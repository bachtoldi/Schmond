using Schmond.Models;
using System.Data.Entity;
using System.Linq;
using System.Web.Http;

namespace Schmond.Controllers
{
    [RoutePrefix("api/specs")]
    public class SpecsController : ApiControllerBase {
        [HttpGet]
        [Route("")]
        [Authorize]
        public IHttpActionResult Read(int classId = 0) {
            var results = (from r in Context.Specs.Include(x => x.Class)
                           where classId == 0 || r.ClassId == classId
                           orderby r.Class.Name, r.Name
                           select r);

            return Ok(results);
        }

        [HttpGet]
        [Route("{id:int}")]
        [Authorize]
        public IHttpActionResult ReadSingle(int id) {
            var result = (from r in Context.Specs.Include(x => x.Class)
                          where r.Id == id
                          select r).SingleOrDefault();

            return Ok(result);
        }

        [HttpPost]
        [Route("")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Create(Spec spec) {
            if (!ModelState.IsValid) {
                return BadRequest(ModelState);
            }

            Context.Specs.Add(spec);
            Context.SaveChanges();

            return Ok();
        }

        [HttpPut]
        [Route("{id:int}")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Update(int id, Spec spec) {
            spec.Id = id;

            if (!ModelState.IsValid) {
                return BadRequest(ModelState);
            }

            Context.Specs.Attach(spec);
            var entry = Context.Entry(spec);
            entry.State = EntityState.Modified;

            Context.SaveChanges();

            return Ok();
        }

        [HttpDelete]
        [Route("{id:int}")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Delete(int id) {
            Context.Specs.Remove(Context.Specs.Find(id));
            Context.SaveChanges();

            return Ok();
        }
    }
}