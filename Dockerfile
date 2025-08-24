# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY DemoApi/DemoApi.csproj DemoApi/
RUN dotnet restore DemoApi/DemoApi.csproj
COPY DemoApi/ DemoApi/
WORKDIR /src/DemoApi
RUN dotnet publish -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_URLS=http://0.0.0.0:8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "DemoApi.dll"]
