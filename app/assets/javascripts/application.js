// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require turbolinks
//= require turboboost
//= require_tree .


$(function () {
    $('#submit').removeAttr("disabled");
    $("#slider-range").slider({
        range: true,
        min: 0,
        max: (Number)($('#hidden').text()),
        step: 0.5,
        values: [ 0, (Number)($('#hidden').text())],
        slide: function (event, ui) {
            $("#amount").val((ui.values[ 0 ]).toFixed(2) + " - " + (ui.values[ 1 ]).toFixed(2));

        }
//        change: function (event, ui) {
//            $('#price_to_search').text(range_to_currency($("#amount").val()));
//        }
    });
    $("#amount").val(($("#slider-range").slider("values", 0)).toFixed(2) +
        " - " + ($("#slider-range").slider("values", 1)).toFixed(2));
//    $('#price_to_search').text(range_to_currency($("#amount").val()));

});
setInterval(function () {
    $('#submit[disabled=disabled]').removeAttr("disabled");
    $("#slider-range:not(.ui-slider)").slider({
        range: true,
        min: 0,
        max: (Number)($('#hidden').text()),
        step: 0.5,
        values: [ 0, (Number)($('#hidden').text())],
        slide: function (event, ui) {
            $("#amount").val((ui.values[ 0 ]).toFixed(2) + " - " + (ui.values[ 1 ]).toFixed(2));
        }
//        change: function (event, ui) {
//            $('#price_to_search').text(range_to_currency($("#amount").val()));
//        }
    });
    $("#amount").val(($("#slider-range").slider("values", 0)).toFixed(2) +
        " - " + ($("#slider-range").slider("values", 1)).toFixed(2));
}, 500);


//function range_to_currency(range) {
//    currency = $('#currency').val();
//    range_array = range.split(" - ");
//    switch (currency) {
//        case 'USD':
//            return [(Number)(range_array[0]).toFixed(2), (Number)(range_array[1]).toFixed(2)];
//        case 'RUB':
//            return [(Number)(range_array[0] * 0.03).toFixed(2), (Number)(range_array[1] * 0.03).toFixed(2)];
//        case 'EUR':
//            return [(Number)(range_array[0] * 1.36).toFixed(2), (Number)(range_array[1] * 1.36).toFixed(2)];
//    }
//}