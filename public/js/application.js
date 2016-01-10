$(document).ready(function() {
  $("#add-row").click(function(){

    var option_count = $(".question-option-input").length;

    $("#options-container").append("<label for = \"question-option-input\" >Question Response Option:</label> <input class = \"question-option-input\" name = \"options[" + option_count + 1 + "]\" type = \"text\"><br>");
  });
});