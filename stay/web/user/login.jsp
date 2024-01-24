<%@ page import="homestay.utils.Config" %><%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/3
  Time: 13:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="h-100">

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
    <link rel="shortcut icon" type="image/png" href="./../assets/images/favicon.png"/>
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">

</head>

<body class="vh-100">
<div class="authincation h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100 align-items-center">
            <div class="col-md-6">
                <div class="authincation-content">
                    <div class="row no-gutters">
                        <div class="col-xl-12">
                            <div class="auth-form">
                                <div class="text-center mb-3">
                                    <a href="/index.html"><img src="../assets/images/logo-full.png" alt=""></a>
                                </div>
                                <h4 class="text-center mb-4">登录您的账号</h4>
                                <form>
                                    <div class="mb-3">
                                        <label class="mb-1" for="user_id"><strong>ID</strong></label>
                                        <input type="text" class="form-control" id="user_id">
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-1" for="user_password"><strong>密码</strong></label>
                                        <input type="password" class="form-control" value="Password" id="user_password">
                                    </div>
                                    <div class="row d-flex">
                                        <div class="mb-3">
                                            <label class="mb-1" for="verify_code"><strong>验证码</strong></label>
                                            <div style="display: flex; justify-content: space-between; flex: 1">
                                                <input type="text" class="form-control" style="width: 75%;"
                                                       id="verify_code" placeholder="请输入右侧验证码 ">
                                                <img src="" alt="verify_code" id="verify_code_img" class="img-preview"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row d-flex justify-content-between mt-4 mb-2">
                                        <div class="mb-3">
                                            <div class="form-check custom-checkbox ms-1">
                                                <input type="checkbox" class="form-check-input" id="remember_me">
                                                <label class="form-check-label" for="remember_me">记住我</label>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <a href="./forgot-password.jsp"> 忘记密码?</a>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button class="btn btn-primary btn-block disabled" id="login_btn" type="button">
                                            登录
                                        </button>
                                    </div>
                                </form>
                                <div class="new-account mt-3">
                                    <p>没有账号? <a class="text-primary" href="./register.jsp">注册</a>
                                    </p>
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
    Scripts
***********************************-->
<!-- Required vendors -->
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>

<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/js/plugins-init/sweetalert.init.js"></script>

<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>

<script src="../assets/js/md5.min.js"></script>
<script src="../assets/js/axios.min.js"></script>

<script src="../assets/js/utils/throttle.js"></script>
<script src="../assets/js/utils/debounce.js"></script>
<script src="../assets/js/utils/storage.js"></script>
<script src="../assets/js/utils/encrypt.js"></script>
<script>


    /**
     *  事件绑定
     */
    $('#verify_code_img').on('click', throttle(flushVerifyCode, 100));
    $('#login_btn').on('click', login);
    $('#user_id,#user_password,#verify_code').on('keyup', debounce(() => {
        if (idInput() && passwordInput() && imgVerifyInput()) {
            $('#login_btn').removeClass('disabled');
        } else {
            $('#login_btn').addClass('disabled');
        }
    }, 500))
    let reg = new RegExp(/\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/, 'g');

    function flushVerifyCode() {
        axios({
            type: 'get',
            url: '<%=Config.getInstance().getString("default.urlheader")%>/verify',
            responseType: 'arraybuffer',
        }).then(res => {
            $('#verify_code_img').attr('src', "data:image/png;base64," +
                btoa(
                    new Uint8Array(res.data).reduce(function (data, byte) {
                        return data + String.fromCharCode(byte)
                    }, '')
                ));
        })
    };

    flushVerifyCode();

    function login() {
        // 校验图形验证码
        /** 数据校验 **/
        const userLoginData = {};
        userLoginData.src = "web";
        userLoginData.imgVerifyCode = $('#verify_code').val();
        userLoginData.id = $('#user_id').val();
        userLoginData.password = encrypt($('#user_password').val());
        userLoginData.rememberMe = $('#remember_me').get(0).checked;
        console.log("user login data", userLoginData);
        $.post("<%=Config.getInstance().getString("default.urlheader")%>/login", userLoginData, res => {
            if (res.resCode === "L0001") {
                sweetAlert({
                    type: "error",
                    title: "密码错误",
                    text: "请重新确认密码",
                    timer: 2e3,
                    showConfirmButton: !1
                });
            } else if (res.resCode === 'V0001') {
                sweetAlert({
                    type: "error",
                    title: "图形验证码错误",
                    text: "请再次尝试",
                    timer: 1e3,
                    showConfirmButton: !1
                });
            } else if (res.resCode === '00000') {
                swal("success", "登录成功", "success");
                let storage = new Storage("localStorage");
                storage.get("user_info")
                const userInfo = JSON.parse(window.atob(res.token.split('.')[1]));
                storage.set("user_info", userInfo, userInfo.exp * 14);
                if(res.userType==='low'||res.userType==='middle')
                    window.location.href = "../market/house_market.jsp"
                else if(res.userType==='high')
                    window.location.href = "../admin/empty-page.html"//管理员
                else
                    window.location.href = "../superadmin/users.jsp"//超级管理员
            }
        });
    }

    /**
     * 输入校验
     */

    function idInput() {
        if ($('#user_id').val() === '') {
            return false;
        }
        return true;
    }

    function passwordInput() {
        if ($('#user_password').val() === '') {
            return false;
        }
        return true;
    }

    function imgVerifyInput() {
        if ($('#verify_code').val() === '') {
            return false;
        }
        return true;
    }
</script>
</body>
</html>
<%--java脚本--%>
<%
    Object msg = request.getAttribute("msg");
    if (msg != null && msg.toString().equals("登录已过期")) {%>
<script>
    sweetAlert({
        title: "登录已过期",
        text: "请重新登录",
        timer: 1e3,
        showConfirmButton: !1
    })
</script>
<%}%>