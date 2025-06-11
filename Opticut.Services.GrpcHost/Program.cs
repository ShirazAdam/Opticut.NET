using Microsoft.EntityFrameworkCore;
using Opticut.Contracts.Data;
using Opticut.Contracts.Services;
using Opticut.Data;
using Opticut.Data.Repositories;
using Opticut.ServiceDefaults;
using Opticut.Services;
using Opticut.Services.GrpcHost.Services;

var builder = WebApplication.CreateBuilder(args);

builder.AddServiceDefaults();

// Add services to the container.
builder.Services.AddGrpc();

var connectionString =
    builder.Configuration.GetConnectionString("DefaultConnection")
    ?? throw new InvalidOperationException("Connection string: 'DefaultConnection' not found.");

builder.Services.AddDbContext<OpticutDbContext>(options =>
    options.UseSqlServer(connectionString));

builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<IUserService, UserService>();

var app = builder.Build();

app.MapDefaultEndpoints();

// Configure the HTTP request pipeline.
app.MapGrpcService<UserGrpcService>();
app.MapGet("/", () => "Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");

app.Run();
