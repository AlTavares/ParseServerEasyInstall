
var ParseServer = require('parse-server').ParseServer;
var api = new ParseServer({
  databaseURI: "mongodb://localhost:27017/parse",
  cloud: __dirname + '/cloud/main.js',
  appId: "MyAppId",
  masterKey: "MyMasterKey", //Add your master key here. Keep it secret!
  serverURL: "http://localhost:3000/api"
  // liveQuery: {
  //   classNames: [] // List of classes to support for query subscriptions
  // }
});
// Client-keys like the javascript key or the .NET key are not necessary with parse-server
// If you wish you require them, you can set them as options in the initialization above:
// javascriptKey, restAPIKey, dotNetKey, clientKey

module.exports = api