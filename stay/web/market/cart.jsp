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
<%@include file="../frame/frame_preloader.jsp" %>
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
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">购物车</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll"
                                                       required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong> </strong></th>
                                        <th><strong>商品信息</strong></th>
                                        <th><strong>商品单价</strong></th>
                                        <th><strong>数量</strong></th>
                                        <th><strong>总价</strong></th>

                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="good_list">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="check_cart" class>
                <button type="button" id="initOrder" class="btn btn-warning btn-lg"
                        style="position:absolute;bottom: 10%;right: 10%" onclick="purChase()">结算
                </button>
                <div style="float:left;position:absolute;right: 20% ;bottom: 15%; font-size: 150%">
                    <span>已选: </span>
                    <span id="total_num"></span>

                    <span>件,  合计</span>
                    <span id="total_cost" class="text-warning" style="font-size: 200%;font-weight: bold"></span>
                    <span class="text-warning" style="font-size: 200%;font-weight: bold">￥</span>
                </div>


            </div>

        </div>
    </div>
</div>
<div id="delete_cart" class="swal2-container swal2-center swal2-fade swal2-shown"
     style="overflow-y: auto;display: none;">
    <div aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-show"
         tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true" style="display:flex;">
        <div class="swal2-header">
            <ul class="swal2-progresssteps" style="display: none;"></ul>
            <div class="swal2-icon swal2-error" style="display: none;"><span class="swal2-x-mark"><span
                    class="swal2-x-mark-line-left"></span><span class="swal2-x-mark-line-right"></span></span></div>
            <div class="swal2-icon swal2-question" style="display: none;"><span class="swal2-icon-text">?</span></div>
            <div class="swal2-icon swal2-warning swal2-animate-warning-icon" style="display: flex;"><span
                    class="swal2-icon-text">!</span></div>
            <div class="swal2-icon swal2-info" style="display: none;"><span class="swal2-icon-text">i</span></div>
            <div class="swal2-icon swal2-success" style="display: none;">
                <div class="swal2-success-circular-line-left" style="background-color: rgb(255, 255, 255);"></div>
                <span class="swal2-success-line-tip"></span> <span class="swal2-success-line-long"></span>
                <div class="swal2-success-ring"></div>
                <div class="swal2-success-fix" style="background-color: rgb(255, 255, 255);"></div>
                <div class="swal2-success-circular-line-right" style="background-color: rgb(255, 255, 255);"></div>
            </div>
            <img class="swal2-image" style="display: none;">
            <h2 class="swal2-title" id="swal2-title" style="display: flex;">确定要删除该商品吗?</h2>
            <button type="button" class="swal2-close" style="display: none;">×</button>
        </div>
        <div class="swal2-content">
            <div id="swal2-content" style="display: block;">You will not be able to recover this imaginary file !!</div>
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
            <button type="button" class="swal2-confirm swal2-styled" aria-label="" id="cart_good_delete"
                    style="background-color: rgb(221, 107, 85); border-left-color: rgb(221, 107, 85); border-right-color: rgb(221, 107, 85);">
                确定
            </button>
            <button type="button" class="swal2-cancel swal2-styled" aria-label="" style="display: inline-block;"
                    id="cancel_delete">取消
            </button>
        </div>
        <div class="swal2-footer" style="display: none;"></div>
    </div>
    <%--  script start  --%>
