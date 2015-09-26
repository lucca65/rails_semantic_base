#= require jquery
#= require semantic-ui
#= require jquery.turbolinks
#= require_tree .
#= require semantic-datepicker
#= require maskmoney

# Clear any login behavior
$('html').attr('style', '')

$('document').ready ->
  # Turbolinks
  Turbolinks.enableProgressBar(true)
  Turbolinks.enableTransitionCache()
  $("#q_amount_eq").maskMoney(
    prefix: 'R$'
    decimal: ','
    thousands: '.'
  )

# Semantic UI Behaviors
$('.ui.dropdown').dropdown({
  fullTextSearch: true
})
$('.message .close').on 'click', ->
  $(this).closest('.message').fadeOut()

# Datepicker
$('.datepicker').semanticDatePicker(
  locale: 'pt-br'
  name: 'q[dtTransaction_date_equals]'
  minDate: moment().subtract(24, 'months')
  maxDate: moment()
  selectedDate: moment()).on 'semanticDatePicker:change', (e, date) ->
  # Datepicker change event
  $(this).parents('form').submit()
  return


  $(".filter").on "change", (e) ->
    $(this).parents('form').submit()


  $('#check_to_all').click ->
    $("#users").toggle @checked
  return
