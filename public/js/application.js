$(document).ready(function () {
  recipeSearch();
  sliderLoader();
});

function recipeSearch() {
  $('#query-interface').on('submit', 'form', function (event) {
    event.preventDefault();
    var $form = $(this);
    var url = $form.attr('action');
    var method = $form.attr('method');
    var data = $form.serialize();
    $.ajax({
      url: url,
      method: method,
      data: data,
    })
    .done(function (response) {
      $('#query-interface').empty();
      $('#query-interface').append(response);
    })
    .fail(function () {
      alert('Something went wrong!');
    });
  });
}

function sliderLoader() {
  $('.slider').slider({
    max: 100,
    min: 0,
    orientation: 'vertical',
    // value: parseInt($(this).attr('id')),
    change: function (event, ui) {
      var initialValue = $(this).parent().next().attr('value');
      $(this).parent().find('.percentage').html(ui.value + '%');
      $(this).parent().next().attr('value', (ui.value * initialValue) / initialValue);
    },
  });
}
