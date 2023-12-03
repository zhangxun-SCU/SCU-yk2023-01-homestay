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
                                            <a href="#houses-post" data-bs-toggle="tab"
                                               class="nav-link">民宿</a>
                                        </li>
                                        <li class="nav-item">
                                            <a href="#specialty-post" data-bs-toggle="tab"
                                               class="nav-link active show">特产</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="houses-post" class="tab-pane fade">
                                            <div class="my-post-content pt-3">
                                                <div class="post-input">
                                                    <textarea name="textarea" id="houses_descrip" cols="30" rows="5"
                                                              class="form-control bg-transparent"
                                                              placeholder="Please type what you want...."></textarea>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-primary light me-1 px-3" data-bs-toggle="modal"
                                                       data-bs-target="#linkModal"><i class="fa fa-link m-0"></i> </a>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="linkModal">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title">Social Links</h5>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal">
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <a class="btn-social facebook"
                                                                       href="javascript:void(0)"><i
                                                                            class="fa fa-facebook"></i></a>
                                                                    <a class="btn-social google-plus"
                                                                       href="javascript:void(0)"><i
                                                                            class="fa fa-google-plus"></i></a>
                                                                    <a class="btn-social linkedin"
                                                                       href="javascript:void(0)"><i
                                                                            class="fa fa-linkedin"></i></a>
                                                                    <a class="btn-social instagram"
                                                                       href="javascript:void(0)"><i
                                                                            class="fa fa-instagram"></i></a>
                                                                    <a class="btn-social twitter"
                                                                       href="javascript:void(0)"><i
                                                                            class="fa fa-twitter"></i></a>
                                                                    <a class="btn-social youtube"
                                                                       href="javascript:void(0)"><i
                                                                            class="fa fa-youtube"></i></a>
                                                                    <a class="btn-social whatsapp"
                                                                       href="javascript:void(0)"><i
                                                                            class="fa fa-whatsapp"></i></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="javascript:void(0);"
                                                       class="btn btn-primary light me-1 px-3" data-bs-toggle="modal"
                                                       data-bs-target="#cameraModal"><i class="fa fa-camera m-0"></i>
                                                    </a>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="cameraModal">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title">Upload images</h5>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal">
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <div class="input-group mb-3">
                                                                        <span class="input-group-text">Upload</span>
                                                                        <div class="form-file">
                                                                            <input type="file"
                                                                                   class="form-file-input form-control">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href="javascript:void(0);" class="btn btn-primary"
                                                       data-bs-toggle="modal" data-bs-target="#postModal">Post</a>
                                                    <!-- Modal -->
                                                    <div class="modal fade" id="postModal">
                                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title">Post</h5>
                                                                    <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal">
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <textarea name="textarea" id="textarea2" cols="30"
                                                                              rows="5"
                                                                              class="form-control bg-transparent"
                                                                              placeholder="Please type what you want...."></textarea>
                                                                    <a class="btn btn-primary btn-rounded"
                                                                       href="javascript:void(0)">Post</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="profile-uoloaded-post border-bottom-1 pb-5">
                                                    <img src="../assets/images/profile/8.jpg" alt=""
                                                         class="img-fluid w-100 rounded">
                                                    <a class="post-title" href="post-details.html"><h3
                                                            class="text-black">Collection of textile samples lay
                                                        spread</h3></a>
                                                    <p>A wonderful serenity has take possession of my entire soul like
                                                        these sweet morning of spare which enjoy whole heart.A wonderful
                                                        serenity has take possession of my entire soul like these sweet
                                                        morning
                                                        of spare which enjoy whole heart.</p>
                                                    <button class="btn btn-primary me-2"><span class="me-2"><i
                                                            class="fa fa-heart"></i></span>Like
                                                    </button>
                                                    <button class="btn btn-secondary" data-bs-toggle="modal"
                                                            data-bs-target="#replyModal"><span class="me-2"><i
                                                            class="fa fa-reply"></i></span>Reply
                                                    </button>
                                                </div>
                                                <div class="profile-uoloaded-post border-bottom-1 pb-5">
                                                    <img src="../assets/images/profile/9.jpg" alt=""
                                                         class="img-fluid w-100 rounded">
                                                    <a class="post-title" href="post-details.html"><h3
                                                            class="text-black">Collection of textile samples lay
                                                        spread</h3></a>
                                                    <p>A wonderful serenity has take possession of my entire soul like
                                                        these sweet morning of spare which enjoy whole heart.A wonderful
                                                        serenity has take possession of my entire soul like these sweet
                                                        morning
                                                        of spare which enjoy whole heart.</p>
                                                    <button class="btn btn-primary me-2"><span class="me-2"><i
                                                            class="fa fa-heart"></i></span>Like
                                                    </button>
                                                    <button class="btn btn-secondary" data-bs-toggle="modal"
                                                            data-bs-target="#replyModal"><span class="me-2"><i
                                                            class="fa fa-reply"></i></span>Reply
                                                    </button>
                                                </div>
                                                <div class="profile-uoloaded-post pb-3">
                                                    <img src="../assets/images/profile/8.jpg" alt=""
                                                         class="img-fluid w-100 rounded">
                                                    <a class="post-title" href="post-details.html"><h3
                                                            class="text-black">Collection of textile samples lay
                                                        spread</h3></a>
                                                    <p>A wonderful serenity has take possession of my entire soul like
                                                        these sweet morning of spare which enjoy whole heart.A wonderful
                                                        serenity has take possession of my entire soul like these sweet
                                                        morning
                                                        of spare which enjoy whole heart.</p>
                                                    <button class="btn btn-primary me-2"><span class="me-2"><i
                                                            class="fa fa-heart"></i></span>Like
                                                    </button>
                                                    <button class="btn btn-secondary" data-bs-toggle="modal"
                                                            data-bs-target="#replyModal"><span class="me-2"><i
                                                            class="fa fa-reply"></i></span>Reply
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="specialty-post" class="tab-pane fade active show">
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
<%@ include file="modals/delete_modal.jsp" %>
<%@ include file="modals/modify_modal.jsp" %>
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
<script src="../assets/js/goods/goods_list.js"></script>


</body>
</html>
