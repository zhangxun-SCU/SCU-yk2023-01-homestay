<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/9
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="modifyHomestayModelCenter">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">修改民宿信息</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">民宿名称</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               placeholder="..."
                               id="modify_homestay_name"
                               name="modify_homestay_name">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">地址</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               placeholder="..."
                               id="modify_location"
                               name="modify_location">
                    </div>
                </div>
                <div class="mb-3 row clearfix">
                    <div class="mb-3 col-md-12">
                        <label class="col-form-label-lg">民宿</label>
                        <div class="col-sm-12">
                            <input type="file" class="form-control"
                                   accept="image/*"
                                   id="modify_homestay_image"
                                   name="modify_homestay_image">
                            <label for="modify_homestay_image"
                                   id="modify_homestay_image_preview">
                                <i class="fa fa-plus"></i>
                                <img src="" alt="">
                            </label>
                        </div>
                    </div>
                </div>
                <div class="mb-3 row" style="display: none">
                    <label class="col-sm-3 col-form-label-lg">经纬度</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               placeholder="..."
                               id="modify_lnglat"
                               name="modify_lnglat"
                               readonly="readonly">
                    </div>
                </div>
                <div class="mb-3 row clearfix" style="display: none">
                    <div class="mb-3 col-md-12">
                        <label class="col-form-label-lg">地图</label>
                        <div class="col-sm-12" id="map_container">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="modifyHomestayConfirmButton">提交修改</button>
            </div>
        </div>
    </div>
</div>
