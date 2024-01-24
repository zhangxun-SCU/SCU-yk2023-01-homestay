<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/16
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="../assets/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

</head>
<body onload="onLoadFunction();">

<%--  preloader start  --%>
<%@include file="../frame/frame_preloader.jsp" %>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  menu start  --%>
    <%@include file="../frame/frame_menu.jsp" %>
    <%--  end  --%>

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <div class="container-fluid">


            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">App</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Profile</a></li>
                </ol>
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="profile card card-body px-3 pt-3 pb-0">
                        <div class="profile-head">
                            <div class="photo-content">
                                <div class="cover-photo rounded"></div>
                            </div>
                            <div class="profile-info">
                                <div class="profile-photo">
                                    <img src="<%=user.avatarURL%>" class="img-fluid rounded-circle"
                                         alt="">
                                </div>
                                <div class="profile-details">
                                    <div class="profile-name px-3 pt-2">
                                        <h4 class="text-primary mb-0">
                                            <%=user.id%>
                                        </h4>
                                        <p>Username</p>
                                    </div>
                                    <div class="profile-email px-2 pt-2">
                                        <h4 class="text-muted mb-0">
                                            <%=user.email%>
                                        </h4>
                                        <p>Email</p>
                                    </div>
                                </div>
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
                                            <a href="#feedback-post" data-bs-toggle="tab"
                                               class="nav-link active show">用户反馈</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="#feedback-post" class="tab-pane fade active show">
                                            <div class="my-post-content pt-3">
                                            </div>
                                            <div class="col-xl-12">
                                                <div class="profile-news">
                                                    <h4 class="text-primary d-inline">Latest Feedback</h4>
                                                    <div id="feedback_list">
                                                        <div class="media pt-3 pb-3">
                                                            <img src="../assets/images/profile/5.jpg" alt="image"
                                                                 class="me-3 rounded" width="75">
                                                            <div class="media-body">
                                                                <h5 class="m-b-5">
                                                                    用户名 <small>时间</small>
                                                                </h5>
                                                                <p class="mb-0 text-muted">
                                                                    反馈内容
                                                                </p>
                                                            </div>
                                                            <button class="btn btn-md btn-primary">
                                                                <i class="fa fa-comment me-2"></i>
                                                                回复反馈
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--**********************************
        Content body end
    ***********************************-->

    <%--  footer start  --%>
    <%@include file="../frame/frame_footer.jsp" %>
    <%--  footer end  --%>
</div>
<%@ include file="modals/reply_modal.jsp" %>
<%--  script start  --%>

<%@include file="../frame/frame_javascript.jsp" %>
<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/js/plugins-init/sweetalert.init.js"></script>
<script src="../assets/js/feedback/feedback.js"></script>
<%--  script end  --%>
</body>
</html>

