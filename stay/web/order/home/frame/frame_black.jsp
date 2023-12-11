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
            <input type="hidden" id="page_id" name="page_id" value="xxxx"/>
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="btn blue" id="add_button" name="add_button">添加设备</button>
                    <button type="button" class="btn blue" id="query_button" name="query_button">查询</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="portlet-body form" id="record_query_setup" name="record_query_setup">
                        <form class="form-horizontal" role="form">
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">记录id</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="Enter text" id="id" name="id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">设备id</label>
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
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="btn blue" id="datatable_button" name="datatable_button">切换到DataTable</button>
                    <button type="button" class="btn blue" id="table_button" name="table_button">切换到自定义Table</button>
                    <button type="button" class="btn blue" id="bar_button" name="bar_button">切换到自定义大横条</button>
                </div>
            </div>
            <div class="row display-none" id="table_tab">
                <div class="col-md-6">
                    <!-- BEGIN SAMPLE TABLE PORTLET-->
                    <div class="portlet box blue">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="fa fa-comments"></i>设备数据表
                            </div>
                            <div class="tools">
                                <a href="javascript:;" class="collapse">
                                </a>
                                <a href="#portlet-config" data-toggle="modal" class="config">
                                </a>
                                <a href="javascript:;" class="reload">
                                </a>
                                <a href="javascript:;" class="remove">
                                </a>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div class="table-scrollable">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>
                                            #
                                        </th>
                                        <th>
                                            Class Name
                                        </th>
                                        <th>
                                            Column
                                        </th>
                                        <th>
                                            Column
                                        </th>
                                        <th>
                                            Column
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="record_table_content_div" name="record_table_content_div">
                                    <tr class="active">
                                        <td>
                                            1
                                        </td>
                                        <td>
                                            active
                                        </td>
                                        <td>
                                            Column heading
                                        </td>
                                        <td>
                                            Column heading
                                        </td>
                                        <td>
                                            Column heading
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- END SAMPLE TABLE PORTLET-->
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

</html>

<%@include file="device_add_div.jsp"%>
<%@include file="device_modify_div.jsp"%>
