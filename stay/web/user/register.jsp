<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/3
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="shortcut icon" type="image/png" href="images/favicon.png"/>
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
                                    <a href="/index.html"><img src="./../assets/images/logo-full.png" alt=""></a>
                                </div>
                                <h4 class="text-center mb-4">Sign up your account</h4>
                                <form>
                                    <div class="mb-3">
                                        <label class="mb-1"><strong>Username</strong></label>
                                        <input type="text" class="form-control" placeholder="username" id="register_id">
                                    </div>
                                    <div class="mb-3">
                                        <label class="mb-1"><strong>Email</strong></label>
                                        <input type="email" class="form-control" placeholder="hello@example.com"
                                               id="register_email">
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
                                        <label class="mb-1"><strong>Password</strong></label>
                                        <input type="password" class="form-control" value="Password"
                                               id="register_password">
                                    </div>
                                    <div class="row d-flex">
                                        <div class="mb-3">
                                            <label class="mb-1" for="verify_code"><strong>验证码</strong></label>
                                            <div style="display: flex; justify-content: space-between; flex: 1">
                                                <input type="text" class="form-control w-75" id="verify_code"
                                                       placeholder="请输入右侧验证码 ">
                                                <img src="" alt="verify_code" id="verify_code_img" class="img-preview"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center mt-4">
                                        <button class="btn btn-primary btn-block disabled" id="register_btn"
                                                type="button">Sign me up
                                        </button>
                                    </div>
                                </form>
                                <div class="new-account mt-3">
                                    <p>Already have an account? <a class="text-primary" href="/user/login.jsp">Sign in</a>
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
<script src="./../assets/vendor/global/global.min.js"></script>
<script src="./../assets/js/custom.min.js"></script>
<script src="./../assets/js/dlabnav-init.js"></script>
<script src="./../assets/js/styleSwitcher.js"></script>

<script src="./../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="./../assets/js/plugins-init/sweetalert.init.js"></script>
<script src="./../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>


<script src="./../assets/js/axios.min.js"></script>
<script src="./../assets/js/md5.min.js"></script>

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
    $('#register_btn').on('click', register);
    $('#register_id,#register_password,#register_email,#email_verify_code,#verify_code').on('keyup', debounce(() => {
        if (idInput() && passwordInput() && emailInput() && emailVerifyCodeINput() && imgVerifyInput()) {
            $('#register_btn').removeClass('disabled');
        } else {
            $('#register_btn').addClass('disabled');
        }
        console.log(111);
    }, 200));
    $('#register_email').on('keyup', debounce(() => {
        if(emailInput()) {
            sendEmailBtn.removeClass('disabled');
        } else {
            sendEmailBtn.addClass('disabled');
        }
    }, 200));

    /**
     * 图形验证码
     */
    function flushVerifyCode() {
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


    /**
     * 邮件验证码
     */
    function sendEmail() {
        let waitTime = 60;
        let userEmail = $('#register_email').val();
        $.get(`/email?email=\${userEmail}`, (res) => {
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
    }

    /**
     * 注册
     */
    function register() {
        // 校验图形验证码
        const userRegisterData = {};
        userRegisterData.imgVerifyCode = $('#verify_code').val();
        userRegisterData.id = $('#register_id').val();
        userRegisterData.email = $('#register_email').val();
        userRegisterData.password = encrypt($('#register_password').val());
        userRegisterData.emailVerifyCode = $('#email_verify_code').val();
        console.log(userRegisterData)
        $.post('/register', userRegisterData, res => {
            console.log('register res', res);
            if(res.resCode === "V0001") {
                sweetAlert({
                    type: "error",
                    title: "图形验证码错误",
                    text: "请再次尝试",
                    timer: 1e3,
                    showConfirmButton: !1
                });
            } else if(res.resCode === "R0001") {
                // id已被占用
            } else if(res.resCode === "R0002") {
                sweetAlert({
                    type: "error",
                    title: "账户已存在",
                    text: "请直接登录",
                    timer: 1e3,
                    showConfirmButton: !1
                });
            }
        })
    }

    /**
     * 输入校验
     */
    function idInput() {
        if ($('#register_id').val() === '') {
            return false;
        }
        return true;
    }

    function passwordInput() {
        if ($('#register_password').val() === '') {
            return false;
        }
        return true;
    }

    function emailInput() {
        if ($('#register_email').val() === '') {
            return false;
        }
        return true;
    }

    function emailVerifyCodeINput() {
        if ($('#email_verify_code').val() === '') {
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
