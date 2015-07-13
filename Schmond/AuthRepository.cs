using System;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Schmond.Models;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;

namespace Schmond {
    public class AuthRepository : IDisposable {
        private readonly Context _context;
        private readonly UserManager<User> _userManager;

        public AuthRepository(Context context = null) {
	        try
	        {
						_context = context ?? new Context();

						var store = new UserStore<User>(_context);
						_userManager = new UserManager<User>(store);
	        }
	        catch (Exception ex)
	        {
		        
		        throw;
	        }
            
        }

        public async Task<IdentityResult> RegisterUser(User user) {
            var result = await _userManager.CreateAsync(user, user.Password);

            return result;
        }

        public async Task<User> FindUser(string userName, string password) {
            var user = await _userManager.FindAsync(userName, password);

            return user;
        }

        public List<User> GetUserList() {
            List<User> userList = _userManager.Users.ToList();

            return userList;
        }

        public async Task<IdentityResult> UpdateUser(string id, User userModel) {
            User user = await GetUserById(id);
            user.UserName = userModel.UserName;
            user.Email = userModel.Email;
            user.Password = userModel.Password;
            user.ConfirmPassword = userModel.ConfirmPassword;
            user.CharsId = userModel.CharsId;
            try {
                IdentityResult identityResult = await _userManager.UpdateAsync(user);
                return identityResult;
            } catch (Exception se) {
                throw se;
            }
        }

        public async Task<IdentityResult> UpdatePassword(string id, User userModel) {
            User user = await GetUserById(id);

            IdentityResult identityResult = await _userManager.ChangePasswordAsync(user.Id, userModel.OldPassword, userModel.Password);

            return identityResult;
        }

        public void Dispose() {
            _context.Dispose();
            _userManager.Dispose();
        }

        public async Task<User> GetUserById(string id) {
            User user = await _userManager.FindByIdAsync(id);

            return user;
        }
    }
}