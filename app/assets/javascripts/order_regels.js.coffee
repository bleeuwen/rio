# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Change_artist_sel = ->
  update_artists_path = "/home/update_artists"
  $.ajax
    url: update_artists_path
    data:
      genre_id: $('#genres_select').val()
    dataType: "script"

Change_artikels_sel = ->
  update_artikels_path = "/order_regels/artikel_selectie"
  $.ajax
    url: update_artikels_path
    data:
      artikelgroep_id: $('#artikelgroeps_select').val()
      zoekphrase:  $('artikel_zoekphrase').val()
    dataType: "script"

jQuery ->
  $('#artikelgroeps_select').change Change_artikels_sel

 #http://stackoverflow.com/questions/15685740/rails-dynamically-display-data-based-on-collection-select
#om de omschrjving op te halen uit een id!!!
# goede oefening: http://jsfiddle.net/Tt3TS/
  $("#artikels_select").change ->
    chosen = $(this).find(":selected")
    $("#artikel_selected").text(chosen.data("omschrijving"))
    $("#order_artikel_id").val(@value)
    $("#artikel_error").text(chosen.data("prijs"))
