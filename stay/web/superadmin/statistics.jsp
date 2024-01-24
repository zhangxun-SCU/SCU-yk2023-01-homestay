<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <!-- PAGE TITLE HERE -->
    <title>Invome Admin Dashboard</title>

    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="image/png" href="images/favicon.png" />
    <link rel="stylesheet" href="./vendor/chartist/css/chartist.min.css">
    <link href="./vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">

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
<%@include file="../frame/frame_menu.jsp"%>

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
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">Charts</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Chartist</a></li>
                </ol>
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">用户权限分布表</h4>
                                </div>
                                <div class="card-body">
                                    <div id="pie-chart" class="ct-chart ct-golden-section chartlist-chart"></div>
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
<%@include file="../frame/frame_footer.jsp" %>

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
<%@include file="../frame/frame_javascript.jsp" %>
<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./vendor/chart.js/Chart.bundle.min.js"></script>
<!-- Apex Chart -->
<script src="./vendor/apexchart/apexchart.js"></script>

<!-- Chart Chartist plugin files -->
<script src="./vendor/chartist/js/chartist.min.js"></script>
<script src="./js/chatinit.js"></script>
<script src="./vendor/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>
<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>

<script src="./js/custom.min.js"></script>
<script src="./js/dlabnav-init.js"></script>
<script src="./js/demo.js"></script>
<script src="./js/styleSwitcher.js"></script>
<script>

</script>
</body>
</html>