$('.nursery-filter input').change(function () {
  $('.nursery-filter').submit();
});

$('.nursery-filter').submit(function(event) {
  event.preventDefault();
  var form = $(this);
  var url = form.attr('action') + "?" + form.serialize();
  $('.results').load(url);
});
