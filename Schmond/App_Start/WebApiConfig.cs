using System.Web.Http;
using Newtonsoft.Json.Serialization;
using Schmond.Filters;

namespace Schmond
{
	public static class WebApiConfig
	{
		public static void Register(HttpConfiguration config)
		{
			config.Formatters.JsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();

			config.MapHttpAttributeRoutes();
			config.Filters.Add(new UnhandledExceptionFilter());
		}
	}
}