using System;
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

		public void Dispose()
		{
			_context.Dispose();
			_userManager.Dispose();
		}
	}
}