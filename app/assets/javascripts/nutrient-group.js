var myNameSpace = {};

$(document).ready(function(){

  $("#find_food_submit").click(function(event) {
    event.preventDefault();
    myNameSpace.foodNameQuery = $('#find_food_field').val();
    myNameSpace.foodGroupQuery = $('select#groups_select option:selected').val();
    getListOfNutrients();
  });

  function getListOfNutrients(){
    var url = "http://api.nal.usda.gov/ndb/nutrients/"
    var params = "?format=json&max=1500&"
    var apiKey = "&api_key=jN1zCCJEqMHOiOY57WmAN7PXDxCVqD1hGIrrAGIN&nutrients=508"

    $.get(url + params + 'fg=' + myNameSpace.foodGroupQuery + apiKey, function(data){
      apiFunction(data);
    });
  }

  function capitalize(string){
    if(string.charAt(0) !== string.charAt(0).toUpperCase()){
      return string.charAt(0).toUpperCase() + string.slice(1);
    }
  }

  function apiFunction(data){
    var foodArray = data.report.foods; //array of food objects
    myNameSpace.filteredFoodArray = [];
    for(var i in foodArray){
      var food = foodArray[i].name;
      if (food.indexOf(myNameSpace.foodNameQuery) > -1 ||
          food.indexOf(capitalize(myNameSpace.foodNameQuery)) > -1 ||
          food.indexOf(myNameSpace.foodNameQuery.toLowerCase()) > -1)
      {
        myNameSpace.filteredFoodArray.push(foodArray[i])
      }
    }
    appendResults(myNameSpace.filteredFoodArray);
  }

  function appendResults(foods){
    for(var food in foods){
      $("#foods").append("<option value='" + food + "'>" + foods[food].name + "</option>");
    }
    $('#choose_from_list').show();
  }

})
