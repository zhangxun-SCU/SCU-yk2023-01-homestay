<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade draggable-modal" id="record_modify_seller_div" name="record_modify_seller_div" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">订单信息修改</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body form">
                    <form class="form-horizontal" role="form">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">订单ID</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" placeholder="Enter text" id="order_id" name="id">
                                    <span class="help-block">
											请填写 </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">商品ID</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" placeholder="Enter text" id="good_id" name="good_id">
                                    <span class="help-block">
											请填写 </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">商品名称</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" placeholder="Enter text" id="specialty_name" name="specialty_name">
                                    <span class="help-block">
											请填写 </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">单价</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" placeholder="Enter text" id="per_price" name="per_price">
                                    <span class="help-block">
											请填写要修改的订单</span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="submit_button_seller" name="submit_button_seller">确认修改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
