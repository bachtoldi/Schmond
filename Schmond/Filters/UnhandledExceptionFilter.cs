using System;
using System.Web.Http.Filters;

namespace Schmond.Filters
{
	public class UnhandledExceptionFilter : ExceptionFilterAttribute
	{
		public override void OnException(HttpActionExecutedContext context)
		{
			Console.WriteLine(context.Exception);
		}
	}
}