using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/priority")]
	public class PriorityController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult Read()
		{
			var results = (from p in Context.Priorities
										 orderby p.Id
										 select p).ToArray();

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from p in Context.Priorities
										where p.Id == id
										select p).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, Priority priority)
		{
			priority.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Priorities.Attach(priority);
			var entry = Context.Entry(priority);
			entry.State = EntityState.Modified;

			Context.SaveChanges();

			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.Priorities.Remove(Context.Priorities.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}