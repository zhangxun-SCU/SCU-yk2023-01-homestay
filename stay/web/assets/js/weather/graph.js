drawStatisticLine([], []);

let draw = Chart.controllers.line.__super__.draw; //draw shadow
function drawStatisticLine(labels, data) {
    //gradient line chart
    if (jQuery('#humidity_line').length > 0) {

        const lineChart_2 = document.getElementById("humidity_line").getContext('2d');
        //generate gradient
        const lineChart_2gradientStroke = lineChart_2.createLinearGradient(500, 0, 100, 0);
        lineChart_2gradientStroke.addColorStop(0, "rgba(249, 58, 11, 1)");
        lineChart_2gradientStroke.addColorStop(1, "rgba(249, 58, 11, 0.5)");

        Chart.controllers.line = Chart.controllers.line.extend({
            draw: function () {
                draw.apply(this, arguments);
                let nk = this.chart.chart.ctx;
                let _stroke = nk.stroke;
                nk.stroke = function () {
                    nk.save();
                    nk.shadowColor = 'rgba(0, 0, 128, .2)';
                    nk.shadowBlur = 10;
                    nk.shadowOffsetX = 0;
                    nk.shadowOffsetY = 10;
                    _stroke.apply(this, arguments)
                    nk.restore();
                }
            }
        });

        lineChart_2.height = 100;
        let maxHumidity = data === null || data === undefined ? 100 : Math.max(...data) + 30;
        new Chart(lineChart_2, {
            type: 'line',
            data: {
                defaultFontFamily: 'Poppins',
                labels: labels,
                datasets: [
                    {
                        label: "湿度",
                        data: data,
                        borderColor: lineChart_2gradientStroke,
                        borderWidth: "2",
                        backgroundColor: 'transparent',
                        pointBackgroundColor: 'rgba(249, 58, 11, 0.5)'
                    }
                ]
            },
            options: {
                legend: false,
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true,
                            max: maxHumidity,
                            min: 0,
                            stepSize: 20,
                            padding: 10
                        }
                    }],
                    xAxes: [{
                        ticks: {
                            padding: 5
                        }
                    }]
                }
            }
        });
    }
}

drawStatisticLine();

$("#city_button").click((e) => {
    let url = getUrlHead() + "/weather";
    let city = $("#city").val();
    if (city !== undefined && city !== null && city !== "") {
        let data = {
            "action": "get_weather_statistics",
            "city": city
        };
        let labels = [];
        let lineData = [];
        $.ajaxSettings.async = false;
        $.post(
            url,
            data,
            (res) => {
                console.log(res);
                if (res.result_code === 0) {
                    console.log(res.result_msg);
                    let list = res.statistics;
                    for (let i = 0; i < list.length; i++) {
                        let stat = list[i];
                        labels.push(stat.create_time);
                        lineData.push(Number(stat.humidity));
                    }
                }
            }
        )
        $.ajaxSettings.async = true;
        drawStatisticLine(labels, lineData);
    } else {
        sweetAlert(
            "Error",
            "请输入要查询的城市！",
            "error"
        );
    }
})