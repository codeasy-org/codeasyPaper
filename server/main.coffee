Meteor.methods
  loginByKakao: (res) ->
    if !res.id? then ___.error 'fields error'
    if !res.kakao_account? then ___.error 'fields error'
    username = res.id+''
    password = Random.secret()
    user = Meteor.users.findOne(username: username)
    if !user?
      options =
        username: username
        password: password
        profile: res.kakao_account
      if (email = res.kakao_account?.email)? then options.email = email

      Accounts.createUser options
      return {
        username: username
        password: password
      }

    else
      Accounts.setPassword user._id, password
      return {
        username: username
        password: password
      }

  cmd: (cmd) ->
    console.log cmd


WebApp.connectHandlers.use '/kakaoauth', (req, res, next) ->
  console.log req.query
  res.writeHead(200);
  res.end("Hello world from: #{Meteor.release}");