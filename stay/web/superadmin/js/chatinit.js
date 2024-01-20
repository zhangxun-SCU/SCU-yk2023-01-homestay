$.get('/permission_statistics', res => {
    console.log(res)
    const statData = {};
    statData.high = res.data[1].high;
    statData.low = res.data[2].low;
    statData.middle = res.data[3].middle;
    statData.superhigh = res.data[4].superhigh;
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
                    labels: ['user', 'seller', 'manager', 'supermanager'],
                    series: [statData.low, statData.middle, statData.high, statData.superhigh]
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

        $(document).ready(function () {
        });

        $(window).on('load', function () {
            setTimeout(function () {
                dlabChartlist.resize();
            }, 1000);
        });

        $(window).on('resize', function () {
            setTimeout(function () {
                dlabChartlist.resize();
            }, 1000);

        });

    })($);

})

