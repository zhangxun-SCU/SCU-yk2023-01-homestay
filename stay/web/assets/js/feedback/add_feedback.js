document.domain = "localhost";
/*================================================================================*/
jQuery(document).ready(function () {
    // initiate layout and plugins
    Page.init();
});
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里
var Page = (function () {
    /*----------------------------------------入口函数  开始----------------------------------------*/
    var initPageControl = function () {
        pageId = $("#page_id").val();
        if (pageId === "feedback_list") {
            initFeedbackList();
        }

    };
    var initFeedbackList = function () {
        initFeedbackListControlEvent();
        initFeedbackRecordList();

    }
    var initFeedbackRecordList = function () {
        getFeedbackRecordList();
    }
    var initFeedbackListControlEvent = function () {
        $('#add_button').click(function () {
            onAddRecord();
        });
        $('#feedback_add_div #submit_button').click(function () {
            onAddDivSubmit();
        });
        $('#feedback_add_div #cancel_button').click(function () {
            reback();
        });
    }
    function getUserInfo() {
        const token = getCookie("token")
        return JSON.parse(window.atob(token.split('.')[1]))
    }
    var getFeedbackRecordList = function () {
        data = {};

        $.post("/feedback?action=get_feedback", data, function (json) {
            console.log(JSON.stringify(json));
            if (json.resCode === "00000") {
                var list = json.feedbackList;
                console.log(list);
                var html = "";
                if (list !== undefined && list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        if (record.user_id===getUserInfo().id) {
                            html = html + "                                   <tr>";
                            html = html + "                                        <td><strong>" + record.fid + "</strong></td>";
                            html = html + "                                    <td> " + record.user_id + "</td>"
                            html = html + "                                    <td> " + record.feedback + "</td>"
                            html = html + "                                    <td> " + record.create_time + "</td>"
                            html = html + "                                    <td>" + "<a href=\"javascript:Page.onDeleteRecord('" + record.fid + "')\">【撤回反馈】</a></td>"
                            //"<a href=\"javascript:Page.onViewRecord(" + record.id + ")\">【查看记录】</a><br> ";
                            html = html + "                                    </tr>";
                        }
                    }
                }
                $("#feedback_table_content_div").html(html);
            }
        })
    }
    var onDeleteRecord = function (fid) {
        console.log("delete");
        if (window.confirm("您确定要撤回这条反馈吗？")) {
            console.log("yes");
            if (fid !== undefined && fid !== null && fid !== "") {
                var url = "/feedback";
                var data = {};
                data.action = "delete_feedback";
                data.fid = fid;
                $.post(url, data, function (json) {
                    if (json.result_code === 0) {
                        window.location.reload();
                    }
                })
            }
        }
    };
    var onAddRecord = function () {
        $("#feedback_add_div").modal("show");
    }
    var reback = function () {
        window.location.href = "feedback-page.jsp";
    }
    var onAddDivSubmit = function () {
        submitAddRecordDiv();
        $("#feedback_add_div").modal("hide");
    }
    var submitAddRecordDiv = function () {
        var url = "/feedback";
        var data = {};
        data.action = "add_feedback";
        data.user_id = $("#feedback_add_div #user_id").val();
        data.feedback = $("#feedback_add_div #feedback").val();
        $.post(url, data, function (json) {
            if (json.result_code === 0) {
                alert("已经完成了反馈。");
                window.location.reload();
            }
        });
    }
    return {
        init: function () {
            console.log(123);
            initPageControl();
        },
        onDeleteRecord: function (id) {
            onDeleteRecord(id);
        }
    }
})();