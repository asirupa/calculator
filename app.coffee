(window.Calculator = ->
    timer = undefined
    currentChars = ""
    prevValidInput = ""
    prevValidClickInput = ""
    
    textbox = $(".tb")
    answerBox = $(".question")
    
    debounce = (e)->
        clearTimeout timer if timer
        ch = String.fromCharCode(e.keyCode)
        #console.log("prev: "+currentChars)
        currentChars = currentChars + ch
        #console.log("next: " +currentChars)
        timer = setTimeout callback, 300, currentChars
                            
    callback = (currentChars)->
        onTextEnter(currentChars)
        
    processKeyInput = (chars)->
        chars = chars.replace(/[^0-9 +-.*/]/ig, '')
        prevValidInput = chars.replace(/^[+-.*0\s/]+|[+-.*\s/]+$/g,'')
        
    onTextEnter = (currentChars)->
        processKeyInput currentChars
        console.log("prevValidInput: " +prevValidInput)
        f = new Function("return " + prevValidInput)
        lastChar = currentChars.slice -1
        if lastChar isnt "+" and lastChar isnt "-" and lastChar isnt "*" and lastChar isnt "/" and lastChar isnt "."
            textbox.val f()
        answerBox.html(prevValidInput + " =")
        
    textbox.on "keypress", debounce
    
    reset = ()->
        currentChars = ""
        prevValidInput = ""
        prevValidClickInput = ""
        timer = undefined
        textbox.val ""
        answerBox.html ""
        
    processClickInput = (chars)->
        chars = chars.replace(/[^0-9 +-.*=/]/ig, '')
        prevValidClickInput = chars.replace(/^[0\s]+|[\s]+/g,'')
    
    onKeyClick = ->
          currentValue = $(".tb").val()
          input = $(this).text().trim()
          if input is "="
            processClickInput currentValue
            f = new Function("return " + prevValidClickInput)
            textbox.val f()
          else if input is "AC"
            return reset()
          else
            processClickInput(currentValue + input)
            textbox.val prevValidClickInput
          answerBox.html prevValidClickInput + " ="
          
    $(".key").on "click", onKeyClick
          
    return {} =
        processClickInput: processClickInput,
        reset: reset,
        processKeyInput: processKeyInput,
        onTextEnter: onTextEnter,
        callback: callback
)()