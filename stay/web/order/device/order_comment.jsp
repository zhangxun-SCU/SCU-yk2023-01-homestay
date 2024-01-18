<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .stars {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .stars > li {
        float: left;
    }
</style>

<div class="modal fade" id="order_comment_div">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">评价订单</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">评分</label>
                    <ul class="stars col-sm-9 float-left">
                        <li class="me-2" data-score="1"><i class="fa fa-star"></i></li>
                        <li class="me-2" data-score="2"><i class="fa fa-star"></i></li>
                        <li class="me-2" data-score="3"><i class="fa fa-star"></i></li>
                        <li class="me-2" data-score="4"><i class="fa fa-star"></i></li>
                        <li data-score="5"><i class="fa fa-star"></i></li>
                    </ul>
                    <input type="hidden" value="0" id="comment_score">
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-3 col-form-label-lg">评价</label>
                    <div class="col-sm-9">
                        <form>
                        <textarea class="form-control" rows="5"
                                  id="comment_description"
                                  name="comment_description"
                                  placeholder="请留下你的评价..."></textarea>
                        </form>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger light" data-bs-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary sweet-success" id="submit_order_comment">提交修改</button>
            </div>
        </div>
    </div>
</div>
