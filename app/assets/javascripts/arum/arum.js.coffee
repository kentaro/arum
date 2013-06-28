$ ->
  $('div#arum form').each () ->
    form = $(this)
    console.log form
    form.submit (e) ->
      e.preventDefault()
      $.ajax({
        type: form.attr('method'),
        url:  form.attr('action'),
        data: form.serialize(),
      })
