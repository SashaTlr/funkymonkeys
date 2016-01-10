$(document).ready(function() {
  $("#add-row").click(function(){

    var option_count = $(".question-option-input").length;

    $("#options-container").append("<label for = \"question-option-input\" >Question Response Option:</label> <input class = \"question-option-input\" name = \"options[" + option_count + 1 + "]\" type = \"text\"><br>");
  });


  $("#questions-show-container").on("click", ".question_link", function (event){
    var x = event.target
    event.preventDefault();
   $.ajax({
    type: "GET",
    url: $(this).attr("href")
    }).done(function(response) {
      $(x.parentElement).html(response);
    });
  });


  $("#questions-show-container").on("submit", ".edit-question-form", function (event){
    var x = event.target
    event.preventDefault();
   $.ajax({
    type: "PUT",
    url: $(this).attr("action"),
    data: $(this).serialize()
    }).done(function(response) {
      $(x).html(response);
    });
  });

})









