<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/11/30
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="modifySpecialtyModelCenter">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">修改商品</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">商品名称</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               id="modify_specialty_name"
                               name="modify_specialty_name">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">价格</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               id="modify_specialty_price"
                               name="modify_specialty_price">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">数量</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               id="modify_specialty_num"
                               name="modify_specialty_num">
                    </div>
                </div>
                <div class="mb-3 row clearfix">
                    <div class="mb-3 col-md-12">
                        <label class="col-form-label-lg">商品图片</label>
                        <div class="col-sm-12">
                            <input type="file" class="form-control"
                                   accept="image/*"
                                   id="modify_specialty_image"
                                   name="modify_specialty_image">
                            <label for="modify_specialty_image"
                                   id="modify_specialty_image_preview">
                                <i class="fa fa-plus"></i>
                                <img src="" alt="">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="modifySpecialtyConfirmButton">提交修改</button>
            </div>
        </div>
    </div>
</div>
