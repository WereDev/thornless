FROM registry.gitlab.com/weredev/dotnet-build:latest AS build-env

WORKDIR /src
ADD . .
WORKDIR "/src/Thornless.UI.Web"
RUN dotnet build "Thornless.UI.Web.csproj" -c Release -o /app/build
RUN dotnet publish "Thornless.UI.Web.csproj" --self-contained --runtime linux-musl-x64 -c Release -o /app/publish

# FROM registry.gitlab.com/weredev/dotnet-run:latest AS run
FROM dotnet-run:latest AS run
WORKDIR /app
COPY --from=build-env /app/publish .
COPY ["ServerFiles/nginx.conf","/etc/nginx/http.d/default.conf"]
COPY ["ServerFiles/run-server.sh", "/app/"]

EXPOSE 80
EXPOSE 443
EXPOSE 5000

CMD ["sh", "/app/run-server.sh"]


# FROM registry.gitlab.com/weredev/dotnet-run:latest AS run
# WORKDIR /app
# COPY --from=build-env /app/publish .
# COPY ["ServerFiles/nginx.conf","/etc/nginx/"]
# COPY ["ServerFiles/run-server.sh", "/app/"]

# EXPOSE 80
# EXPOSE 443
# EXPOSE 5000