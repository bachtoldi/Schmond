using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/needtypes")]
	public class NeedTypeController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult Read()
		{
			var results = (from nt in Context.NeedTypes
										 orderby nt.Id
										 select nt).ToArray();

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from nt in Context.NeedTypes
										where nt.Id == id
										select nt).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Create(NeedType needType)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.NeedTypes.Add(needType);
			Context.SaveChanges();

			return Ok();
		}

		[HttpPut]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, NeedType needType)
		{
			needType.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.NeedTypes.Attach(needType);
			var entry = Context.Entry(needType);
			entry.State = EntityState.Modified;

			Context.SaveChanges();

			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.NeedTypes.Remove(Context.NeedTypes.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}