using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Microsoft.AspNet.Identity;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/chars")]
	public class CharController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult Read()
		{
			var results = (from c in Context.Chars
										 orderby c.Name
										 select c);

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from c in Context.Chars
										where c.Id == id
										select c).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("")]
		public IHttpActionResult Create(Char @char)
		{
			@char.UserId = User.Identity.GetUserId();

			ModelState.Clear();
			Validate(@char);

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}
			
			@char = Context.Chars.Add(@char);
			Context.SaveChanges();

			var user = (from u in Context.Users
									where u.Id == @char.UserId
									select u).Single();
			user.MainCharId = @char.Id;
			Context.SaveChanges();

			return Ok(@char.Id);
		}

		[HttpPut]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, Char @char)
		{
			@char.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Chars.Attach(@char);
			var entry = Context.Entry(@char);
			entry.State = EntityState.Modified;

			Context.SaveChanges();

			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.Chars.Remove(Context.Chars.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}
