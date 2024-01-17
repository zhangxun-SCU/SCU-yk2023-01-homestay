


<%--
Created by IntelliJ IDEA.
User: cw
Date: 2023/12/1
Time: 15:00
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="../frame/frame_style.jsp" %>
    <link rel="stylesheet" href="../assets/vendor/sweetalert2/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="../assets/vendor/toastr/css/toastr.min.css">

</head>
<body>

<%--  preloader start  --%>
<%@include file="../frame/frame_preloader.jsp"%>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%@ include file="/frame/frame_menu.jsp" %>

    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" onclick="cartBack()"><a>返回</a></li>
                </ol>
            </div>
            <div class="row"id="good_list">
                <div class="col-lg-12" >

                </div>
            </div>
            <div id="check_cart" class>
                <button type="button" onclick="submitOrder()" class="btn btn-warning btn-lg"
                        style="position:absolute;bottom: 10%;right: 10%">提交订单
                </button>
                <div style="float:left;position:absolute;right: 20% ;bottom: 15%; font-size: 150%">

                    <span>合计</span>
                    <span id="total_cost" class="text-warning" style="font-size: 200%;font-weight: bold"></span>
                    <span class="text-warning" style="font-size: 200%;font-weight: bold">￥</span>
                </div>


            </div>

        </div>
    </div>
</div>
<%--  script start  --%>
<%@include file="../frame/frame_javascript.jsp"%>
<%--  script end  --%>
</body>
<script src="../assets/js/styleSwitcher.js"></script>
<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/vendor/toastr/js/toastr.min.js"></script>
<script>
    var cartBack = function () {
        window.history.go(-1);
    };
    var cookie=document.cookie;
    console.log(cookie);
    var cookie=cookie.split(";")[0]
    var checkgoods=cookie.split("=")[1];
    var submitOrder=function(){
        let data=new Date().getTime();
        let new_data=new Date(data+6000);
        document.cookie="checkgood="+checkgoods+";expires="+new_data.toUTCString();
        window.location="pay_order_room.jsp";
    }
    var total_cost=0;
    document.getElementById("check_cart").style.position = "fixed";
    document.getElementById("check_cart").style.height = "10%"
    document.getElementById("check_cart").style.backgroundColor = "white";
    document.getElementById("check_cart").style.bottom = "0";
    document.getElementById("check_cart").style.right = "0";
    document.getElementById("check_cart").style.width = "100%";
    console.log(checkgoods);
    var goodlist=JSON.parse(checkgoods);
    var data = {"good_list":"["+checkgoods+"]","action":"query_by_list","good_type":"house"};
    console.log(JSON.stringify(data));
    $.post('/specialtyMarket', data, function (json) {
        if (json.code == 0) {
            var html = "";
            order_list = json.good_list;
            console.log(JSON.stringify(order_list));
            for (var i = 0; i < order_list.length; i++) {
                var order = order_list[i];
                var num=goodlist.need_num;
                html=html+"<div class=\"col-lg-12\" >";
                html = html + "<div class=\"card\">";
                html = html + "<div class=\"card-body\">";
                html = html + "<div class=\"table-responsive\">";
                html = html + "<table class=\"table table-responsive-md\">";
                html = html + "<thead>";
                html = html + "<tr>";
                html = html + "<th>";
                html = html + "<strong>";
                html = html + "</strong>";
                html = html + "</th>";
                html = html + "<th>";
                html = html + "<strong>房间名称";
                html = html + "</strong>";
                html = html + "</th>";
                html = html + "<th>";
                html = html + "<strong>房间单价";
                html = html + "</strong>";
                html = html + "</th>";
                html = html + "<th>";
                html = html + "<strong>预定数量";
                html = html + "</strong>";
                html = html + "</th>";
                html = html + "<th>";
                html = html + "<strong>预定日期";

                html = html + "</strong>";
                html = html + "</th>";
                html = html + "</tr>";
                html = html + "</thead>";
                html = html + "<tbody>";
                html = html + "<tr>";
                html = html + "<td>";
                html = html + "<img src=\"" + order.main_image + "\" class=\"rounded-lg me-2\" width=\"120\" alt=\"\"style=\"aspect-ratio: 1;\">";
                html = html + "</td>";
                html = html + "<td>";
                html = html + "<div class=\"d-flex align-items-center\">";
                html = html + "<span class=\"w-space-no\">";
                html = html + order.good_name;
                html = html + "</span>";
                html = html + "</div>";
                html = html + "</td>";
                html = html + "<td>";
                html = html + "<span  class=\"text-warning\" style=\"font-size: 130%;font-weight: bold\">";
                html = html + order.good_price;
                html = html + "￥</span>";
                html = html + "</td>";
                html = html + "<td>";
                html = html + num;
                html = html + "</td>";
                html = html + "<td>";
                html=html+goodlist.in_date+"-"+ goodlist.out_date;
                html = html + "</td>";
                html = html + "</tr>";
                html = html + "</tbody>";
                html = html + "</table>";
                html = html + "</div>";
                html = html + "</div>";
                html=html+"<div class=\"card-footer\" style='height: 50%'>";
                html=html+"<div style='position: relative;left: 10%;float: left' >"
                html = html + "<span  style=\"font-size: 150%;font-weight: bold;\">";
                html = html + "共  ";
                html = html + "</span>";
                html = html + "<span  class=\"text-warning\" style=\"font-size: 180%;font-weight: bold;\">";
                html=html+order.range_day;
                html = html + "</span>";
                html = html + "<span  style=\"font-size: 150%;font-weight: bold;\">";
                html = html + "天  ";
                html = html + "</span>";
                html = html + "</div>";
                html=html+"<div style='position: relative;left: 80%'>"
                html = html + "<span  style=\"font-size: 150%;font-weight: bold;\">";
                html = html + "小计:  ";
                html = html + "</span>";
                html = html + "<span  class=\"text-warning\" style=\"font-size: 180%;font-weight: bold;\">";
                html = html + (num * order.good_price*order.range_day).toFixed(2
                );
                html = html + "￥</span>";
                html = html + "</div>";
                html = html + "</div>";
                html = html + "</div>";
                html = html + "</div>";
                total_cost=(total_cost+num * order.good_price*order.range_day).toFixed(2);
            }
            document.getElementById("good_list").innerHTML = html;
            document.getElementById("total_cost").innerText=total_cost;
        }
    });


</script>

</html>







