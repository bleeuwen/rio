# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Artikelnummer =
  cleanNumber: (number) ->
    number.replace /[- ]/g, ""

  validNumber: (number) ->
    number = @cleanNumber(number)
    number - 125 == 0

jQuery ->
  $("#artikel_artikelnummer").blur ->
    if Artikelnummer.validNumber(@value)
      $("#artikel_error").text(@value)
    else
      $("#artikel_error").text("Mag niet dit getal zijn" + @value)



##alert "Hieperdepiep"
## some databees actions

