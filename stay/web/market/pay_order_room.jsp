


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
    <link rel="shortcut icon" type="image/png" href="../assets/images/favicon.png"/>
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/vendor/sweetalert2/dist/sweetalert2.min.css">
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
                        style="position:absolute;bottom: 10%;right: 10%">立即支付
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
<div id="pay_error1" aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-show"
     tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true" style="display: none;position: fixed;left: 40%;top: 30%">
    <div class="swal2-header">
        <ul class="swal2-progresssteps" style="display: none;"></ul>
        <div class="swal2-icon swal2-error swal2-animate-error-icon" style="display: flex;"><span
                class="swal2-x-mark"><span class="swal2-x-mark-line-left"></span><span
                class="swal2-x-mark-line-right"></span></span></div>
        <div class="swal2-icon swal2-question" style="display: none;"><span class="swal2-icon-text">?</span></div>
        <div class="swal2-icon swal2-warning" style="display: none;"><span class="swal2-icon-text">!</span></div>
        <div class="swal2-icon swal2-info" style="display: none;"><span class="swal2-icon-text">i</span></div>
        <div class="swal2-icon swal2-success" style="display: none;">
            <div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div>
            <span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span>
            <div class="swal2-success-ring"></div>
            <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
            <div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
        </div>
        <img class="swal2-image" style="display: none;">
        <h2 class="swal2-title" id="swal2-title" style="display: flex;">支付失败!</h2>
        <button type="button" class="swal2-close" style="display: none;">×</button>
    </div>
    <div class="swal2-content">
        <div id="swal2-content" style="display: block;">余额不足,请充值!</div>
        <input class="swal2-input" style="display: none;"><input type="file" class="swal2-file" style="display: none;">
        <div class="swal2-range" style="display: none;"><input type="range">
            <output></output>
        </div>
        <select class="swal2-select" style="display: none;"></select>
        <div class="swal2-radio" style="display: none;"></div>
        <label for="swal2-checkbox" class="swal2-checkbox" style="display: none;"><input type="checkbox"><span
                class="swal2-label"></span></label><textarea class="swal2-textarea" style="display: none;"></textarea>
        <div class="swal2-validation-message" id="swal2-validation-message" style="display: none;"></div>
    </div>
    <div class="swal2-actions" style="display: flex;">
        <button type="button" class="swal2-confirm swal2-styled" aria-label=""
                style="border-left-color: rgb(48, 133, 214); border-right-color: rgb(48, 133, 214);" onclick="goSpecialtyOrder()">OK
        </button>
        <button type="button" class="swal2-cancel swal2-styled" aria-label="" style="display: none;">Cancel</button>
    </div>
    <div class="swal2-footer" style="display: none;"></div>
</div>
<div id="pay_status" aria-labelledby="swal2-title" aria-describedby="swal2-content"
     class="swal2-popup swal2-modal swal2-show"
     tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true"
     style="display: none;position: fixed;left: 40%;top: 30%">
    <div class="swal2-header">
        <ul class="swal2-progresssteps" style="display: none;"></ul>
        <div class="swal2-icon swal2-error" style="display: none;"><span class="swal2-x-mark"><span
                class="swal2-x-mark-line-left"></span><span class="swal2-x-mark-line-right"></span></span></div>
        <div class="swal2-icon swal2-question" style="display: none;"><span class="swal2-icon-text">?</span></div>
        <div class="swal2-icon swal2-warning" style="display: none;"><span class="swal2-icon-text">!</span></div>
        <div class="swal2-icon swal2-info" style="display: none;"><span class="swal2-icon-text">i</span></div>
        <div class="swal2-icon swal2-success swal2-animate-success-icon" style="display: flex;">
            <div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div>
            <span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span>
            <div class="swal2-success-ring"></div>
            <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
            <div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
        </div>
        <img class="swal2-image" style="display: none;">
        <h2 class="swal2-title" id="swal2-title" style="display: flex;">支付成功!</h2>
        <button type="button" class="swal2-close" style="display: none;">×</button>
    </div>
    <div class="swal2-content">
        <div id="swal2-content" style="display: block;"></div>
        <input class="swal2-input" style="display: none;"><input type="file" class="swal2-file"
                                                                 style="display: none;">
        <div class="swal2-range" style="display: none;"><input type="range">
            <output></output>
        </div>
        <select class="swal2-select" style="display: none;"></select>
        <div class="swal2-radio" style="display: none;"></div>
        <label for="swal2-checkbox" class="swal2-checkbox" style="display: none;"><input type="checkbox"><span
                class="swal2-label"></span></label><textarea class="swal2-textarea"
                                                             style="display: none;"></textarea>
        <div class="swal2-validation-message" id="swal2-validation-message" style="display: none;"></div>
    </div>
    <div class="swal2-actions" style="display: flex;">
        <button type="button" class="swal2-confirm swal2-styled" aria-label=""
                style="border-left-color: rgb(48, 133, 214); border-right-color: rgb(48, 133, 214);"
                onclick="goSpecialtyOrder()">OK
        </button>
        <button type="button" class="swal2-cancel swal2-styled" aria-label="" style="display: none;">Cancel</button>
    </div>
    <div class="swal2-footer" style="display: none;"></div>
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
    var order_list;
    var cookie=document.cookie;
    var total_cost=0;
    var cookie=cookie.split(";")[0]
    var checkgoods=cookie.split("=")[1];
    var submitOrder=function(){
        var data2 = {
            "total_coast": total_cost,
            "action": "pay_order",
            "good_list": JSON.stringify(order_list),
            "good_type": "house"
        };
        $.post('<%=Config.getInstance().getString("default.urlheader")%>/specialtyMarketOrder', data2, function (json) {
            if (json.code == 0) {
                document.getElementById("pay_status").style.display = 'block';
            } else if(json.code==1) {
                document.getElementById("pay_error1").style.display='block';
            }
        })

    }
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
    $.post('<%=Config.getInstance().getString("default.urlheader")%>/specialtyMarketOrder', data, function (json) {
        if (json.code == 0) {
            var html = "";
            order_list = json.good_list;
            console.log(JSON.stringify(order_list));
            for (var i = 0; i < order_list.length; i++) {
                var order = order_list[i];
                var num=order.num;
                html=html+"<div class=\"col-lg-12\" >";
                html = html + "<div class=\"card\">";
                html = html + "<div class=\"card-header\">";
                html = html + "<h4 class=\"card-title\">订单编号: ";
                html=html+order.order_id;
                html = html + "</h4>";
                html = html + "</div>";
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

    var goSpecialtyOrder = function () {
        window.location.href = '../order/room/room_order.jsp'
    }
</script>
</html>




