<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="shortcut icon" type="image/png" href="images/favicon.png"/>
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="../assets/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

</head>

<body>

<!--*******************
    Preloader start
********************-->
<%@include file="../frame/frame_preloader.jsp"%>
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
    <%@ include file="../frame/frame_menu.jsp" %>
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
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">湿度</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">变化图</a></li>
                </ol>
            </div>
            <!-- row -->
            <div class="row">
                <div clss="portlet-body form" id="record_query_setup" name="record_query_setup">
                    <form class="form-horizontal" role="form">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">想查询湿度的城市</label>
                                <div class="row">
                                    <div class="col-md-9">
                                        <input type="text" id="city" name="city" class="form-control"
                                               >
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-rounded btn-danger sweet-wrong"
                                                id="city_button"
                                                name="city_button">
                                                <span class="btn-icon-start text-danger">
                                                    <i class="fa fa-question color-danger"></i>
                                                </span>查询
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card-header">
                        <h4 class="card-title">湿度变化曲线</h4>
                    </div>
                    <div class="card-body">
                        <canvas id="humidity_line"></canvas>
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
    <%@ include file="../frame/frame_footer.jsp" %>
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
<!--**********************************
    Main wrapper end
***********************************-->

<!--**********************************
    Scripts
***********************************-->
<%@ include file="../frame/frame_javascript.jsp" %>
<!-- Required vendors -->
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<!-- Apex Chart -->
<script src="../assets/vendor/apexchart/apexchart.js"></script>

<!-- Chart ChartJS plugin files -->
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<%--<script src="../assets/js/plugins-init/chartjs-init.js"></script>--%>
<script src="../assets/js/weather/graph.js"></script>

<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<%-- Sweet Alert --%>
<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<%--<script src="../assets/js/plugins-init/sweetalert.init.js"></script>--%>

<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>

</body>
</html>