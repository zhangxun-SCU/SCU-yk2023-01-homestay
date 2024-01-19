


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
            <div  class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"onclick="detailBack()"><a >返回</a></li>

                </ol>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xl-3 col-lg-6  col-md-6 col-xxl-5 ">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade show active">
                                            <img class="img-fluid" src="/images/product/1.jpg" id="first" alt="">
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="second">
                                            <img class="img-fluid" src="images/product/2.jpg" alt="">
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="third">
                                            <img class="img-fluid" src="images/product/3.jpg" alt="">
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="for">
                                            <img class="img-fluid" src="images/product/4.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="tab-slide-content new-arrival-product mb-4 mb-xl-0">
                                        <!-- Nav tabs -->
                                        <ul class="nav slide-item-list mt-3" role="tablist">
                                            <li role="presentation" class="show">
                                                <a role="tab" data-bs-toggle="tab">
                                                    <img class="img-fluid" src="/good_image/1.jpg" alt="" width="50">
                                                </a>
                                            </li>
                                            <li role="presentation">
                                                <a role="tab" data-bs-toggle="tab"><img class="img-fluid"
                                                                                        src="/good_image/1.jpg" alt=""
                                                                                        width="50"></a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#third" role="tab" data-bs-toggle="tab"><img class="img-fluid"
                                                                                                      src="images/tab/3.jpg"
                                                                                                      alt="" width="50"></a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#for" role="tab" data-bs-toggle="tab"><img class="img-fluid"
                                                                                                    src="images/tab/4.jpg"
                                                                                                    alt="" width="50"></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--Tab slider End-->
                                <div class="col-xl-9 col-lg-6  col-md-6 col-xxl-7 col-sm-12">
                                    <div class="product-detail-content">
                                        <!--Product details-->
                                        <div class="new-arrival-content pr">
                                            <h3 id="good_name"></h3>
                                            <div class="comment-review star-rating">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>

                                                </ul>
                                                <span class="review-text">(34 reviews) / </span><a class="product-review"
                                                                                                   href=""
                                                                                                   data-bs-toggle="modal"
                                                                                                   data-bs-target="#reviewModal">Write
                                                a review?</a>
                                            </div>
                                            <div class="d-table mb-2">
                                                <p class="price float-start d-block" id="good_price"></p>
                                            </div>
                                            <p>剩余库存: <span id="good_num"></span><span class="item">   <i
                                                    class="fa fa-shopping-basket"></i>

                                                </span>
                                            </p>
                                            <p>Product code: <span class="item"></span></p>
                                            <p>Brand: <span class="item">Lee</span></p>
                                            <p>Product tags:&nbsp;&nbsp;
                                                <span class="badge badge-success light">bags</span>
                                                <span class="badge badge-success light">clothes</span>
                                                <span class="badge badge-success light">shoes</span>
                                                <span class="badge badge-success light">dresses</span>
                                            </p>
                                            <p class="text-content">There are many variations of passages of Lorem Ipsum
                                                available, but the majority have suffered alteration in some form, by
                                                injected humour, or randomised words which don't look even slightly
                                                believable.
                                                If you are going to use a passage of Lorem Ipsum, you need to be sure there
                                                isn't anything embarrassing.</p>
                                            <div class="d-flex align-items-end flex-wrap mt-4">
                                                <!--Quantity start-->
                                                <div class=" px-0  mb-2 me-3">
                                                    <h4>数量</h4>
                                                </div>

                                                <div class="col-2 px-0  mb-2 me-3">
                                                    <input id="need_num" type="number" name="num"
                                                           class="form-control input-btn input-number" value="1" min="1"
                                                           max="2">
                                                </div>
                                                <!--Quanatity End-->
                                                <div class="shopping-cart  mb-2 me-3">
                                                    <a id="view_comments" class="btn btn-info" href="javascript:viewComments();"><i
                                                            class="fa fa-comment me-2"></i>查看评论</a>
                                                </div>
                                                <div class="shopping-cart  mb-2 me-3">
                                                    <a id="add_cart" class="btn btn-primary" href="javascript:void();"><i
                                                            class="fa fa-shopping-basket me-2"></i>加入购物车</a>
                                                </div>
                                                <div class="shopping-cart  mb-2 me-3">
                                                    <a id="initOrder" class="btn btn-danger" href="javascript:void();"><i
                                                            class="fa fa-shopping-basket me-2"></i>立即购买</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- review -->
                <div class="modal fade" id="reviewModal">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Review</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal">
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="text-center mb-4">
                                        <img class="img-fluid rounded" width="78" src="./images/avatar/1.jpg"
                                             alt="DexignZone">
                                    </div>
                                    <div class="mb-3">
                                        <div class="rating-widget mb-4 text-center">
                                            <!-- Rating Stars Box -->
                                            <div class="rating-stars">
                                                <ul id="stars">
                                                    <li class="star" title="Poor" data-value="1">
                                                        <i class="fa fa-star fa-fw"></i>
                                                    </li>
                                                    <li class="star" title="Fair" data-value="2">
                                                        <i class="fa fa-star fa-fw"></i>
                                                    </li>
                                                    <li class="star" title="Good" data-value="3">
                                                        <i class="fa fa-star fa-fw"></i>
                                                    </li>
                                                    <li class="star" title="Excellent" data-value="4">
                                                        <i class="fa fa-star fa-fw"></i>
                                                    </li>
                                                    <li class="star" title="WOW!!!" data-value="5">
                                                        <i class="fa fa-star fa-fw"></i>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <textarea class="form-control" placeholder="Comment" rows="5"></textarea>
                                    </div>
                                    <button class="btn btn-success btn-block">RATE</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="position: fixed;left: 90%;top:80%" onclick="openCart()">
            <span id="cart_num" class="badge light text-white bg-danger rounded-circle"
                  style="position: relative;left:10% ;top:-100%;float: left"></span>
                <button type="button" class="btn btn-rounded btn-primary"><span class="btn-icon-start text-primary"><i
                        class="fa fa-shopping-cart"></i>
