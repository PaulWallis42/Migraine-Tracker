$(document).ready(function(){
  var foodNameQuery;
  var foodGroupQuery;
  var filteredFoodArray = [];
  var optionValue;
  var finalChoice;
  var phenyPer100g;
  var portionWeight;
  var phenyPerServing;
  var finalName;

  var foodGroups = {'Baby Foods': '0300',
                    'Baked Products': '1800',
                    'Beef Products': '1300',
                    'Beverages': '1400',
                    'Breakfast Cereals': '0800',
                    'Cereal Grains & Pasta': '2000',
                    'Dairy & Egg': '0100',
                    'Fast Foods': '2100',
                    'Fats & Oils': '0400',
                    'Fish & Shellfish': '1500',
                    'Fruits & Fruit Juices': '0900',
                    'Lamb, Veal & Game': '1700',
                    'Legumes & Legume Products': '1600',
                    'Nut & Seed': '1200',
                    'Pork Products': '1000',
                    'Poultry': '0500',
                    'Restaurant Foods': '3600',
                    'Sausages & Luncheon Meats': '0700',
                    'Snacks': '2500',
                    'Soups Sauces & Gravies': '0600',
                    'Spices & Herbs': '0200',
                    'Sweets': '1900',
                    'Vegtables & Veg Products': '1100'};

  (function() {
    for(var group in foodGroups){
      $("#groups_select").append("<option value='" + foodGroups[group] + "'>" + group + "</option>");
    }
  })();

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
    finalName = finalChoice.name;
  }

  function perServing(){
    phenyPerServing = ((phenyPer100g / 100) * portionWeight).toPrecision(3);
    appendFinalCalculation();
  }

  function appendFinalCalculation(){
    $('body').append("<p>Your food choice is: " + finalName + " Pheny total is: " + phenyPerServing + " grams</p>");
  }
});
