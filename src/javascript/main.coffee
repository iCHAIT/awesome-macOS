$(document).ready ->

  filter = ->
    value = $('input').val()
    re = new RegExp(value, "i")
    $("h2, h3").each ->
      id = $(this).attr('id')
      list = $(this).next()
      list.find('li').each ->
        if $(this).text().match(re)
          $(this).show()
        else
          $(this).hide()
    if value == ''
      $('.content li').hide()

  $('input')
    .on 'change keyup paste', filter

  $.get 'README.md', (resp) ->
    $('.content').html marked resp
    $('.content li').hide()
    logo = $('.content .logo')
    logo.remove()
    $('main').prepend(logo)
    $('#contribute, #contribute ~ *').remove()
