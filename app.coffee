  Calculator = Backbone.View.extend(
    el: $("body")
    timer: null
    currentChars: ""
    prevValidInput: ""
    prevValidClickInput: ""
    textbox: $(".tb")
    answerBox: $(".question")
    events:
      keypress: "debounce"
      "click .key": "onKeyClick"

    initialize: ->
      _.bindAll this, "debounce"
      return

    debounce: (e) ->
      ch = undefined
      clearTimeout @timer  if @timer
      ch = String.fromCharCode(e.keyCode)
      @currentChars = @currentChars + ch
      @timer = setTimeout(_.bind(@callback, this), 300, @currentChars)

    callback: (currentChars) ->
      @onTextEnter currentChars

    processKeyInput: (chars) ->
      chars = chars.replace(/[^0-9 +-.*/]/g, "")
      @prevValidInput = chars.replace(/^[+-.*0\s/]+|[+-.*\s/]+$/g, "")

    onTextEnter: (currentChars) ->
      f = undefined
      lastChar = undefined
      @processKeyInput currentChars
      console.log "prevValidInput: " + @prevValidInput
      f = new Function("return " + @prevValidInput)
      lastChar = currentChars.slice(-1)
      @textbox.val f()  if lastChar isnt "+" and lastChar isnt "-" and lastChar isnt "*" and lastChar isnt "/" and lastChar isnt "."
      @answerBox.html @prevValidInput + " ="

    reset: ->
      @currentChars = ""
      @prevValidInput = ""
      @prevValidClickInput = ""
      @timer = null
      @textbox.val ""
      @answerBox.html ""

    processClickInput: (chars) ->
      chars = chars.replace(/[^0-9 +-.*=/]/g, "")
      @prevValidClickInput = chars.replace(/^[0\s]+|[\s]+/g, "")

    onKeyClick: (ev) ->
      currentValue = undefined
      f = undefined
      input = undefined
      currentValue = $(".tb").val()
      input = $(ev.target).text().trim()
      if input is "="
        @processClickInput currentValue
        f = new Function("return " + @prevValidClickInput)
        @textbox.val f()
      else if input is "AC"
        return @reset()
      else
        @processClickInput currentValue + input
        @textbox.val @prevValidClickInput
      @answerBox.html @prevValidClickInput + " ="
  )
  calculator = new Calculator()
