$(document).ready(function(){

  var optionValue;
  var finalChoice;
  var phenyPer100g;
  var portionWeight;
  var phenyPerServing;

  // gets the value of the food selected from the options list
  $('#select_food').click(function(event){
    event.preventDefault();
    optionValue = $('select#foods option:selected').val();
    portionWeight = $('#food_weight').val();
    selectFoodFromFilter();
    phenyPer100g = finalChoice.nutrients[0].gm;
    perServing();
  });

  // uses the value to select the matching object from filteredFoodArray
  function selectFoodFromFilter(){
    finalChoice = filteredFoodArray[optionValue];
  }

  function perServing(){
    phenyPerServing = (phenyPer100g / 100) * portionWeight;
  }

});
