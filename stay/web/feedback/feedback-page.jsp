<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2023/12/10
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<input type="hidden" id="page_id" name="page_id" value="feedback_list"/>
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
    <title>用户反馈模块</title>

    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="../assets/image/png" href="../assets/images/favicon.png"/>
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

</head>

<body>

<%--  preloader start  --%>
<%@include file="../frame/frame_preloader.jsp" %>
<%--  preloader end  --%>


<!--**********************************
    Main wrapper start
***********************************-->
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
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">反馈清单</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">历史</a></li>
                </ol>
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-xl-6 col-xxl-12">
                    <div class="card">
                        <div class="card-header d-block">
                            <button type="button" class="btn btn-primary"id="add_button" name="add_button">我要反馈</button>
                            <button type="button" class="btn btn-rounded btn-success"id="print_word_button"
                                    name="print_word_button"><span
                                    class="btn-icon-start text-success"><i class="fa fa-upload color-success"></i>
                                    </span>打印反馈记录</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">用户反馈表</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th><strong>反馈ID</strong></th>
                                        <th><strong>用户ID</strong></th>
                                        <th><strong>反馈内容</strong></th>
                                        <th><strong>回复反馈</strong></th>
                                        <th><strong>反馈时间</strong></th>
                                        <th><strong>操作</strong></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody id="feedback_table_content_div" name="feedback_table_content_div">

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


    <%--  footer start  --%>
    <%@include file="../frame/frame_footer.jsp" %>
    <%--  footer end  --%>


</div>
<!--**********************************
    Main wrapper end
***********************************-->

<!--**********************************
    Scripts
***********************************-->
<%@include file="../frame/frame_javascript.jsp" %>
<!-- Required vendors -->
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>
<script src="../assets/js/dashboard/add_feedback.js"></script>
</body>
<%@ include file="./feedback_add_div.jsp" %>
<%@include file="./feedack_print_word.jsp"%>
</html>
