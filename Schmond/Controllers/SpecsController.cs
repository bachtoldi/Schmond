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
        public IHttpActionResult Read(int factionId = 0) {
            var results = (from r in Context.Races.Include(x => x.Faction)
                           where factionId == 0 || r.FactionId == factionId
                           orderby r.Faction.Name, r.Name
                           select r);

            return Ok(results);
        }

        [HttpGet]
        [Route("{id:int}")]
        [Authorize]
        public IHttpActionResult ReadSingle(int id) {
            var result = (from r in Context.Races.Include(x => x.Faction)
                          where r.Id == id
                          select r).SingleOrDefault();

            return Ok(result);
        }

        [HttpPost]
        [Route("")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Create(Race race) {
            if (!ModelState.IsValid) {
                return BadRequest(ModelState);
            }

            Context.Races.Add(race);
            Context.SaveChanges();

            return Ok();
        }

        [HttpPut]
        [Route("{id:int}")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Update(int id, Race race) {
            race.Id = id;

            if (!ModelState.IsValid) {
                return BadRequest(ModelState);
            }

            Context.Races.Attach(race);
            var entry = Context.Entry(race);
            entry.State = EntityState.Modified;

            Context.SaveChanges();

            return Ok();
        }

        [HttpDelete]
        [Route("{id:int}")]
        [Authorize(Roles = "Administrator")]
        public IHttpActionResult Delete(int id) {
            Context.Races.Remove(Context.Races.Find(id));
            Context.SaveChanges();

            return Ok();
        }
    }
}