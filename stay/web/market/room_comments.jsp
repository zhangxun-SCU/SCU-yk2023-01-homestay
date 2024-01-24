<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2024/1/17
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
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
    <title>Title</title>
    <%@include file="/frame/frame_style.jsp" %>
    <style>
        .stars {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .stars > li {
            float: left;
        }
    </style>
</head>
<body onload="onloadFunction();">

<%--  preloader start  --%>
<%@include file="/frame/frame_preloader.jsp" %>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  menu start  --%>
    <%@include file="/frame/frame_menu.jsp" %>
    <%--  end  --%>

    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" onclick="window.history.go(-1);">
                        <a>返回</a>
                    </li>
                </ol>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="profile-tab">
                                <div class="custom-tab-1">
                                    <ul class="nav nav-tabs">
                                        <li class="nav-item">
                                            <a href="#comments" data-bs-toggle="tab"
                                               class="nav-link active show">评论</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="comments" class="tab-pane fade active show">
                                            <div class="my-post-content pt-3">
                                            </div>
                                            <div id="comments_list">
                                                <%--                                                <div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">--%>
                                                <%--                                                    <div class="user-bx-2 me-3 mb-3">--%>
                                                <%--                                                        <img src="/upload/house_image/GH1705405506092.png"--%>
                                                <%--                                                             class="rounded-circle" alt="">--%>
                                                <%--                                                        <div>--%>
                                                <%--                                                            <h3 class="fs-20 font-w700">hubert</h3>--%>
                                                <%--                                                            <span class="font-w400 text-muted fs-12">2024-01-16 23:32:30</span>--%>
                                                <%--                                                        </div>--%>
                                                <%--                                                    </div>--%>
                                                <%--                                                    <div class="user-bx-2 d-flex flex-column"--%>
                                                <%--                                                         style="flex: 0.9; align-items: flex-start;">--%>
                                                <%--                                                        <div class="mb-2 row">--%>
                                                <%--                                                            <ul class="stars col-sm-9 float-left" id="stars_0">--%>
                                                <%--                                                                <li class="me-2" data-score="1"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li class="me-2" data-score="2"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li class="me-2" data-score="3"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li class="me-2" data-score="4"><i--%>
                                                <%--                                                                        class="fa fa-star"></i></li>--%>
                                                <%--                                                                <li data-score="5"><i class="fa fa-star"></i></li>--%>
                                                <%--                                                            </ul>--%>
                                                <%--                                                        </div>--%>
                                                <%--                                                        <p class="me-2 mb-2 fs-16 row">--%>
                                                <%--                                                            aaaaaaaa--%>
                                                <%--                                                        </p>--%>
                                                <%--                                                    </div>--%>
                                                <%--                                                </div>--%>
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

    <%--  footer start  --%>
    <%@include file="/frame/frame_footer.jsp" %>
    <%--  footer end  --%>
</div>
<%--  script start  --%>

<%@include file="/frame/frame_javascript.jsp" %>
<script type="text/javascript">
    function onloadFunction() {
        // 获取所有评论信息
        $.ajaxSettings.async = false;
        $.post(
            "<%=Config.getInstance().getString("default.urlheader")%>/order_comment",
            {
                "type": "room",
                "action": "get_comment",
                "house_id": getParam("house_id"),
                "room_id": getParam("room_id")
            },
            (res) => {
                console.log(res.resCode);
                if (res.resCode === "00000") {
                    var html = "";
                    var comments = res.comments;
                    console.log(comments);
                    if (comments !== undefined && comments !== null) {
                        for (var i = 0; i < comments.length; i++) {
                            var comment = comments[i];
                            html += `<div class="card-body pb-3 transaction-details d-flex flex-wrap justify-content-between align-items-center">`;
                            html += `    <div class="user-bx-2 me-3 mb-3">`;
                            html += `        <img src="\${comment.avatar}"`;
                            html += `             class="rounded-circle" alt="">`;
                            html += `            <div>`;
                            html += `                <h3 class="fs-20 font-w700">\${comment.user_id}</h3>`;
                            html += `                <span class="font-w400 text-muted fs-12">\${comment.create_time}</span>`;
                            html += `            </div>`;
                            html += `    </div>`;
                            html += `    <div class="user-bx-2 d-flex flex-column"`;
                            html += `         style="flex: 0.9; align-items: flex-start;">`;
                            html += `        <div class="mb-2 row">`;
                            html += `            <ul class="stars col-sm-9 float-left" id="stars_\${i}">`;
                            html += `                <li class="me-2" data-score="1"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li class="me-2" data-score="2"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li class="me-2" data-score="3"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li class="me-2" data-score="4"><i`;
                            html += `                    class="fa fa-star"></i></li>`;
                            html += `                <li data-score="5"><i class="fa fa-star"></i></li>`;
                            html += `            </ul>`;
                            html += `        </div>`;
                            html += `        <p class="me-2 mb-2 fs-16 row">`;
                            html += `            \${comment.comment}`;
                            html += `        </p>`;
                            html += `    </div>`;
                            html += `</div>`;
                        }
                        $("#comments_list").html(html);
                        for (var i = 0; i < comments.length; i++) {
                            var comment = comments[i];
                            setStars(Number(comment.score), i);
                        }
                    }
                }
            }
        )
        $.ajaxSettings.async = true;
    }

    function getParam(key) {
        var re = new RegExp(`\${key}=\\w+`);
        var url = window.location.href;
        var value = url.match(re)[0].split("=")[1];
        return value;
    }

    function setStars(score, id) {
        var stars = document.querySelectorAll(`#stars_\${id} > li`);
        for (var j = 0; j < 5; j++) {
            var t_star = stars[j];
            var t_score = t_star.dataset.score;
            if (t_score <= score) {
                t_star.style.color = "orange";
            } else {
                t_star.style.color = "black";
            }
        }
    }
</script>
<%--  script end  --%>
</body>
</html>