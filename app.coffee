timer = undefined
currentChars = ""
prevValidInput = ""
prevValidClickInput = ""

textbox = $(".tb")
answerBox = $(".question")

debounce = (e)->
    if(timer)
        clearTimeout(timer)
    #e.stopPropagation()
    #e.preventDefault()
    ch = String.fromCharCode(e.keyCode)
    console.log("prev: "+currentChars)
    currentChars = currentChars + ch
    console.log("next: " +currentChars)
    timer = setTimeout callback, 300, e, currentChars
                        
callback = ()->
    onTextEnter.call(null, arguments)
    
processKeyInput = (chars)->
    chars = chars.replace(/[^0-9 +-.*/]/ig, '')
    prevValidInput = chars.replace(/^[+-.*0\s/]+|[+-.*\s/]+$/g,'')
    
onTextEnter = ()->
    currentChars=arguments[0][1]
    processKeyInput(currentChars)
    console.log("prevValidInput: " +prevValidInput)
    tmpFunc = new Function("return " + prevValidInput)
    textbox.val tmpFunc()
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

$(".key").click ->
      currentValue = $(".tb").val()
      input = $(this).text().trim()
      if input == "="
        processClickInput(currentValue)
        tmpFunc = new Function("return " + prevValidClickInput)
        textbox.val tmpFunc()
      else if input == "AC"
        return reset()
      else
        processClickInput(currentValue + input)
        textbox.val prevValidClickInput
      answerBox.html(prevValidClickInput + " =")