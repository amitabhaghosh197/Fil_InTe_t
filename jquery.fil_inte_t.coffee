$.fn.extend
  fillInText: ()->
    @each ->
      @tempHTML = @innerHTML
      @innerHTML = ''
      @innerHTML += '-' for i in [1..@tempHTML.length]


#testing
$(document).ready ->
  $('.orderFill').fillInText()
