Template.modalLogin.events
  'click .idKakaoLogin': (evt) ->
    Kakao.Auth.login
      success: (authObj) ->
#        alert(JSON.stringify(authObj))
        console.log JSON.stringify(authObj)
      fail: (err) ->
        alert(JSON.stringify(err))