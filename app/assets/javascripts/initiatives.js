/**
 * Entregar una función a la función $ es equivalente a entregar un callback para el evento
 * DOMContentLoaded, que se gatilla luego de que se carga el DOM por una carga inicial de una página.
 * Sin embargo, al usar turbolinks evitamos que el browser cargue por completo la página (sólo reemplazamos
 * el body) por lo que este evento no se gatillará.
 * Por ello turbolinks gatillará, tanto en la carga inicial de la página como en sucesivas cargas turbolinks,
 * un evento personalizado llamado 'turbolinks:load'. Si escuchamos ese evento en lugar de DOMContentLoaded
 * estaremos considerando todos los casos que necesitamos.
 */
$(document).on('turbolinks:load', function () {
  var $signsContainer, updateCounterUrl;
  if (($signsContainer = $('#initiative-sign-container')).length) {
    // procesamiento de la respuesta del request Ajax para crear una firma
    $signsContainer.on('ajax:success', function (e, data) {
      $('#initiative-sign-container').html(data);
    }).on('ajax:error', function () {
      alert('Ocurrió un error al firmar, inténtalo nuevamente.');
    });

    // actualización de contadores de firmas utilizando pooling
    if (updateCounterUrl = $signsContainer.data('update-counter-url')) {
      var counterUpdateInterval = window.setInterval(function () {
        $.getJSON(updateCounterUrl).success(function (data) {
          $signsContainer.find('.count-number').html(data.count);
        })
      }, 10000);
    }
  }
});
