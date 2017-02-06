$(document).ready(function(){

  $('#select_food').click(function(event){
    myNameSpace.optionValue = $('select#foods option:selected').val();
    myNameSpace.portionWeight = $('#food_weight').val();
    myNameSpace.phenyPer100g = selectFoodFromFilter().nutrients[0].gm;
    upDateFormValues();
  });

  function selectFoodFromFilter(){
    return myNameSpace.filteredFoodArray[myNameSpace.optionValue];
  }

  function perServing(){
    return ((myNameSpace.phenyPer100g / 100) * myNameSpace.portionWeight).toPrecision(3);
  }

  function upDateFormValues(){
    $('#name').val(selectFoodFromFilter().name);
    $('#food_quant').val(myNameSpace.portionWeight);
    $('#phen_quant').val(perServing());
  }
})
