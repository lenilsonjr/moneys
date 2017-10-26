//= require gritter
//= require pickadate/picker
//= require pickadate/picker.date
//= require pickadate/picker.time
//= require pickadate/translations/pt_BR
//= require jQuery-Mask-Plugin
//= require filterrific/filterrific-jquery
//= require rails.validations
//= require rails.validations.simple_form
//= require bootbox
//= require Chart.bundle
//= require bootstrap3-typeahead.min
//= require bootstrap3-autocomplete-input.min
//= require chartkick
//= require underscore-min
//= require cocoon
//= require sounds
//= require cable
//= require jquery.simplecolorpicker.js

// Sobrescreve data-confirm do Rails
$.rails.allowAction = function(element) {
  var message = element.attr('data-confirm');
  var ok = element.attr('data-ok');
  var cancel = element.attr('data-cancel');
  var type = element.attr('data-type');
  if (!message) { return true; }

  var opts = {
    title: "Confirmação",
    message: message,
    buttons: {
      confirm: {
        label: ok,
        className: 'btn-' + type
      },
      cancel: {
        label: cancel,
        className: 'btn-white'
      }
    },
    callback: function(result) {
      if (result) {
        element.removeAttr('data-confirm');
        element.trigger('click.rails')
      }
    }
  };

  bootbox.confirm(opts);

  return false;
}

$.extend($.gritter.options, {
  position: 'bottom-left'
});

$('.datepicker').each(function() {
  var $picker = $(this);  
  $picker.pickadate({
  format: 'dd/mm/yyyy',
  formatSubmit: false,
  firstDay: 1,
  selectYears: 100,
  selectMonths: true,
  //container: $picker.parent().parent().parent()
  });
});

$('.timepicker').each(function() {
  var $picker = $(this);  
  $picker.pickatime({
  format: 'H:i',
  // interval: 40,
  // min: [8,0],
  // max: [17,20],
  //container: $picker.parent().parent().parent()
  });
});

$('.editable').popover({
  placement: 'auto'
})
$('.price-brl').mask("#.##0,00", {reverse: true, clearIfNotMatch: true });
$('.price').mask("#.##0,00", { reverse: true, clearIfNotMatch: true });
$('.cpf').mask('000.000.000-00');
$('.cnpj').mask('00.000.000/0000-00');
$('.date-mask').mask('00/00/0000');
$('.cep').mask('00000-000');

$(document).on('cocoon:after-insert', function(e, insertedItem){

  $('.price-brl').mask("#.##0,00", {reverse: true, clearIfNotMatch: true });
  $('.price').mask("#.##0,00", { reverse: true, clearIfNotMatch: true });
  $('.cpf').mask('000.000.000-00');
  $('.cnpj').mask('00.000.000/0000-00');
  $('.date-mask').mask('00/00/0000');
  $('.cep').mask('00000-000');

});  

var SPMaskBehavior = function (val) {
  return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
},
spOptions = {
  onKeyPress: function(val, e, field, options) {
    field.mask(SPMaskBehavior.apply({}, arguments), options);
  }
};

$('.cellphone').mask(SPMaskBehavior, spOptions);

ClientSideValidations.formBuilders['NestedForm::SimpleBuilder'] = ClientSideValidations.formBuilders['SimpleForm::FormBuilder'];

$(document).on('change', '.radio-icon', function(e){  

  image = $(this).val();
  $('.radio-icon-selected').attr('src', '/assets/banks/' + image);

});

$('select.colorpicker').simplecolorpicker({picker: true, theme: 'fontawesome'});
