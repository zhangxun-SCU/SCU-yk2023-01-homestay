<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="addUser" method="get">
    姓名：<input type="text" name="user_id"><br>
    密码：<input type="text" name="user_password"><br>
    邮箱：<input type="text" name="email"><br>
    权限：
    <select name="permission">
        <option value="high">高级权限</option>
        <option value="middle">中级权限</option>
        <option value="low">低级权限</option>
    </select><br>
    xxx：<input type="text" name="priority"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>