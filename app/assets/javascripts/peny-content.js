$(document).ready(function(){

  $('#select_food').click(function(event){
    event.preventDefault();
    myNameSpace.optionValue = $('select#foods option:selected').val();
    myNameSpace.portionWeight = $('#food_weight').val();
    console.log(selectFoodFromFilter());
    myNameSpace.phenyPer100g = selectFoodFromFilter().nutrients[0].gm;
    console.log(perServing());
  });

  function selectFoodFromFilter(){
    return myNameSpace.filteredFoodArray[myNameSpace.optionValue];
  }

  function perServing(){
    return ((myNameSpace.phenyPer100g / 100) * myNameSpace.portionWeight).toPrecision(3);
  }

})
