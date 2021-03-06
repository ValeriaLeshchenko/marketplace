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
//= require select2
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
    if ($('#product_index').length != 0) {
        $("#amount").val(($("#slider-range").slider("values", 0)).toFixed(2) +
            " - " + ($("#slider-range").slider("values", 1)).toFixed(2));
        $("select").select2({
            width: 'resolve'
        });

        $("#e7").select2({
            multiple: true,
            width: 'resolve',
            //        minimumInputLength: 3,
            ajax: {
                dataType: "json",
                quietMillis: 100,
                url: "/tags/index.json",
                data: function (term, page) {
                    return {
                        q: term,
                        page_limit: 10, // page size
                        page: page // page number
                    };
                },
                results: function (data, page) {
                    var more = (page * 10) < data[0].total;
                    return {results: data, more: more};
                }
            }
        });
    }

    $('#product_tag_list').val('');
    $(document).on("page:load", function() {
        if ($('#product_index').length != 0) {
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
                $('select[class=select2], select[class=table_select2]').select2({
                    width: 'resolve'
                });
                $("#e7[class=select2]").select2({
                    multiple: true,
                    width: 'resolve',
                    //        minimumInputLength: 3,
                    ajax: {
                        dataType: "json",
                        quietMillis: 100,
                        url: "/tags/index.json",
                        data: function (term, page) {
                            return {
                                q: term,
                                page_limit: 10, // page size
                                page: page // page number
                            };
                        },
                        results: function (data, page) {
                            var more = (page * 10) < data[0].total;
                            return {results: data, more: more};
                        }
                    }
                });
            }
    });
});
