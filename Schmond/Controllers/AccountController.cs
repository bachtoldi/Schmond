using System.Threading.Tasks;
using System.Web.Http;
using Microsoft.AspNet.Identity;
using Schmond.Models;

namespace Schmond.Controllers
{
	[RoutePrefix("api/accounts")]
	public class AccountController : ApiController
	{
		private readonly AuthRepository _repo;

		public AccountController()
		{
			_repo = new AuthRepository();
		}

		// POST api/accounts
		[AllowAnonymous]
		[HttpPost]
		public async Task<IHttpActionResult> Register(User userModel)
		{
			if (!ModelState.IsValid)
			{
				return BadRequest(ModelState);
			}
			var result = await _repo.RegisterUser(userModel);

			var errorResult = GetErrorResult(result);

			if (errorResult != null)
			{
				return errorResult;
			}

			return Ok();
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing)
			{
				_repo.Dispose();
			}

			base.Dispose(disposing);
		}

		private IHttpActionResult GetErrorResult(IdentityResult result)
		{
			if (result == null)
			{
				return InternalServerError();
			}

			if (result.Succeeded)
			{
				return null;
			}

			if (result.Errors != null)
			{
				foreach (var error in result.Errors)
				{
					ModelState.AddModelError("", error);
				}
			}

			if (ModelState.IsValid)
			{
				// No ModelState errors are available to send, so just return an empty BadRequest.
				return BadRequest();
			}

			return BadRequest(ModelState);
		}
	}
}
