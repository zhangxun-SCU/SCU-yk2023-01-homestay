<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/1
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="./../assets/vendor/global/global.min.js"></script>
<script src="./../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="./../assets/js/custom.min.js"></script>
<script src="./../assets/js/dlabnav-init.js"></script>
<script src="./../assets/js/demo.js"></script>
<script src="./../assets/js/styleSwitcher.js"></script>
<script src="./../assets/js/utils/storage.js"></script>
<script>
    const storage = new Storage();
    const userInfo = storage.get("user_info");
    $('#user_id').text(userInfo.id);
    console.log(userInfo)
    $('#to-profile').on('click', (event) => {
        event.preventDefault();
        // 请求
        $.get(`/profile?id=\${userInfo.id}`, () => {

        })
    })
</script>
