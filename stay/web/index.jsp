<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2024/1/25
  Time: 11:41
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
    <link rel="shortcut icon" type="image/png" href="images/favicon.png"/>
    <link href="./assets/css/style.css" rel="stylesheet">
    <link href="./assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="./assets/vendor/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/vendor/nouislider/nouislider.min.css">
    <style>
        body {
            background: url("./assets/images/bg.jpg") no-repeat;
            background-size: contain;
        }
    </style>
</head>

<body class="vh-100">

<div class="header bg-transparent p-0 border-0">
    <div class="header-content">
        <nav class="navbar navbar-expand">
            <div class="collapse navbar-collapse justify-content-between">
                <div class="header-left">
                    <div class="dashboard_bar">
                        SCU Homestay
                    </div>
                </div>
                <ul class="navbar-nav header-right">
                    <!--                              <li class="nav-item d-flex align-items-center">-->
                    <!--                                  <div class="input-group search-area">-->
                    <!--                                      <input type="text" class="form-control" placeholder="Search here...">-->
                    <!--                                      <span class="input-group-text"><a href="javascript:void(0)"><i class="flaticon-381-search-2"></i></a></span>-->
                    <!--                                  </div>-->
                    <!--                              </li>-->

                    <li class="nav-item invoices-btn">
                        <a href="./user/login.jsp" class="btn btn-primary ms-5"><i
                                class="far fa-file-alt fs-20 me-2"></i>登录</a>
                    </li>
                    <li class="nav-item invoices-btn">
                        <a href="./user/register.jsp" class="btn btn-primary ms-5"><i
                                class="far fa-file-alt fs-20 me-2"></i>注册</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<div class="authincation h-100">
    <div class="container h-100">
        <div class="row justify-content-center h-100 align-items-center">
            <div class="col-md-6">
                <div class="authincation-content">
                    <div class="row no-gutters">
                        <div class="col-xl-12">
                            <div class="auth-form">
                                <div class="text-center mb-3">
                                    <a href="index.jsp"><img src="./assets/images/logo-full.png" alt=""></a>
                                </div>
                                <div class="card-img img-fluid rounded w-100 h-50 justify-content-around" style="display: flex">
                                    <img src="./assets/images/miniapp.png " class="card-img img-fluid rounded-circle w-50 m-5">
                                </div>
                                <div>
                                    <h4 class="text-center mb-4"><a href="./user/login.jsp" class="link-primary">Sign in your account</a></h4>
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
<script src="./assets/vendor/global/global.min.js"></script>
<script src="./assets/js/custom.min.js"></script>
<script src="./assets/js/dlabnav-init.js"></script>
<script src="./assets/js/styleSwitcher.js"></script>

</body>
</html>
