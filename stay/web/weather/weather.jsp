<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2023/12/2
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<input type="hidden" id="page_id" name="page_id" value="weather_list"/>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Invome : Invome Admin  Bootstrap 5 Template" />
    <meta property="og:title" content="Invome : Invome Admin  Bootstrap 5 Template" />
    <meta property="og:description" content="Invome : Invome Admin  Bootstrap 5 Template" />
    <meta property="og:image" content="https://invome.dexignlab.com/xhtml/social-image.png" />
    <meta name="format-detection" content="telephone=no">

    <!-- PAGE TITLE HERE -->
    <title>Invome Admin Dashboard</title>

    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="image/png" href="images/favicon.png" />
    <!-- Custom Stylesheet -->
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
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
            <!-- row -->
            <div class="row">
            <div clss="portlet-body form" id="record_query_setup" name="record_query_setup">
                <div class="form-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label">想查询天气数据的城市</label>
                        <div class="row">
                            <div class="col-md-9">
                                <input type="text" id="city" name="city" class="form-control"
                                      >
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn btn-rounded btn-danger"
                                        id="query_button"
                                        name="query_button">
                                                <span class="btn-icon-start text-danger">
                                                    <i class="fa fa-question color-danger"></i>
                                                </span>查询
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            </div>
            <div class="card">
                <div class="card-header d-block">
                    <button type="button" class="btn btn-rounded btn-info" id="add_button" name="add_button"><span
                            class="btn-icon-start text-info"><i class="fa fa-plus color-info"></i>
                                    </span>添加</button>
                    <button type="button" class="btn btn-rounded btn-warning" id="export_button" name="export_button"><span
                            class="btn-icon-start text-warning"><i class="fa fa-download color-warning"></i>
                                    </span>导出</button>
                    <button type="button" class="btn btn-rounded btn-success"id="print_word_button"
                            name="print_word_button"><span
                            class="btn-icon-start text-success"><i class="fa fa-upload color-success"></i>
                                    </span>打印天气数据</button>
                    <button type="button" class="btn btn-rounded btn-secondary"id="weather_statistic"name="weather_statistic"><span
                            class="btn-icon-start text-secondary"><i class="fa fa-share-alt color-secondary"></i>
                                    </span>湿度统计</button>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">天气数据表</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th><strong>记录ID</strong></th>
                                        <th><strong>城市</strong></th>
                                        <th><strong>温度</strong></th>
                                        <th><strong>天气</strong></th>
                                        <th><strong>风力</strong></th>
                                        <th><strong>湿度</strong></th>
                                        <th><strong>记录时间</strong></th>
                                        <th><strong>操作</strong></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody id="weather_table_content_div" name="weather_table_content_div">

                                    </tbody>
                                </table>
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
<%--<script src="../assets/vendor/global/global.min.js"></script>--%>
<%--<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>--%>
<%--<script src="../assets/js/custom.min.js"></script>--%>
<%--<script src="../assets/js/dlabnav-init.js"></script>--%>
<%--<script src="../assets/js/demo.js"></script>--%>
<%--<script src="../assets/js/styleSwitcher.js"></script>--%>
<script src="../assets/js/weather/weather.js"></script>
</body>
<%@include file="./weather_add_div.jsp" %>
<%@include file="./weather_modify_div.jsp" %>
<%@include file="./weather_download_div.jsp" %>
</html>

