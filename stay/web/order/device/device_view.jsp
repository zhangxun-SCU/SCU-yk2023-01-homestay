<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>

    <%@include file="../../home/frame/frame_style.jsp"%>

    <link rel="stylesheet" type="text/css" href="dataTables.bootstrap.css" />
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content ">
<!-- BEGIN HEADER -->
<%@include file="../../home/frame/frame_header.jsp"%>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <%@include file="../../home/frame/frame_left_sidebar.jsp"%>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <%@include file="../../home/frame/frame_page_header.jsp"%>
            <!-- END STYLE CUSTOMIZER -->
            <!-- BEGIN PAGE HEADER-->
            <!------------------------------------页面开始------------------------------------->
            <h3 class="page-title">
                设备信息 <small>管理设备数据</small>
            </h3>
            <div class="page-bar">
                <ul class="page-breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="index.html">Home</a>
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
                        <button type="button" class="btn btn-fit-height grey-salt dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
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
                    <button type="button" class="btn blue" id="return_button" name="return_button">返回</button>
                </div>
            </div>

            <div class="row" id="bar_tab">
                <div class="col-md-6">
                    <div id="record_bar_div" name="record_bar_div">
                        <form class="form-horizontal" role="form">
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">设备编号</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="Enter text" id="device_id" name="device_id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">设备名称</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="Enter text" id="device_name" name="device_name">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- END PAGE CONTENT-->
            <!------------------------------------页面结束------------------------------------->
        </div>
    </div>
    <!-- END CONTENT -->
    <!-- BEGIN QUICK SIDEBAR -->
    <%@include file="../../home/frame/frame_right_sidebar.jsp"%>
    <!-- END QUICK SIDEBAR -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="../../home/frame/frame_footer.jsp"%>

<!-- END FOOTER -->

<%@include file="../../home/frame/frame_javascript.jsp"%>

<script type="text/javascript" src="jquery.dataTables.min.js"></script>
<script src="device.js"></script>
</body>
<!-- END BODY -->
<input type="hidden" id="page_id" name="page_id" value="device_view"/>
</html>

<%@include file="device_add_div.jsp"%>
<%@include file="device_modify_div.jsp"%>

