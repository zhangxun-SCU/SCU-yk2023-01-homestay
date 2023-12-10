<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.5
Version: 4.1.0
Author: KeenThemes
Website: http://www.keenthemes.com/
Contact: support@keenthemes.com
Follow: www.twitter.com/keenthemes
Like: www.facebook.com/keenthemes
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
License: You must have a valid license purchased only from themeforest(the above link) in order to legally use the theme for your project.
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>信息管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../../home/frame/frame_style.jsp" %>
    <link rel="stylesheet" href="../../assets/css/dataTables.bootstrap.css" type="text/css"/>
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content ">
<%@include file="../../home/frame/frame_header.jsp" %>
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <%@include file="../../home/frame/frame_left_sidebar.jsp" %>
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <%@include file="../../home/frame/frame_page_header.jsp" %>
            <!-- BEGIN PAGE HEADER-->
            <h3 class="page-title">
                电子眼信息 <small>管理数据表</small>
            </h3>
            <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="../templates/index.html">Home</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">Data Tables</a>
                        <i class="fa fa-angle-right"></i>
                    </li>
                    <li>
                        <a href="#">Basic Datatables</a>
                    </li>
                </ul>
                <div class="page-toolbar">
                    <div class="btn-group pull-right">
                        <button type="button" class="btn btn-fit-height grey-salt dropdown-toggle"
                                data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
                            Actions <i class="fa fa-angle-down"></i>
                        </button>
                        <ul class="dropdown-menu pull-right" role="menu">
                            <li>
                                <a href="#">Action</a>
                            </li>
                            <li>
                                <a href="#">Another action</a>
                            </li>
                            <li>
                                <a href="#">Something else here</a>
                            </li>
                            <li class="divider">
                            </li>
                            <li>
                                <a href="#">Separated link</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="btn default purple-stripe" id="return_button" name="return_button">
                        返回上一页
                    </button>
                </div>
            </div>
            <div class="row" id="_bar">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-md-3 control-label">记录ID</label>
                        <div class="col-md-9">
                            <input type="text" id="record_id" name="record_id" class="form-control"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">车牌号</label>
                        <div class="col-md-9">
                            <input type="text" id="plate_code" name="plate_code" class="form-control"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">车牌颜色</label>
                        <div class="col-md-9">
                            <input type="text" id="plate_color" name="plate_color" class="form-control"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">获取时间</label>
                        <div class="col-md-9">
                            <input type="text" id="capture_time" name="capture_time" class="form-control"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">设备ID</label>
                        <div class="col-md-9">
                            <input type="text" id="device_id" name="device_id" class="form-control"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">道路ID</label>
                        <div class="col-md-9">
                            <input type="text" id="lane_id" name="lane_id" class="form-control"
                                   readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">方向ID</label>
                        <div class="col-md-9">
                            <input type="text" id="direction_id" name="direction_id" class="form-control"
                                   readonly="readonly">
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE CONTENT-->
        </div>
    </div>
    <!-- END CONTENT -->
    <%@include file="../../home/frame/frame_right_sidebar.jsp" %>
</div>
<!-- END CONTAINER -->
<%@include file="../../home/frame/frame_footer.jsp" %>

<%@include file="../../home/frame/frame_script.jsp" %>
<script src="../../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../../assets/js/device.js"></script>
</body>
<!-- END BODY -->
<input type="hidden" id="page_id" name="page_id" value="device_view">
<%@include file="weather_modify_div.jsp" %>
<%@include file="weather_add_div.jsp" %>
</html>


