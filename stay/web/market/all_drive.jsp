<%@ page import="homestay.utils.Config" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>驾驶舱 全部</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="css/comon0.css">
<%--    <link rel="stylesheet" href="css/comon1.css">--%>
    <style>
        .grid {
            margin-top: 5%;
            width: 80%;
            height: 10px;
            display: grid;
            grid-template-columns: repeat(20, 1fr);
            grid-column-gap: 14px;
        }

        .line {
            position: relative;
            width: 90%;
            height: 7px;
        }

        .line::before, .line::after {
            content: '';
            position: absolute;
            width: 4.5rem;
            height: 100%;
            border-radius: 7px;
            background-color: #FF0000;
        }

        .line::before {
            animation: first-line ease-in-out 4s var(--delay) infinite alternate;
        }

        .line::after {
            bottom: 0;
            background-color: #B22222;
            width: calc(80% - 10px);
            animation: second-line ease-in-out 4s var(--delay) infinite alternate;
        }

        .line:nth-child(1) {
            --delay: calc(-0.1s);
        }


        @keyframes first-line {
            70% {
                width: calc(80% - 10px);
            }
            100% {
                background-color: #FF0000;
            }
        }

        .text-white {
            color: white;
        }

        .text-orange {
            color: orange;
        }
    </style>
    <style>
        li#comments .boxall{ padding:15px;  background: rgba(0,0,0,.2); position: relative; margin-bottom:15px;; z-index: 10;}
        li#comments .alltitle{ font-size:18px; color:#fff; position: relative; padding-left: 12px;margin-bottom: 10px;}
        li#comments .alltitle:before{ width: 5px; height: 20px; top:2px; position: absolute; content: ""; background: #49bcf7; border-radius:20px; left: 0; }

        li#comments .navboxall{height: calc(100% - 30px);}
        li#comments .table1 th{border-bottom: 1px solid rgba(255,255,255,.2); font-size: 16px; color:rgba(255,255,255,.6); font-weight: normal; padding:0 0 10px 0;}
        li#comments .table1 td{ font-size: 16px; color:rgba(255,255,255,.4); padding: 15px 0 0 0; }
        li#comments .table1 span{ width: 24px; height: 24px; border-radius: 3px; display: block; background: #878787; color: #fff; line-height: 24px; text-align: center;}

        li#comments .table1 tr:nth-child(2) span{ background: #ed405d}
        li#comments .table1 tr:nth-child(3) span{ background: #f78c44}
        li#comments .table1 tr:nth-child(4) span{ background: #49bcf7}

        .mainbox>ul>li:nth-child(5){ width: 40%}
    </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        var html=$(".wrap ul").html()
        $(".wrap ul").append(html)
        var ls=$(".wrap li").length/2+1
        i=0
        ref = setInterval(function(){
            i++
            if(i==ls){
                i=1
                $(".wrap ul").css({marginTop:0})
                $(".wrap ul").animate({marginTop:-'.52'*i+'rem'},1000)
            }
            $(".wrap ul").animate({marginTop:-'.52'*i+'rem'},1000)


        },2400);



        var html2=$(".adduser ul").html()
        $(".adduser ul").append(html2)
        var ls2=$(".adduser li").length/2+1
        a=0
        ref = setInterval(function(){
            a++
            if(a==ls2){
                a=1
                $(".adduser ul").css({marginTop:0})
                $(".adduser ul").animate({marginTop:-'.5'*a+'rem'},800)
            }
            $(".adduser ul").animate({marginTop:-'.5'*a+'rem'},800)


        },4300);
    })
</script>
<body style='overflow:-Scroll;'>
<div class="loading">
    <div class="loadbox"> <img src="images/loading.gif"> 页面加载中... </div>
