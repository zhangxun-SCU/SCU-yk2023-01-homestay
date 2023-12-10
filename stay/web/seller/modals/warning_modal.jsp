<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/4
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="warningModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    function showWarningModal(msg) {
        console.log("show warning modal");
        $("#warningModal div.modal-body").html(msg);
        $("#warningModal").modal("show");
    }
</script>