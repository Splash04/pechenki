using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using Test.Formatters;

namespace Test
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

            var config = GlobalConfiguration.Configuration;
            var index = config.Formatters.IndexOf(config.Formatters.JsonFormatter);
            config.Formatters[index] = new JsonCamelCaseFormatter();
        }

        protected void Application_PreRequestHandlerExecute(object sender, EventArgs e)
        {
            HttpApplication app = sender as HttpApplication;
            string acceptEncoding = app.Request.Headers["Accept-Encoding"];
            Stream prevUncompressedStream = app.Response.Filter;

            if (acceptEncoding == null || acceptEncoding.Length == 0)
                return;

            acceptEncoding = acceptEncoding.ToLower();

            if (acceptEncoding.Contains("deflate") || acceptEncoding == "*")
            {
                // deflate
                app.Response.Filter = new DeflateStream(prevUncompressedStream, CompressionMode.Compress);
                app.Response.AppendHeader("Content-Encoding", "deflate");
            }
            else if (acceptEncoding.Contains("gzip"))
            {
                // gzip
                app.Response.Filter = new GZipStream(prevUncompressedStream, CompressionMode.Compress);
                app.Response.AppendHeader("Content-Encoding", "gzip");
            }
        } 
    }
}