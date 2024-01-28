<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade draggable-modal" id="weather_view_div" name="weather_view_div" tabindex="-1" role="basic"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">详细天气数据</h4>
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
                                >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">天气</label>
                            <div class="col-md-9">
                                <input type="text" id="weather_type" name="weather_type" class="form-control"
                                       >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">风力</label>
                            <div class="col-md-9">
                                <input type="text" id="wind" name="wind" class="form-control"
                                       >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">湿度</label>
                            <div class="col-md-9">
                                <input type="text" id="humidity" name="humidity" class="form-control"
                                       >
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">返回</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

