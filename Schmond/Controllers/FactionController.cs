using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/factions")]
	public class FactionController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult Read()
		{
			var results = (from f in Context.Factions
										 orderby f.Name
										 select f);

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from f in Context.Factions
										where f.Id == id
										select f).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Create(Faction faction)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Factions.Add(faction);
			Context.SaveChanges();

			return Ok();
		}

		[HttpPut]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, Faction faction)
		{
			faction.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Factions.Attach(faction);
			var entry = Context.Entry(faction);
			entry.State = EntityState.Modified;

			Context.SaveChanges();

			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.Factions.Remove(Context.Factions.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}