</div>
<%@include file="../frame/frame_javascript.jsp" %>
<%--  script end  --%>
</body>
<script src="../assets/js/styleSwitcher.js"></script>
<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/vendor/toastr/js/toastr.min.js"></script>
<script>
    var checkgoods = [];
    var good_list = "";
    var total_cost = 0;
    var total_num = 0;
    document.getElementById("total_num").innerText = total_num;
    document.getElementById("total_cost").innerText = total_cost;
    document.getElementById("checkAll").onclick = function () {
        var begin = false;
        var checked = "";
        checkgoods = [];
        total_num = 0;
        total_cost = 0;
        for (let doo of document.getElementsByClassName("form-check-input")) {
            if (doo.disabled==true)
            {
                doo.checked=false;
                console.log("disabled");
                continue;
            }
            if (!begin) {
                checked = doo.checked;
                begin = true;
                continue;
            } else {
                if (checked) {
                    var good_id = doo.id.split("k")[1];
                    var good = "";
                    for (var i = 0; i < good_list.length; i++) {
                        if (good_list[i].good_id == good_id) {
                            good = good_list[i];
                        }
                    }
                    checkgoods.push(good);
                    total_num = total_num + good.num;
                    total_cost = total_cost + good.good_price * good.num;
                    document.getElementById("total_num").innerText = total_num;
                    document.getElementById("total_cost").innerText = total_cost;
                } else {
                    document.getElementById("total_num").innerText = total_num;
                    document.getElementById("total_cost").innerText = total_cost;
                }
            }
        }
    }
    var cartBack = function () {
        window.history.go(-1);
    };
    document.getElementById("check_cart").style.position = "fixed";
    document.getElementById("check_cart").style.height = "10%"
    document.getElementById("check_cart").style.backgroundColor = "white";
    document.getElementById("check_cart").style.bottom = "0";
    document.getElementById("check_cart").style.right = "0";
    document.getElementById("check_cart").style.width = "100%";
    var queryAll = function () {
        let data2 = {"action": "query"};
        $.post('/getCartGood', data2, function (json) {
            if (json.code == 0) {
                var html = "";
                good_list = json.good_list;
                console.log(JSON.stringify(good_list));
                for (var i = 0; i < good_list.length; i++) {
                    var good = good_list[i];
                    html = html + "<tr>";
                    html = html + "<td>";
                    html = html + "<div class=\"form-check custom-checkbox checkbox-success check-lg me-3\">";
                    if(good.max_num==0)
                    {
                        html = html + "<code style='position:relative; left:-20px'>x</code>";
                    }
                    else{
                        html = html + "<input type=\"checkbox\" class=\"form-check-input\" id=\"ck" + good.good_id + "\" required=\"\" onclick=\"chooseGood('" + good.good_id + "')\">";
                    }
                    html = html + "<label class=\"form-check-label\" for=\"customCheckBox2\">";
                    html = html + "</label>";
                    html = html + "</div>";
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<img src=\"" + good.main_image + "\" class=\"rounded-lg me-2\" width=\"120\" alt=\"\"style=\"aspect-ratio: 1;\">";
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<div class=\"d-flex align-items-center\">";
                    html = html + "<span class=\"w-space-no\">";
                    html = html + good.good_name;
                    html = html + "</span>";
                    html = html + "</div>";
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<span  class=\"text-warning\" style=\"font-size: 130%;font-weight: bold\">";
                    html = html + good.good_price;
                    html = html + "</span>";
                    html = html + "</td>";
                    html = html + "<td>";
                    html=html+"<div class=\"col-2 px-0  mb-2 me-3\" style='width: 80px'>";
                    if(good.max_num==0)
                    {
                    html=html+"<code>没有库存</code>";
                    }
                    else{
                        html=html+"<input  type=\"number\" name=\"num\"class=\"form-control input-btn input-number\" value=\""+good.num+"\""+
                            "min=\"1\"max=\"2\">";
                        html=html+"</div>";
                    }
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<div class=\"d-flex align-items-center\">";
                    html = html + "<span  class=\"text-warning\" style=\"font-size: 150%;font-weight: bold\">";
                    html = html + good.num * good.good_price;
                    html = html + "</span>";
                    html = html + "<span  class=\"text-warning\" style=\"font-size: 150%;font-weight: bold\">￥</span>";
                    html = html + "</div>";
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<div class=\"d-flex\">";
                    html = html + "<a  class=\"btn btn-danger shadow btn-xs sharp\" onclick=\"deleteCartGood('" + good.good_id + "')\">";
                    html = html + "<i class=\"fa fa-trash\">";
                    html = html + "</i>";
                    html = html + "</a>";
                    html = html + "</div>";
                    html = html + "</td>";
                    html = html + "</tr>";

                }

                document.getElementById("good_list").innerHTML = html;

            }
        });
    }
    queryAll();
    var deleteCartGood = function (tp_id) {
        document.getElementById("delete_cart").style.display = "flex";
        console.log(1);
        document.getElementById("cart_good_delete").onclick = function(){
            data = {"action": "delete", "good_id": tp_id};
            console.log(data);
            document.getElementById("delete_cart").style.display = "none";
            $.post('/getCartGood', data, function (json) {
                    if (json.code == 0) {
                        queryAll();
                        for (var i = 0; i < checkgoods.length; i++) {
                            let good = checkgoods[i];
                            if (good.good_id == data.good_id) {
                                checkgoods.slice(i, i);
                                total_cost = total_cost - good.num * good.good_price;
                                total_num = total_num - good.num;
                                document.getElementById("total_num").innerText = total_num;
                                document.getElementById("total_cost").innerText = total_cost;
                                break;
                            }

                        }

                    }

                }
            );
        }
    };
    document.getElementById("cancel_delete").onclick = function () {
        document.getElementById("delete_cart").style.display = "none";
    }
    var chooseGood = function (id) {
        if (document.getElementById("ck" + id).checked) {
            var good = "";
            for (var i = 0; i < good_list.length; i++) {
                if (good_list[i].good_id == id) {
                    good = good_list[i];
                    break;
                }
            }
            checkgoods.push(good);
            total_num = total_num + good.num;
            total_cost = total_cost + good.good_price * good.num;
            document.getElementById("total_num").innerText = total_num;
            document.getElementById("total_cost").innerText = total_cost;
        } else {
            var good = "";
            for (var i = 0; i < good_list.length; i++) {
                if (good_list[i].good_id == id) {
                    good = good_list[i];
                    if (checkgoods.length < 2) {
                        checkgoods = [];
                    } else {
                        checkgoods.splice(i, i);
                    }
                    break;
                }
            }
            total_num = total_num - good.num;
            total_cost = total_cost - good.good_price * good.num;
            document.getElementById("total_num").innerText = total_num;
            document.getElementById("total_cost").innerText = total_cost;
            document.getElementById("checkAll").checked = false;
        }

    }
    var purChase = function () {
        if(checkgoods.length>0)
        {
            var checkgoodsstring = JSON.stringify(checkgoods);
            let data = new Date().getTime();
            let new_data = new Date(data + 6000);
            document.cookie = "checkgood=" + checkgoodsstring + ";expires=" + new_data.toUTCString();
            window.location.href = "confirm_order.jsp"
        }
        else{
            toastr.error("没有选择商品~", "未选择商品", {
                positionClass: "toast-top-center",
                timeOut: 5e3,
                closeButton: !0,
                debug: !1,
                newestOnTop: !0,
                progressBar: !0,
                preventDuplicates: !0,
                onclick: null,
                showDuration: "300",
                hideDuration: "1000",
                extendedTimeOut: "1000",
                showEasing: "swing",
                hideEasing: "linear",
                showMethod: "fadeIn",
                hideMethod: "fadeOut",
                tapToDismiss: !1
            })
        }
    }
</script>
</html>
