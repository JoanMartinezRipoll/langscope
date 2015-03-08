$(document).ready(function() {

    var countryName = document.getElementById('country-name');
    var speakers = document.getElementById('speakers');

    $.get("/countries.json", function(data) {

    console.log(data);

    function colorFill(amount) {
        if(amount < 20000000) {
            return "LOW";
        } else if(amount > 20000000 && amount < 100000000) {
            return "MEDIUM";
        } else {
            return "HIGH";
        }
    }

    var map = new Datamap({
        element: document.getElementById('container'),
        fills: {
            HIGH: '#38496C',
            LOW: '#65C7FF',
            MEDIUM: '#3E78D6',
            UNKNOWN: 'rgb(0,0,0)',
            defaultFill: '#B4DDED'
        },
        data: {
            USA: {
                fillKey: colorFill(this.numberOfSpeakers),
                numberOfSpeakers: 103234234281
            },
            GBR: {
                fillKey: colorFill(this.numberOfSpeakers),
                numberOfSpeakers: 10382341
            },
            DEU: {
                fillKey: colorFill(this.numberOfSpeakers),
                numberOfSpeakers: 200232423
            },
            ESP: {
                fillKey: colorFill(this.numberOfSpeakers),
                numberOfSpeakers: 1032342381
            },
            ITA: {
                fillKey: colorFill(this.numberOfSpeakers),
                numberOfSpeakers: 103234281
            },
            CAN: {
                fillKey: colorFill(this.numberOfSpeakers),
                numberOfSpeakers: 1038234231
            }
        },

        geographyConfig: {
            borderColor: '#FFFFFF',
            highlightBorderWidth: 1,
            highlightBorderColor: '#899D82',
            highlightFillColor: '#89E882',
            popupTemplate: function(geo, data) {
                countryName.textContent = geo.properties.name;
                if (data) {
                    speakers.textContent = data.numberOfSpeakers;                    
                
                } else {
                    speakers.textContent = "Not available";
                }
            }
        }
    });
    });

});