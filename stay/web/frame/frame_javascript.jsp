<%@ page import="homestay.utils.Config" %><%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/1
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>

<script src="../assets/js/utils/storage.js"></script>
<script>
    function getUserInfo() {
        const token = getCookie("token")
        return JSON.parse(window.atob(token.split('.')[1]))
    }

    $('#to-profile').attr('href', '/user/user-profile.jsp?id=' + getUserInfo().id)

    const urlStorage = new Storage("localStorage");
    urlStorage.set("url", '<%=Config.getInstance().getString("default.urlheader")%>');
    function getUrlHead() {
        return urlStorage.get("url");
    }
</script>
<script>
    /**
     * top menu slider
     */

</script>
