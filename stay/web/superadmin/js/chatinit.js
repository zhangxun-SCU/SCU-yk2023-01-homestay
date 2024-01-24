$.get('/permission_statistics', res => {
    console.log(res)
    const statData = {};
    // statData.high = res.data[0].high;
    statData.low = res.data[1].low;
    statData.middle = res.data[2].middle;
    statData.superhigh = res.data[3].superhigh;
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
                console.log("stata", statData)
                var data = {
                    labels: ['user', 'seller', 'supermanager'],
                    series: [statData.low, statData.middle, statData.superhigh]
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
                    console.log("load")
                    setChartWidth();
                    pieChart();
                },

                resize: function () {
                    console.log("resize")
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