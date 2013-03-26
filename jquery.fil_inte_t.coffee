# Fil_InTe_t 0.1
# https://github.com/mingchoi/Fil_InTe_t
# MIT licensed
#
# Copyright (C) 2013 Mingchoi, http://mingchoi.twbbs.org

$.fn.extend
  Fil_InTe_t: (options)->

    #init options
    switch options.speed
      when 'slow' then options.speed = 5000
      when 'normal' then options.speed = 3000
      when 'fast' then options.speed = 1000

    #init element
    @each ->
      new DomTextFill @, options.speed, options.delay, options.random, options.replaceChar

class DomTextFill

  #dom
  #text
  #fillChar
  #textLength
  #orderArr
  #speed

  constructor: (@dom, @speed, delay, random, replaceChar) ->

    #init
    @text = @dom.innerHTML
    @textLength = @text.length
    @orderArr = if random is on then [0...@textLength].sort( -> return 0.5 - Math.random() ) else[0...@textLength]
    @dom.innerHTML = "abc"
    @speed = @speed / @textLength
    replaceChar = '_' if replaceChar is undefined

    #ready for effect
    @fillChar = ''
    @fillChar += (if @text.charAt(i) is ' ' then ' ' else replaceChar) for i in [1..@textLength]
    @dom.innerHTML = @fillChar
    setTimeout =>
      @showNextChar()
    , delay
    

  showNextChar: () ->
    if @orderArr.length > 0
      order = @orderArr.shift()
      @fillChar = @fillChar.substr(0, order) + @text.charAt(order) + @fillChar.substr(order+1, @textLength)
      @dom.innerHTML = @fillChar
      setTimeout =>
        @showNextChar()
      , @speed
