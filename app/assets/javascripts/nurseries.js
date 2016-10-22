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

$('.remove-child').click(function() {
  $('.child-container').last().remove()
  var check = $('.child-container').length
  if ( check == 1 ) {
    $('.remove-icon').hide();
  } else {
    $('.remove-icon').show();
  }
});