</div>
<div class="head">
    <h1>驾驶舱 全部</h1>
    <div class="weather"><span id="showTime"></span></div>
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
            <div class="boxall" style="height: 5.2rem">
                <div class="alltitle">基础统计</div>

                <div class="sycm">
                    <ul class="clearfix">
                        <li><h2 id="a"></h2><span>民宿订单数量</span></li>
                        <li><h2 id="b"></h2><span>特产订单数量</span></li>
                        <li><h2  id="c"></h2><span>环比增长</span></li>
                    </ul>
                    <div style="border-bottom: 1px solid rgba(255,255,255,.1)"></div>
                    <ul class="clearfix">
                        <li><h2 id="d">824</h2><span>特产商品数量</span></li>
                        <li><h2 id="e">710</h2><span>民宿商品数量</span></li>
                        <li><h2 id="f">200</h2><span>房间商品数量</span></li>
                    </ul>
                </div>
                <div class="addnew" >
                    <div class="tit02"><span>三维统计</span></div>
                    <div class="allnav" style="height: 2.2rem" id="wbzl"></div>
                </div>
                <div class="boxfoot"></div>
            </div>

        </li>
        <li>
            <div class="bar">
                <div class="barbox ">
                    <ul class="clearfix">
                        <li  class="pulll_left counter" >
                            <span id="h1">10</span>
                        </li>
                        <li class="pulll_left counter" >
                            <span id="i1">6</span>
                        </li>
                    </ul>
                </div>
                <div class="barbox2">
                    <ul class="clearfix">
                        <li class="pulll_left">用户数量</li>
                        <li class="pulll_left">普通用户数量</li>
                    </ul>
                </div>
            </div>
            <div class="bar">
                <div class="barbox">
                    <ul class="clearfix">
                        <li class="pulll_left counter" ><span id="j1">3</span></li>
                        <li class="pulll_left counter"><span id="k1">1</span></li>
                    </ul>
                </div>
                <div class="barbox2">
                    <ul class="clearfix">
                        <li class="pulll_left">管理员数量</li>
                        <li class="pulll_left">超级管理员数量</li>
                    </ul>
                </div>
            </div>
            <div class="alltitle"></div>
            <div class="allnav" style="height: 1.5rem" id="wxyg"></div>
            <div class="addnew" >
            <div class="map">
                <div class="map1"><img src="images/lbx.png"></div>
                <div class="map2"><img src="images/jt.png"></div>
                <div class="map3"><img src="images/map.png"></div>
                <div class="map4" id="map_1"></div>
            </div>
            </div>
        </li>
        <li>
            <div class="boxall" style="height:6.8rem">
                <div class="alltitle">消费统计</div>

                <div class="clearfix">
                    <div class="sy" style="width:300px;" id="yqbj"></div>
                </div>
                <div class="addnew" >
                    <div class="tit02"><span>高消费订单展示</span></div>
                    <div class="adduser"  style="height: 2.0rem">
                        <ul >
                            <li class="clearfix"> <span class="pulll_left">SO1705715440001</span> <span class="pulll_right">2024-01-20 09:50:40 </span> </li>
                            <li class="clearfix"> <span class="pulll_left">SO1705326874362</span> <span class="pulll_right">2024-01-15 21:54:34 </span> </li>
                            <li class="clearfix"> <span class="pulll_left">SO1705892238520</span> <span class="pulll_right">2024-01-22 10:57:18</span> </li>
                            <li class="clearfix"> <span class="pulll_left">SO1705326874362</span> <span class="pulll_right">2024-01-22 10:57:01 </span> </li>
                            <li class="clearfix"> <span class="pulll_left">SO1705670216986</span> <span class="pulll_right">2024-01-19 21:16:56</span> </li>
                            <li class="clearfix"> <span class="pulll_left">SO1705670211632</span> <span class="pulll_right">2024-01-19 21:16:51 </span> </li>
                        </ul>
                    </div>
                </div>
                <div class="boxfoot"></div>
            </div>
            <div class="boxall" style="height: 1.4rem">
                <div class="alltitle"></div>
                <div class="grid">
                    <span class="line"></span>
                </div>
                <div>
                </div>
                <div class="boxfoot"></div>
            </div>
        </li>
        <li id="comments">
            <div class="boxall" style="height:3rem;">
                <div class="alltitle">评论TOP</div>
                <div class="navboxall">
                    <table class="table1" width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <th scope="col">排名</th>
                            <th scope="col">商品</th>
                            <th scope="col">评论数</th>
                            <th scope="col">平均评分</th>
                        </tr>
                        <tr>
                            <td><span>1</span></td>
                            <td>Test2</td>
                            <td>1<br></td>
                            <td>5<br></td>
                        </tr>
                        <tr>
                            <td><span>2</span></td>
                            <td>测试商品22</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>

                        <tr>
                            <td><span>3</span></td>
                            <td>Test1</td>
                            <td>2</td>
                            <td>1</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </li>
        <li>
            <div class="boxall" style="height: 5.2rem;">
                <div class="alltitle">实时消费记录</div>
                <div class="wrap">
                    <div id="new_order_list">
                    </div>
                </div>
                <div class="boxfoot"></div>
            </div>
        </li>
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
    </ul>

