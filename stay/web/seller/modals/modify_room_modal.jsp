<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2023/12/15
  Time: 20:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #modify_room_image {
        display: none;
    }

    #modify_room_image_preview {
        position: relative;
        width: 200px;
        height: 200px;
        background-color: #d5d5d5;
        margin-right: 10px;
        margin-bottom: 0 !important;
    }

    #modify_room_image_preview > i {
        position: absolute;
        left: 50%;
        margin-left: -85px;
        top: 50%;
        margin-top: -90px;
        color: #EEEEEE;
        font-size: 180px;
        cursor: pointer;
    }

    #modify_room_image_preview > img[src=""] {
        display: none;
    }

    #modify_room_image_preview > img {
        position: absolute;
        width: 100%;
        height: 100%;
        z-index: 100;
    }
</style>
<!-- Modal -->
<div class="modal fade" id="modifyRoomModelCenter">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">修改房间</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">房间类型</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               id="modify_room_name"
                               name="modify_room_name">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">价格</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               id="modify_room_price"
                               name="modify_room_price">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">数量</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control border-light"
                               id="modify_room_num"
                               name="modify_room_num">
                    </div>
                </div>
                <div class="mb-3 row clearfix">
                    <div class="mb-3 col-md-12">
                        <label class="col-form-label-lg">房间图片</label>
                        <div class="col-sm-12">
                            <input type="file" class="form-control"
                                   accept="image/*"
                                   id="modify_room_image"
                                   name="modify_room_image">
                            <label for="modify_room_image"
                                   id="modify_room_image_preview">
                                <i class="fa fa-plus"></i>
                                <img src="" alt="">
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="modifyRoomConfirmButton">提交修改</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    document.querySelector("#modify_room_image").addEventListener("change", (input_event) => {
        var file = input_event.target.files[0];
        if (file !== undefined && file !== null) {
            var reader = new FileReader();
            reader.addEventListener("load", (reader_event) => {
                document.querySelector("#modify_room_image_preview > img").src = reader_event.target.result;
            })
            reader.readAsDataURL(file);
            document.querySelector("#modify_room_image").value = "";
        }
    })
</script>