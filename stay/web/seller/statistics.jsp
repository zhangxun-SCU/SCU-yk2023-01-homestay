<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2024/1/20
  Time: 20:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="homestay.utils.UserUtil" %>
<%@ page import="homestay.entity.User" %>
<%@ page import="homestay.dao.UserDao" %>
<!DOCTYPE html>
<html lang="en">

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

    <!-- PAGE TITLE HERE -->
    <title>Invome Admin Dashboard</title>

    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="image/png" href="../assets/images/favicon.png"/>
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="../assets/vendor/lightgallery/css/lightgallery.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/seller/goods_page.css">

    <!--    &lt;!&ndash; dropify &ndash;&gt;-->
    <!--&lt;!&ndash;    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css"/>&ndash;&gt;-->
    <!--    <link rel="stylesheet" href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css"/>-->
    <!--    <link rel="stylesheet" href="../assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"/>-->
    <!--    <link rel="stylesheet" href="../assets/plugins/multi-select/css/multi-select.css">-->
    <!--    <link rel="stylesheet" href="../assets/plugins/dropify/css/dropify.min.css">-->

</head>

<body onload="onloadFunction();">

<!--*******************
    Preloader start
********************-->
<div id="preloader">
    <div class="lds-ripple">
        <div></div>
        <div></div>
    </div>
</div>
<!--*******************
    Preloader end
********************-->


<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <!--**********************************
        Nav header start
    ***********************************-->
    <%@ include file="/frame/frame_menu.jsp" %>
    <!--**********************************
        Sidebar end
    ***********************************-->

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <div class="container-fluid">


            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">商品管理</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">销量统计</a></li>
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
                                        <p>用户名</p>
                                    </div>
                                    <div class="profile-email px-2 pt-2">
                                        <h4 class="text-muted mb-0">
                                            <%=user.email%>
                                        </h4>
                                        <p>邮箱地址</p>
                                    </div>
                                    <div class="ms-auto">
                                        <button type="button" class="btn btn-rounded btn-primary"
                                                onclick="window.location.href='./goods_page.jsp'">
                                            <span class="btn-icon-start text-primary">
                                                <i class="fa fa-feather color-info"></i>
                                            </span>
                                            发布新商品
                                        </button>
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
                                            <a href="#statistics" data-bs-toggle="tab"
                                               class="nav-link active show">销售量统计</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="statistics" class="tab-pane fade active show">
                                            <a href="#"
                                               class="btn btn-rounded btn-success mb-2 m-2"
                                               id="download">
                                                <span class="btn-icon-start text-success">
                                                    <i class="fa fa-file-excel color-danger"></i>
                                                </span>导出数据为Excel
                                            </a>
                                            <div class="row">
                                                <div class="col-xl-6 col-lg-12 col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">最近一周特产总销量变化</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <canvas id="specialty_total_sales"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 col-lg-12 col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">特产销量TOP</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <canvas id="specialty_top_sales"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 col-lg-12 col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">最近一周民宿预订数量变化</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <canvas id="homestay_total_sales"></canvas>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 col-lg-12 col-sm-12">
                                                    <div class="card">
                                                        <div class="card-header">
                                                            <h4 class="card-title">民宿热度TOP</h4>
                                                        </div>
                                                        <div class="card-body">
                                                            <canvas id="homestay_top_sales"></canvas>
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


    <!--**********************************
        Footer start
    ***********************************-->
    <%@ include file="/frame/frame_footer.jsp" %>
    <!--**********************************
        Footer end
    ***********************************-->

    <!--**********************************
       Support ticket button start
    ***********************************-->

    <!--**********************************
       Support ticket button end
    ***********************************-->


</div>
<%@ include file="modals/delete_specialty_modal.jsp" %>
<%@ include file="modals/modify_specialty_modal.jsp" %>
<%@ include file="modals/delete_homestay_modal.jsp" %>
<%@ include file="modals/modify_homestay_modal.jsp" %>
<!--**********************************
    Main wrapper end
***********************************-->

<!--removeIf(production)-->

<!--**********************************
    Scripts
***********************************-->
<%@ include file="/frame/frame_javascript.jsp" %>
<!-- Required vendors -->
<script src="../assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="../assets/vendor/lightgallery/js/lightgallery-all.min.js"></script>

<!-- Chart ChartJS plugin files -->
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<%--<script src="../assets/js/plugins-init/chartjs-init.js"></script>--%>
<script src="../assets/js/seller/statistics.js"></script>

</body>
</html>
