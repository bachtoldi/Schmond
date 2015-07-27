﻿using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/items")]
	public class ItemController : ApiControllerBase
	{
		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult Read(int bossId = 0)
		{
			var results = (from i in Context.Items.Include(x => x.DroppedBy)
										 where bossId == 0 || i.DroppedBy.Any(x => x.Id == bossId)
										 orderby i.Name
										 select i);

			return Ok(results);
		}

		[HttpGet]
		[Route("{id:int}")]
		[Authorize]
		public IHttpActionResult ReadSingle(int id)
		{
			var result = (from i in Context.Items
										where i.Id == id
										select i).SingleOrDefault();

			return Ok(result);
		}

		[HttpPost]
		[Route("")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Create(Item item)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Items.Add(item);
			Context.SaveChanges();

			return Ok();
		}

		[HttpPut]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Update(int id, Item item)
		{
			item.Id = id;

			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}

			Context.Items.Attach(item);
			var entry = Context.Entry(item);
			entry.State = EntityState.Modified;

			Context.SaveChanges();

			return Ok();
		}

		[HttpDelete]
		[Route("{id:int}")]
		[Authorize(Roles = "Administrator")]
		public IHttpActionResult Delete(int id)
		{
			Context.Items.Remove(Context.Items.Find(id));
			Context.SaveChanges();

			return Ok();
		}
	}
}
