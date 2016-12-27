$(function() {
  function toggleRemoveButton() {
    var numberOfChildren = $('.child-container').length;

    if ( numberOfChildren == 1 ) {
      $('.remove-icon').hide();
    } else {
      $('.remove-icon').show();
    }
  }
  $('.add-child').click(function() {
    var numberOfChildren = $('.child-container').length;
    var data = { index: numberOfChildren };
    var additionalChild = JST['views/registrations/additional_child'](data);
    $('.children').append($(additionalChild));

    toggleRemoveButton();
  });

  $('.remove-child').click(
    function() {
      $('.child-container').last().remove();
      toggleRemoveButton();
    });

  $('.appointment-check').change(
    function() {
      showOptionalText(this, ".appointment");
    });

  $('.sibling-check').change(
    function() {
      showOptionalText(this, ".sibling");
      showOpeningText();
    });

  $('.located-nearby-check').change(
    function() {
      showOptionalText(this, ".located-nearby");
      showOpeningText();
    });

  $('.recommendation-check').change(
    function() {
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

  $('.recommendation-field').on(
    'propertychange input',
    function() {
      var name = $(this).val();
      $('.recommendation-person').text(name);
    });

  $('.add-freetext').click(
    'textarea',
    function(event) {
      event.preventDefault();
      var foo = $('.freetext').val();
      $('.placeholder').fadeIn();
      $('.placeholder').text(foo);
    });

  $('.empty-text').click(
    'textarea',
    function(event) {
      event.preventDefault();
      $('.freetext').val('');
      $('.placeholder').fadeOut();
    }
  )

  console.log();
});
