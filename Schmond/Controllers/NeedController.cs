using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/need")]
	public class NeedController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult Read(int charId, int availableId, int needTypeId, int priorityId)
		{
			var results = (from n in Context.Needs
										 where (charId == 0 || n.CharId == charId)
										 && (availableId == 0 || n.AvailableId == availableId)
										 && (needTypeId == 0 || n.NeedTypeId == needTypeId)
										 && (priorityId == 0 || n.PriorityId == priorityId)
										 orderby n.Id
										 select n).ToArray();

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from n in Context.Needs
										where n.Id == id
										select n).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Create(Need need)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Needs.Add(need);
			Context.SaveChanges();

			return Ok();
		}

		[HttpPut]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, Need need)
		{
			need.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Needs.Attach(need);
			var entry = Context.Entry(need);
			entry.State = EntityState.Modified;

			Context.SaveChanges();

			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.Needs.Remove(Context.Needs.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}