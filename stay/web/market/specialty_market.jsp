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
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-xl-6">
                            <div class="input-group search-area " >
                                <input type="text" class="form-control" placeholder="输入搜索的商品名" id="search_name">
                                <span class="input-group-text" onclick="searchSpecialtyByName()"><a href="javascript:void(0)"><i class="flaticon-381-search-2"></i></a></span>
                            </div>
                        </div>

                        <div class="col-xl-6">
                            <button class="btn  btn-success"onclick="ascPrice()">价格升序</button>
                            <button class="btn btn-success" onclick="descPrice()">价格降序</button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row" id="good_list">
                <div class="col-xl-3 col-lg-6 col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="new-arrival-product">
                                <div class="new-arrivals-img-contnent">
                                    <img class="img-fluid" src="/good_image/1.jpg" alt="">
                                </div>
                                <div class="new-arrival-content text-center mt-3">
                                    <h4><a href="ecom-product-detail.html">Bonorum et Malorum</a></h4>
                                    <ul class="star-rating">
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star"></i></li>
                                        <li><i class="fa fa-star-half-empty"></i></li>
                                        <li><i class="fa fa-star-half-empty"></i></li>
                                    </ul>
                                    <span class="price">$761.00</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div style="position: fixed;left: 85%;top:80%" onclick="openCart()">
            <span id="cart_num" class="badge light text-white bg-danger rounded-circle"
                  style="position: relative;left:10% ;top:-100%;float: left"></span>
                <button type="button" class="btn btn-rounded btn-primary"><span class="btn-icon-start text-primary"><i
                        class="fa fa-shopping-cart"></i></span>购物车
                </button>
            </div>

        </div>
    </div>




    <!--**********************************
       Support ticket button start
    ***********************************-->

    <!--**********************************
       Support ticket button end
    ***********************************-->


</div>
<%@include file="../frame/frame_javascript.jsp"%>
<script>
    var good_list="";

    var searchSpecialtyByName =function(){
        var search_name=document.getElementById("search_name").value;
        var data = {"search_name":search_name,"action":"query_by_name","good_type":"specialty"};
        $.post('/specialtyMarket',data,function(json){
            if(json.code==0){
                good_list = json.good_list;
                console.log(JSON.stringify(json))
                var html = "";
                for (var i = 0; i < good_list.length; i++) {
                    var good = good_list[i];
                    html = html + "<div class=\"col-xl-3 col-lg-6 col-sm-6\" onclick=MarketGoodDetail('" + good.good_id + "')>";
                    html = html + "<div class=\"card\">";
                    html = html + "<div class=\"card-body\">";
                    html = html + "<div class=\"new-arrival-product\">";
                    html = html + "<div class=\"new-arrivals-img-contnent\"  style='width: 200px; height: 200px;display: flex;justify-content: center;align-items: center;'>";
                    html = html + "<img class=\"img-fluid\" src=\"" + good.main_image + "\" width='200' alt=\"\" style='display: flex;justify-content: center;align-items: center;' >";
                    html = html + "</div>";
                    html = html + "<div class=\"new-arrival-content text-left mt-3\">";
                    html = html + "<h4>";
                    html = html + good.good_name;

                    html = html + "</h4>";
                    html = html + "<ul class=\"star-rating\">";
                    html = html + "<li>";
                    html = html + "<i class=\"fa fa-star\">";
                    html = html + "</i>";
                    html = html + "</li>";
                    html = html + "<li>";
                    html = html + "<i class=\"fa fa-star\">";
                    html = html + "</i>";
                    html = html + "</li>";
                    html = html + "<li>";
                    html = html + "<i class=\"fa fa-star\">";
                    html = html + "</i>";
                    html = html + "</li>";
                    html = html + "<li>";
                    html = html + "<i class=\"fa fa-star-half-empty\">";
                    html = html + "</i>";
                    html = html + "</li>";
                    html = html + "<li>";
                    html = html + "<i class=\"fa fa-star-half-empty\">";
                    html = html + "</i>";
                    html = html + "</li>";
                    html = html + "</ul>";
                    html = html + "<span class=\"price\">";
                    html = html + good.good_price + "￥";
                    html = html + "</span>";
                    html = html + "</div>";
                    html = html + "</div>";
                    html = html + "</div>";
                    html = html + "</div>";
                    html = html + "</div>";
                }
                document.getElementById("good_list").innerHTML = html;
                document.getElementById("cart_num").innerText = json.cart_num;
            }

        })
    }
    var data={"good_type":"specialty","action":"query_all"};
    var init=function(){
        var html = "";
        for (var i = 0; i < good_list.length; i++) {
            var good = good_list[i];
            html = html + "<div class=\"col-xl-3 col-lg-6 col-sm-6\" onclick=MarketGoodDetail('" + good.good_id + "')>";
            html = html + "<div class=\"card\">";
            html = html + "<div class=\"card-body\">";
            html = html + "<div class=\"new-arrival-product\">";
            html = html + "<div class=\"new-arrivals-img-contnent\"  style='width: 200px; height: 200px;display: flex;justify-content: center;align-items: center;'>";
            html = html + "<img class=\"img-fluid\" src=\"" + good.main_image + "\" width='200' alt=\"\" style='display: flex;justify-content: center;align-items: center;' >";
            html = html + "</div>";
            html = html + "<div class=\"new-arrival-content text-left mt-3\">";
            html = html + "<h4>";
            html = html + good.good_name;

            html = html + "</h4>";
            html = html + "<ul class=\"star-rating\">";
            html = html + "<li>";
            html = html + "<i class=\"fa fa-star\">";
            html = html + "</i>";
            html = html + "</li>";
            html = html + "<li>";
            html = html + "<i class=\"fa fa-star\">";
            html = html + "</i>";
            html = html + "</li>";
            html = html + "<li>";
            html = html + "<i class=\"fa fa-star\">";
            html = html + "</i>";
            html = html + "</li>";
            html = html + "<li>";
            html = html + "<i class=\"fa fa-star-half-empty\">";
            html = html + "</i>";
            html = html + "</li>";
            html = html + "<li>";
            html = html + "<i class=\"fa fa-star-half-empty\">";
            html = html + "</i>";
            html = html + "</li>";
            html = html + "</ul>";
            html = html + "<span class=\"price\">";
            html = html + good.good_price + "￥";
            html = html + "</span>";
            html = html + "</div>";
            html = html + "</div>";
            html = html + "</div>";
            html = html + "</div>";
            html = html + "</div>";
        }
        document.getElementById("good_list").innerHTML = html;

    };
    $.post('/specialtyMarket', data, function (json) {
        if (json.code == 0) {
            good_list = json.good_list;
            console.log(JSON.stringify(json))
            init();
            document.getElementById("cart_num").innerText = json.cart_num;
        }
    });


var MarketGoodDetail = function (good_id) {
    var data = {"good_id": good_id};
    window.location.href = "/market/market_specialty_detail.jsp?good_is=" + good_id;
}
var openCart=function(){
    window.location.href="cart.jsp"
}
var ascPrice=function()
{
    function up(x, y) {
        return x.good_price - y.good_price
    }
    good_list.sort(up);
    init();
}
    var descPrice=function()
    {
        function up(x, y) {
            return y.good_price - x.good_price
        }
        good_list.sort(up);
        init();
    }





</script>


</body>
</html>