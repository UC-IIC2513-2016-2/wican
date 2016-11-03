// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  $('#initiative-sign form').on('ajax:success', function (e, data) {
    $('#initiative-sign').replaceWith(data);
  }).on('ajax:error', function () {
    alert('Ocurrió un error al firmar, inténtalo nuevamente.');
  });
});
