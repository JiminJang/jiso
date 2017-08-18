$(document).ready(function() {

  // toggle search bar and disable request if blank...
  $('[data-expanding-search-button]').on('click', function() {
    var parent = $(this).closest('[data-expanding-search]');
    if (parent.find('[data-expanding-search-text]').val() === '') {
      parent.toggleClass('broker-expanding-search--open');
      return false;
    }
  });

});


