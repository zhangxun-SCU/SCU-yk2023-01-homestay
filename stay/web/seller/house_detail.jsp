<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/12
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="homestay.dao.seller.HomestayDao" %>
<%@ page import="homestay.dao.Data" %>
<%@ page import="homestay.entity.Homestay" %>
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
    <%@include file="/frame/frame_style.jsp" %>
    <link rel="stylesheet" href="/assets/css/goods/house_detail.css">
</head>
<body>

<%--  preloader start  --%>
<%@include file="/frame/frame_preloader.jsp" %>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  menu start  --%>
    <%@include file="/frame/frame_menu.jsp" %>
    <%--  end  --%>

    <%--  获取民宿信息  --%>
    <%
        HomestayDao dao = new HomestayDao();
    %>
    <%
        Data data = Data.getPageParameters(request, response);
        String homestayId = data.getParam().getString("house_id");
        Homestay homestay = dao.queryHomestayById(homestayId);
        System.out.println(homestayId);
    %>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">民宿</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">详细信息</a></li>
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
                                        <div role="tabpanel" class="tab-pane fade show active" id="first">
                                            <img class="house_image" src="<%=homestay.imageurl%>" alt="">
                                        </div>
                                    </div>
                                </div>
                                <!--Tab slider End-->
                                <div class="col-xl-9 col-lg-6  col-md-6 col-xxl-7 col-sm-12">
                                    <div class="product-detail-content">
                                        <!--Product details-->
                                        <div class="new-arrival-content pr">
                                            <h4>
                                                <%=homestay.house_name%>
                                            </h4>
                                            <div class="d-table mb-2">
                                                <p class="price float-start d-block">$325.00</p>
                                            </div>
                                            <p>地址: <span class="item"><%=homestay.location%></span></p>
                                            <p class="text-content">There are many variations of passages of Lorem Ipsum
                                                available, but the majority have suffered alteration in some form, by
                                                injected humour, or randomised words which don't look even slightly
                                                believable.
                                                If you are going to use a passage of Lorem Ipsum, you need to be sure
                                                there isn't anything embarrassing.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4 card-footer">
                                    <a class="btn btn-primary float-end" href="javascript:void(0);">
                                        <i class="fa fa-shopping-basket me-2"></i>
                                        Add to cart
                                    </a>
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
        </div>
    </div>

    <%--  footer start  --%>
    <%@include file="/frame/frame_footer.jsp" %>
    <%--  footer end  --%>
</div>
<%--  script start  --%>

<%@include file="/frame/frame_javascript.jsp" %>

<%--  script end  --%>
</body>
</html>