</span>购物车
                </button>
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
    var url = window.location.href;
    var good_id = url.split('=')[1];
    var data = {"good_id": good_id,"good_type":"specialty"};
    data.good_id = good_id;
    console.log(data);
    $.post('/getSpecialtyDetail', data, function (json) {
        if (json.code == 0) {
            console.log(JSON.stringify(json));
            document.getElementById("good_name").innerText = json.good_name;
            document.getElementById("good_price").innerText = json.good_price + "￥";
            document.getElementById("first").src = json.main_image;
            document.getElementById("good_num").innerText = json.num;
            document.getElementById("need_num").max = json.num;
            document.getElementById("cart_num").innerText = json.cart_num;
            if(json.num==0)
            {
                document.getElementById("add_cart").disabled = "disabled";
                document.getElementById("add_cart").className="btn btn-light";
                document.getElementById("initOrder").disabled = "disabled";
                document.getElementById("initOrder").className="btn btn-light";
                document.getElementById("add_cart").onclick = function (){
                    sweetAlert("无库存", "去看看别的吧~", "error")
                }
                document.getElementById("initOrder").onclick = function (){
                    sweetAlert("无库存", "去看看别的吧~", "error")
                }
            }
            else
            {
                document.getElementById("add_cart").onclick = function () {
                    var good_id = url.split('=')[1];
                    var good_num = document.getElementById("need_num").value;
                    var data = {"good_id": good_id, "good_num": good_num};
                    $.post("/addGood2Cart", data, function (json) {
                        if (json.code == 0) {
                            toastr.success("去购物车查看吧~", "添加成功", {
                                positionClass: "toast-bottom-right",
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
                            });
                            document.getElementById("cart_num").innerText = json.cart_num;
                        }
                    })
                }
                document.getElementById("initOrder").onclick=purChase();
            }
        }
    });
    document.getElementById("need_num").onchange = function () {
        if (Number(this.value) > Number(this.max)) {
            this.value = Number(this.max);
        }
        if (Number(this.value < 1)) {
            this.value = Number(this.min);
        }
    };
    var openCart=function(){
        window.location.href="cart.jsp"
    };
    var purChase=function(){
        var checkgoods = [];
        var good={"good_id":good_id,"num":document.getElementById("need_num").value};
        checkgoods.push(good);
        var checkgoodsstring = JSON.stringify(checkgoods);
        let data=new Date().getTime();
        let new_data=new Date(data+6000);
        document.cookie="checkgood="+checkgoodsstring+";expires="+new_data.toUTCString();
        window.location.href="confirm_order.jsp"
    }
    var detailBack = function () {
        window.history.go(-1);
    };

    function viewComments(){
        window.location.href = "./specialty_comments.jsp?good_id=" + good_id;
    }



</script>

</html>

