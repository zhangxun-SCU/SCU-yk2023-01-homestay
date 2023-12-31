<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade draggable-modal" id="record_download_div" name="record_download_div" tabindex="-1" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">下载订单</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body form">
                    <form class="form-horizontal" role="form">
                        <div class="form-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">下载链接</label>
                                <div class="col-md-9">
                                    <span><a href="" id="download_url" name="download_url">点击下载</a></span>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn default" data-dismiss="modal">取消</button>
                <button type="button" class="btn blue" id="submit_button" name="submit_button">确认修改</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script src="/assets/vendor/global/global.min.js"></script>
<script src="/assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="/assets/js/custom.min.js"></script>
<script src="/assets/js/dlabnav-init.js"></script>
<script src="/assets/js/demo.js"></script>
<script>
    function getUserInfo() {
        const token = getCookie("token")
        return JSON.parse(window.atob(token.split('.')[1]))
    }
</script>
<script>
    /**
     * top menu slider
     */

    $('#to-profile').attr('href', `/user/user-profile.jsp?id=\${getUserInfo().id}`);
</script>
