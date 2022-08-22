FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /app
# Copy csproj and restore as distinct layers
COPY . ./
RUN dotnet restore

RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS final
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "nagp-devops-us.dll"]