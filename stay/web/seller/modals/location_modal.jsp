<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/4
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal -->
<div class="modal fade" id="locationModalCenter" onload="initMap();">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">获取地址</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">地址</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               value="北京市天安门"
                               id="input_location"
                               name="input_location">
                        <button type="button" class="btn btn-primary mt-3"
                                id="geo"
                                name="geo">
                            获取地址
                        </button>
                    </div>
                </div>
                <div class="mb-3 row clearfix">
                    <div class="mb-3 col-md-12">
                        <label class="col-form-label-lg">地图</label>
                        <div class="col-sm-12" id="map_container">
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">确定</button>
            </div>
        </div>
    </div>
</div>
