document.addEventListener("DOMContentLoaded", function() {
    console.log("DOM completamente caricato. Eseguendo il codice...");

    var specialChars = /[\/<>()[\]{}]/g;
    var inputFields = document.querySelectorAll('input[type="text"], input[type="password"]');
    
    inputFields.forEach(function(input) {
        input.addEventListener("input", function() {
            console.log("Input cambiato:", input.value);
            if (input.value.match(specialChars)) {
                console.log("Trovato carattere speciale. Sostituendo...");
                input.value = input.value.replace(specialChars, '');
                console.log("Nuovo valore:", input.value);
            }
        });
    });
});

function attachInputValidation() {
    var specialChars = /[\/<>()[\]{}]/g;
    var inputFields = document.querySelectorAll('input[type="text"], input[type="password"], textarea');
    
    inputFields.forEach(function(input) {
        input.addEventListener("input", function() {
            if (input.value.match(specialChars)) {
                input.value = input.value.replace(specialChars, '');
            }
        });
    });
}