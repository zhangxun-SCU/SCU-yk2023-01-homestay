<%--
  Created by IntelliJ IDEA.
  User: 86135
  Date: 2023/12/10
  Time: 10:26
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
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=B2Lz3CYUZVzjXBhZ0g3MS8wY"></script>
    <script type="text/javascript" src="../assets/js/GPS/jquery.min.js"></script>
    <style>
        div#map {
            position: relative;
        }

        div#map_container {
            height: 500px;
        }

        div.query-info {
            position: absolute;
            right: 20px;
            top: 20px;
            z-index: 100;
            padding: 5px;
            border-radius: 5px;
            border: solid 1px lightskyblue;
        }
    </style>

    <!-- PAGE TITLE HERE -->
    <title>地图查询模块</title>

    <!-- FAVICONS ICON -->
    <link rel="shortcut icon" type="image/png" href="../assets/images/favicon.png"/>
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
                            地图查询模块
                        </div>
                    </div>
                    <ul class="navbar-nav header-right">
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
        <!-- row -->
        <div class="container-fluid">
            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"><a href="javascript:void(0)">定位</a></li>
                    <li class="breadcrumb-item"><a href="javascript:void(0)">查询民宿位置</a></li>
                </ol>
            </div>

            <div class="row mb-2">
                <div class="col-md-9">
                    <input type="text" id="house" name="house" class="form-control"
                           placeholder="请输入民宿名称...">
                </div>
                <div class="col-md-3">
                    <button type="button" class="btn btn-rounded btn-danger sweet-wrong"
                            id="query_button"
                            name="query_button">
                            <span class="btn-icon-start text-danger">
                                <i class="fa fa-search-location color-danger"></i>
                            </span>定位
                    </button>
                </div>
            </div>
            <div id="map">
                <div class="query-info bg-white">
                    共查询到<i id="query_num">0</i>家民宿
                </div>
                <div id="map_container" class="col-sm-12">
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
<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>

<%-- 地图API --%>
<script type="text/javascript">
    window._AMapSecurityConfig = {
        securityJsCode: 'd71806b25af8ceba503a3b358b33694b',
    }
</script>
<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
<script type="text/javascript"
        src="https://webapi.amap.com/maps?v=1.4.15&key=89fd825427ce3fbf3dc999e544b50f99&plugin=AMap.Geocoder"></script>

<script type="text/javascript">
    let map = new AMap.Map("map_container", {
        resizeEnable: true
    });
    let geocoder = new AMap.Geocoder({
        city: "全国"
    });
    let infoWindow = new AMap.InfoWindow({
        offset: new AMap.Pixel(0, -30)
    });

    map.setFitView();

    function addMarker(house) {
        console.log(house);
        let address = house.location;
        geocoder.getLocation(address, function (status, result) {
            console.log(address);
            if (status === "complete" && result.geocodes.length) {
                let lnglat = result.geocodes[0].location;
                let marker = new AMap.Marker({
                    position: lnglat,
                    map: map,
                    title: house.house_name
                });
                let content = `<div class="card">` +
                    `<div class="card-header">详细信息</div>` +
                    `<div class="card-body">` +
                    `    <p>民宿名称：\${house.house_name}</p>` +
                    `    <p>房东：\${house.owner_id}</p>` +
                    `    <p>详细地址：\${house.location}</p>` +
                    `</div>` +
                    `</div>`;
                marker.on("mouseover", (e) => {
                    infoWindow.setContent(content);
                    infoWindow.open(map, e.target.getPosition());
                });
                marker.on("mouseout", (e) => {
                    infoWindow.close(map, e.target.getPosition());
                });
                marker.on("click", (e) => {
                    map.setZoomAndCenter(15, e.target.getPosition());
                });
                map.add(marker);
                map.setFitView(marker);
            } else {
                console.error("根据地址查询位置失败");
            }
        })
    }

    $("#query_button").one("click", (e) => {
        let url = "/seller";
        let data = {
            "actionType": "homestay",
            "action": "get_locations",
            "house_name": $("#house").val()
        };
        console.log(data);
        $.ajaxSettings.async = false;
        $.post(
            url,
            data,
            (res) => {
                console.log(res.resCode);
                if (res.resCode === "00000") {
                    let list = res.house_locations;
                    console.log(list);
                    for (let i = 0; i < list.length; i++) {
                        let house = list[i];
                        addMarker(house);
                    }
                    $("#query_num").html(Number(list.length));
                }
            }
        )
        $.ajaxSettings.async = true;
    })
</script>
</body>
</html>
