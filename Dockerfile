FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /build
# Copy csproj and restore as distinct layers
COPY . .
RUN dotnet restore

RUN dotnet publish -c Release -o /app

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS final
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "nagp-devops-us.dll"]