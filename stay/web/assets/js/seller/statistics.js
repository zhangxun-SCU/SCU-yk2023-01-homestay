function onloadFunction() {
    getStatistics();
    getExportURL();
}

let draw = Chart.controllers.line.__super__.draw; //draw shadow

function getStatistics() {
    console.log(1);
    getTotalSales("specialty");
    getTopSales("specialty");
    getTotalSales("homestay");
    getTopSales("homestay");
}

function getTotalSales(type) {
    let url = getUrlHead() + "/seller";
    let data = {
        "actionType": type,
        "action": "get_statistics",
        "owner_id": getUserInfo().id
    };
    let labels = [];
    let graphData = [];
    $.ajaxSettings.async = false;
    $.post(
        url,
        data,
        (res) => {
            if (res.resCode === "00000") {
                let sales = res.sales;
                for (let i = 0; i < sales.length; i++) {
                    let sale = sales[i];
                    labels.push(sale.date);
                    graphData.push(sale.total_sale);
                }
            }
        }
    )
    drawTotalSales(labels, graphData, type);
    $.ajaxSettings.async = true;
}

function getTopSales(type) {
    console.log(type);
    let url = getUrlHead() + "/seller";
    let data = {
        "actionType": type,
        "action": "get_statistics",
        "owner_id": getUserInfo().id,
        "limit": 5
    };
    let labels = [];
    let graphData = [];
    $.ajaxSettings.async = false;
    $.post(
        url,
        data,
        (res) => {
            if (res.resCode === "00000") {
                let sales = res.sales;
                console.log(sales);
                for (let i = 0; i < sales.length; i++) {
                    let sale = sales[i];
                    labels.push(sale.name);
                    graphData.push(sale.total_sale);
                }
            }
        }
    )
    drawTopSales(labels, graphData, type);
    $.ajaxSettings.async = true;
}

function drawTotalSales(labels, data, type) {
    let element_id = `${type}_total_sales`;
    //gradient line chart
    if (jQuery(`#${element_id}`).length > 0) {

        const totalSalesChart = document.getElementById(element_id).getContext('2d');
        //generate gradient
        const lineChart_2gradientStroke = totalSalesChart.createLinearGradient(500, 0, 100, 0);
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

        totalSalesChart.height = 100;
        let max = Math.max(...data);
        let n = max.toString().length;
        let step = Math.pow(10, n > 3 ? (n - 1) : 2);

        new Chart(totalSalesChart, {
            type: 'line',
            data: {
                defaultFontFamily: 'Poppins',
                labels: labels,
                datasets: [
                    {
                        label: "当日总销量",
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
                            beginAtZero: false,
                            max: max + step,
                            min: 0,
                            stepSize: step,
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

function drawTopSales(labels, data, type) {
    let element_id = `${type}_top_sales`;
    console.log(element_id);
    if (jQuery(`#${element_id}`).length > 0) {

        //gradient bar chart
        const topSalesChart = document.getElementById(element_id).getContext('2d');
        //generate gradient
        const barChart_2gradientStroke = topSalesChart.createLinearGradient(0, 0, 0, 250);
        barChart_2gradientStroke.addColorStop(0, "rgba(249, 58, 11, 1)");
        barChart_2gradientStroke.addColorStop(1, "rgba(249, 58, 11, 0.5)");

        topSalesChart.height = 100;

        new Chart(topSalesChart, {
            type: 'bar',
            data: {
                defaultFontFamily: 'Poppins',
                labels: labels,
                datasets: [
                    {
                        label: "销量",
                        data: data,
                        borderColor: barChart_2gradientStroke,
                        borderWidth: "0",
                        backgroundColor: barChart_2gradientStroke,
                        hoverBackgroundColor: barChart_2gradientStroke
                    }
                ]
            },
            options: {
                legend: false,
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }],
                    xAxes: [{
                        // Change here
                        barPercentage: 0.5
                    }]
                }
            }
        });
    }
}

function getExportURL() {
    let url = getUrlHead() + "/seller";
    let data = {
        "actionType": "export",
        "owner_id": getUserInfo().id
    };
    $.post(
        url,
        data,
        (res) => {
            if (res.resCode === "00000") {
                console.log(res);
                document.getElementById("download").href = res.download_path;
            }
        }
    )
}

