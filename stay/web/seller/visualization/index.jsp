<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>生意参谋大数据可视化HTML模板</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="css/comon0.css">
    <style>
        .text-white {
            color: white;
        }

        .text-orange {
            color: orange;
        }
    </style>
</head>
<body onload="onLoadFunction();">
<div class="loading">
    <div class="loadbox"><img src="images/loading.gif"> 页面加载中...</div>
</div>
<div class="head">
    <h1>生意参谋大数据可视化</h1>
    <div class="weather">
        <img src="images/weather.png">
        <span><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%></span>
    </div>
</div>
<div class="mainbox">
    <ul class="clearfix">
        <li>
            <div class="boxall" style="height: 5.2rem">
                <div class="alltitle">生意参谋</div>
                <div class="sycm">
                    <ul class="clearfix">
                        <li><h2 id="specialty_today">0</h2><span>今日特产销售额</span></li>
                        <li><h2 id="specialty_yesterday">0</h2><span>昨日销售额</span></li>
                        <li><h2 id="specialty_increment">0%</h2><span>环比增长</span></li>
                    </ul>
                    <div style="border-bottom: 1px solid rgba(255,255,255,.1)"></div>
                    <ul class="clearfix">
                        <li><h2 id="house_today">0</h2><span>今日民宿销售额</span></li>
                        <li><h2 id="house_yesterday">0</h2><span>昨日民宿销售额</span></li>
                        <li><h2 id="house_increment">0%</h2><span>环比增长</span></li>
                    </ul>
                </div>
                <div class="boxfoot"></div>
            </div>
            <%--            <div class="boxall" style="height: 2.65rem">--%>
            <%--                <div class="alltitle">消费占比</div>--%>
            <%--                <div class="sy" id="echarts1"></div>--%>
            <%--                <div class="sy" id="echarts2"></div>--%>
            <%--                <div class="sy" id="echarts3"></div>--%>
            <%--                <div class="boxfoot"></div>--%>
            <%--            </div>--%>
        </li>
        <li>
            <div class="bar">
                <div class="barbox">
                    <ul class="clearfix">
                        <li class="pulll_left" id="total_income">0</li>
                        <li class="pulll_left" id="total_sales">0</li>
                    </ul>
                </div>
                <div class="barbox2">
                    <ul class="clearfix">
                        <li class="pulll_left">消费总金额</li>
                        <li class="pulll_left">消费总笔数</li>
                    </ul>
                </div>
            </div>
            <div class="map">
                <div class="map1"><img src="images/lbx.png"></div>
                <div class="map2"><img src="images/jt.png"></div>
                <div class="map3"><img src="images/map.png"></div>
                <div class="map4" id="map_1"></div>
            </div>
        </li>
        <li>
            <div class="boxall" style="height: 5.2rem">
                <div class="alltitle">实时消费记录</div>
                <div class="wrap">
                    <div id="new_order_list">
                    </div>
                </div>
                <div class="boxfoot"></div>
            </div>
        </li>
    </ul>

</div>
<div class="back"></div>


<script language="JavaScript" src="js/js.js"></script>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/china.js"></script>
<script type="text/javascript" src="js/area_echarts.js"></script>

<script src="../../assets/vendor/global/global.min.js"></script>
<script src="../../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../../assets/js/custom.min.js"></script>
<script src="../../assets/js/demo.js"></script>
<script>
    function getUserInfo() {
        const token = getCookie("token")
        return JSON.parse(window.atob(token.split('.')[1]))
    }
</script>
<script>
    /**
     * top menu slider
     */

    $('#to-profile').attr('href', `/user/user-profile.jsp?id=\${getUserInfo().id}`);
