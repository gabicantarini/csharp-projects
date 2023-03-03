using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;


namespace Globaliza
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddLocalization(); //roda em diferentes localiza��es
            services.AddControllers();
          
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
               
            }

            app.UseHttpsRedirection(); 

            var supportedCultures = new [] { "pt-BR", "en-US", "it" }; // array para informar as linguagens que vamos suportar
            var localizationOptions = new RequestLocalizationOptions()
                .SetDefaultCulture(supportedCultures[0]) // por dar�o ele est� pegando o [0] do array que � o pt-BR, mas podemos settar para o idioma que quisermos, basta mudar o �ndice
                .AddSupportedCultures(supportedCultures)
                .AddSupportedUICultures(supportedCultures); // Suporte UI => j� altera a formata��o da data conforme local/linguagem escolhido

            app.UseRequestLocalization(localizationOptions);

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
