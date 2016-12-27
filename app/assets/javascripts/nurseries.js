$(function() {
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
});
