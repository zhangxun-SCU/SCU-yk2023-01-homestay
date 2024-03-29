<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade draggable-modal" id="weather_modify_div" name="weather_modify_div" tabindex="-1" role="basic"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">修改天气数据</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="col-md-3 control-label">ID</label>
                            <div class="col-md-9">
                                <input type="text" id="id" name="id" class="form-control"
                                       placeholder="Enter text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">城市</label>
                            <div class="col-md-9">
                                <input type="text" id="city" name="city" class="form-control"
                                       placeholder="Enter text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">温度</label>
                            <div class="col-md-9">
                                <input type="text" id="temperature" name="temperature" class="form-control"
                                       placeholder="Enter text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">天气</label>
                            <div class="col-md-9">
                                <input type="text" id="weather_type" name="weather_type" class="form-control"
                                       placeholder="Enter text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">风力</label>
                            <div class="col-md-9">
                                <input type="text" id="wind" name="wind" class="form-control"
                                       placeholder="Enter text">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">湿度</label>
                            <div class="col-md-9">
                                <input type="text" id="humidity" name="humidity" class="form-control"
                                       placeholder="Enter text">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="submit_button" name="submit_button">确认修改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
