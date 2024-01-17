<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade draggable-modal" id="feedback_add_div" name="feedback_add_div" tabindex="-1" role="basic"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">添加一条反馈记录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">用户ID</label>
                            <div class="col-md-9">
                                <input type="text" id="user_id" name="user_id" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">反馈内容</label>
                            <div class="col-md-9">
                                <input type="text" id="feedback" name="feedback" class="form-control"
                                       placeholder="Enter text">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="submit_button" name="submit_button">确认反馈</button>
            </div>
        </div>
        <!-- /.modal-content -->

    </div>
    <!-- /.modal-dialog -->
</div>
<input type="hidden" id="page_id" name="page_id" value="weather_add">