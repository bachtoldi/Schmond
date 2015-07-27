using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Schmond.Models;

namespace Schmond
{
	public class AuthRepository : IDisposable
	{
		private readonly Context _context;
		private readonly ApplicationUserManager _userManager;

		public AuthRepository(Context context = null)
		{
			_context = context ?? new Context();

			var store = new UserStore<ApplicationUser>(_context);
			_userManager = new ApplicationUserManager(store);
		}

		public IEnumerable<string> GetRoles(string userId)
		{
			var roles = _userManager.GetRoles(userId);
			return roles;
		}

		public async Task<IdentityResult> RegisterUser(ApplicationUser user)
		{
			var result = await _userManager.CreateAsync(user, user.Password);

			return result;
		}

		public async Task<ApplicationUser> FindUser(string userName, string password)
		{
			var user = await _userManager.FindAsync(userName, password);

			return user;
		}

		public List<ApplicationUser> GetUserList()
		{
			var userList = _userManager.Users.ToList();

			return userList;
		}

		public async Task<IdentityResult> UpdateUser(string id, ApplicationUser userModel)
		{
			var user = await GetUserById(id);

			user.Email = userModel.Email;
			user.UserName = userModel.UserName;
			user.MainCharId = userModel.MainCharId;

			var identityResult = await _userManager.UpdateAsync(user);
			return identityResult;
		}

		public async Task<IdentityResult> UpdatePassword(string id, ApplicationUser userModel)
		{
			var identityResult = await _userManager.ChangePasswordAsync(id, userModel.OldPassword, userModel.Password);

			return identityResult;
		}

		public async Task<IdentityResult> DeleteUser(string id)
		{
			var identityResult = await _userManager.DeleteAsync(await GetUserById(id));

			return identityResult;
		}

		public void Dispose()
		{
			_context.Dispose();
			_userManager.Dispose();
		}

		public async Task<ApplicationUser> GetUserById(string id)
		{
			var user = await _userManager.FindByIdAsync(id);

			return user;
		}
	}
}