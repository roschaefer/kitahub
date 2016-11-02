$('.nursery-filter input[name = "district[]"]').change(function () {
  $('.nursery-filter').submit();
});

$('.nursery-filter input[name = all]').change(function () {
  if ($(this).is(':checked')) {
    $('.nursery-filter input[name = "district[]"]').prop('checked', true);
  }
  else {
    $('.nursery-filter input[name = "district[]"]').prop('checked', false);
  }
  $('.nursery-filter').submit();
});

$('.nursery-filter').submit(function(event) {
  event.preventDefault();
  var form = $(this);
  var url = form.attr('action') + "?" + form.serialize();
  $('.results').load(url);
});

$('.add-child').click(function() {
  $('.child-container').first().clone().appendTo('.next-child');
  $('.remove-icon').show();
  var check = $('.child-container').length
  if ( check == 1 ) {
    $('.remove-icon').hide();
  } else {
    $('.remove-icon').show();
  }
});

$('.remove-child').click(
  function() {
  $('.child-container').last().remove()
  var check = $('.child-container').length
  if ( check == 1 ) {
    $('.remove-icon').hide();
  } else {
    $('.remove-icon').show();
  }
});

$('.appointment-check').change(
  function(){
    showOptionalText(this, ".appointment");
});

$('.sibling-check').change(
  function(){
    showOptionalText(this, ".sibling");
    showOpeningText();
});

$('.located-nearby-check').change(
  function(){
    showOptionalText(this, ".located-nearby");
    showOpeningText();
});

$('.recommendation-check').change(
  function(){
    showOptionalText(this, ".recommendation");
    showOpeningText();
});

function showOptionalText(element, selector){
  if ($(element).is(':checked')) {
    $( selector ).fadeIn('slow');
  } else {
    $( selector ).fadeOut();
  }
}

$('.recommendation-field').on('propertychange input',
  function(){
    var name = $(this).val();
    $('.recommendation-person').text(name);
});

$('.add-freetext').click('textarea',
  function(event){
    event.preventDefault();
    var foo = $('.freetext').val();
    $('.placeholder').fadeIn();
    $('.placeholder').text(foo);
});

$('.empty-text').click('textarea',
  function(event){
    event.preventDefault();
    $('.freetext').val('');
    $('.placeholder').fadeOut();
  }
)
