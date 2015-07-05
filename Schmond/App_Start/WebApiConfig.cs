﻿using System.Linq;
using System.Net.Http.Formatting;
using System.Web.Http;
using Newtonsoft.Json.Serialization;

namespace Schmond
{
	public static class WebApiConfig
	{
		public static void Register(HttpConfiguration config)
		{
			var jsonFormatter = config.Formatters.OfType<JsonMediaTypeFormatter>().First();
			jsonFormatter.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();

			config.MapHttpAttributeRoutes();
		}
	}
}
