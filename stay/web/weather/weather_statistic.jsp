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
    <link rel="shortcut icon" type="image/png" href="images/favicon.png"/>
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="../assets/vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="../assets/css/style.css" rel="stylesheet">

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
    <div class="nav-header">
        <a href="index.html" class="brand-logo">
            <svg class="logo-abbr" width="57" height="57" viewBox="0 0 57 57" fill="none"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="M32.9585 1.84675C30.4961 -0.615584 26.5039 -0.615585 24.0415 1.84675L19.3876 6.50068H12.8059C9.32365 6.50068 6.50071 9.32362 6.50071 12.8059V19.3876L1.84675 24.0415C-0.615584 26.5039 -0.615585 30.4961 1.84675 32.9585L6.50071 37.6124V44.1941C6.50071 47.6763 9.32365 50.4993 12.8059 50.4993H19.3876L24.0415 55.1532C26.5039 57.6156 30.4961 57.6156 32.9585 55.1532L37.6124 50.4993H44.1941C47.6764 50.4993 50.4993 47.6763 50.4993 44.1941V37.6124L55.1532 32.9585C57.6156 30.4961 57.6156 26.5039 55.1532 24.0415L50.4993 19.3876V12.8059C50.4993 9.32362 47.6764 6.50068 44.1941 6.50068H37.6124L32.9585 1.84675Z"
                      fill="url(#paint0_linear)"/>
                <path class="logo-text" fill-rule="evenodd" clip-rule="evenodd"
                      d="M24.7614 37.345L20.7666 40.3417C20.4005 40.616 19.9111 40.6607 19.5015 40.4553C19.0919 40.2511 18.8333 39.833 18.8333 39.375V17.625C18.8333 16.958 19.3746 16.4167 20.0416 16.4167H36.9583C37.6253 16.4167 38.1666 16.958 38.1666 17.625V39.375C38.1666 39.833 37.9081 40.2511 37.4984 40.4553C37.0888 40.6607 36.5994 40.616 36.2333 40.3417L32.2386 37.345L29.3543 40.2293C28.883 40.7018 28.1169 40.7018 27.6457 40.2293L24.7614 37.345ZM35.75 36.9584V18.8334H21.25V36.9584L24.15 34.7834C24.6309 34.4221 25.3039 34.4704 25.7293 34.8957L28.5 37.6664L31.2707 34.8957C31.696 34.4704 32.3691 34.4221 32.85 34.7834L35.75 36.9584ZM27.2916 28.5H29.7083C30.3753 28.5 30.9166 27.9587 30.9166 27.2917C30.9166 26.6247 30.3753 26.0834 29.7083 26.0834H27.2916C26.6246 26.0834 26.0833 26.6247 26.0833 27.2917C26.0833 27.9587 26.6246 28.5 27.2916 28.5ZM24.875 23.6667H32.125C32.792 23.6667 33.3333 23.1254 33.3333 22.4584C33.3333 21.7914 32.792 21.25 32.125 21.25H24.875C24.208 21.25 23.6666 21.7914 23.6666 22.4584C23.6666 23.1254 24.208 23.6667 24.875 23.6667Z"
                      fill="white"/>
                <defs>
                </defs>
            </svg>
            <div class="brand-title">
                <h2 class="">inv<span>ome</span></h2>
                <span class="brand-sub-title">Invoicing Admin</span>

            </div>

        </a>
        <div class="nav-control">
            <div class="hamburger">
                <span class="line"></span><span class="line"></span><span class="line"></span>
            </div>
        </div>
    </div>
    <!--**********************************
        Nav header end
    ***********************************-->

    <!--**********************************
        Header start
    ***********************************-->
    <div class="header">
        <div class="header-content">
            <nav class="navbar navbar-expand">
                <div class="collapse navbar-collapse justify-content-between">
                    <div class="header-left">
                        <div class="dashboard_bar">
                            天气数据统计
                        </div>
                    </div>
                    <ul class="navbar-nav header-right">
                        <li class="nav-item d-flex align-items-center">
                            <div class="input-group search-area">
                                <input type="text" class="form-control" placeholder="Search here...">
                                <span class="input-group-text"><a href="javascript:void(0)"><i
                                        class="flaticon-381-search-2"></i></a></span>
                            </div>
                        </li>

                        <li class="nav-item dropdown notification_dropdown">
                            <a class="nav-link" href="javascript:void(0);" role="button" data-bs-toggle="dropdown">
                                <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="">
                                        <path d="M28.0948 25.0879H26.6026V11.3407C26.6026 10.7074 26.5333 10.0741 26.3965 9.45825C26.2318 8.717 25.4985 8.24975 24.7572 8.41431C24.0164 8.57912 23.5494 9.31363 23.7141 10.0549C23.8058 10.4676 23.8547 10.9115 23.8547 11.3407V25.0879L8.08365 25.088V11.4309C8.08365 8.38875 10.6582 5.62356 13.8228 5.26694C13.8273 5.26644 13.8317 5.26562 13.8362 5.26506C14.5092 5.18325 15.0368 4.59319 15.0427 3.914C15.0427 3.9095 15.043 3.90506 15.043 3.90056C15.043 3.26619 15.5576 2.75 16.1902 2.75C16.8228 2.75 17.3375 3.26612 17.3375 3.90069C17.3375 4.55975 17.8577 5.16475 18.5103 5.26069C19.2389 5.36862 19.94 5.60462 20.594 5.96219C20.8032 6.07656 21.0289 6.13081 21.2515 6.13081C21.7377 6.13081 22.2089 5.87188 22.4585 5.41475C22.8223 4.74831 22.5773 3.91294 21.9115 3.54888C21.2738 3.20025 20.6042 2.93225 19.9114 2.74719C19.4192 1.15775 17.9372 0 16.1902 0C14.4558 0 12.9832 1.14125 12.4803 2.71294C10.7098 3.1255 9.07122 4.06819 7.78547 5.42975C6.20572 7.10281 5.33572 9.23406 5.33572 11.4309V25.0881H3.90528C3.14647 25.0881 2.53134 25.7037 2.53134 26.4631C2.53134 27.2224 3.14647 27.8381 3.90528 27.8381H11.5226C11.6948 30.1617 13.6364 32 16 32C18.3637 32 20.3053 30.1616 20.4775 27.838H28.0948C28.8537 27.838 29.4688 27.2224 29.4688 26.463C29.4688 25.7036 28.8537 25.0879 28.0948 25.0879ZM16 29.25C15.1533 29.25 14.4458 28.6416 14.2892 27.838H17.7108C17.5542 28.6416 16.8468 29.25 16 29.25Z"
                                              fill="#717579"/>
                                        <path d="M23.8691 8.18592C24.6279 8.18592 25.2431 7.57031 25.2431 6.81092C25.2431 6.05152 24.6279 5.43591 23.8691 5.43591C23.1103 5.43591 22.4952 6.05152 22.4952 6.81092C22.4952 7.57031 23.1103 8.18592 23.8691 8.18592Z"
                                              fill="#717579"/>
                                    </g>
                                    <defs>
                                        <clipPath>
                                            <rect width="32" height="32" fill="white"/>
                                        </clipPath>
                                    </defs>
                                </svg>
                                <span class="badge light text-white bg-warning rounded-circle">12</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <div id="DZ_W_Notification1" class="widget-media dlab-scroll p-3" style="height:380px;">
                                    <ul class="timeline">
                                        <li>
                                            <div class="timeline-panel">
                                                <div class="media me-2">
                                                    <img alt="image" width="50" src="images/avatar/1.jpg">
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="mb-1">Dr sultads Send you Photo</h6>
                                                    <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="timeline-panel">
                                                <div class="media me-2 media-info">
                                                    KG
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="mb-1">Resport created successfully</h6>
                                                    <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="timeline-panel">
                                                <div class="media me-2 media-success">
                                                    <i class="fa fa-home"></i>
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="mb-1">Reminder : Treatment Time!</h6>
                                                    <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="timeline-panel">
                                                <div class="media me-2">
                                                    <img alt="image" width="50" src="images/avatar/1.jpg">
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="mb-1">Dr sultads Send you Photo</h6>
                                                    <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="timeline-panel">
                                                <div class="media me-2 media-danger">
                                                    KG
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="mb-1">Resport created successfully</h6>
                                                    <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="timeline-panel">
                                                <div class="media me-2 media-primary">
                                                    <i class="fa fa-home"></i>
                                                </div>
                                                <div class="media-body">
                                                    <h6 class="mb-1">Reminder : Treatment Time!</h6>
                                                    <small class="d-block">29 July 2020 - 02:26 PM</small>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <a class="all-notification" href="javascript:void(0);">See all notifications <i
                                        class="ti-arrow-end"></i></a>
                            </div>
                        </li>
                        <li class="nav-item dropdown notification_dropdown">
                            <a class="nav-link bell-link " href="javascript:void(0);">
                                <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="">
                                        <path d="M20.4632 3.4715H11.5369C5.17544 3.4715 0 8.63718 0 14.9867V20.4849C0 26.8344 5.17544 32.0001 11.5369 32.0001H20.5686C21.328 32.0001 21.9436 31.3844 21.9436 30.6251C21.9436 29.8657 21.328 29.2501 20.5686 29.2501H11.5369C6.69181 29.2501 2.75 25.318 2.75 20.4849V14.9867C2.75 13.2669 3.2495 11.6614 4.11081 10.3064L12.4198 17.0756L12.4315 17.085C13.4248 17.8762 14.7284 18.3115 16.1044 18.3115H16.1214C17.4992 18.3079 18.8024 17.8682 19.7926 17.0732L28.0844 10.6274C28.8258 11.9121 29.2501 13.4007 29.2501 14.9865V20.958C29.2501 22.1491 29.0027 23.2979 28.515 24.3729C28.0432 25.4126 27.3724 26.3305 26.5209 27.1011C25.9579 27.6106 25.9146 28.4801 26.4241 29.0432C26.9337 29.6063 27.8032 29.6496 28.3662 29.14C29.4984 28.1153 30.391 26.8937 31.0193 25.5091C31.6701 24.0749 32 22.5437 32 20.9581V14.9866C32 8.63712 26.8246 3.4715 20.4632 3.4715ZM18.0956 14.9092L18.0758 14.9249C17.0344 15.7656 15.2018 15.7711 14.1501 14.9381L5.93113 8.24218C7.4535 6.98087 9.40794 6.2215 11.5369 6.2215H20.4632C22.7278 6.2215 24.7949 7.08062 26.3545 8.48912L18.0956 14.9092Z"
                                              fill="#717579"/>
                                        <path d="M24.5181 31.8096C25.2775 31.8096 25.8931 31.194 25.8931 30.4346C25.8931 29.6752 25.2775 29.0596 24.5181 29.0596C23.7587 29.0596 23.1431 29.6752 23.1431 30.4346C23.1431 31.194 23.7587 31.8096 24.5181 31.8096Z"
                                              fill="#717579"/>
                                    </g>
                                    <defs>
                                        <clipPath>
                                            <rect width="32" height="32" fill="white"/>
                                        </clipPath>
                                    </defs>
                                </svg>
                                <span class="badge light text-white bg-warning rounded-circle">76</span>
                            </a>
                        </li>


                        <li class="nav-item dropdown notification_dropdown">
                            <a class="nav-link " href="javascript:void(0);" data-bs-toggle="dropdown">
                                <svg width="32" height="32" viewBox="0 0 32 32" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path d="M32 12.7087C32 12.6285 31.9928 12.5501 31.9796 12.4736C31.6646 7.57756 27.6102 3.67738 22.6341 3.57681V1.375C22.6341 0.615625 22.0184 0 21.2591 0C20.4997 0 19.8841 0.615625 19.8841 1.375V3.57431H11.6726V1.375C11.6726 0.615625 11.0569 0 10.2976 0C9.53819 0 8.92256 0.615625 8.92256 1.375V3.59612C3.94706 3.92506 0 8.05588 0 13.0872V21.4244C0 27.2558 4.76956 32 10.6322 32H20.9373C21.6967 32 22.3123 31.3844 22.3123 30.625C22.3123 29.8656 21.6967 29.25 20.9373 29.25H10.6322C6.28594 29.25 2.75 25.7394 2.75 21.4244V14.0837H29.25V20.9966C29.25 22.1813 29.003 23.3243 28.5158 24.3937C28.0444 25.4284 27.3739 26.342 26.5229 27.1092C25.9589 27.6177 25.9138 28.4871 26.4223 29.0511C26.9309 29.6151 27.8002 29.6601 28.3642 29.1518C29.4969 28.1306 30.3898 26.9134 31.0184 25.5336C31.6698 24.1039 32 22.5774 32 20.9966V13.0872C32 12.9952 31.9984 12.9036 31.9958 12.8122C31.9983 12.778 32 12.7436 32 12.7087ZM8.92988 6.35375C9.001 7.04638 9.58619 7.58663 10.2976 7.58663C11.019 7.58663 11.6102 7.03094 11.6676 6.32431H19.889C19.9464 7.03094 20.5376 7.58663 21.259 7.58663C21.9794 7.58663 22.5701 7.03244 22.6288 6.32713C25.6904 6.41156 28.2531 8.51081 29.0173 11.3337H2.98269C3.70981 8.64756 6.0655 6.61706 8.92988 6.35375Z"
                                          fill="#717579"/>
                                    <path d="M24.7114 31.81C25.4708 31.81 26.0864 31.1944 26.0864 30.435C26.0864 29.6756 25.4708 29.06 24.7114 29.06C23.952 29.06 23.3364 29.6756 23.3364 30.435C23.3364 31.1944 23.952 31.81 24.7114 31.81Z"
                                          fill="#717579"/>
                                </svg>

                                <span class="badge light text-white bg-primary rounded-circle">!</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <div id="DZ_W_TimeLine02"
                                     class="widget-timeline dlab-scroll style-1 ps ps--active-y p-3 height370">
                                    <ul class="timeline">
                                        <li>
                                            <div class="timeline-badge primary"></div>
                                            <a class="timeline-panel text-muted" href="javascript:void(0);">
                                                <span>10 minutes ago</span>
                                                <h6 class="mb-0">Youtube, a video-sharing website, goes live <strong
                                                        class="text-primary">$500</strong>.</h6>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="timeline-badge info">
                                            </div>
                                            <a class="timeline-panel text-muted" href="javascript:void(0);">
                                                <span>20 minutes ago</span>
                                                <h6 class="mb-0">New order placed <strong
                                                        class="text-info">#XF-2356.</strong></h6>
                                                <p class="mb-0">Quisque a consequat ante Sit amet magna at
                                                    volutapt...</p>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="timeline-badge danger">
                                            </div>
                                            <a class="timeline-panel text-muted" href="javascript:void(0);">
                                                <span>30 minutes ago</span>
                                                <h6 class="mb-0">john just buy your product <strong
                                                        class="text-warning">Sell $250</strong></h6>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="timeline-badge success">
                                            </div>
                                            <a class="timeline-panel text-muted" href="javascript:void(0);">
                                                <span>15 minutes ago</span>
                                                <h6 class="mb-0">StumbleUpon is acquired by eBay. </h6>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="timeline-badge warning">
                                            </div>
                                            <a class="timeline-panel text-muted" href="javascript:void(0);">
                                                <span>20 minutes ago</span>
                                                <h6 class="mb-0">Mashable, a news website and blog, goes live.</h6>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="timeline-badge dark">
                                            </div>
                                            <a class="timeline-panel text-muted" href="javascript:void(0);">
                                                <span>20 minutes ago</span>
                                                <h6 class="mb-0">Mashable, a news website and blog, goes live.</h6>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item invoices-btn">
                            <a href="javascript:void(0);" class="btn btn-primary ms-5"><i
                                    class="far fa-file-alt fs-20 me-2"></i>New Invoices</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <!--**********************************
        Header end ti-comment-alt
    ***********************************-->

    <!--**********************************
        Sidebar start
    ***********************************-->
    <%@include file="../frame/frame_menu.jsp" %>
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
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">气温</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">变化图</a></li>
                </ol>
            </div>
            <!-- row -->

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">温度变化曲线</h4>
                        </div>
                        <div class="card-body">
                            <canvas id="lineChart_3"></canvas>
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
    <div class="footer">
        <div class="copyright">
            <p>Copyright © Designed &amp; Developed by <a href="https://dexignlab.com/" target="_blank">DexignLab</a>
                2021</p>
        </div>
    </div>
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
<!-- Required vendors -->
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<!-- Apex Chart -->
<script src="../assets/vendor/apexchart/apexchart.js"></script>

<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>

<!-- Chart ChartJS plugin files -->
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="../assets/js/plugins-init/chartjs-init.js"></script>

<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>

</body>
</html>