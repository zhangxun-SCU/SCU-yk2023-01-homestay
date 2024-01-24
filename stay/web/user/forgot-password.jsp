<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2024/1/24
  Time: 17:23
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
    <link href="./../assets/css/style.css" rel="stylesheet">
    <link href="./../assets/vendor/sweetalert2/dist/sweetalert2.min.css" rel="stylesheet">
    <link href="./../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
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
                                    <a href="index.html"><img src="./../assets/images/logo-full.png" alt=""></a>
                                </div>
                                <h4 class="text-center mb-4">忘记密码</h4>
                                <form>
                                    <div class="mb-3">
                                        <label><strong>邮箱</strong></label>
                                        <input type="email" class="form-control" placeholder="hello@example.com"
                                               id="reset_email">
                                    </div>
                                    <div class="row d-flex">
                                        <div class="mb-3">
                                            <label class="mb-1"><strong>邮件验证码</strong></label>
                                            <div class="d-flex justify-content-between">
                                                <input type="text" class="form-control w-75" id="email_verify_code">
                                                <button type="button" class="btn light btn-primary disabled" id="send_email_btn">
                                                    发送
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-1" for="reset_password"><strong>密码</strong></label>
                                        <input type="password" class="form-control" value="Password"
                                               id="reset_password">
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-1"
                                               for="repeat_reset_password"><strong>确认密码</strong></label>
                                        <input type="password" class="form-control" value="Password"
                                               id="repeat_reset_password">
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
                                    <div class="text-center">
                                        <button class="btn btn-primary btn-block disabled" type="button"
                                                id="reset_password_btn">提交
                                        </button>
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


<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<script src="./../assets/vendor/global/global.min.js"></script>
<script src="./../assets/js/custom.min.js"></script>
<script src="./../assets/js/dlabnav-init.js"></script>
<script src="./../assets/js/styleSwitcher.js"></script>

<script src="./../assets/js/axios.min.js"></script>
<script src="./../assets/js/md5.min.js"></script>


<script src="./../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="./../assets/js/plugins-init/sweetalert.init.js"></script>

<script src="../assets/js/utils/throttle.js"></script>
<script src="./../assets/js/utils/debounce.js"></script>
<script src="./../assets/js/utils/encrypt.js"></script>


<script>
    /**
     *  事件绑定
     */
    let sendEmailBtn = $('#send_email_btn');
    sendEmailBtn.on('click', () => {
        sendEmail();
    });
    $('#verify_code_img').on('click', throttle(flushVerifyCode, 10000));
    let resetPasswordBtn = $("#reset_password_btn");
    resetPasswordBtn.on('click', submitReset);
    // 输入校验
    $('#reset_email,#email_verify_code,#reset_password,#repeat_reset_password,#verify_code').on('keyup', debounce(() => {
        if (emailInput() && passwordInput() && repeatPasswordInput() && emailVerifyCodeInput() && imgVerifyInput()) {
            resetPasswordBtn.removeClass('disabled');
        } else {
            resetPasswordBtn.addClass('disabled');
        }
    }, 200));
    $("#reset_email").on('keyup', debounce(() => {
        if(emailInput()) {
            sendEmailBtn.removeClass('disabled');
        } else {
            sendEmailBtn.addClass('disabled');
        }
    }, 200));
    function flushVerifyCode() {  // 图形验证码
        axios({
            type: 'get',
            url: '/verify',
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


    function sendEmail() {  // 邮件验证码
        let waitTime = 60;
        let userEmail = $('#reset_email').val();
        console.log(userEmail);
        $.get(`/email?email=\${userEmail}`, (res) => {
            console.log("sendEmailRes");
            sendEmailBtn.addClass("disabled");
            sendEmailBtn.text(waitTime);
            let sendEmailTimer = setInterval(() => {
                sendEmailBtn.text(waitTime--);
                if (waitTime < 0) {
                    clearInterval(sendEmailTimer);
                    sendEmailBtn.removeClass('disabled')
                    sendEmailBtn.text("发送");
                }
            }, 1000);
        });
    }

    function submitReset() {
        // 先校验图形验证码
        const data = {};
        data.action = "modifyPassword";
        data.img = true;
        data.imgVerifyCode = $('#verify_code').val();
        data.email = $('#reset_email').val();
        data.resetPassword = encrypt($('#reset_password').val())
        data.emailVerifyCode = $('#email_verify_code').val();
        $.post('/reset', data, res => {
            console.log(res);
            if(res.resCode === '00000') {
                swal("success", "重置成功", "success");
                window.location.href = '/user/login.jsp';
            } else if(resCode === 'S0001') {
                sweetAlert({
                    type: "error",
                    title: "重置失败",
                    text: "请再次尝试",
                    timer: 1e3,
                    showConfirmButton: !1
                });
            }
        })
    }

    /**
     * 输入校验
     */
    function emailInput() {
        if ($('#reset_email').val() === '') {
            return false;
        }
        return true;
    }

    function emailVerifyCodeInput() {
        if ($('#email_verify_code').val() === '') {
            return false;
        }
        return true;
    }

    function passwordInput() {
        if ($('#reset_password').val() === '') {
            return false;
        }
        return true;
    }

    function repeatPasswordInput() {
        if ($('#repeat_reset_password').val() === '') {
            return false;
        }
        if ($('#repeat_reset_password').val() !== $('#reset_password').val()) {
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
