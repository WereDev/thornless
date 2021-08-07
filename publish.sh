cd ./Thornless.UI.Web/ClientApp/
npm install
npm run build
cd ../..
dotnet publish ./Thornless.UI.Web -c Release --self-contained --runtime linux-x64
