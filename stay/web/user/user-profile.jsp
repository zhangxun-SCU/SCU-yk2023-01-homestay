<%@ page import="homestay.dao.Data" %>
<%@ page import="homestay.entity.User" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="homestay.utils.Config" %><%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/1
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="../frame/frame_style.jsp" %>
    <link href="./../assets/vendor/lightgallery/css/lightgallery.min.css" rel="stylesheet">
    <link href="./../assets/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
    <style>
        #upload_avatar:hover {

        }
    </style>
</head>
<body>

<%--  preloader start  --%>
<%@include file="../frame/frame_preloader.jsp" %>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  top-menu start  --%>
        <%@include file="../frame/frame_menu.jsp"%>
    <%--  slider end  --%>
        <%
            // 判断是否是自己
            Data data = Data.getPageParameters(request, response);
            String visitedId = data.getParam().getString("id");
            boolean isSelf = visitedId.equals(userId);
        %>
        <%
            // 获取访问人信息
            User visited = userDao.queryUserByKey("user_id", visitedId);
            BigDecimal balance = userDao.getUserBalance(userId);
        %>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">ScuStay</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)"><%=visited.id%> 简介</a></li>
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
<%--                            profile--%>
                            <div class="profile-info">
                                <div class="profile-photo">
                                    <img src="<%=visited.avatarURL%>" class="img-fluid rounded-circle" id="profile_avatar" alt="profile_avatar">
                                </div>
                                <div class="profile-details">
                                    <div class="profile-name px-3 pt-2">
                                        <h4 class="text-primary mb-0"><%=visited.id%></h4>
                                        <p>free</p>
                                    </div>
                                    <div class="profile-email px-2 pt-2">
                                        <h4 class="text-muted mb-0"><%=visited.email%></h4>
                                        <p>Email</p>
                                    </div>
                                    <div class="dropdown ms-auto">
                                        <a href="#" class="btn btn-primary light sharp" data-bs-toggle="dropdown"
                                           aria-expanded="true">
                                            <svg xmlns="http://www.w3.org/2000/svg"
                                                 xmlns:xlink="http://www.w3.org/1999/xlink" width="18px" height="18px"
                                                 viewBox="0 0 24 24" version="1.1">
                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                    <rect x="0" y="0" width="24" height="24"></rect>
                                                    <circle fill="#000000" cx="5" cy="12" r="2"></circle>
                                                    <circle fill="#000000" cx="12" cy="12" r="2"></circle>
                                                    <circle fill="#000000" cx="19" cy="12" r="2"></circle>
                                                </g>
                                            </svg>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-end">
                                            <li class="dropdown-item"><i
                                                    class="fa fa-user-circle text-primary me-2"></i> View profile
                                            </li>
                                            <li class="dropdown-item"><i class="fa fa-users text-primary me-2"></i> Add
                                                to btn-close friends
                                            </li>
                                            <li class="dropdown-item"><i class="fa fa-plus text-primary me-2"></i> Add
                                                to group
                                            </li>
                                            <li class="dropdown-item"><i class="fa fa-ban text-primary me-2"></i> Block
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-4">
                    <div class="row">
                        <div class="col-xl-12">
                            <%if (isSelf) {%>
                            <div class="card">
                                <div class="card-body">
                                    <div class="profile-statistics">

                                        <div class="text-center">
                                            <div class="row">
                                                <div class="col">
                                                    <h3 class="m-b-0"><%=balance%></h3><span>钱包余额</span>
                                                </div>
                                            </div>
                                            <div class="mt-4 justify-content-around" style="display: flex">
                                                <a href="javascript:void(0);"
                                                   class="btn btn-primary mb-1 w-25"
                                                   data-bs-toggle="modal" data-bs-target="#rechargeModal">充值</a>
                                                <a href="javascript:void(0);" class="btn btn-primary mb-1 w-25"
                                                   data-bs-toggle="modal" data-bs-target="#payoutsModal">
                                                    提现</a>
                                            </div>
                                        </div>

                                        <!-- Modal -->
                                        <div class="modal fade" id="payoutsModal">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Send Message</h5>
                                                        <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form class="comment-form">
                                                            <div class="row">
                                                                <div class="text-center">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <h3 class="m-b-0"><%=balance%></h3><span>钱包余额</span>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-4">
                                                                    <div class="mb-3 mb-0">
                                                                        <input value="确认"
                                                                               class="btn btn-primary"
                                                                               name="submit" id="payoutsSubmit">
                                                                    </div>
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
                            <%}%>
                        </div>
                        <div class="col-xl-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="profile-blog">
                                        <h5 class="text-primary d-inline">Today Highlights</h5>
                                        <img src="./../assets/images/profile/1.jpg" alt="" class="img-fluid mt-4 mb-4 w-100">
                                        <h4><a href="#" class="text-black">Darwin Creative Agency
                                            Theme</a></h4>
                                        <p class="mb-0">A small river named Duden flows by their place and supplies it
                                            with the necessary regelialia. It is a paradisematic country, in which
                                            roasted parts of sentences fly into your mouth.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <div class="card">
                        <div class="card-body">
                            <div class="profile-tab">
                                <div class="custom-tab-1">
                                    <ul class="nav nav-tabs">
