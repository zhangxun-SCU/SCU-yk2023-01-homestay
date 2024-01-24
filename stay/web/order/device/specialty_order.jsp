<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html lang="en">
<input type="hidden" id="page_id" name="page_id" value="order_list"/>
<%--<script src="specialty_order.js"></script>--%>
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
    <!-- Custom Stylesheet -->
    <link href="../../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="../../assets/css/style.css" rel="stylesheet">
    <link href="../../assets/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">

</head>

<body>

<!--*******************
    Preloader start
********************-->
<%@ include file="../../frame/frame_preloader.jsp" %>
<!--*******************
    Preloader end
********************-->


<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <!--**********************************
        Header start
    ***********************************-->
    <%@ include file="../../frame/frame_menu.jsp" %>
    <!--**********************************
        Sidebar end
    ***********************************-->

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <div class="container-fluid">
            <%--            <div class="row page-titles">--%>
            <%--                <ol class="breadcrumb">--%>
            <%--                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Welcome</a></li>--%>
            <%--                    <li class="breadcrumb-item"><a href="javascript:void(0)">Bootstrap</a></li>--%>
            <%--                </ol>--%>
            <%--            </div>--%>
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="btn blue" id="query_button" name="query_button">查询</button>
                    <button type="button" class="btn blue" id="export_button" name="export_button">导出订单</button>
                    <button type="button" class="btn blue" id="print_word" name="print_word">打印订单</button>
                    <button type="button" class="btn blue" id="order_statistic" name="order_statistic">统计</button>
                    <button type="button" class="btn blue" id="order_add" name="order_add">添加</button>

                    <%--                    <button type="button" class="btn blue" id="device_statistic" name="device_statistic">统计表</button>--%>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="portlet-body form" id="record_query_setup" name="record_query_setup">
                        <form class="form-horizontal" role="form">
                            <div class="form-body">
                                <div class="form-group">
                                    <label class="col-md-3 control-label">订单编号</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="输入待查找订单编号" id="order_id"
                                               name="order_id">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">商品名称</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" placeholder="输入待查找商品名称"
                                               id="specialty_name" name="specialty_name">
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-md-6">
                    <button type="button" class="btn blue" id="order_list_all_button" name="order_list_all_button">
                        全部订单
                    </button>
                    <button type="button" class="btn blue" id="order_list_finished_button"
                            name="order_list_finished_button">已完成订单
                    </button>
                    <button type="button" class="btn blue" id="order_list_unfinished_button"
                            name="order_list_unfinished_button">待支付订单
                    </button>
                    <button type="button" class="btn blue" id="order_list_up_button" name="order_list_up_button">
                        订单单价升序
                    </button>
                    <button type="button" class="btn blue" id="order_list_down_button" name="order_list_down_button">
                        订单单价降序
                    </button>

                </div>
            </div>

            <div class="row" id="all_order_tab">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">订单信息</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll"
                                                       required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong>订单编号</strong></th>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>商品数量</strong></th>
                                        <th><strong>商品总价</strong></th>
                                        <th><strong>订单状态</strong></th>
                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="order_table_content_div" name="order_table_content_div">
                                    <tr>
                                        <td>
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="customCheckBox2"
                                                       required="">
                                                <label class="form-check-label" for="customCheckBox2"></label>
                                            </div>
                                        </td>
                                        <td><strong>542</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center"><img src="images/avatar/1.jpg"
                                                                                        class="rounded-lg me-2"
                                                                                        width="24" alt=""/> <span
                                                    class="w-space-no">Dr. Jackson</span></div>
                                        </td>
                                        <td>example@example.com</td>
                                        <td>01 August 2020</td>
                                        <td>
                                            <div class="d-flex align-items-center"><i
                                                    class="fa fa-circle text-success me-1"></i> Successful
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i
                                                        class="fas fa-pencil-alt"></i></a>
                                                <a href="#" class="btn btn-danger shadow btn-xs sharp"><i
                                                        class="fa fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row display-none" style="display:none" id="finished_order_tab">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">订单信息</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll_2"
                                                       required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong>订单编号</strong></th>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>商品数量</strong></th>
                                        <th><strong>商品总价</strong></th>
                                        <th><strong>订单状态</strong></th>
                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="order_table_content_finished_div"
                                           name="order_table_content_finished_div">
                                    <tr>
                                        <td>
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="customCheckBox2_2"
                                                       required="">
                                                <label class="form-check-label" for="customCheckBox2"></label>
                                            </div>
                                        </td>
                                        <td><strong>542</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center"><img src="images/avatar/1.jpg"
                                                                                        class="rounded-lg me-2"
                                                                                        width="24" alt=""/> <span
                                                    class="w-space-no">Dr. Jackson</span></div>
                                        </td>
                                        <td>example@example.com</td>
                                        <td>01 August 2020</td>
                                        <td>
                                            <div class="d-flex align-items-center"><i
                                                    class="fa fa-circle text-success me-1"></i> Successful
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i
                                                        class="fas fa-pencil-alt"></i></a>
                                                <a href="#" class="btn btn-danger shadow btn-xs sharp"><i
                                                        class="fa fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row display-none" style="display:none" id="unfinished_order_tab">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">订单信息</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll_3"
                                                       required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong>订单编号</strong></th>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>商品数量</strong></th>
                                        <th><strong>商品总价</strong></th>
                                        <th><strong>订单状态</strong></th>
                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="order_table_content_unfinished_div"
                                           name="order_table_content_unfinished_div">
                                    <tr>
                                        <td>
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="customCheckBox2_3"
                                                       required="">
                                                <label class="form-check-label" for="customCheckBox2"></label>
                                            </div>
                                        </td>
                                        <td><strong>542</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center"><img src="images/avatar/1.jpg"
                                                                                        class="rounded-lg me-2"
                                                                                        width="24" alt=""/> <span
                                                    class="w-space-no">Dr. Jackson</span></div>
                                        </td>
                                        <td>example@example.com</td>
                                        <td>01 August 2020</td>
                                        <td>
                                            <div class="d-flex align-items-center"><i
                                                    class="fa fa-circle text-success me-1"></i> Successful
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i
                                                        class="fas fa-pencil-alt"></i></a>
                                                <a href="#" class="btn btn-danger shadow btn-xs sharp"><i
                                                        class="fa fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row display-none" style="display:none" id="up_order_tab">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">订单信息</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll_4"
                                                       required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong>订单编号</strong></th>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>商品数量</strong></th>
                                        <th><strong>商品总价</strong></th>
                                        <th><strong>订单状态</strong></th>
                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="order_table_content_up_div" name="order_table_content_up_div">
                                    <tr>
                                        <td>
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="customCheckBox2_4"
                                                       required="">
                                                <label class="form-check-label" for="customCheckBox2"></label>
                                            </div>
                                        </td>
                                        <td><strong>542</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center"><img src="images/avatar/1.jpg"
                                                                                        class="rounded-lg me-2"
                                                                                        width="24" alt=""/> <span
                                                    class="w-space-no">Dr. Jackson</span></div>
                                        </td>
                                        <td>example@example.com</td>
                                        <td>01 August 2020</td>
                                        <td>
                                            <div class="d-flex align-items-center"><i
                                                    class="fa fa-circle text-success me-1"></i> Successful
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i
                                                        class="fas fa-pencil-alt"></i></a>
                                                <a href="#" class="btn btn-danger shadow btn-xs sharp"><i
                                                        class="fa fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row display-none" style="display:none" id="down_order_tab">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">订单信息</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll_5"
                                                       required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong>订单编号</strong></th>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>商品数量</strong></th>
                                        <th><strong>商品总价</strong></th>
                                        <th><strong>订单状态</strong></th>
                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="order_table_content_down_div" name="order_table_content_up_div">
                                    <tr>
                                        <td>
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="customCheckBox2_5"
                                                       required="">
                                                <label class="form-check-label" for="customCheckBox2"></label>
                                            </div>
                                        </td>
                                        <td><strong>542</strong></td>
                                        <td>
                                            <div class="d-flex align-items-center"><img src="images/avatar/1.jpg"
                                                                                        class="rounded-lg me-2"
                                                                                        width="24" alt=""/> <span
                                                    class="w-space-no">Dr. Jackson</span></div>
                                        </td>
                                        <td>example@example.com</td>
                                        <td>01 August 2020</td>
                                        <td>
                                            <div class="d-flex align-items-center"><i
                                                    class="fa fa-circle text-success me-1"></i> Successful
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i
                                                        class="fas fa-pencil-alt"></i></a>
                                                <a href="#" class="btn btn-danger shadow btn-xs sharp"><i
                                                        class="fa fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row display-none" style ="display:none" id="up_order_tab">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">订单信息</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll_4" required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong>订单编号</strong></th>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>商品数量</strong></th>
                                        <th><strong>商品总价</strong></th>
                                        <th><strong>订单状态</strong></th>
                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="order_table_content_up_div" name="order_table_content_up_div">
                                    <tr>
                                        <td>
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="customCheckBox2_4" required="">
                                                <label class="form-check-label" for="customCheckBox2"></label>
                                            </div>
                                        </td>
                                        <td><strong>542</strong></td>
                                        <td><div class="d-flex align-items-center"><img src="images/avatar/1.jpg" class="rounded-lg me-2" width="24" alt=""/> <span class="w-space-no">Dr. Jackson</span></div></td>
                                        <td>example@example.com	</td>
                                        <td>01 August 2020</td>
                                        <td><div class="d-flex align-items-center"><i class="fa fa-circle text-success me-1"></i> Successful</div></td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i class="fas fa-pencil-alt"></i></a>
                                                <a href="#" class="btn btn-danger shadow btn-xs sharp"><i class="fa fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row display-none" style ="display:none" id="down_order_tab">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">订单信息</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th style="width:50px;">
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="checkAll_5" required="">
                                                <label class="form-check-label" for="checkAll"></label>
                                            </div>
                                        </th>
                                        <th><strong>订单编号</strong></th>
                                        <th><strong>商品名称</strong></th>
                                        <th><strong>商品数量</strong></th>
                                        <th><strong>商品总价</strong></th>
                                        <th><strong>订单状态</strong></th>
                                        <th><strong></strong></th>
                                    </tr>
                                    </thead>
                                    <tbody id="order_table_content_down_div" name="order_table_content_up_div">
                                    <tr>
                                        <td>
                                            <div class="form-check custom-checkbox checkbox-success check-lg me-3">
                                                <input type="checkbox" class="form-check-input" id="customCheckBox2_5" required="">
                                                <label class="form-check-label" for="customCheckBox2"></label>
                                            </div>
                                        </td>
                                        <td><strong>542</strong></td>
                                        <td><div class="d-flex align-items-center"><img src="images/avatar/1.jpg" class="rounded-lg me-2" width="24" alt=""/> <span class="w-space-no">Dr. Jackson</span></div></td>
                                        <td>example@example.com	</td>
                                        <td>01 August 2020</td>
                                        <td><div class="d-flex align-items-center"><i class="fa fa-circle text-success me-1"></i> Successful</div></td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="#" class="btn btn-primary shadow btn-xs sharp me-1"><i class="fas fa-pencil-alt"></i></a>
                                                <a href="#" class="btn btn-danger shadow btn-xs sharp"><i class="fa fa-trash"></i></a>
                                            </div>
                                        </td>
                                    </tr>
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
    <%@ include file="../../frame/frame_footer.jsp" %>
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
<%@ include file="order_modify_buyer_div.jsp" %>
<%@ include file="../../frame/frame_javascript.jsp" %>
<%@ include file="order_download_div.jsp" %>
<%@ include file="order_comment.jsp" %>

<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
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
<script src="../../assets/vendor/global/global.min.js"></script>
<script src="../../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../../assets/js/custom.min.js"></script>
<script src="../../assets/js/dlabnav-init.js"></script>
<script src="../../assets/js/demo.js"></script>
<script src="../../assets/js/styleSwitcher.js"></script>
<script src="../../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../../assets/js/plugins-init/sweetalert.init.js"></script>
<script src="../../assets/js/order/specialty_order.js"></script>

</body>
</html>

