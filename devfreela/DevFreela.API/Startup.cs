using DevFreela.API.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using DevFreela.Infraestructure.Persistence;
using DevFreela.Application.Services.Interfaces;
using DevFreela.Application.Services.Implementations;
using Microsoft.EntityFrameworkCore;
using DevFreela.Application.Commands.CreateProject;
using MediatR;
using DevFreela.Core.Repositories;
using DevFreela.Infraestructure.Persistence.Repositories;
using FluentValidation.AspNetCore;
using DevFreela.Application.Validators;
using DevFreela.API.Filters;

namespace DevFreela.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        [System.Obsolete]
        public void ConfigureServices(IServiceCollection services)
        {
            //services.Configure<OpeningTimeOption>(Configuration.GetSection("OpeningTime"));

            var connectionString = Configuration.GetConnectionString("DevFreelaCs");
            services.AddDbContext<DevFreelaDbContext>(options => options.UseSqlServer(connectionString)); //antigo services.AddSingleton<DevFreelaDbContext>(); //AddSingleton => padr�o de inje��o de depend�ncia para registrar um servi�o que ter� uma �nica inst�ncia do servi�o durante o ciclo de vida da aplica��o.    

            //services.AddScoped<IProjectService, ProjectServices>(); 

            //services.AddScoped<ExampleClass>(e => new ExampleClass { Name = "Initial Stage" }); //AddScoped => padr�o de inje��o de depend�ncia para registrar um servi�o que mant�m a mesma inst�ncia do servi�o durante a vida de uma solicita��o HTTP, criando novas inst�ncias para solicita��es subsequentes. 

            services.AddScoped<IProjectRepository, ProjectRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<ISkillRepository, SkillRepository>();

            services.AddControllers(options => options.Filters.Add(typeof(ValidationFilter)))
                .AddFluentValidation(fv => fv.RegisterValidatorsFromAssemblyContaining<CreateUserCommandValidator>());

            services.AddMediatR(config => config.RegisterServicesFromAssemblyContaining<CreateProjectCommand>()); //passar o tipo de uma classe do application

            services.AddSwaggerGen(c =>


            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "DevFreela.API", Version = "v1" });
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "DevFreela.API v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }




}
