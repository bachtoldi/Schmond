using System.Threading.Tasks;
using System.Web.Http;
using Microsoft.AspNet.Identity;
using Schmond.Models;
using System;
using System.Collections.Generic;
using System.Linq;

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
		[Route("")]
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

		[HttpGet]
		[Route("")]
		[Authorize]
		public IHttpActionResult GetUserList()
		{
			var userList = _repo.GetUserList().Select(user => new
			{
				user.Id, 
				user.UserName, 
				user.Email, 
				MainCharId = user.CharsId
			});
			return Ok(userList);
		}

		[HttpGet]
		[Route("{id}")]
		[Authorize]
		public async Task<IHttpActionResult> GetUserById(string id)
		{
			var user = await _repo.GetUserById(id);
			return Ok(new
			{
				user.Id,
				user.Email,
				user.UserName,
				MainCharId = user.CharsId
			});
		}

		[HttpPut]
		[Route("{id}")]
		[Authorize]
		public async Task<IHttpActionResult> UpdateUser(string id, User userModel)
		{
			IHttpActionResult errorResult = GetErrorResult(await _repo.UpdateUser(id, userModel));

			if (errorResult != null)
			{
				return errorResult;
			}
			else
			{
				errorResult = GetErrorResult(await _repo.UpdatePassword(id, userModel));

				return (errorResult != null) ? errorResult : Ok();
			}
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
