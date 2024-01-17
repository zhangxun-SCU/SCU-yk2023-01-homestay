<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/16
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="replyModal">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">回复反馈</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form>
                    <textarea class="form-control" rows="4"
                              id="reply"
                              name="reply">回复内容...</textarea>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary sweet-success" id="replyConfirmButton">回复</button>
            </div>
        </div>
    </div>
</div>

