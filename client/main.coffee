#import 'trix'
import Quill from 'quill'
import { ImageDrop } from 'quill-image-drop-module';
#import ImageResize from '@felrov/quill-image-resize-module';
import ImageResize from 'quill-image-resize'

#import EditorJS from '@editorjs/editorjs'
#import Header from '@editorjs/header'
#import List from '@editorjs/list'
#import ImageTool from '@editorjs/image'

#import MediumEditor from 'medium-editor'
self = @
self.quill = null

Template.main.onCreated ->

Template.main.helpers
  mark: ->
    return "(function contact(phone, email, address) {
              phone.call('<a href=\"tel:+82-70-7913-6309\">+82-70-7913-6309</a>');
              email.send('<a href=\"mailto:support@codeasy.org\" target=\"_blank\">support@codeasy.org</a>');
              address.go('대한민국 서울 성북');
              })();"

Template.main.onRendered ->
  toolbarOptions = [
    [{ 'size': ['small', false, 'large', 'huge'] }],  # custom dropdown
#        [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
    ['bold', 'italic', 'underline', 'strike'],        # toggled buttons
    ['blockquote', 'code-block'],
#        [{ 'header': 1 }, { 'header': 2 }],               # custom button values
    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
    [{ 'script': 'sub'}, { 'script': 'super' }],      # superscript/subscript
    [{ 'indent': '-1'}, { 'indent': '+1' }, { 'align': []} ],          # outdent/indent, align
    [{ 'direction': 'rtl' }],                         # text direction
    [{ 'color': [] }, { 'background': [] }],          # dropdown with defaults from theme
#        [{ 'font': [] }],
    ['image', 'video'],
    ['clean']                                         # remove formatting button
  ]

  imageHandler = ->
    range = @quill.getSelection()
    value = prompt('What is the image URL')
    if value
      @quill.insertEmbed range.index, 'image', value, Quill.sources.USER

  Quill.register('modules/imageResize', ImageResize);
  Quill.register('modules/imageDrop', ImageDrop);


  self.quill = new Quill '#editor',
    modules:
      imageDrop: true
      imageResize: {
        modules: [ 'Resize', 'DisplaySize', 'Toolbar' ]
      }
      toolbar:
        container: toolbarOptions
#        handlers:
#          image: imageHandler
    placeholder: '써라. 읽을 것이다...'
    theme: 'snow'



#  editor = new EditorJS
#    holder: 'editor'
#    tools: {
#      header: Header
#      list: List
#
#    }

  #  cl MediumEditor
#  editor = new MediumEditor('.editor');
#  $('#lbModalLogin').click()

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
