<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2024/1/19
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    div#map_container {
        height: 400px;
    }
</style>
<!-- Modal -->
<div class="modal fade" id="locationModalCenter">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">详细地址</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <div class="mb-3 col-md-12">
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
