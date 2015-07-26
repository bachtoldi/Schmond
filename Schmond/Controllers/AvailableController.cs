using System.Data.Entity;
using System.Linq;
using System.Web.Http;
using Schmond.Models;

namespace Schmond.Controllers {
    [RoutePrefix("api/available")]
    public class AvailableController : ApiControllerBase {
        [HttpGet]
        [Route("")]
        [Authorize]
        public IHttpActionResult Read(int specId = 0, int itemId = 0) {
            var results = (from a in Context.Availabilities
                           where (specId == 0 && itemId == 0) 
                           || (a.SpecId == specId && itemId == 0)
                           || (specId == 0 && a.ItemId == itemId)
                           || (a.SpecId == specId && a.ItemId == itemId)
                           orderby a.id
                           select a).ToArray();

            return Ok(results);
        }

        [HttpGet]
        [Route("{id:int}")]
        [Authorize]
        public IHttpActionResult ReadSingle(int id) {
            var result = (from a in Context.Availabilities
                          where a.Id == id
                          select a).SingleOrDefault();

            return Ok(result);
        }

        [HttpPost]
        [Route("")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Create(Available available) {
            if (!ModelState.IsValid) {
                return BadRequest(ModelState);
            }

            Context.Availabilities.Add(available);
            Context.SaveChanges();

            return Ok();
        }

        [HttpPut]
        [Route("{id:int}")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Update(int id, Available available) {
            available.Id = id;

            if (!ModelState.IsValid) {
                return BadRequest(ModelState);
            }

            Context.Availabilities.Attach(available);
            var entry = Context.Entry(available);
            entry.State = EntityState.Modified;

            Context.SaveChanges();

            return Ok();
        }

        [HttpDelete]
        [Route("{id:int}")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Delete(int id) {
            Context.Availabilities.Remove(Context.Availabilities.Find(id));
            Context.SaveChanges();

            return Ok();
        }
    }
}