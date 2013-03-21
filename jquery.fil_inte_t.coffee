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

    #main loop to show text
    showText = (element, array, textLength, delay) ->
      if array.length > 0
        order = array.shift()
        element.innerHTML = element.innerHTML.substr(0, order) +
          element.tempHTML[order] + element.innerHTML.substr(order+1, textLength)
        setTimeout ->
          showText element, array, textLength, delay
        , delay

    #init element
    @each ->
      textLength = @innerHTML.length
      @tempHTML = @innerHTML
      @innerHTML = ''
      @innerHTML += (if @tempHTML[i] is ' ' then ' ' else '_')  for i in [1..textLength]
      setTimeout =>
        showText(@, (if options.random is on then [0...textLength].sort(->
          return 0.5 - Math.random()
        ) else [0...textLength]), textLength, options.speed / textLength)
      , options.delay
