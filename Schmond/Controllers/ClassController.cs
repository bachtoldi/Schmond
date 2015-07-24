using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/classes")]
	public class ClassController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult Read(int raceId = 0)
		{
			var results = (from c in Context.Classes.Include(x => x.AvailableRaces)
										 where raceId == 0 || c.AvailableRaces.Any(r => r.Id == raceId)
										 orderby c.Name
										 select c).Select(c => new
										 {
											 c.Id,
											 c.Name,
											 Races = c.AvailableRaces.Select(r => new
											 {
												 r.Id,
												 r.Name
											 })
										 });

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from r in Context.Classes.Include(x => x.AvailableRaces)
										where r.Id == id
										select r).Select(c => new
										{
											c.Id,
											c.Name,
											Races = c.AvailableRaces.Select(r => new
											{
												r.Id,
												r.Name
											})
										}).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Create(Class @class)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			// avoiding duplicate or changed entities
			foreach (var entry in @class.AvailableRaces)
			{
				entry.Faction = null; // else ef tries to add the faction again
				Context.Entry(entry).State = EntityState.Unchanged;
			}

			Context.Classes.Add(@class);
			Context.SaveChanges();

			return Ok();
		}

		[HttpPut]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, Class @class)
		{
			@class.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			// really fucking dirty, but working!!!

			var entry = Context.Entry(@class);
			var tmp = new Race[@class.AvailableRaces.Count];
			@class.AvailableRaces.CopyTo(tmp, 0);

			@class.AvailableRaces.Clear();
			entry.State = EntityState.Modified;

			entry.Collection(i => i.AvailableRaces).Load();
			@class.AvailableRaces.Clear();
			
			foreach (var race in tmp)
			{
				@class.AvailableRaces.Add(Context.Races.Find(race.Id));
			}

			Context.SaveChanges();
			
			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.Classes.Remove(Context.Classes.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}
