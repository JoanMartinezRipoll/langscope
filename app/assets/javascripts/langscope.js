var map;

$(document).ready(function() {

    var countryName = document.getElementById('country-name');
    var speakers = document.getElementById('speakers');

    $.get("/countries.json", function(data) {

    var countryCollection = {};

    for (var i = 0; i < data.length; i++) {
        countryCollection[data[i].code] = {
            fillKey: colorFill(data[i].population),
            population: data[i].population
        }
    }

    function colorFill(amount) {
        if(amount < 20000000) {
            return "LOW";
        } else if(amount > 20000000 && amount < 100000000) {
            return "MEDIUM";
        } else {
            return "HIGH";
        }
    }

    map = new Datamap({
        element: document.getElementById('container'),
        fills: {
            HIGH: '#38496C',
            LOW: '#65C7FF',
            MEDIUM: '#3E78D6',
            UNKNOWN: 'rgb(0,0,0)',
            defaultFill: '#B4DDED'
        },
        data: countryCollection,
        geographyConfig: {
            borderColor: '#FFFFFF',
            highlightBorderWidth: 1,
            highlightBorderColor: '#899D82',
            highlightFillColor: '#89E882',
            popupTemplate: function(geo, data) {
                countryName.textContent = geo.properties.name;
                if (data) {
                    speakers.textContent = data.population;                    
                
                } else {
                    speakers.textContent = "Not available";
                }
            }
        }
    });
    });

});