<%--                                        <li class="nav-item"><a href="#my-posts" data-bs-toggle="tab"--%>
<%--                                                                class="nav-link ">Posts</a>--%>
<%--                                        </li>--%>
                                        <%if (!isSelf) {%>
                                        <li class="nav-item"><a href="#about-me" data-bs-toggle="tab" class="nav-link active show">About
                                            He</a>
                                        </li>
                                        <%}%>
                                        <%if (isSelf) {%>
                                        <li class="nav-item"><a href="#about-me" data-bs-toggle="tab" class="nav-link active show">About
                                            Me</a>
                                        </li>
                                        <li class="nav-item"><a href="#profile-settings" data-bs-toggle="tab"
                                                                class="nav-link">Setting</a>
                                        </li>
                                        <%}%>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="my-posts" class="tab-pane fade ">
                                            <div class="my-post-content pt-3">
                                                <div class="post-input">
                                                    <textarea name="textarea" id="textarea" cols="30" rows="5"
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
                                                </div>
                                                <div class="profile-uoloaded-post border-bottom-1 pb-5">
                                                    <img src="images/profile/8.jpg" alt=""
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
                                                    <img src="images/profile/9.jpg" alt=""
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
                                                    <img src="images/profile/8.jpg" alt=""
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
                                        <div id="about-me" class="tab-pane fade active show">
                                            <div class="profile-personal-info">
                                                <h4 class="text-primary mb-4">个人信息</h4>
                                                <div class="row mb-2">
                                                    <div class="col-sm-3 col-5">
                                                        <h5 class="f-w-500">ID <span class="pull-end">:</span>
                                                        </h5>
                                                    </div>
                                                    <div class="col-sm-9 col-7"><span><%=user.id%></span>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-sm-3 col-5">
                                                        <h5 class="f-w-500">用户类型 <span class="pull-end">:</span>
                                                        </h5>
                                                    </div>
                                                    <div class="col-sm-9 col-7"><span><%=userType%></span>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-sm-3 col-5">
                                                        <h5 class="f-w-500">邮箱 <span class="pull-end">:</span>
                                                        </h5>
                                                    </div>
                                                    <div class="col-sm-9 col-7"><span><%=user.email%></span>
                                                    </div>
                                                </div>
                                                <div class="row mb-2">
                                                    <div class="col-sm-3 col-5">
                                                        <h5 class="f-w-500">Year Experience <span
                                                                class="pull-end">:</span></h5>
                                                    </div>
                                                    <div class="col-sm-9 col-7"><span>07 Year Experiences</span>
                                                    </div>
                                                </div>
                                                <button class="btn btn-primary" id="export_btn" type="button">导出个人信息</button>
                                                <a href="" id="export_url" style="display: none;"></a>
                                            </div>
                                        </div>

                                        <div class="modal fade" id="rechargeModal">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">输入充值金额</h5>
                                                        <button type="button" class="btn-close"
                                                                data-bs-dismiss="modal">
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="basic-form">
                                                            <form>
                                                                <div class="mb-3">
                                                                    <input class="form-control" type="text" placeholder="输入充值金额(￥)" id="rechargeInput">
                                                                </div>
                                                            </form>
                                                        </div>
                                                        <a class="btn btn-primary btn-rounded" data-bs-dismiss="modal"
                                                           href="javascript:void(0)" id="rechargeSubmit">确认充值</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <%if(isSelf){%>
                                        <div id="profile-settings" class="tab-pane fade">
                                            <div class="pt-3">
                                                <div class="settings-form">
                                                    <h4 class="text-primary">Account Setting</h4>
                                                    <form>
                                                        <div class="row justify-content-around" style="display: flex;">
                                                            <label for="upload_avatar_btn">
                                                                <input type="file" id="upload_avatar_btn" style="display: none">
                                                            </label>
                                                            <img src="<%=visited.avatarURL%>"
                                                                 class="img-fluid rounded-circle w-25"
                                                                 id="upload_avatar"
                                                                 style="right: 25%; cursor: pointer;"
                                                                 alt="上传头像">
                                                        </div>
                                                        <div class="row">
                                                            <div class="mb-3 col-md-12">
                                                                <label class="form-label">邮箱</label>
                                                                <input type="email" placeholder="<%=visited.email%>" class="form-control" id="set-email">
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="mb-3 col-md-12">
                                                                <label class="form-label">密码</label>
                                                                <input type="password" class="form-control" id="set-password">
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="mb-3 col-md-9">
                                                                <label class="form-label">验证码</label>
                                                                <input type="text" class="form-control" id="verify_code">
                                                            </div>
                                                            <div class="mb-3 col-md-3 flex-column justify-content-around" style="display: flex;" >
                                                                <button class="btn btn-primary disabled" id="verify_btn" type="button" >发送验证码</button>
                                                            </div>
                                                        </div>
                                                        <div class="mb-3">
                                                            <div class="form-check custom-checkbox">
                                                                <input type="checkbox" value="logout" class="form-check-input" id="gridCheck">
                                                                <label class="form-check-label form-label" for="gridCheck"> Check me out</label>
                                                            </div>
                                                        </div>
                                                        <button class="btn btn-primary disabled" id="submit_btn" type="button" >确定</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>

                                    </div>
                                </div>
                                <!-- Modal -->
                                <div class="modal fade" id="replyModal">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Post Reply</h5>
                                                <button type="button" class="btn-close"
                                                        data-bs-dismiss="modal"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form>
                                                    <textarea class="form-control" rows="4">Message</textarea>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger light"
                                                        data-bs-dismiss="modal">btn-close
                                                </button>
                                                <button type="button" class="btn btn-primary">Reply</button>
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
<%--  script start--%>
<script src="../assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="../assets/vendor/lightgallery/js/lightgallery-all.min.js"></script>
<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/js/plugins-init/sweetalert.init.js"></script>
<script src="../assets/js/utils/throttle.js"></script>
<script src="../assets/js/utils/debounce.js"></script>
<script src="../assets/js/md5.min.js"></script>
<script src="../assets/js/utils/encrypt.js"></script>
<%@include file="../frame/frame_javascript.jsp" %>

<script>
    const uploadAvatarBtn = $('#upload_avatar_btn');
    const uploadAvatar = $('#upload_avatar');
    const submitBtn = $('#submit_btn');
    const sendEmailBtn = $('#verify_btn');
    $("#set-password,#verify_code").on('keyup', debounce(() => {
        console.log(passwordSet());
        if(avatarSet() || passwordSet() && verifySet()) {
            submitBtn.removeClass('disabled');
        } else {
            submitBtn.addClass('disabled');
        }
    }, 500));

    $("#upload_avatar").on('change', debounce(() => {
        console.log(passwordSet());
        if(avatarSet() || passwordSet() && verifySet()) {
            submitBtn.removeClass('disabled');
        } else {
            submitBtn.addClass('disabled');
        }
    }, 500));
    $("#set-email").on('keyup', debounce(() => {
        if(emailSet()) {
            $('#verify_btn').removeClass('disabled');
        } else {
            $('#verify_btn').addClass('disabled');
        }
    }, 500));
    uploadAvatar.on('click', () => {
        uploadAvatarBtn.click();
    })
    uploadAvatarBtn.on('change', (event) => {
        const file = event.target.files[0];
        console.log(file)
        let tmpURL = window.URL.createObjectURL(file);
        uploadAvatar.attr('src', tmpURL);
    });
    submitBtn.on('click', (event) => {
        const file = uploadAvatarBtn.prop("files")[0];
        if(file) {
            const formData = new FormData();
            formData.append("avatar", file);
            $.ajax({
                url: '<%=Config.getInstance().getString("default.urlheader")%>/reset',
                type: 'POST',
                data: formData,
                processData: false,  // 不处理数据
                contentType: false,
                success(res) {
                    console.log(res)
                    swal("success", "头像更换", "success");
                    $('#upload_avatar').attr('src', res.urls[0]);
                    $('#profile_avatar').attr('src', res.urls[0]);
                }
            })
        }

        const data = {};
        data.action = "modifyPassword";
        data.img = false;
        data.resetPassword = encrypt($('#set-password').val());
        data.email = $('#set-email').val();
        data.emailVerifyCode = $('#verify_code').val();
        console.log(data);
        if($('#set-password').val() !== '') {
            $.post("<%=Config.getInstance().getString("default.urlheader")%>/reset", data, (res) => {
                console.log(res);
                if (res.resCode === '00000') {
                    swal("success", "信息重置成功", "success");
                    if($("#gridCheck").is(":checked")) {
                        $.get('<%=Config.getInstance().getString("default.urlheader")%>/logout');
                    }
                } else {
                    sweetAlert({
                        type: "error",
                        title: "信息重置失败",
                        text: "请再次尝试",
                        timer: 1e3,
                        showConfirmButton: !1
                    });
                }
            })
        }
    })

    $('#rechargeInput').on('input', (e) => {
        e.target.value = e.target.value.replace(/[^\d.]/g, ""); //清除“数字”和“.”以外的字符
        e.target.value = e.target.value.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的
        e.target.value = e.target.value.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
        e.target.value = e.target.value.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');//只能输入两个小数
        if (e.target.value.indexOf(".") < 0 && e.target.value !== "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
            e.target.value = parseFloat(e.target.value);
        }
    });

    $('#rechargeSubmit').on('click', (e) => {
        let value = $('#rechargeInput').val();
        if (!value || value == '0' || value == '0.0' || value == '0.00') {
            sweetAlert({
                type: "error",
                title: "充值金额不能为0",
                text: "请再次尝试",
                timer: 1e3,
                showConfirmButton: !1
            });
            return;
        }
        const data = {};
        data.rechargeValue = value;
        data.action = 'recharge';
        $.post('<%=Config.getInstance().getString("default.urlheader")%>/balance', data, (res) => {
            console.log(res)
            $('#rechargeInput').val(res['newBalance']);
            swal("success", "充值成功", "success");
        })
    });
    const data = {};
    data.action = 'payouts';
    $('#payoutsSubmit').on('click', () => {
        $.post('<%=Config.getInstance().getString("default.urlheader")%>/balance', data, (res) => {
            swal("success", "提现成功", "success");
        })
    });

    $('#verify_btn').on('click', () => {
        let waitTime = 60;
        let userEmail = $('#set-email').val();
        $.get(`<%=Config.getInstance().getString("default.urlheader")%>/email?email=\${userEmail}`, (res) => {
            console.log("sendEmailRes");
            sendEmailBtn.addClass("disabled");
            sendEmailBtn.text(waitTime);
            let sendEmailTimer = setInterval(() => {
                sendEmailBtn.text(waitTime--);
                if (waitTime < 0) {
                    clearInterval(sendEmailTimer);
                    sendEmailBtn.removeClass('disabled')
                    sendEmailBtn.text("test");
                }
            }, 1000);
        });
    })
    const exportFile = () => {
        $.get('<%=Config.getInstance().getString("default.urlheader")%>/export_profile', res => {
            console.log(res);
            $('#export_url').attr('href', res.url);
            $('#export_url').attr('download', "profile.json");
            document.getElementById("export_url").click();
        });
    }
    $('#export_btn').on('click', throttle(exportFile, 50));

    function passwordSet() {
        return $('#set-password').val() !== '';
    }

    function avatarSet() {
        return $('#upload_avatar').href !== "<%=user.avatarURL%>";
    }

    function verifySet() {
        return $('#verify_btn').val() !== '';
    }

    function emailSet() {
        return $('#set-email').val() !== '';
    }


</script>

<%--  script end  --%>
</body>
</html>