$(document).on('turbolinks:load', function () {
  var validations = {
    required: {
      validator: function(value) {
        return value && value.trim();
      },
      message: 'es requerido'
    },
    format: {
      validator: function (value, format) {
        if (!value) {
          return true;
        }
        var regexp;
        if (format === 'email') {
          regexp = /^[a-zA-Z0-9_\.\+-]+@(?:[a-zA-Z0-9_-]+\.){1,}[a-zA-Z0-9_-]{2,5}$/;
        } else {
          regexp = new RegExp(format);
        }
        return regexp.test(value);
      },
      message: 'no es válido'
    }
  };

  var ERROR_MESSAGE_CLASS = 'error-message';
  var ERROR_MESSAGE_SELECTOR = '.' + ERROR_MESSAGE_CLASS;
  var FIELD_CONTAINER_SELECTOR = '.field';
  var ERROR_CLASS = 'error'

  function clearErrors($field) {
    $field.next(ERROR_MESSAGE_SELECTOR).hide().parent(FIELD_CONTAINER_SELECTOR).removeClass(ERROR_CLASS);
  }

  function runValidation($field, validationName, validationData) {
    var validation;
    if (validation = validations[validationName]) {
      if (!validation.validator($field.val(), validationData)) {
        var $message = $field.next(ERROR_MESSAGE_SELECTOR);
        if (!$message.length) {
          $message = $('<span></span>').addClass(ERROR_MESSAGE_CLASS).insertAfter($field);
        }
        $message.html(validation.message).show().parent(FIELD_CONTAINER_SELECTOR).addClass(ERROR_CLASS);
        return false;
      }
    }
    return true;
  }

  function runValidations($field) {
    clearErrors($field);
    var inputValidations = $field.data('validate') || {};
    if ($field.prop('required')) {
      inputValidations.required = true;
    }
    for (var validationName in inputValidations) {
      if (!runValidation($field, validationName, inputValidations[validationName])) {
        formHasErrors = true;
        break;
      }
    }
  }

  function getFields($form) {
    return $form.find('input, textarea');
  }

  $('form.validate').on('submit', function () {
    var $form = $(this);
    var formHasErrors = false;
    getFields($form).each(function () {
      if (!runValidations($(this))) {
        formHasErrors = true;
      }
    });
    return !formHasErrors;
  }).on('change', 'input, textarea', function () {
    runValidations($(this));
  });
});
