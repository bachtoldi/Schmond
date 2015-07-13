using System.Linq;
using System.Net.Http.Formatting;
using System.Web.Http;
using Newtonsoft.Json.Serialization;
using Schmond.Filters;

namespace Schmond
{
	public static class WebApiConfig
	{
		public static void Register(HttpConfiguration config)
		{
			var jsonFormatter = config.Formatters.OfType<JsonMediaTypeFormatter>().First();
			jsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();

			config.MapHttpAttributeRoutes();
			config.Filters.Add(new UnhandledExceptionFilter());
		}
	}
}