using System.Web.Http;

namespace Schmond.Controllers
{
	public class ControllerBase : ApiController
	{
		protected Context Context;

		public ControllerBase()
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