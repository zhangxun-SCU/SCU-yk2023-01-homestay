<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/15
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="deleteRoomModalCenter">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">提示</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <p>
                    是否确定删除这间房间？
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="deleteRoomConfirmButton">确认</button>
            </div>
        </div>
    </div>
</div>