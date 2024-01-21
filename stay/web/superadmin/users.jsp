<%@ page import="homestay.bean.UserBean" %>
<%@ page import="java.util.List" %>
<%@ page import="homestay.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
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
    <!-- 在<head>标签中添加以下链接 -->


    <!-- PAGE TITLE HERE -->
    <title>Invome Admin Dashboard</title>

    <!-- FAVICONS ICON -->
    <!-- 在<head>标签中添加以下链接 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="shortcut icon" type="image/png" href="images/favicon.png"/>
    <link href="./vendor/jquery-nice-select/css/nice-select.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    <head>
        <title>User Management</title>
        <style>
            body {
                font-family: 'Arial', sans-serif;
                background-color: #f4f4f4;
                margin: 20px;
            }

            .container {
                max-width: 800px;
                margin: 0 auto;
            }

            .content-body {
                background: linear-gradient(to right, #f0f0f0, #ffffff);
            }

            .new-user-container,
            .search-container {
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                background-color: #ffffff; /* 设置为白色 */
            }

            .new-user-container button {
                background-color: #007bff;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
                transition: background-color 0.3s ease;
            }

            .new-user-container button:hover {
                background-color: #0056b3;
                color: #fff;
            }

            .new-user-container button:first-child {
                background-color: #007bff;
                border: none; /* 移除边框 */
                border-radius: 4px; /* 添加圆角 */
                padding: 10px 20px; /* 调整按钮内边距 */
                transition: background-color 0.3s ease, color 0.3s ease; /* 添加过渡效果 */
            }

            .new-user-container button:first-child:hover {
                /* background-image: linear-gradient(to top, #96fbc4 0%, #f9f586 100%); */
                background-color: #0056b3; /* 将颜色设置为深蓝色 */
                color: #fff; /* 修改悬停时的文本颜色 */
            }

            /* 添加悬停效果至所有按钮 */
            button:hover,
            .submit-button:hover,
            .edit-button:hover,
            .delete-button:hover {
                background-color: #0056b3;
            }

            label {
                font-weight: bold;
                display: block;
                margin-bottom: 8px;
            }

            input[type="text"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ced4da;
                border-radius: 4px;
                box-sizing: border-box;
            }

            table {
                border-collapse: collapse;
                width: 100%;
                margin-top: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                background-color: #fff;
            }

            th,
            td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                border-right: 1px solid #ddd;
            }

            th:last-child,
            td:last-child {
                border-right: none;
            }

            th {
                background-color: #0ebb51;
                color: white;
            }

            tr:hover {
                background-color: #f5f5f5;
            }

            a {
                text-decoration: none;
                color: #007BFF;
            }

            a:hover {
                text-decoration: underline;
            }

            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0, 0, 0, 0.4);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 60%;
                border-radius: 8px;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
            }

            .form-input {
                margin-bottom: 15px;
            }

            select,
            input[type="text"],
            input[type="submit"] {
                padding: 10px;
                width: calc(100% - 22px);
                box-sizing: border-box;
                border: 1px solid #ced4da;
                border-radius: 4px;
            }

            select {
                width: 100%;
            }

            .submit-button {
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .submit-button:hover {
                background-color: #0056b3;
            }

            .edit-button,
            .delete-button {
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .edit-button {
                background-color: #4CAF50;
                color: white;
                margin-right: 5px;
            }

            .delete-button {
                background-color: #f44336;
                color: white;
            }
        </style>

    </head>
</head>
<body>

<!--*******************
    Preloader start
********************-->
<%@ include file="/frame/frame_preloader.jsp" %>
<!--*******************
    Preloader end
********************-->

<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <!--**********************************
        menu start
    ***********************************-->
    <%@ include file="/frame/frame_menu.jsp" %>
    <!--**********************************
        menu end
    ***********************************-->

    <div class="content-body">
        <div class="container-fluid">
            <%--            <div class="new-user-container">--%>
            <%--                <h2><a href="#" onclick="openNewUserModal()">新建用户</a></h2>--%>
            <%--            </div>--%>

            <div class="search-container">
                <label for="searchInput">按user_id搜索：</label>
                <div class="input-group">
                    <input type="text" id="searchInput" class="form-control" placeholder="输入user_id">
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button" onclick="searchUsers()">搜索</button>
                    </div>
                </div>
            </div>
            <div class="new-user-container">
                <button onclick="openNewUserModal()">新建用户</button>
                <button onclick="printTableData()">打印表格数据</button>
                <button id="export_btn" onclick="exportData()">导出数据</button>
                <a href="" style="display: none" id="export_users_url"></a>
                <button id="statistics_btn" onclick="statistics()">统计数据</button>
            </div>
            <%--            <div class="new-user-container">--%>
            <%--            </div>--%>
            <br>
            <table border="1">
                <tr>
                    <th onclick="sortTable(0)">user_id <i class="fas fa-sort"></i></th>
                    <th onclick="sortTable(1)">user_password <i class="fas fa-sort"></i></th>
                    <th onclick="sortTable(2)">email <i class="fas fa-sort"></i></th>
                    <th onclick="sortTable(3)">permission <i class="fas fa-sort"></i></th>
                    <%--                    <th onclick="sortTable(4)">priority <i class="fas fa-sort"></i></th>--%>
                    <th>操作</th>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td>${user.user_id}</td>
                        <td>${user.user_password}</td>
                        <td>${user.email}</td>
                        <td>${user.permission}</td>
                            <%--                        <td>${user.priority}</td>--%>
                        <td>
                            <button class="edit-button"
                                    onclick="openModal('${user.user_id}', '${user.user_password}', '${user.email}', '${user.permission}')">
                                修改
                            </button>
                            <button class="delete-button" onclick="deleteUser('${user.user_id}')">删除</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <!-- 用于创建新用户的弹窗部分 -->


            <div id="newUserModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeNewUserModal()">&times;</span>
                    <h2>新建用户</h2>
                    <form action="addUser" method="get">
                        <div class="form-input">
                            <label for="user_id">姓名：</label>
                            <input type="text" name="user_id" id="user_id">
                        </div>
                        <div class="form-input">
                            <label for="user_password">密码：</label>
                            <input type="text" name="user_password" id="user_password">
                        </div>
                        <div class="form-input">
                            <label for="email">邮箱：</label>
                            <input type="text" name="email" id="email">
                        </div>
                        <div class="form-input">
                            <label for="permission">权限：</label>
                            <select name="permission" id="permission">
                                <option value="high">高级权限</option>
                                <option value="middle">中级权限</option>
                                <option value="low">低级权限</option>
                            </select>
                        </div>
                        <%--                        <div class="form-input">--%>
                        <%--                            <label for="priority">xxx：</label>--%>
                        <%--                            <input type="text" name="priority" id="priority">--%>
                        <%--                        </div>--%>
                        <input type="submit" value="提交" class="submit-button">
                    </form>
                </div>
            </div>

            <!-- 修改用户 Modal -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="closeModal()">&times;</span>
                    <h2>修改用户</h2>
                    <form action="/superadmin/updateUser" method="get" id="modify_form">
                        <div class="form-input">用户ID：<input type="text" name="user_id" readonly id="modal_user_id">
                        </div>
                        <div class="form-input">新密码：<input type="text" name="user_password" id="modal_user_password">
                        </div>
                        <div class="form-input">新邮箱：<input type="text" name="email" id="modal_email"></div>
                        <div class="form-input">
                            新权限：
                            <select name="permission" id="modal_permission">
                                <option value="high">高级权限: high</option>
                                <option value="middle">中级权限: middle</option>
                                <option value="low">低级权限: low</option>
                            </select>
                        </div>
                        <%--                        <div class="form-input">新 priority：<input type="text" name="priority" id="modal_priority"></div>--%>
                        <input type="submit" value="提交" class="submit-button">
                    </form>
                </div>
            </div>

            <%--  footer start  --%>
            <%@include file="/frame/frame_footer.jsp" %>
            <%--  footer end  --%>
        </div>
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->
</body>
<script defer>
    document.addEventListener("DOMContentLoaded", function () {
        // 在这里调用获取和显示数据的函数
        searchUsers();
    });

    $(document).ready(function () {
        // 在这里调用获取和显示数据的函数
        searchUsers();
    });

    function openNewUserModal() {
        document.getElementById("newUserModal").style.display = "block";
    }

    // 用于关闭创建新用户弹窗的功能
    function closeNewUserModal() {
        document.getElementById("newUserModal").style.display = "none";
    }

    function openModal(userId, userPassword, email, permission, priority) {
        document.getElementById("modal_user_id").value = userId;
        document.getElementById("modal_user_password").value = userPassword;
        document.getElementById("modal_email").value = email;
        document.getElementById("modal_permission").value = permission;
        // document.getElementById("modal_priority").value = priority;

        // 在模态框打开时检查 permission 的值
        checkPermission(permission);

        document.getElementById("myModal").style.display = "block";

        // 在打开模态框时检查是否禁用删除按钮
        checkDeleteButton(permission);
    }

    function checkPermission(permission) {
        // 获取 permission 对应的表单元素
        var permissionField = document.getElementById("modal_permission");

        // 如果 permission 是 "superhigh"，禁用相关表单元素
        if (permission === "superhigh") {
            permissionField.disabled = true;
            // 可以选择隐藏相关表单元素
            // permissionField.style.display = "none";
        } else {
            // 如果 permission 不是 "superhigh"，启用表单元素
            permissionField.disabled = false;
            // 可以选择显示相关表单元素
            // permissionField.style.display = "block";
        }
    }

    function checkDeleteButton(permission) {
        // 获取删除按钮
        var deleteButton = document.querySelector(".delete-button");

        // 如果 permission 是 "superhigh"，禁用删除按钮
        if (permission === "superhigh") {
            deleteButton.disabled = true;
            // 可以选择隐藏删除按钮
            // deleteButton.style.display = "none";
        } else {
            // 如果 permission 不是 "superhigh"，启用删除按钮
            deleteButton.disabled = false;
            // 可以选择显示删除按钮
            // deleteButton.style.display = "block";
        }
    }

    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    document.querySelector("#modify_button").onclick = (e) => {
        document.querySelector("#modify_form").submit();
        setTimeout(() => {
            location.reload();
        }, 1000);
    }

    function searchUsers() {
        var searchValue = document.getElementById("searchInput").value;
        var searchUrl = "/searchUser?user_id=" + searchValue;

        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    var users = JSON.parse(xhr.responseText);
                    var table = document.querySelector("table");
                    table.innerHTML = ""; // 清除现有行

                    // 创建表头行
                    var headerRow = table.insertRow(0);
                    var headerCells = ["user_id", "user_password", "email", "permission", "操作"];
                    for (var i = 0; i < headerCells.length; i++) {
                        var headerCell = document.createElement("th");
                        headerCell.innerHTML = headerCells[i] + ' <i class="fas fa-sort"></i>';
                        headerCell.onclick = function () {
                            sortTable(i);
                        };
                        headerRow.appendChild(headerCell);
                    }

                    // 用搜索结果填充表格
                    for (var i = 0; i < users.length; i++) {
                        var user = users[i];
                        var row = table.insertRow(i + 1);

                        // 在表格单元格中填充数据
                        var userIdCell = row.insertCell(0);
                        userIdCell.innerHTML = user.user_id;

                        var userPasswordCell = row.insertCell(1);
                        userPasswordCell.innerHTML = user.user_password;

                        var emailCell = row.insertCell(2);
                        emailCell.innerHTML = user.email;

                        var permissionCell = row.insertCell(3);
                        permissionCell.innerHTML = user.permission;

                        // 添加适当的操作按钮或链接
                        var operationCell = row.insertCell(4);
                        if (user.permission !== 'superhigh') {
                            var editButton = document.createElement("button");
                            editButton.innerHTML = "修改";
                            editButton.className = "edit-button";
                            editButton.onclick = function () {
                                openModal(user.user_id, user.user_password, user.email, user.permission);
                            };
                            operationCell.appendChild(editButton);

                            var deleteButton = document.createElement("button");
                            deleteButton.innerHTML = "删除";
                            deleteButton.className = "delete-button";
                            deleteButton.onclick = function () {
                                deleteUser(user.user_id);
                            };
                            operationCell.appendChild(deleteButton);
                        } else {
                            // 如果permission为'superhigh'，您可以选择隐藏按钮或显示消息
                            operationCell.innerHTML = "禁止操作";
                        }
                    }
                } else {
                    console.error("获取搜索结果失败。状态：" + xhr.status);
                }
            }
        };
        xhr.open("GET", searchUrl, true);
        xhr.send();
    }

    function sortTable(columnIndex) {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.querySelector("table");
        switching = true;

        while (switching) {
            switching = false;
            rows = table.rows;

            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("td")[columnIndex];
                y = rows[i + 1].getElementsByTagName("td")[columnIndex];

                // 根据权限的高、中、低进行排序
                if (columnIndex === 3) {
                    var xValue = getPermissionValue(x.innerHTML);
                    var yValue = getPermissionValue(y.innerHTML);

                    if (xValue > yValue) {
                        shouldSwitch = true;
                        break;
                    }
                } else {
                    // 对于其他列，按字母顺序排序
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }

            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }
    }

    function getPermissionValue(permission) {
        // 定义权限的排序顺序
        var order = {'low': 1, 'middle': 2, 'high': 3};

        // 返回权限的排序值
        return order[permission.toLowerCase()] || 0;
    }


    function deleteUser(userId) {
        // 假设你想要确认删除，你可以使用 `confirm` 函数
        var isConfirmed = confirm("确定要删除该用户吗？");

        // 如果用户确认删除，继续删除流程
        if (isConfirmed) {
            // 构造用于删除用户的URL（根据你的应用程序调整URL）
            var deleteUrl = "deleteUser?user_id=" + userId;

            // 发送用于删除用户的AJAX请求
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        // 假设删除成功，你可能根据你的应用逻辑进行处理
                        console.log("用户删除成功");

                        // 删除成功后重新加载页面或更新用户列表
                        location.reload();
                    } else {
                        console.error("用户删除失败。状态：" + xhr.status);
                        // 根据应用程序的要求适当处理错误
                    }
                }
            };
            xhr.open("GET", deleteUrl, true);
            xhr.send();
        }
    }

    function printTableData() {
        var table = document.querySelector("table"); // 获取表格元素
        var rows = table.rows; // 获取表格的所有行
        var printWindow = window.open('', '_blank');
        var data = '<html><head><title>Print Table</title>';

        // 添加CSS样式
        data += '<style>' +
            'table {width: 100%; border-collapse: collapse;}' +
            'th, td {border: 1px solid black; padding: 10px;}' +
            'th {background-color: #f0f0f0;}' +
            '</style>';

        data += '</head><body>';
        data += '<table>'; // 创建新的表格

        // 遍历每一行，获取每一行的数据
        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].cells; // 获取当前行的所有单元格
            data += '<tr>';
            // 遍历每一个单元格，获取单元格的数据
            for (var j = 0; j < cells.length; j++) {
                // 如果单元格不是 user_password, priority 或 操作 列，则添加到打印数据中
                if (j !== 1 && j !== 4 && j !== 5) { // 假设 user_password 是第二列，priority 是第五列，操作是第六列
                    data += '<td>' + cells[j].innerText + '</td>';
                }
            }
            data += '</tr>';
        }

        data += '</table></body></html>'; // 结束表格标签

        printWindow.document.write(data); // 写入数据
        printWindow.document.close(); // 关闭文档
        printWindow.print(); // 打印数据
    }

    // 排序功能
    function sortTable(n) {
        var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
        table = document.querySelector("table");
        switching = true;
        dir = "asc";
        while (switching) {
            switching = false;
            rows = table.rows;
            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = rows[i].getElementsByTagName("TD")[n];
                y = rows[i + 1].getElementsByTagName("TD")[n];
                if (dir == "asc") {
                    if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                } else if (dir == "desc") {
                    if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }
            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
                switchcount++;
            } else {
                if (switchcount == 0 && dir == "asc") {
                    dir = "desc";
                    switching = true;
                }
            }
        }
    }

</script>

<script defer>
    function exportData() {
        $.get('/exportUsers', res => {
            $('#export_users_url').attr('href', res.url);
            $('#export_users_url').attr('download', 'allusers.json');
            document.getElementById('export_users_url').click();
        })
    }

    function statistics() {
        window.location.href = '/superadmin/statistics.jsp'
    }
</script>


<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="./js/custom.min.js"></script>
<script src="./js/dlabnav-init.js"></script>
<script src="./js/demo.js"></script>
<script src="./../assets/js/utils/throttle.js"></script>
<script src="./../assets/js/utils/debounce.js"></script>
<script src="./js/styleSwitcher.js"></script>


</html>