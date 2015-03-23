$(document).ready(function(){
    $(".city").autocomplete({
        source: $(".city").data('autocomplete-source')});
    $(".country").autocomplete({
        source: $(".country").data('autocomplete-source')});

});