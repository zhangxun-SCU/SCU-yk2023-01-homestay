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
    <link rel="stylesheet" href="/assets/css/seller/house_detail.css">
</head>
<body onload="onLoadFunction();">

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
                                            <h3 class="font-w700">
                                                <%=homestay.house_name%>
                                            </h3>
                                            <p>地址: <span class="item"><%=homestay.location%></span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-4 card-footer">
                                    <div class="float-end">
                                        <button type="button" class="btn btn-primary"
                                                id="addRoomButton" data-id="<%=homestay.house_id%>">
                                            <i class="fa fa-plus me-2"></i>
                                            添加房间
                                        </button>
                                        <button type="button" class="btn btn-primary ml-5"
                                                onclick="window.history.go(-1);">
                                            <i class="fa fa-arrow-left me-2"></i>
                                            返回上一页
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row card">
                <div class="card-header">
                    <h3 class="font-w700">所有房间信息</h3>
                </div>
                <div id="room_list">
                    <%--                    <div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">--%>
                    <%--                        <div class="user-bx-2 me-3 mb-3">--%>
                    <%--                            <img src="{imageurl}"--%>
                    <%--                                 class="rounded"--%>
                    <%--                                 alt="">--%>
                    <%--                            <div>--%>
                    <%--                                <h3 class="fs-20 font-w700">{房间名称}</h3>--%>
                    <%--                                <span class="font-w400 price">&yen;{price}</span>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                        <div class="d-flex justify-content-between align-items-center">--%>
                    <%--                            <div class="me-3 mb-3">--%>
                    <%--                                <button type="button" class="btn btn-sm light btn-primary modify_room_button"--%>
                    <%--                                        data-id="{room_id}">--%>
                    <%--                                    修改房间信息--%>
                    <%--                                </button>--%>
                    <%--                            </div>--%>
                    <%--                            <div class="me-3 mb-3">--%>
                    <%--                                <button type="button" class="btn btn-sm btn-outline-danger delete_room_button"--%>
                    <%--                                        data-id="room_id">--%>
                    <%--                                    删除房间--%>
                    <%--                                </button>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>

    <%--  footer start  --%>
    <%@include file="/frame/frame_footer.jsp" %>
    <%--  footer end  --%>
</div>

<%@ include file="/seller/modals/add_room_modal.jsp" %>
<%@ include file="/seller/modals/modify_room_modal.jsp" %>
<%@ include file="/seller/modals/delete_room_modal.jsp" %>
<%--  script start  --%>

<%@include file="/frame/frame_javascript.jsp" %>
<script src="../assets/js/seller/house_detail.js"></script>
<%--  script end  --%>
</body>
</html>
