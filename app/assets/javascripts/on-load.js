$(document).ready(function(){
  $('#choose_from_list').hide();

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

});
