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

</head>

<body>

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
    <%@ include file="/frame/frame_menu.jsp" %>
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
                                    <img src="<%=user.avatarURL%>" class="img-fluid rounded-circle"
                                         alt="">
                                </div>
                                <div class="profile-details">
                                    <div class="profile-name px-3 pt-2">
                                        <h4 class="text-primary mb-0">
                                            <%=user.id%>
                                        </h4>
                                        <p>Username</p>
                                    </div>
                                    <div class="profile-email px-2 pt-2">
                                        <h4 class="text-muted mb-0">
                                            <%=user.email%>
                                        </h4>
                                        <p>Email</p>
                                    </div>
                                    <div class="ms-auto">
                                        <button type="button" class="btn btn-rounded btn-primary"
                                                onclick="window.location.href='./goods_list.jsp'">
                                            <span class="btn-icon-start text-primary">
                                                <i class="fa fa-eye color-info"></i>
                                            </span>
                                            我的商品
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
                                                <div class="basic-form">
                                                    <form action="" enctype="multipart/form-data" id="homestay_form"
                                                          name="homestay_form" method="post">
                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label-lg">民宿名称</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control border-light"
                                                                       id="homestay_name"
                                                                       name="homestay_name">
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label-lg">民宿地址</label>
                                                            <div class="col-sm-9">
                                                                <input type="text"
                                                                       class="form-control border-light"
                                                                       placeholder="点击选择民宿地址"
                                                                       id="homestay_location"
                                                                       name="homestay_location">
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label-lg">民宿地址经纬度</label>
                                                            <div class="col-sm-9">
                                                                <input type="text"
                                                                       class="form-control border-light disabled"
                                                                       readonly="readonly"
                                                                       id="homestay_lnglat"
                                                                       name="homestay_lnglat">
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row clearfix">
                                                            <div class="mb-3 col-md-12">
                                                                <label class="col-form-label-lg">民宿图片</label>
                                                                <div class="col-sm-12">
                                                                    <input type="file" class="form-control"
                                                                           accept="image/*"
                                                                           id="homestay_image"
                                                                           name="homestay_image">
                                                                    <label for="homestay_image"
                                                                           id="homestay_image_preview">
                                                                        <i class="fa fa-plus"></i>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row clearfix">
                                                            <div class="col-sm-10">
                                                                <button type="button" class="btn btn-primary"
                                                                        id="add_homestay_button"
                                                                        name="add_homestay_button">
                                                                    发布新民宿
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="specialty-post" class="tab-pane fade">
                                            <div class="my-post-content pt-3">
                                                <div class="basic-form">
                                                    <form action="" enctype="multipart/form-data" id="specialty_form"
                                                          name="specialty_form" method="post">
                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label-lg">商品名称</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control border-light"
                                                                       id="specialty_name"
                                                                       name="specialty_name">
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label-lg">价格</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control border-light"
                                                                       id="specialty_price"
                                                                       name="specialty_price">
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label-lg">数量</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control border-light"
                                                                       id="specialty_num"
                                                                       name="specialty_num">
                                                            </div>
                                                        </div>
                                                        <!--                                                        <div class="mb-3 row">-->
                                                        <!--                                                            <label class="col-sm-3 col-form-label-lg">商品描述</label>-->
                                                        <!--                                                            <div class="col-sm-9">-->
                                                        <!--                                                                <textarea class="form-control" rows="4"-->
                                                        <!--                                                                          id="specialty_description"-->
                                                        <!--                                                                          name="specialty_description">-->
                                                        <!--                                                                </textarea>-->
                                                        <!--                                                            </div>-->
                                                        <!--                                                        </div>-->
                                                        <div class="mb-3 row clearfix">
                                                            <div class="mb-3 col-md-12">
                                                                <label class="col-form-label-lg">商品图片</label>
                                                                <div class="col-sm-12">
                                                                    <input type="file" class="form-control"
                                                                           accept="image/*"
                                                                           id="specialty_image"
                                                                           name="specialty_image">
                                                                    <label for="specialty_image"
                                                                           id="specialty_image_preview">
                                                                        <i class="fa fa-plus"></i>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3 row clearfix">
                                                            <div class="col-sm-10">
                                                                <button type="button" class="btn btn-primary"
                                                                        id="add_specialty_button"
                                                                        name="add_specialty_button">
                                                                    上架新商品
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </form>
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
<%@ include file="modals/location_modal.jsp" %>
<%@ include file="modals/warning_modal.jsp" %>
<!--**********************************
    Main wrapper end
***********************************-->

<!--removeIf(production)-->

<!--**********************************
    Scripts
***********************************-->
<%@ include file="../frame/frame_javascript.jsp" %>
<!-- Required vendors -->
<script src="../assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="../assets/vendor/lightgallery/js/lightgallery-all.min.js"></script>
<script src="../assets/js/goods/goods_page.js"></script>
<%-- 地图API --%>
<%--<script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=vHACkq2zCcvmYIGWtlw8dYbwYHbQj458"></script>--%>
<script type="text/javascript">
    window._AMapSecurityConfig = {
        securityJsCode: 'd71806b25af8ceba503a3b358b33694b',
    }
</script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript"
        src="https://webapi.amap.com/maps?v=1.4.15&key=89fd825427ce3fbf3dc999e544b50f99&plugin=AMap.Geocoder"></script>
<script src="../assets/js/goods/location.js"></script>

</body>
</html>