</div>
<div class="back"></div>
<script type="text/javascript" src="js/echarts.min.js"></script>
<script type="text/javascript" src="js/echarts-gl.min.js"></script>
<script language="JavaScript" src="js/echarts-tool.js"></script>
<script type="text/javascript" src="js/timelineOption.js"></script>



<script type="text/javascript" src="js/jquery.waypoints.min.js"></script>
<script type="text/javascript" src="js/jquery.countup.min.js"></script>
<script type="text/javascript">

    $('.counter').countUp();
    var data={"action":"sun"}
    $.post('<%=Config.getInstance().getString("default.urlheader")%>/getDriveData',data,function (json) {
        document.getElementById("a").innerText=json.num_room_order;
        document.getElementById("b").innerText=json.num_specialty_order;
        document.getElementById("c").innerText=json.num_room_order+json.num_specialty_order;
        document.getElementById("d").innerText=json.num_specialty;
        document.getElementById("e").innerText=json.num_house;
        document.getElementById("f").innerText=json.num_room;

        document.getElementById("i1").innerText=json.num_normal_user;
        document.getElementById("j1").innerText=json.num_admin_user;
        document.getElementById("k1").innerText.json.num_super_ser;
    })

</script>

<script type="text/javascript">
    getNewOrders();
    function getNewOrders() {
        let url = "<%=Config.getInstance().getString("default.urlheader")%>/seller_statistics";
        let data = {
            "action": "get_new_orders"
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
                        console.log(order);
                        html += `<li>`
                        html += "    <p>" + (i + 1).toString() + "&nbsp;<i class=\"text-white\">" + order.user_id + "</i> 购买\"" + order.specialty_name + "\"" + order.num + "件 <span class=\"text-orange\">&yen;" + order.price + "</span></p>"
                        // html += `    <p>\${i+1}&nbsp;<i class="text-white">\${order.user_id}</i> 购买"\${order.specialty_name}"\${order.num}件 <span class="text-orange">&yen;\${order.price}</span></p>`
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
</script>
<script type="text/javascript">
    getWeatherRecordList();

    function getWeatherRecordList() {
        data = {};
        console.log(1)
        $.ajaxSettings.async = false;
        $.post("<%=Config.getInstance().getString("default.urlheader")%>/weather?action=get_device_record", data, function (json) {
            console.log(JSON.stringify(json));
            if (json.result_code == 0) {
                var list = json.aaData;
                console.log(list);
                let html = "<ul>";
                if (list != undefined && list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        console.log(record);
                        html += `<li>`
                        html += "    <p>" + record.city + "天气" + record.weather_type + "温度 " + record.temperature + "</p>"
                        html += `</li>`
                    }
                    html += "</ul>"
                }
                $("#weather_table_content_div").html(html);

            }
        })
        initWeatherListScroll();
        $.ajaxSettings.async = true;
    }

    function initWeatherListScroll() {
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

</body>
</html>
