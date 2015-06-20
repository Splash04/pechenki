using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Formatting;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace Test.Formatters
{
    public class JsonCamelCaseFormatter : MediaTypeFormatter
    {
        private readonly JsonSerializerSettings jsonSerializerSettings = null;

        public JsonCamelCaseFormatter()
        {
            jsonSerializerSettings =
                new JsonSerializerSettings
                {
                    ContractResolver =
                        new CamelCasePropertyNamesContractResolver(),
                    DateTimeZoneHandling = DateTimeZoneHandling.Unspecified
                };

            // Fill out the mediatype and encoding we support
            SupportedMediaTypes.Add(new MediaTypeHeaderValue("application/json"));
            SupportedEncodings.Add(Encoding.UTF8);
        }

        public override bool CanReadType(Type type)
        {
            return true;
        }

        public override bool CanWriteType(Type type)
        {
            return true;
        }

        public override Task<object> ReadFromStreamAsync(Type type, Stream stream, System.Net.Http.HttpContent content, IFormatterLogger formatterLogger)
        {
            // Create a serializer
            var serializer = JsonSerializer.Create(jsonSerializerSettings);

            // Create task reading the content
            return Task.Factory.StartNew(
                () =>
                {
                    using (var streamReader = new StreamReader(stream, new UTF8Encoding(false, true)))
                    using (var jsonTextReader = new JsonTextReader(streamReader))
                        return serializer.Deserialize(jsonTextReader, type);
                });
        }

        public override Task WriteToStreamAsync(Type type, object value, Stream stream, System.Net.Http.HttpContent content, System.Net.TransportContext transportContext)
        {
            // Create a serializer
            var serializer = JsonSerializer.Create(jsonSerializerSettings);

            // Create task writing the serialized content
            return Task.Factory.StartNew(
                () =>
                {
                    using (var jsonTextWriter =
                        new JsonTextWriter(new StreamWriter(stream, new UTF8Encoding(false, true)))
                        {
                            Formatting = Formatting.Indented,
                            CloseOutput = false
                        })
                    {
                        serializer.Serialize(jsonTextWriter, value);
                        jsonTextWriter.Flush();
                    }
                });
        }
    }
}