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

    <%--    <%@include file="../../home/frame/frame_style.jsp"%>--%>

    <link rel="stylesheet" type="text/css" href="dataTables.bootstrap.css" />
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-quick-sidebar-over-content ">
<!-- BEGIN HEADER -->
<%--<%@include file="../../home/frame/frame_header.jsp"%>--%>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <%--    <%@include file="../../home/frame/frame_left_sidebar.jsp"%>--%>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <%--            <%@include file="../../home/frame/frame_page_header.jsp"%>--%>
            <!-- END STYLE CUSTOMIZER -->
            <!-- BEGIN PAGE HEADER-->
            <!------------------------------------页面开始------------------------------------->

            <div class="page-bar">
                <ul class="page-breadcrumb">
                    <%--                    <li>--%>
                    <%--                        <i class="fa fa-home"></i>--%>
                    <%--                        <a href="index.html">Home</a>--%>
                    <%--                        <i class="fa fa-angle-right"></i>--%>
                    <%--                    </li>--%>
                    <%--                    <li>--%>
                    <%--                        <a href="#">Data Tables</a>--%>
                    <%--                        <i class="fa fa-angle-right"></i>--%>
                    <%--                    </li>--%>
                    <%--                    <li>--%>
                    <%--                        <a href="#">Basic Datatables</a>--%>
                    <%--                    </li>--%>
                    <%--                </ul>--%>
                    <%--                <div class="page-toolbar">--%>
                    <%--                    <div class="btn-group pull-right">--%>
                    <%--                        <button type="button" class="btn btn-fit-height grey-salt dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">--%>
                    <%--                            Actions <i class="fa fa-angle-down"></i>--%>
                    <%--                        </button>--%>
                    <%--                        <ul class="dropdown-menu pull-right" role="menu">--%>
                    <%--                            <li>--%>
                    <%--                                <a href="#">Action</a>--%>
                    <%--                            </li>--%>
                    <%--                            <li>--%>
                    <%--                                <a href="#">Another action</a>--%>
                    <%--                            </li>--%>
                    <%--                            <li>--%>
                    <%--                                <a href="#">Something else here</a>--%>
                    <%--                            </li>--%>
                    <%--                            <li class="divider">--%>
                    <%--                            </li>--%>
                    <%--                            <li>--%>
                    <%--                                <a href="#">Separated link</a>--%>
                    <%--                            </li>--%>
                    <%--                        </ul>--%>
                    <%--                    </div>--%>
                    <%--                </div>--%>
                    <%--            </div>--%>
                    <!-- END PAGE HEADER-->
                    <!-- BEGIN PAGE CONTENT-->
                    <input type="hidden" id="page_id" name="page_id" value="room_order_statistic"/>


                    <div class="row">
                        <div class="col-md-12">
                            <!-- BEGIN CHART PORTLET-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-bar-chart font-green-haze"></i>
                                        <span class="caption-subject bold uppercase font-green-haze"> Bar Charts</span>
                                        <span class="caption-helper">column and line mix</span>
                                    </div>
                                    <div class="tools">
                                        <a href="javascript:;" class="collapse">
                                        </a>
                                        <a href="#portlet-config" data-toggle="modal" class="config">
                                        </a>
                                        <a href="javascript:;" class="reload">
                                        </a>
                                        <a href="javascript:;" class="fullscreen">
                                        </a>
                                        <a href="javascript:;" class="remove">
                                        </a>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div id="chart_1" class="chart" style="height: 500px;">
                                    </div>
                                </div>
                            </div>
                            <!-- END CHART PORTLET-->
                        </div>
                    </div>
                    <!-- END PAGE CONTENT-->
                    <!------------------------------------页面结束------------------------------------->
            </div>
        </div>
        <!-- END CONTENT -->
        <!-- BEGIN QUICK SIDEBAR -->
        <%--    <%@include file="../../home/frame/frame_right_sidebar.jsp"%>--%>
        <!-- END QUICK SIDEBAR -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <%--<%@include file="../../home/frame/frame_footer.jsp"%>--%>

    <!-- END FOOTER -->

    <%@include file="../home/frame/frame_javascript.jsp"%>

    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="../../assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/ammap/maps/js/worldLow.js" type="text/javascript"></script>
    <script src="../../assets/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <script type="text/javascript" src="jquery.dataTables.min.js"></script>
    <%--<%@ include file="/frame/frame_javascript.jsp" %>--%>

    <script src="/assets/vendor/global/global.min.js"></script>
    <script src="/assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
    <script src="/assets/js/custom.min.js"></script>
    <script src="/assets/js/dlabnav-init.js"></script>
    <script src="/assets/js/demo.js"></script>
    <script>
        function getUserInfo() {
            const token = getCookie("token")
            return JSON.parse(window.atob(token.split('.')[1]))
        }
    </script>
    <script>
        /**
         * top menu slider
         */

        $('#to-profile').attr('href', `/user/user-profile.jsp?id=\${getUserInfo().id}`);
    </script>
    <script src="../../assets/js/order/room_order_seller.js"></script>
</body>
<!-- END BODY -->

</html>

<%--<script src="/assets/vendor/global/global.min.js"></script>--%>
<%--<script src="/assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>--%>
<%--<script src="/assets/js/custom.min.js"></script>--%>
<%--<script src="/assets/js/dlabnav-init.js"></script>--%>
<%--<script src="/assets/js/demo.js"></script>--%>
<%--<script>--%>
<%--    function getUserInfo() {--%>
<%--        const token = getCookie("token")--%>
<%--        return JSON.parse(window.atob(token.split('.')[1]))--%>
<%--    }--%>
<%--</script>--%>
<%--<script>--%>
<%--    /**--%>
<%--     * top menu slider--%>
<%--     */--%>

<%--    $('#to-profile').attr('href', `/user/user-profile.jsp?id=\${getUserInfo().id}`);--%>
<%--</script>--%>