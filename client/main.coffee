Template.body.onCreated ->

Template.body.onRendered ->
  $('#lbModalLogin').click()

#  interpreter = (command) ->
#    console.log command
#    return 'haha'
#
#  loadOpts = {
#    greetings: 'Javascript Interpreter',
#    name: 'js_demo',
#    height: 200,
#    width: 450,
#    prompt: 'js> '
#  }
#  cli = jQTerminal.instance "#jquery_terminal", interpreter, loadOpts, (term) ->

  $ptty = $('#jquery_terminal').Ptty()
  _Meteor = Meteor
  $ptty.register 'command',
    name: 'chat'
    method: (cmd) ->
      _Meteor.call 'cmd', cmd.last, (err, rslt) ->
        console.log(err, rslt)
      cmd.out = 'haha'
      return cmd

#  container = $('<div class="console">')
#  $('#jquery_terminal').append(container)
#
#  controller = container.console(
#    promptLabel: 'chat> '
#    commandValidate: (line) ->
#      if line == ''
#        false
#      else
#        true
#    commandHandle: (line) ->
#      [
#        {
#          msg: "user=> #{line}"
#          className: 'jquery-console-message-value'
#        }
##        {
##          msg: ':: [a]'
##          className: 'jquery-console-message-type'
##        }
#      ]
#    autofocus: true
#    animateScroll: true
#    promptHistory: true
#    charInsertTrigger: (keycode, line) ->
## Let you type until you press a-z
## Never allow zero.
##      !line.match(/[a-z]+/) and keycode != '0'.charCodeAt(0)
#      return true
#  )

#  t1 = new Terminal()
#  t1.setHeight("200px")
#  t1.setWidth('100%')
#  t1.blinkingCursor(true)
#  $('#jquery_terminal').append(t1.html)
#  t1.print('Hello, world!')
#  callInput = ->
#    t1.input 'say something', (word) ->
#      t1.print(word)
#      callInput()
#  callInput()


#  jQuery ($) ->
#    $('#term_demo').terminal ((command) ->
#      if command != ''
#        result = window.eval(command)
#        if result != undefined
#          @echo String(result)
#      return
#    ),
#      greetings: 'Javascript Interpreter'
#      name: 'js_demo'
#      height: 200
#      width: 450
#      prompt: 'js> '
#    return

#  Meteor.setTimeout ->
#    $('#jquery_terminal').terminal hello: (what) ->
#      @echo 'Hello'
#    , greetings: 'hey man'
#  , 2000
