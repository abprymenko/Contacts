namespace Contacts.WebAPI
{
    #region Usings
    using Contacts.WebAPI.API_Start;
    using Contacts.WebAPI.Services;
    using Microsoft.AspNetCore;
    using System.Diagnostics;
    using Microsoft.AspNetCore.Hosting.WindowsServices;
    #endregion
    public class Program
    {
        public static void Main(string[] args)
        {
            try
            {
                var host = CreateWebHostBuilder(args).Build();
                if(!Debugger.IsAttached) host.RunAsService();
                else host.Run();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args)
            => WebHost.CreateDefaultBuilder(args)
                      .UseContentRoot(Directory.GetCurrentDirectory())
                      .UseIISIntegration()
                      .UseStartup<Startup>()
                      .ConfigureServices(services => services.AddHostedService<Service>())
                      .UseEnvironment(!Debugger.IsAttached
                                        ? Microsoft.AspNetCore.Hosting.EnvironmentName.Staging
                                        : Microsoft.AspNetCore.Hosting.EnvironmentName.Development)
                      .CaptureStartupErrors(true);
    }
}