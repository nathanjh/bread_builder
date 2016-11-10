$(document).ready(function () {
  recipeSearch();
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
