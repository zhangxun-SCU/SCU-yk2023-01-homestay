(function ($) {
    "use strict"


    var dlabChartlist = function () {

        var screenWidth = $(window).width();

        var setChartWidth = function () {

            if (screenWidth <= 768) {
                var chartBlockWidth = 0;
                if (screenWidth >= 500) {
                    chartBlockWidth = 250;
                } else {
                    chartBlockWidth = 300;
                }

                jQuery('.chartlist-chart').css('min-width', chartBlockWidth - 31);
            }
        }

        var pieChart = function () {
            //Pie chart with custom labels

            var data = {
                labels: ['35%', '55%', '10%'],
                series: [50, 15, 40]
            };

            var options = {
                labelInterpolationFnc: function (value) {
                    return value[0]
                }
            };

            var responsiveOptions = [
                ['screen and (min-width: 640px)', {
                    chartPadding: 30,
                    donut: true,
                    labelOffset: 100,
                    donutWidth: 60,
                    labelDirection: 'explode',
                    labelInterpolationFnc: function (value) {
                        return value;
                    }
                }],
                ['screen and (min-width: 1024px)', {
                    labelOffset: 60,
                    chartPadding: 20
                }]
            ];

            new Chartist.Pie('#pie-chart', data, options, responsiveOptions);

        }


        /* Function ============ */
        return {
            init: function () {
            },
			
            load: function () {
                setChartWidth();
                pieChart();
            },

            resize: function () {
                setChartWidth();
                pieChart();
            }
        }

    }();

    jQuery(document).ready(function () {
    });

    jQuery(window).on('load', function () {
        setTimeout(function () {
            dlabChartlist.resize();
        }, 1000);
    });

    jQuery(window).on('resize', function () {
        setTimeout(function () {
            dlabChartlist.resize();
        }, 1000);

    });

})(jQuery);