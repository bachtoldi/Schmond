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
				// TODO: Filter by race
				var results = Context.Classes;

				return Ok(results);
			}

			[HttpGet]
			[Route("{id:int}")]
			[Authorize]
			public IHttpActionResult ReadSingle(int id)
			{
				var result = (from r in Context.Classes
											where r.Id == id
											select r).SingleOrDefault();

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

				Context.Classes.Attach(@class);
				var entry = Context.Entry(@class);
				entry.State = EntityState.Modified;

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
