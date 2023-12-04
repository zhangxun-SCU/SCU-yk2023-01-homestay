<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/1
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="/frame/frame_style.jsp" %>
</head>
<body>

<%--  preloader start  --%>
<%@include file="/frame/frame_preloader.jsp" %>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  top-menu start  --%>
    <%@include file="/frame/frame_topmenu.jsp" %>
    <%--  top-menu end  --%>

    <%--  slider start  --%>
    <%@include file="/frame/frame_slider.jsp" %>
    <%--  slider end  --%>

    <div class="content-body">

    </div>

    <%--  footer start  --%>
    <%@include file="/frame/frame_footer.jsp" %>
    <%--  footer end  --%>
</div>
<%--  script start  --%>
<%@include file="/frame/frame_javascript.jsp" %>
<%--  script end  --%>
</body>
</html>
