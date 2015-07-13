using System.Web.Http;

namespace Schmond.Controllers
{
	public class ApiControllerBase : ApiController
	{
		protected Context Context;

		public ApiControllerBase()
		{
			Context = new Context();
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing)
			{
				Context.Dispose();
			}

			base.Dispose(disposing);
		}
	}
}