</script>
<script type="text/javascript">
    function onLoadFunction() {
        getNewOrders();
        getTotalStatistics();
        getSalesComparison();
    }

    function getNewOrders() {
        let url = "/seller_statistics";
        let data = {
            "action": "get_new_orders",
            "owner_id": getUserInfo().id
        };
        $.ajaxSettings.async = false;
        $.post(
            url,
            data,
            (res) => {
                if (res.resCode === "00000") {
                    let new_orders = res.new_orders;
                    let html = "<ul>";
                    for (let i = 0; i < new_orders.length; i++) {
                        let order = new_orders[i];
                        html += `<li>`
                        html += `    <p>\${i+1}&nbsp;<i class="text-white">\${order.user_id}</i> 购买"\${order.specialty_name}"\${order.num}件 <span class="text-orange">&yen;\${order.price}</span></p>`
                        html += `</li>`
                    }
                    html += "</ul>"
                    $("#new_order_list").html(html);
                }
            }
        )
        initOrdersScroll();
        $.ajaxSettings.async = true;
    }

    function initOrdersScroll() {
        var html = $("#new_order_list ul").html()
        $("#new_order_list ul").append(html)
        var ls = $("#new_order_list ul > li").length / 2 + 1
        console.log($("#new_order_list ul > li").length)
        console.log(ls);
        i = 0
        ref = setInterval(function () {
            i++
            if (i === ls) {
                i = 1
                $("#new_order_list ul").css({marginTop: 0})
                $("#new_order_list ul").animate({marginTop: -'.52' * i + 'rem'}, 1000)
            }
            $("#new_order_list ul").animate({marginTop: -'.52' * i + 'rem'}, 1000)
        }, 2400);
    }

    function getTotalStatistics() {
        let url = "/seller_statistics";
        let data = {
            "action": "get_total_statistics",
            "owner_id": getUserInfo().id
        };
        // $.ajaxSettings.async = false;
        $.post(
            url,
            data,
            (res) => {
                console.log(res);
                if (res.resCode === "00000") {
                    document.getElementById("total_income").innerHTML = res.total_income;
                    document.getElementById("total_sales").innerHTML = res.total_sales;
                }
            }
        )
        // $.ajaxSettings.async = true;
    }

    function getSalesComparison() {
        let url = "/seller_statistics";
        let data = {
            "action": "get_sales_comparison",
            "owner_id": getUserInfo().id
        };
        $.ajaxSettings.async = false;
        $.post(
            url,
            data,
            (res) => {
                console.log(res);
                if (res.resCode === "00000") {
                    document.querySelector("#specialty_today").innerHTML = res.specialty_today;
                    document.querySelector("#specialty_yesterday").innerHTML = res.specialty_yesterday;
                    let specialty_increment = ((Number(res.specialty_today) - Number(res.specialty_yesterday)) / Number(res.specialty_yesterday) * 100).toFixed(2);
                    console.log(specialty_increment);
                    document.querySelector("#specialty_increment").innerHTML = specialty_increment + "%";

                    document.querySelector("#house_today").innerHTML = res.house_today;
                    document.querySelector("#house_yesterday").innerHTML = res.house_yesterday;
                    let house_increment = ((Number(res.house_today) - Number(res.house_yesterday)) / Number(res.house_yesterday) * 100).toFixed(2);
                    document.querySelector("#house_increment").innerHTML = house_increment + "%";
                }
            }
        )
        $.ajaxSettings.async = true;
    }
</script>

<script type="text/javascript">
    $(document).ready(function () {
        myChart1.resize();
        myChart2.resize();
        myChart3.resize();
    })
    window.addEventListener("resize", function () {
        myChart1.resize();
        myChart2.resize();
        myChart3.resize();
    });
</script>
<script type="text/javascript">
    var myChart1 = echarts.init(document.getElementById('echarts1'));
    var v1 = 298;
    var v2 = 523;
    var v3 = v1 + v2;
    option1 = {


        series: [{
            type: 'pie',
            radius: ['70%', '80%'],
            color: '#0088cc',
            label: {
                normal: {
                    position: 'center'
                }
            },
            data: [{
                value: v1,
                name: '总销售额',
                label: {
                    normal: {
                        formatter: v3 + '',
                        textStyle: {
                            fontSize: 20,
                            color: '#fff',
                        }
                    }
                }
            },
            ]
        }]
    };

    var myChart2 = echarts.init(document.getElementById('echarts2'));
    option2 = {


        series: [{

            type: 'pie',
            radius: ['70%', '80%'],
            color: '#62b62f',
            label: {
                normal: {
                    position: 'center'
                }
            },
            data: [{
                value: v2,
                name: '民宿销售额',
                label: {
                    normal: {
                        formatter: v2 + '',
                        textStyle: {
                            fontSize: 20,
                            color: '#fff',
                        }
                    }
                }
            }, {
                value: v1,
                name: '特产销售额',
                label: {
                    normal: {
                        formatter: function (params) {
                            return '占比' + Math.round(v2 / v3 * 100) + '%'
                        },
                        textStyle: {
                            color: '#aaa',
                            fontSize: 12
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        color: 'rgba(255,255,255,.2)'
                    },
                    emphasis: {
                        color: '#fff'
                    }
                },
            }]
        }]
    };

    var myChart3 = echarts.init(document.getElementById('echarts3'));
    option3 = {


        series: [{
            type: 'pie',
            radius: ['70%', '80%'],
            color: '#fccb00',
            label: {
                normal: {
                    position: 'center'
                }
            },
            data: [{
                value: v1,
                name: '特产销售额',
                label: {
                    normal: {
                        formatter: v1 + '',
                        textStyle: {
                            fontSize: 20,
                            color: '#fff',
                        }
                    }
                }
            }, {
                value: v2,
                name: '民宿销售额',
                label: {
                    normal: {
                        formatter: function (params) {
                            return '占比' + Math.round(v1 / v3 * 100) + '%'
                        },
                        textStyle: {
                            color: '#aaa',
                            fontSize: 12
                        }
                    }
                },
                itemStyle: {
                    normal: {
                        color: 'rgba(255,255,255,.2)'
                    },
                    emphasis: {
                        color: '#fff'
                    }
                },
            }]
        }]
    };

    setTimeout(function () {
        myChart1.setOption(option1);
        myChart2.setOption(option2);
        myChart3.setOption(option3);
    }, 500);

</script>
<script type="text/javascript" src="js/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="js/jquery.countup.min.js"></script>
<script type="text/javascript">
    $('.counter').countUp();
</script>


</body>
</html>
