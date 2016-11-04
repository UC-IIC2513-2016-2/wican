$(function () {
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
      }, 1000);
    }
  }
});
