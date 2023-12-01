<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/1
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="./frame_style.jsp" %>
</head>
<body>

<%--  preloader start  --%>
<%@include file="frame_preloader.jsp"%>
<%--  preloader end  --%>
<div id="main-warpper">
    <%--  top-menu start  --%>
    <%@include file="frame_topmenu.jsp"%>
    <%--  top-menu end  --%>

    <%--  slider start  --%>
    <%@include file="frame_slider.jsp"%>
    <%--  slider end  --%>

        <div class="content-body">

        </div>
</div>
<%--  script start  --%>
<%@include file="frame_javascript.jsp"%>
<%--  script end  --%>
</body>
</html>
