<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/1
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="shortcut icon" type="image/png" href="../assets/images/favicon.png"/>
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="../assets/vendor/lightgallery/css/lightgallery.min.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/goods/goods_page.css">

    <!--    &lt;!&ndash; dropify &ndash;&gt;-->
    <!--&lt;!&ndash;    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css"/>&ndash;&gt;-->
    <!--    <link rel="stylesheet" href="../assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.css"/>-->
    <!--    <link rel="stylesheet" href="../assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css"/>-->
    <!--    <link rel="stylesheet" href="../assets/plugins/multi-select/css/multi-select.css">-->
    <!--    <link rel="stylesheet" href="../assets/plugins/dropify/css/dropify.min.css">-->

</head>

<body onload="onLoadFunction();">

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
    <%@ include file="/frame/frame_topmenu.jsp" %>
    <!--**********************************
        Header end ti-comment-alt
    ***********************************-->

    <!--**********************************
        Sidebar start
    ***********************************-->
    <%@ include file="/frame/frame_slider.jsp" %>
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
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">App</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Profile</a></li>
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
                                    <img src="../assets/images/profile/profile.png" class="img-fluid rounded-circle"
                                         alt="">
                                </div>
                                <div class="profile-details">
                                    <div class="profile-name px-3 pt-2">
                                        <h4 class="text-primary mb-0">Mitchell C. Shay</h4>
                                        <p>UX / UI Designer</p>
                                    </div>
                                    <div class="profile-email px-2 pt-2">
                                        <h4 class="text-muted mb-0">info@example.com</h4>
                                        <p>Email</p>
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
                                            <a href="#homestays-post" data-bs-toggle="tab"
                                               class="nav-link active show">民宿</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#specialty-post" data-bs-toggle="tab"
                                               class="nav-link">特产</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="homestays-post" class="tab-pane fade active show">
                                            <div class="my-post-content pt-3">
                                            </div>
                                            <div id="homestay_list">
                                                <div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">
                                                    <div class="user-bx-2 me-3 mb-3">
                                                        <img src="/upload/house_image/GH1701779773111.png"
                                                             class="rounded" alt="">
                                                        <div>
                                                            <h3 class="fs-20 font-w700">民宿名称</h3>
                                                            <span class="font-w400">民宿地址</span>
                                                        </div>
                                                    </div>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div class="me-3 mb-3">
                                                            <button type="button"
                                                                    class="btn light btn-primary detail_button">
                                                                查看民宿内房间
                                                            </button>
                                                        </div>
                                                        <div class="me-3 mb-3">
                                                            <button type="button"
                                                                    class="btn light btn-primary modify_homestay_button">
                                                                修改民宿信息
                                                            </button>
                                                        </div>
                                                        <div class="me-3 mb-3">
                                                            <button type="button"
                                                                    class="btn btn-sm btn-outline-danger delete_homestay_button">
                                                                下架民宿
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="specialty-post" class="tab-pane fade">
                                            <div class="my-post-content pt-3">
                                            </div>
                                            <div class="row" id="specialty_list">
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
<!-- Required vendors -->
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="../assets/vendor/lightgallery/js/lightgallery-all.min.js"></script>
<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>
<script type="text/javascript">
    window._AMapSecurityConfig = {
        securityJsCode: 'd71806b25af8ceba503a3b358b33694b',
    }
</script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript"
        src="https://webapi.amap.com/maps?v=1.4.15&key=89fd825427ce3fbf3dc999e544b50f99&plugin=AMap.Geocoder"></script>
<script type="text/javascript">
    var map = new AMap.Map("map_container", {
        resizeEnable: true
    });

    var geocoder = new AMap.Geocoder({
        city: "全国", //城市设为北京，默认：“全国”
    });

    var marker = new AMap.Marker();

    function geoCode() {
        var address = document.getElementById('modify_location').value;
        geocoder.getLocation(address, function (status, result) {
            console.log(address);
            if (status === 'complete' && result.geocodes.length) {
                var lnglat = result.geocodes[0].location;
                marker.setPosition(lnglat);
                map.add(marker);
                map.setFitView(marker);
                $("#modify_lnglat").val(lnglat);
            } else {
                console.log('根据地址查询位置失败');
            }
        });
    }

    document.getElementById("geo").onclick = geoCode;
    document.getElementById('modify_location').onkeydown = function (e) {
        if (e.keyCode === 13) {
            geoCode();
            return false;
        }
        return true;
    };
</script>
<script src="../assets/js/goods/goods_list.js"></script>
<script>
    function getUserInfo() {
        const token = getCookie("token")
        return JSON.parse(window.atob(token.split('.')[1]))
    }
</script>

</body>
</html>
