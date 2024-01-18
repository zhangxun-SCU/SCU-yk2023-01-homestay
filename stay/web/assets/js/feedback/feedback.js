function onLoadFunction() {
    getAllFeedbacks();
}

function getAllFeedbacks() {
    var url = "/feedback";
    var data = {
        "actionType": "feedback",
        "action": "get_feedback"
    };
    $.ajaxSettings.async = false;
    $.post(
        url,
        data,
        (res) => {
            console.log(res);
            console.log(res.resCode);
            if (res.resCode === "00000") {
                var feedbackList = res.feedbackList;
                var html = "";
                for (var i = 0; i < feedbackList.length; i++) {
                    var feedback = feedbackList[i];
                    var time = new Date(feedback.feedback_time);
                    time = time.toDateString();
                    html += `<div class="media pt-3 pb-3">`;
                    html += `    <img src="${feedback.avatar}" alt="${feedback.user_id}"`;
                    html += `         class="me-3 rounded" width="75">`;
                    html += `        <div class="media-body">`;
                    html += `            <h5 class="m-b-5">`;
                    html += `                ${feedback.user_id} <i class="invisible">&nbsp;</i><small class="text-light ml-2">${time}</small>`;
                    html += `            </h5>`;
                    html += `            <p class="mb-0 text-muted">`;
                    html += `                ${feedback.feedback}`;
                    html += `            </p>`;
                    html += `        </div>`;
                    html += `        <button class="btn btn-md btn-primary reply_button" data-id="${feedback.fid}">`;
                    html += `            <i class="fa fa-comment me-2"></i>`;
                    html += `            回复反馈`;
                    html += `        </button>`;
                    html += `</div>`;
                }
                $("#feedback_list").html(html);
            }
        }
    )
    $.ajaxSettings.async = true;
    initFeedbackButtons();
}

function initFeedbackButtons() {
    $(".reply_button").click((e) => {
        var fid = e.target.dataset.id;
        showReplyModal(fid);
    })
}

function showReplyModal(fid) {
    console.log(fid);
    getReply(fid);
    $("#replyModal #replyConfirmButton").click((e) => {
        var reply = $("#reply").val();
        var url = "/feedback";
        var data = {
            "actionType": "feedback",
            "action": "reply_feedback",
            "fid": fid,
            "reply": reply
        };
        console.log(data);
        $.post(
            url,
            data,
            (res) => {
                console.log(res.resCode);
                if (res.resCode === "00000") {
                    swal("回复成功！",
                        "",
                        "success");
                    $("#replyModal").modal("hide");
                }
            }
        )
    })
    $("#replyModal").modal("show");
}

function getReply(fid) {
    var url = "/feedback";
    var data = {
        "actionType": "feedback",
        "action": "get_feedback",
        "fid": fid
    };
    $.ajaxSettings.async = false;
    $.post(
        url,
        data,
        (res) => {
            console.log(res.resCode);
            if (res.resCode === "00000") {
                var feedback = res.feedbackList[0];
                if (feedback.reply !== undefined && feedback.reply !== null && feedback.reply !== "") {
                    document.querySelector("#reply").innerText = feedback.reply;
                }else{
                    document.querySelector("#reply").innerText = "请填写反馈内容...";
                }
            }
        }
    )
    $.ajaxSettings.async = true;
}