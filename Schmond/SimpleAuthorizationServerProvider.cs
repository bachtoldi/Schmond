using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.Owin.Security.OAuth;

namespace Schmond
{
	public class SimpleAuthorizationServerProvider : OAuthAuthorizationServerProvider
	{
		public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
		{
			// This call is required...
			// but we're not using client authentication, so validate and move on...
			await Task.FromResult(context.Validated());
		}

		public override async Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
		{
			context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "*" });

			using (var repo = new AuthRepository())
			{
				var user = await repo.FindUser(context.UserName, context.Password);

				if (user == null)
				{
					context.SetError("invalid_grant", "Benutzername oder Kennwort falsch");
					return;
				}

				var identity = new ClaimsIdentity(context.Options.AuthenticationType);
				identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
				identity.AddClaim(new Claim("sub", context.UserName));
				identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, user.Id));

				var roles = repo.GetRoles(user.Id);
				foreach (var role in roles)
				{
					identity.AddClaim(new Claim(ClaimTypes.Role, role));
				}

				// Identity info will ultimatly be encoded into an Access Token
				// as a result of this call:
				context.Validated(identity);
			}
		}
	}
}