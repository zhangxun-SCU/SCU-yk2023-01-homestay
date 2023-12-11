<%@ page import="homestay.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%User user= (User) request.getAttribute("user");%>
</head>
<body>
<form action="updateUser" method="get">
    要修改用户的id：<input type="text" name="user_id" readonly value="<%=user.getUser_id()%>"><br>
    新密码：<input type="text" name="user_password" value="<%=user.getUser_password()%>"><br>
    新邮箱：<input type="text" name="email" value="<%=user.getEmail()%>"><br>
    新权限：<input type="text" name="permission" value="<%=user.getPermission()%>"><br>
    新pp：<input type="text" name="priority" value="<%=user.getPriority()%>"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>

