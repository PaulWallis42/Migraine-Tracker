$(document).ready(function(){

  var foodNameQuery;
  var foodGroupQuery;
  var filteredFoodArray = [];

  // initially hiding final list for user to choose from
  $('#choose_from_list').hide();

  // after entering food type and keyword function stores those values and executes api call
  $("#find_food_submit").click(function(event) {
    event.preventDefault();
    foodNameQuery = $('#find_food_field').val();
    foodGroupQuery = $('select#groups_select option:selected').val();
    getListOfNutrients();
  });

  // api call to US department of Agriculture returning all results of selected type of food
  function getListOfNutrients(){
    var url = "http://api.nal.usda.gov/ndb/nutrients/"
    var params = "?format=json&max=1500&"
    var apiKey = "&api_key=jN1zCCJEqMHOiOY57WmAN7PXDxCVqD1hGIrrAGIN&nutrients=508"

    $.get(url + params + 'fg=' + foodGroupQuery + apiKey, function(data){
      apiFunction(data);
    });
  }

  // function to capitalize the users keyword
  function capitalize(string){
    if(string.charAt(0) !== string.charAt(0).toUpperCase()){
      return string.charAt(0).toUpperCase() + string.slice(1);
    }
  }

  // filters the returned data from US dept of Ag by users keyword and stores results in filteredFoodArray
  function apiFunction(data){
    var foodArray = data.report.foods; //array of food objects
    for(var i in foodArray){
      var food = foodArray[i].name;
      if (food.indexOf(foodNameQuery) > -1 ||
          food.indexOf(capitalize(foodNameQuery)) > -1 ||
          food.indexOf(foodNameQuery.toLowerCase()) > -1)
      {
        filteredFoodArray.push(foodArray[i])
      }
    }
    appendResults(filteredFoodArray);
  }

  // appends the filteredFoodArray into an option list for user to choose most appropriate result
  function appendResults(foods){
    for(var food in foods){
      $("#foods").append("<option value='" + food + "'>" + foods[food].name + "</option>");
    }
    $('#choose_from_list').show();
  }

});
