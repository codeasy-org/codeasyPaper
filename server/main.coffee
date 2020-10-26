Meteor.methods
  cmd: (cmd) ->
    console.log cmd


WebApp.connectHandlers.use '/kakaoauth', (req, res, next) ->
  console.log req, res
  res.writeHead(200);
  res.end("Hello world from: #{Meteor.release}");