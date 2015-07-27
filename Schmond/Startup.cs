using System;
using System.Web.Http;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OAuth;
using Owin;
using Schmond.Models;
using Schmond.Providers;

namespace Schmond
{
	public class Startup
	{
		public static OAuthAuthorizationServerOptions OAuthOptions { get; private set; }

		public static string PublicClientId { get; private set; }

		public void Configuration(IAppBuilder app)
		{
			ConfigureOAuth(app);

			var config = new HttpConfiguration();
			WebApiConfig.Register(config);
			app.UseWebApi(config);
		}

		public void ConfigureOAuth(IAppBuilder app)
		{
			// Configure the db context and user manager to use a single instance per request
			app.CreatePerOwinContext(Context.Create);
			app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);

			// Enable the application to use a cookie to store information for the signed in user
			// and to use a cookie to temporarily store information about a user logging in with a third party login provider
			app.UseCookieAuthentication(new CookieAuthenticationOptions());
			app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

			// Configure the application for OAuth based flow
			PublicClientId = "self";
			var oAuthServerOptions = new OAuthAuthorizationServerOptions()
			{
				TokenEndpointPath = new PathString("/api/token"),
				Provider = new ApplicationOAuthProvider(PublicClientId),
				AccessTokenExpireTimeSpan = TimeSpan.FromDays(14),
				AllowInsecureHttp = true,
			};

			// Token Generation
			app.UseOAuthAuthorizationServer(oAuthServerOptions);
			app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());
		}
	}
}