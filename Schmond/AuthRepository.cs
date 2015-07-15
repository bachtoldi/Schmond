using System;
using System.Collections.Generic;
using System.Data.Entity;
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
		private readonly UserManager<User> _userManager;

		public AuthRepository(Context context = null)
		{
			_context = context ?? new Context();

			var store = new UserStore<User>(_context);
			_userManager = new UserManager<User>(store);
		}

		public IEnumerable<string> GetRoles(string userId)
		{
			var roles = _userManager.GetRoles(userId);
			return roles;
		}

		public async Task<IdentityResult> RegisterUser(User user)
		{
			var result = await _userManager.CreateAsync(user, user.Password);

			return result;
		}

		public async Task<User> FindUser(string userName, string password)
		{
			var user = await _userManager.FindAsync(userName, password);

			return user;
		}

		public List<User> GetUserList()
		{
			var userList = _userManager.Users.ToList();

			return userList;
		}

		public async Task<IdentityResult> UpdateUser(string id, User userModel)
		{
			var user = await GetUserById(id);
			
			user.Email = userModel.Email;
			user.UserName = userModel.UserName;
			user.MainCharId = userModel.MainCharId;

			var identityResult = await _userManager.UpdateAsync(user);
			return identityResult;
		}

		public async Task<IdentityResult> UpdatePassword(string id, User userModel)
		{
			var identityResult = await _userManager.ChangePasswordAsync(id, userModel.OldPassword, userModel.Password);

			return identityResult;
		}

		public void Dispose()
		{
			_context.Dispose();
			_userManager.Dispose();
		}

		public async Task<User> GetUserById(string id)
		{
			var user = await _userManager.FindByIdAsync(id);

			return user;
		}
	}
}