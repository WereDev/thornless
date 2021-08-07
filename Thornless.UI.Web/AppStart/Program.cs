using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using SumoLogic.Logging.AspNetCore;

namespace Thornless.UI.Web.AppStart
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureLogging((context, logging) =>
                {
                    if (context.HostingEnvironment.IsDevelopment())
                    {
                        // logging.AddFilter("Microsoft.EntityFrameworkCore.Database.Command", LogLevel.Information);
                        logging.AddConsole();
                    }
                    else
                    {  
                        // var sumoLogicOptions = context.Configuration.GetSection("Logging:SumoLogic").Get<LoggerOptions>();
                        // logging.AddSumoLogic(sumoLogicOptions);
                    }
                })
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}
