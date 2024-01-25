<%@ page import="homestay.utils.Config" %><%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2024/1/24
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
Created by IntelliJ IDEA.
User: 86135
Date: 2024/1/21
Time: 15:52
To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>index</title>
    <script type="text/javascript" src="../assets/js/weather/js/jquery.js"></script>
    <link rel="stylesheet" href="../assets/js/weather/css/comon0.css">
</head>
<script>
    $(window).load(function () {
        $(".loading").fadeOut()
    })


    $(document).ready(function () {
        var whei = $(window).width()
        $("html").css({ fontSize: whei / 20 })
        $(window).resize(function () {
            var whei = $(window).width()
            $("html").css({ fontSize: whei / 20 })
        });
    });
</script>
<script type="text/javascript" src="../assets/js/weather/js/echarts.min.js"></script>
<script language="JavaScript" src="../assets/js/weather/js/js.js"></script>
<body onload="onLoadFunction();">
<script src="../assets/js/utils/storage.js"></script>
<script>
    function getUserInfo() {
        const token = getCookie("token")
        return JSON.parse(window.atob(token.split('.')[1]))
    }

    $('#to-profile').attr('href', '/user/user-profile.jsp?id=' + getUserInfo().id)

    const urlStorage = new Storage("localStorage");
    urlStorage.set("url", '<%=Config.getInstance().getString("default.urlheader")%>');
    function getUrlHead() {
        return urlStorage.get("url");
    }
</script>
<script>
    /**
     * top menu slider
     */

</script>
<div class="loading">
    <div class="loadbox"> <img src="../assets/js/weather/images/loading.gif"> 页面加载中... </div>
</div>
<div class="head">
    <h1>全国天气数据统计</h1>
    <div class="weather"><!--<img src="images/weather.png"><span>多云转小雨</span>--><span id="showTime"></span></div>

    <script>
        var t = null;
        t = setTimeout(time, 1000);
        function time() {
            clearTimeout(t);
            dt = new Date();
            var y = dt.getFullYear();
            var mt = dt.getMonth() + 1;
            var day = dt.getDate();
            var h = dt.getHours();
            var m = dt.getMinutes();
            var s = dt.getSeconds();
            document.getElementById("showTime").innerHTML = y + "年" + mt + "月" + day + "-" + h + "时" + m + "分" + s + "秒";
            t = setTimeout(time, 1000);
        }

    </script>


</div>
<div class="mainbox">
    <ul class="clearfix">
        <li>
            <div class="boxall" style="height: 3.2rem">
                <div class="alltitle">采集的天气数据数量</div>
                <div class="allnav" id="echart1"></div>
                <div class="boxfoot"></div>
            </div>
        </li>
        <li>
            <div class="map">
                <div class="map1"><img src="../assets/js/weather/images/lbx.png"></div>
                <div class="map2"><img src="../assets/js/weather/images/jt.png"></div>
                <div class="map3"><img src="../assets/js/weather/images/map.png"></div>
                <div class="map4" id="map_1"></div>
            </div>
        </li>
        <li>
        <li>
            <div class="boxall" style="height: 5.2rem">
                <div class="alltitle">实时天气数据</div>
                <div class="wrap">
                    <div id="weather_table_content_div">
                    </div>
                </div>
                <div class="boxfoot"></div>
            </div>
        </li>

        </li>
    </ul>
</div>
<div class="back"></div>


<script type="text/javascript" src="../assets/js/weather/js/china.js"></script>
<script type="text/javascript" src="../assets/js/weather/js/area_echarts.js"></script>
<script type="text/javascript">
    function onLoadFunction() {
        getWeatherRecordList();
    }
    function getWeatherRecordList() {
        data = {};
        console.log(1)
        $.post(getUrlHead()+"/weather?action=get_device_record",data,function(json){
            console.log(JSON.stringify(json));
            if(json.result_code==0){
                var list=json.aaData;
                console.log(list);
                let html = "<ul>";
                if(list!=undefined && list.length>0){
                    for(var i=0;i<list.length;i++){
                        var record=list[i];
                        console.log(record);
                        html += `<li>`
                        html += `    <p>${record.city}天气${record.weather_type}温度 ${record.temperature}</p>`
                        html += `</li>`
                    }
                    html += "</ul>"
                }
                $("#weather_table_content_div").html(html);

            }
        })
        initOrdersScroll();
    }
    function initOrdersScroll() {
        var html = $("#weather_table_content_div ul").html()
        $("#weather_table_content_div ul").append(html)
        var ls = $("#weather_table_content_div ul > li").length / 2 + 1
        console.log($("#weather_table_content_div ul > li").length)
        console.log(ls);
        i = 0
        ref = setInterval(function () {
            i++
            if (i === ls) {
                i = 1
                $("#weather_table_content_div ul").css({marginTop: 0})
                $("#weather_table_content_div ul").animate({marginTop: -'.52' * i + 'rem'}, 1000)
            }
            $("#weather_table_content_div ul").animate({marginTop: -'.52' * i + 'rem'}, 1000)
        }, 2400);
    }

</script>
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>



</body>
</html>


