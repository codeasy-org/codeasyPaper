Template.modalLogin.events
  'click .idLogout': (evt) ->
    Kakao.API.request
      url: '/v1/user/unlink'
      success: (response) ->
        console.log response
        return
      fail: (error) ->
        console.log error
        return
#    cl Kakao.Auth.logout()

  'click .idKakaoLogin': (evt) ->
#    Kakao.init '27bbb40fd0c3dc6d056c9b8f82321c57' #REST API키
    if !Kakao.isInitialized() then Kakao.init 'c28e8fe3b0047ba9bd2068c4d646b62d' #js 키
    Kakao.Auth.login
      success: (authObj) ->
        Kakao.Auth.setAccessToken authObj.access_token
        Kakao.API.request({
          url: '/v2/user/me'
          success: (res) ->
            Meteor.call 'loginByKakao', res, (err, rslt) ->
              if err? then return alert err.reason
              Meteor.loginWithPassword(rslt.username, rslt.password)
          fail: (err) -> alert err
        });
      fail: (err) -> alert(err)