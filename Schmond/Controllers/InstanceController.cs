using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/instances")]
	public class InstanceController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		public IHttpActionResult Read()
		{
			var results = (from i in Context.Instances
										 orderby i.Name
										 select i);

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from i in Context.Instances
										where i.Id == id
										select i).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Create(Instance instance)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Instances.Add(instance);
			Context.SaveChanges();

			return Ok();
		}

		[HttpPut]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, Instance instance)
		{
			instance.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Instances.Attach(instance);
			var entry = Context.Entry(instance);
			entry.State = EntityState.Modified;

			Context.SaveChanges();

			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.Instances.Remove(Context.Instances.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}
