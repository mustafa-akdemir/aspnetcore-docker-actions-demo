using System;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => Results.Ok(new {
    message = "Hello from GitHub Actions + WSL + Docker 🚀",
    version = Environment.GetEnvironmentVariable("VERSION") ?? "dev",
    time = DateTimeOffset.UtcNow
}));

app.Run();
