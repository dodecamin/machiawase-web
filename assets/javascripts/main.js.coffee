
$ ->
  # check if form is empty
  $('form').submit =>
    x = $('#form1').val()
    if x isnt ""
      return true
    else
      alert("form is empty")
      return false
      