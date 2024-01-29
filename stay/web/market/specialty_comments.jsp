<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2024/1/16
  Time: 23:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="homestay.utils.Config" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content=""/>
    <meta name="author" content=""/>
    <meta name="robots" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Invome : Invome Admin  Bootstrap 5 Template"/>
    <meta property="og:title" content="Invome : Invome Admin  Bootstrap 5 Template"/>
    <meta property="og:description" content="Invome : Invome Admin  Bootstrap 5 Template"/>
    <meta property="og:image" content="https://invome.dexignlab.com/xhtml/social-image.png"/>
    <meta name="format-detection" content="telephone=no">
    <title>Title</title>
    <%@include file="../frame/frame_style.jsp" %>
    <style>
        .stars {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .stars > li {
            float: left;
        }
    </style>
</head>
<body onload="onloadFunction();">

<%--  preloader start  --%>
<%@include file="../frame/frame_preloader.jsp" %>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  menu start  --%>
    <%@include file="../frame/frame_menu.jsp" %>
    <%--  end  --%>

    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" onclick="window.history.go(-1);"><a>返回</a></li>
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
                                                                                                    alt=""
                                                                                                    width="50"></a>
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
                                                <span class="review-text">(34 reviews) / </span><a
                                                    class="product-review"
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
                                                If you are going to use a passage of Lorem Ipsum, you need to be sure
                                                there
                                                isn't anything embarrassing.</p>
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
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="profile-tab">
                                <div class="custom-tab-1">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a href="#comments" data-bs-toggle="tab"
                                               class="nav-link active show">评论</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="comments" class="tab-pane fade active show">
                                            <div class="my-post-content pt-3">
                                            </div>
                                            <div id="comments_list">
                                                <%--                                                <div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">--%>
                                                <%--                                                    <div class="user-bx-2 me-3 mb-3">--%>
                                                <%--                                                        <img src="/upload/house_image/GH1705405506092.png"--%>
                                                <%--                                                             class="rounded-circle" alt="">--%>
                                                <%--                                                        <div>--%>
                                                <%--                                                            <h3 class="fs-20 font-w700">hubert</h3>--%>
                                                <%--                                                            <span class="font-w400 text-muted fs-12">2024-01-16 23:32:30</span>--%>
                                                <%--                                                        </div>--%>
                                                <%--                                                    </div>--%>
                                                <%--                                                    <div class="user-bx-2 d-flex flex-column"--%>
                                                <%--                                                         style="flex: 0.9; align-items: flex-start;">--%>
                                                <%--                                                        <div class="mb-2 row">--%>
                                                <%--                                                            <ul class="stars col-sm-9 float-left" id="stars_0">--%>
                                                <%--                                                                <li class="me-2" data-score="1"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li class="me-2" data-score="2"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li class="me-2" data-score="3"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li class="me-2" data-score="4"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li data-score="5"><i class="fa fa-star"></i></li>--%>
                                                <%--                                                            </ul>--%>
                                                <%--                                                        </div>--%>
                                                <%--                                                        <p class="me-2 mb-2 fs-16 row">--%>
                                                <%--                                                            aaaaaaaa--%>
                                                <%--                                                        </p>--%>
                                                <%--                                                    </div>--%>
                                                <%--                                                </div>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="position: fixed;left: 90%;top:80%" onclick="openCart()">
            <span id="cart_num" class="badge light text-white bg-danger rounded-circle"
                  style="position: relative;left:10% ;top:-100%;float: left"></span>
                <button type="button" class="btn btn-rounded btn-primary">
                    <span class="btn-icon-start text-primary">
                        <i class="fa fa-shopping-cart"></i>
                    </span>
                    购物车
                </button>
            </div>

        </div>
    </div>

    <%--  footer start  --%>
    <%@include file="../frame/frame_footer.jsp" %>
    <%--  footer end  --%>
</div>
<%--  script start  --%>

<%@include file="../frame/frame_javascript.jsp" %>
<script type="text/javascript">
    function onloadFunction() {
        var url = window.location.href;
        var good_id = url.split('=')[1];
        var data = {"good_id": good_id, "good_type": "specialty"};

        data.good_id = good_id;
        console.log(data);
        $.post('<%=Config.getInstance().getString("default.urlheader")%>/getSpecialtyDetail', data, function (json) {
            if (json.code === 0) {
                console.log(JSON.stringify(json));
                document.getElementById("good_name").innerText = json.good_name;
                document.getElementById("good_price").innerText = json.good_price + "￥";
                document.getElementById("first").src = json.main_image;
                document.getElementById("good_num").innerText = json.num;
                document.getElementById("cart_num").innerText = json.cart_num;
            }
        });

        // 获取所有评论信息
        $.ajaxSettings.async = false;
        $.post(
            "<%=Config.getInstance().getString("default.urlheader")%>/order_comment",
            {
                "type": "specialty",
                "action": "get_comment",
                "specialty_id": good_id
            },
            (res) => {
                console.log(res.resCode);
                if (res.resCode === "00000") {
                    var html = "";
                    var comments = res.comments;
                    console.log(comments);
                    if (comments !== undefined && comments !== null) {
                        for (var i = 0; i < comments.length; i++) {
                            var comment = comments[i];
                            html += `<div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">`;
                            html += `    <div class="user-bx-2 me-3 mb-3">`;
                            html += `        <img src="${comment.avatar}"`;
                            html += `             class="rounded-circle" alt="">`;
                            html += `            <div>`;
                            html += `                <h3 class="fs-20 font-w700">${comment.user_id}</h3>`;
                            html += `                <span class="font-w400 text-muted fs-12">${comment.create_time}</span>`;
                            html += `            </div>`;
                            html += `    </div>`;
                            html += `    <div class="user-bx-2 d-flex flex-column"`;
                            html += `         style="flex: 0.9; align-items: flex-start;">`;
                            html += `        <div class="mb-2 row">`;
                            html += `            <ul class="stars col-sm-9 float-left" id="stars_${i}">`;
                            html += `                <li class="me-2" data-score="1"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li class="me-2" data-score="2"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li class="me-2" data-score="3"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li class="me-2" data-score="4"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li data-score="5"><i class="fa fa-star"></i></li>`;
                            html += `            </ul>`;
                            html += `        </div>`;
                            html += `        <p class="me-2 mb-2 fs-16 row">`;
                            html += `            ${comment.comment}`;
                            html += `        </p>`;
                            html += `    </div>`;
                            html += `</div>`;
                        }
                        $("#comments_list").html(html);
                        for (var i = 0; i < comments.length; i++) {
                            var comment = comments[i];
                            setStars(Number(comment.score), i);
                        }
                    }
                }
            }
        )
        $.ajaxSettings.async = true;
    }

    function setStars(score, id) {
        var stars = document.querySelectorAll(`#stars_${id} > li`);
        console.log(stars);
        for (var j = 0; j < 5; j++) {
            var t_star = stars[j];
            var t_score = t_star.dataset.score;
            if (t_score <= score) {
                t_star.style.color = "orange";
            } else {
                t_star.style.color = "black";
            }
        }
    }
</script>
<%--  script end  --%>
</body>
</html>
