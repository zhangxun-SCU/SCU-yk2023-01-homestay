var module = "homestay";
var sub = "servlet";
document.domain = "localhost";
/*================================================================================*/
jQuery(document).ready(function () {
    // initiate layout and plugins
    Page.init();
    initRating();
    console.log(111)
});
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里
var Page = function () {
    /*----------------------------------------入口函数  开始----------------------------------------*/
    var initPageControl = function () {
        pageId = $("#page_id").val();
        if (pageId == "order_list") {
            initOrderList();
        }
        if (pageId == "print_word") {
            initOrderListPrintWordRecord();
        }
    };

    /*----------------------------------------入口函数  结束----------------------------------------*/
    var columnsData = undefined;
    var recordResult = undefined;
    /*----------------------------------------业务函数  开始----------------------------------------*/
    /*------------------------------针对各个页面的入口  开始------------------------------*/
    var initOrderList = function () {
        initOrderListControlEvent();
        initOrderRecordList();
    }
    var initOrderAdd = function () {
        initOrderAddControlEvent();
    }
    var initOrderModify = function () {
        initOrderModifyControlEvent();
        initOrderRecordView();
    }


    /*------------------------------针对各个页面的入口 结束------------------------------*/
    var getUrlParam = function (name) {
        //获取url中的参数
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return decodeURI(r[2]);
        return null; //返回参数值，如果是中文传递，就用decodeURI解决乱码，否则用unescape
    }
    var initOrderListControlEvent = function () {
        $("#help_button").click(function () {
            help();
        });
        $('#add_button').click(function () {
            onAddRecord();
        });
        $('#order_list_all_button').click(function () {
            onOrderListAll();
        });
        $('#order_list_finished_button').click(function () {
            onOrderListFinished();
        });
        $('#order_list_unfinished_button').click(function () {
            onOrderListUnfinished();
        });
        $('#record_modify_div #submit_button').click(function () {
            onModifyDivSubmit();
        });
        $('#record_add_div #submit_button').click(function () {
            onAddDivSubmit();
        });
        $('#query_button').click(function () {
            onQueryRecord();
        });
        $('#export_button').click(function () {
            onExportRecord();
        });
        $('#print_table_button').click(function () {
            window.location.href = "device_list_print_table.jsp";
        });
        $('#device_statistic').click(function () {
            window.location.href = "device_statistic.jsp";
        });
        $('#print_word').click(function () {
            window.location.href = "device_list_print_word.jsp";
        });
    }
    var initOrderAddControlEvent = function () {
        $("#help_button").click(function () {
            help();
        });
        $('#add_button').click(function () {
            submitAddRecord();
        });
    }
    var initOrderModifyControlEvent = function () {
        $("#help_button").click(function () {
            help();
        });
        $('#modify_button').click(function () {
            submitModifyRecord();
        });
    }
    var initOrderViewControlEvent = function () {
        $("#help_button").click(function () {
            help();
        });
        $('#return_button').click(function () {
            returnBack();
        });
    }
    var initOrderRecordView = function () {
        var id = getUrlParam("id");
        var data = {};
        data.action = "get_specialty_order_record";
        data.id = id;
        $.post("../../" + module + "_" + sub + "_specialty_order_servlet_action", data, function (json) {
            console.log(JSON.stringify(json));
            if (json.result_code == 0) {
                var list = json.aaData;
                if (list != undefined && list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        $("#device_id").val(record.device_id);
                        $("#device_name").val(record.device_name);
                    }
                }
            }
        })
    }
    var onAddRecord = function () {
        $("#record_add_div").modal("show");
        //window.location.href="device_add.jsp";
    }
    var submitAddRecord = function () {
        var url = "../../homestay_servlet_specialty_order_servlet_action";
        var data = {};
        data.action = "add_device_record";
        data.device_id = $("#device_id").val();
        data.device_name = $("#device_name").val();
        data.device_type = $("#device_type").val();
        $.post(url, data, function (json) {
            if (json.result_code == 0) {
                alert("已经完成设备添加。");
                window.location.href = "device_list.jsp";
            }
        });
    }
    var submitModifyRecord = function () {
        if (confirm("您确定要修改该记录吗？")) {
            var id = getUrlParam("id");
            var url = "../../homestay/servlet_specialty_order_servlet_action";
            var data = {};
            data.action = "modify_device_record";
            data.id = id;
            data.device_id = $("#device_id").val();
            data.device_name = $("#device_name").val();
            $.post(url, data, function (json) {
                if (json.result_code == 0) {
                    alert("已经完成设备修改。");
                    window.location.href = "device_list.jsp";
                }
            });
        }
    }


    var initOrderRecordList = function () {
        getOrderRecordList();
        getOrderRecordFinished();
        getOrderRecordUnfinished();
    }
    var initOrderMobileRecord = function () {
        getOrderMobileRecord();
    }
    var getOrderRecordList = function () {
        data = {};
        data.order_id = $("#record_query_setup #order_id").val();
        data.specialty_name = $("#record_query_setup #specialty_name").val();

        console.log(1)
        $.post("../../" + module + "_" + sub + "_specialty_order_servlet_action?action=get_specialty_order_record", data, function (json) {
            console.log(JSON.stringify(json));
            if (json.result_code == 0) {
                var list = json.aaData;
                console.log(list);
                var html = "";
                if (list != undefined && list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        console.log(record);
                        html = html + "                                   <tr>";
                        html = html + "                                        <td>";
                        html = html + "                                            <div class=\"form-check custom-checkbox checkbox-success check-lg me-3\">";
                        html = html + "                                                <input type=\"checkbox\" class=\"form-check-input\" id=\"customCheckBox2\" required=\"\">";
                        html = html + "                                                <label class=\"form-check-label\" for=\"customCheckBox2\"></label>";
                        html = html + "                                            </div>";
                        html = html + "                                        </td>";
                        html = html + "                                        <td><strong>" + record.order_id + "</strong></td>";
                        html = html + "                                        <td><div class=\"d-flex align-items-center\"><img src=\"" + record.imageurl + "\" class=\"rounded-lg me-2\" width=\"24\" alt=\"\"/> <span class=\"w-space-no\">" + record.specialty_name + "</span></div></td>";
                        html = html + "                                        <td>" + record.num + "	</td>";
                        html = html + "                                        <td>" + record.price * record.num + "</td>";
                        html = html + "                                        <td><div class=\"d-flex align-items-center\"><i class=\"fa fa-circle text-success me-1\"></i> " + (record.order_status != 0 ? '已支付' : '未支付') + "</div></td>";
                        html = html + "                                        <td>";
                        html = html + "                                            <div class=\"d-flex\">";
                        html = html + "                                                <a href=\"#\" class=\"btn btn-primary shadow btn-xs sharp me-1\"><i class=\"fas fa-pencil-alt\"></i></a>";
                        html = html + "                                                <a href=\"javascript:Page.onDeleteRecord('" + record.order_id + "')\" class=\"btn btn-danger shadow btn-xs sharp me-1\"><i class=\"fa fa-trash\"></i></a>";
                        html = html + "                                                <a href=\"javascript:Page.onComment('" + record.order_id + "')\" class=\"btn btn-info shadow btn-xs sharp\"><i class=\"fa fa-comment\"></i></a>"
                        html = html + "                                            </div>";
                        html = html + "                                        </td>";
                        html = html + "                                    </tr>";
                    }
                }
                $("#order_table_content_div").html(html);
            }
        })
    }
    var onDeleteRecord = function (order_id) {
        if (confirm("您确定要删除这条订单记录吗？")) {
            if (order_id > -1) {
                var url = "../../homestay/servlet_specialty_order_servlet_action";
                var data = {};
                data.action = "delete_specialty_order_record";
                data.order_id = order_id;
                $.post(url, data, function (json) {
                    if (json.result_code == 0) {
                        window.location.reload();
                    }
                })
            }
        }
    };

    var onModifyRecord = function (order_id) {
        //显示出修改前数据
        //window.location.href="device_modify.jsp?order_id="+order_id;
        for (var i = 0; i < resultList.length; i++) {
            if (resultList[i].order_id == order_id) {
                $("#record_modify_div #order_id").val(resultList[i].order_id);
                $("#record_modify_div #specialty_name").val(resultList[i].specialty_name);
                $("#record_modify_div #total_price").val(resultList[i].price * resultList[i].num);
                $("#record_modify_div").modal("hide");
            }
        }
        $("#record_modify_div").modal("show");
    }
    var initOrderFileControlEvent = function (id) {
        $('#jump_div #upload_button').click(function () {
            onJumpUploadFile();
        });
        $('#ajax_div #upload_button').click(function () {
            onAjaxUploadFile();
        });
        console.log("[initOrderFileControlEvent]");
    }
    var initOrderFileView = function (id) {
        console.log("[initOrderFileView]");
        getOrderFile();
    }
    var getOrderFile = function () {

    }
    var onJumpUploadFile = function () {
        console.log("[onJumpUploadFile]====");
        var deviceId = $("#device_id").val();
        var deviceName = $("#device_name").val();
        jump_form.action = "../../homestay/servlet_specialty_order_servlet_action?action=upload_file&device_id=" + deviceId + "&device_name=" + deviceName;
        //jump_form.action="http://192.168.3.111:8888?action=upload_file&device_id="+deviceId+"&device_name="+deviceName;			/*设置提交到TCP工具来接收，TCP工具设置好监听端口例如8888和接收自动存入文件*/
        jump_form.submit();
    }
    //如果出现“No resource with given identifier found”，注意：在谷歌浏览器调试界面找到Network界面导航栏中找到Preserve log，把勾去掉就好了。
    //https://blog.csdn.net/m0_46296300/article/details/126130250
    //发送ajax请求后页面自动刷新的问题
    //https://blog.csdn.net/GCTTTTTT/article/details/123824126
    var onAjaxUploadFile = function () {
        console.log("[onAjaxUploadFile]====");
        var deviceId = $("#device_id").val();
        var deviceName = $("#device_name").val();
        var options = {
            type: 'post', /*设置表单以post方法提交*/
            url: '../../homestay/servlet_specialty_order_servlet_action?action=upload_file&device_id=' + deviceId + "&device_name=" + deviceName, /*设置post提交到的页面*/
            success: function (json) {
                console.log("[onAjaxUploadFile]上传文件返回结果=" + JSON.stringify(json));
                if (json.upload_files.length > 0) {
                    var files = json.upload_files;
                    var fileUrl = files[0].file_url_name;
                    var objectId = files[0].file_object_id;
                    $("#current_attachment_name").html("您当前上传的附件第一个是：<span style='color:blue;'><a href='javascript:window.open(\"" + fileUrl + "\")'>" + fileUrl + "</a></span>");
                    $("#current_attachment_object_id").val(objectId);
                    console.log("[onAjaxUploadFile]fileUrl=" + fileUrl);
                    console.log("[onAjaxUploadFile]objectId=" + objectId);
                } else {
                    alert("[onAjaxUploadFile]没有上传文件结果返回！");
                }
            },
            error: function (error) {
                alert(error);
            },
            dataType: "json" /*设置返回值类型为文本*/
        };
        $("#ajax_form").ajaxSubmit(options);
    }

    var resultList = [];
    var getOrderRecordFinished = function () {
        data = {};
        data = {};
        data.order_id = $("#record_query_setup #order_id").val();
        data.specialty_name = $("#record_query_setup #specialty_name").val();

        console.log(1)
        $.post("../../" + module + "_" + sub + "_specialty_order_servlet_action?action=get_specialty_order_record_finished", data, function (json) {
            console.log(JSON.stringify(json));
            if (json.result_code == 0) {
                var list = json.aaData;
                console.log(list);
                var html = "";
                if (list != undefined && list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        console.log(record);
                        html = html + "                                   <tr>";
                        html = html + "                                        <td>";
                        html = html + "                                            <div class=\"form-check custom-checkbox checkbox-success check-lg me-3\">";
                        html = html + "                                                <input type=\"checkbox\" class=\"form-check-input\" id=\"customCheckBox2\" required=\"\">";
                        html = html + "                                                <label class=\"form-check-label\" for=\"customCheckBox2\"></label>";
                        html = html + "                                            </div>";
                        html = html + "                                        </td>";
                        html = html + "                                        <td><strong>" + record.order_id + "</strong></td>";
                        html = html + "                                        <td><div class=\"d-flex align-items-center\"><img src=\"images/avatar/1.jpg\" class=\"rounded-lg me-2\" width=\"24\" alt=\"\"/> <span class=\"w-space-no\">" + record.specialty_name + "</span></div></td>";
                        html = html + "                                        <td>" + record.num + "	</td>";
                        html = html + "                                        <td>" + record.price * record.num + "</td>";
                        html = html + "                                        <td><div class=\"d-flex align-items-center\"><i class=\"fa fa-circle text-success me-1\"></i> " + (record.order_status != 0 ? '已支付' : '未支付') + "</div></td>";
                        html = html + "                                        <td>";
                        html = html + "                                            <div class=\"d-flex\">";
                        html = html + "                                                <a href=\"#\" class=\"btn btn-primary shadow btn-xs sharp me-1\"><i class=\"fas fa-pencil-alt\"></i></a>";
                        html = html + "                                                <a href=\"javascript:Page.onDeleteRecord(" + record.order_id + ")\" class=\"btn btn-danger shadow btn-xs sharp\"><i class=\"fa fa-trash\"></i></a>";
                        html = html + "                                            </div>";
                        html = html + "                                        </td>";
                        html = html + "                                    </tr>";
                    }
                }
                $("#order_table_content_finished_div").html(html);
            }
        })
    }

    $('#order_list_all_button').click(function () {
        onOrderListAll();
    });
    $('#order_list_finished_button').click(function () {
        onOrderListFinished();
    });
    $('#order_list_unfinished_button').click(function () {
        onOrderListUnfinished();
    });

    var onOrderListAll = function () {
        $("#all_order_tab").show();
        $("#finished_order_tab").hide();
        $("#unfinished_order_tab").hide();
    }
    var onOrderListFinished = function () {
        $("#all_order_tab").hide();
        $("#finished_order_tab").show();
        $("#unfinished_order_tab").hide();
    }
    var onOrderListUnfinished = function () {
        $("#all_order_tab").hide();
        $("#finished_order_tab").hide();
        $("#unfinished_order_tab").show();
    }

    var getOrderRecordUnfinished = function () {
        data = {};
        data.order_id = $("#record_query_setup #order_id").val();
        data.specialty_name = $("#record_query_setup #specialty_name").val();

        console.log(1)
        $.post("../../" + module + "_" + sub + "_specialty_order_servlet_action?action=get_specialty_order_record_unfinished", data, function (json) {
            console.log(JSON.stringify(json));
            if (json.result_code == 0) {
                var list = json.aaData;
                console.log(list);
                var html = "";
                if (list != undefined && list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        console.log(record);
                        html = html + "                                   <tr>";
                        html = html + "                                        <td>";
                        html = html + "                                            <div class=\"form-check custom-checkbox checkbox-success check-lg me-3\">";
                        html = html + "                                                <input type=\"checkbox\" class=\"form-check-input\" id=\"customCheckBox2\" required=\"\">";
                        html = html + "                                                <label class=\"form-check-label\" for=\"customCheckBox2\"></label>";
                        html = html + "                                            </div>";
                        html = html + "                                        </td>";
                        html = html + "                                        <td><strong>" + record.order_id + "</strong></td>";
                        html = html + "                                        <td><div class=\"d-flex align-items-center\"><img src=\"images/avatar/1.jpg\" class=\"rounded-lg me-2\" width=\"24\" alt=\"\"/> <span class=\"w-space-no\">" + record.specialty_name + "</span></div></td>";
                        html = html + "                                        <td>" + record.num + "	</td>";
                        html = html + "                                        <td>" + record.price * record.num + "</td>";
                        html = html + "                                        <td><div class=\"d-flex align-items-center\"><i class=\"fa fa-circle text-success me-1\"></i> " + (record.order_status != 0 ? '已支付' : '未支付') + "</div></td>";
                        html = html + "                                        <td>";
                        html = html + "                                            <div class=\"d-flex\">";
                        html = html + "                                                <a href=\"#\" class=\"btn btn-primary shadow btn-xs sharp me-1\"><i class=\"fas fa-pencil-alt\"></i></a>";
                        html = html + "                                                <a href=\"javascript:Page.onDeleteRecord(" + record.order_id + ")\" class=\"btn btn-danger shadow btn-xs sharp\"><i class=\"fa fa-trash\"></i></a>";
                        html = html + "                                            </div>";
                        html = html + "                                        </td>";
                        html = html + "                                        <td>";
                        html = html + "                                            <a href=\"javascript:Page.onModifyRecord('" + record.order_id + "')\">【修改记录】</a><a href=\"javascript:Page.onDeleteRecord(" + record.id + ")\">【删除记录】</a>";
                        html = html + "                                        </td>";
                        html = html + "                                    </tr>";
                    }
                }
                $("#order_table_content_unfinished_div").html(html);
            }
        })
    }
    var onModifyDivSubmit = function () {
        submitModifyRecordDiv();
        $("#record_modify_div").modal("hide");
    }
    var onAddDivSubmit = function () {
        submitAddRecordDiv();
        $("#record_add_div").modal("hide");
    }
    var submitModifyRecordDiv = function () {
        if (confirm("您确定要修改该记录吗？")) {
            var url = "../../homestay/servlet_specialty_order_servlet_action";
            var data = {};
            data.action = "modify_device_record";
            data.order_id = $("#record_modify_div #order_id").val();
            data.specialty_name = $("#record_modify_div #specialty_name").val();
            data.total_price = $("#record_modify_div #total_price").val();
            $.post(url, data, function (json) {
                if (json.result_code == 0) {
                    alert("已经完成设备修改。");
                    window.location.reload();
                }
            });
        }
    }
    var submitAddRecordDiv = function () {
        var url = "../../homestay/servlet_specialty_order_servlet_action";
        var data = {};
        data.action = "add_device_record";
        data.device_id = $("#record_add_div #device_id").val();
        data.device_name = $("#record_add_div #device_name").val();
        data.device_type = $("#record_add_div #device_type").val();
        $.post(url, data, function (json) {
            if (json.result_code == 0) {
                alert("已经完成设备添加。");
                window.location.reload();
            }
        });
    }
    var onViewRecord = function (id) {
        window.location.href = "device_view.jsp?id=" + id;
    }
    var returnBack = function () {
        history.go(-1);
    }
    var onQueryRecord = function () {
        initOrderRecordList();
    }
    var onExportRecord = function () {
        console.log("Export Record post");
        var url = "../../homestay/servlet_specialty_order_servlet_action";
        var data = {"action": "export_device_record"};
        $.post(url, data, function (json) {
            if (json.result_code == 0) {
                console.log(JSON.stringify(json));
                $("#record_download_div #download_url").attr("href", json.download_url);
                $("#record_download_div").modal("show");
            } else {
                alert("[onExportRecord]与后端交互错误！" + json.result.msg);
            }
        })
    }
    var initOrderListPrintTableRecord = function () {
        $("#page_sidebar_wrapper").hide();
        $("#page_header").hide();
        $("#page_content").attr("style", "margin-left:0px");
        $("#page_container").attr("style", "margin-top:0px");
        var url = "../../homestay/servlet_specialty_order_servlet_action";
        var data = {"action": "get_device_record"};
        $.post(url, data, function (json) {
            console.log(JSON.stringify(json));
            var list = json.aaData;
            if (json.result_code == 0) {
                var list = json.aaData;
                console.log(list);
                if (list != undefined && list.length > 0) {
                    var html = "";
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        html = html + "								<tr>";
                        html = html + "									<td class=\"highlight\">";
                        html = html + "										<div class=\"success\">";
                        html = html + "										</div>";
                        html = html + "										<a href=\"javascript:;\">";
                        html = html + "										" + record.device_id + " </a>";
                        html = html + "									</td>";
                        html = html + "									<td class=\"hidden-xs\">";
                        html = html + "										 " + record.device_name + "";
                        html = html + "									</td>";
                        html = html + "									<td>";
                        html = html + "										 2560.60$";
                        html = html + "									</td>";
                        html = html + "									<td>";
                        html = html + "										<a href=\"javascript:;\" class=\"btn default btn-xs purple\">";
                        html = html + "										<i class=\"fa fa-edit\"></i> Edit </a>";
                        html = html + "									</td>";
                        html = html + "								</tr>";
                    }
                    $("#print_table_content_div").html(html);
                } else {
                    alert("[print_table]与后端交互错误！" + json.result.msg);
                }
            }
        })
    }

    var initOrderListPrintWordRecord = function () {
        $("#page_sidebar_wrapper").hide();
        $("#page_header").hide();
        $("#page_content").attr("style", "margin-left:0px");
        $("#page_container").attr("style", "margin-top:0px");
        var url = "../../homestay_servlet_specialty_order_servlet_action";
        var data = {"action": "get_specialty_order_record"};
        $.post(url, data, function (json) {
            console.log(JSON.stringify(json));
            var list = json.aaData;
            if (json.result_code == 0) {
                var list = json.aaData;
                console.log(list);
                if (list != undefined && list.length > 0) {
                    var html = "";
                    for (var i = 0; i < list.length; i++) {
                        var record = list[i];
                        html = html + "				<tr>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + record.order_id + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + record.specialty_name + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + record.num + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + record.price + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + record.price * record.num + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + record.owner_id + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + record.buyer_id + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
                        html = html + "  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
                        html = html + "  padding:0cm 5.4pt 0cm 5.4pt\">";
                        html = html + "                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
                        html = html + "                            lang=EN-US>" + (record.order_status != 0 ? '已支付' : '未支付') + "</span></b></p>";
                        html = html + "                </th>";
                        html = html + "            </tr>";
                    }
                    $("#print_word_div").html(html);
                } else {
                    alert("[print_table]与后端交互错误！" + json.result.msg);
                }
            }
        })
    }

    var initOrderStatisticRecord = function () {
        var url = "../../homestay/servlet_specialty_order_servlet_action";
        var data = {"action": "get_gps_receive_count_by_hour"};
        console.log("init statistic record");
        $.post(url, data, function (json) {
            var html = "";
            console.log(json);
            if (json.result_code == 0) {
                console.log(JSON.stringify(json));
                var list = json.aaData;
                console.log(list);
                if (list != undefined) { //&& list.length>0
                    changeResultDataToChartData(list, chartData);
                    console.log(JSON.stringify(chartData));
                } else {
                    alert("[initOrderStatisticRecord]与后端交互错误！" + json.result.msg);
                }
            }
        })
    }
    var changeResultDataToChartData = function (list, chartData) {
        //list元素是：time_interval,total
        //chartData元素是：data,duation
        for (var i = 0; i < list.length; i++) {
            list[i].time_interval = i;
            var json = {"year": list[i].time_interval, "income": list[i].total, "expenses": list[i].total};
            chartData.push(json);
        }
    }

    // comments on order
    function onCommentClick(id) {
        console.log(id);
        getCommentById(id);
        // 防止点击事件累加
        // 可以使用unbind先解绑事件，再绑定新事件： object.unbind("click").click(...)
        // 或者使用one("click", ...) 声明只绑定一次
        $("#submit_order_comment").unbind("click").click((e) => {
            var url = "/order_comment";
            var data = {
                "action": "update_comment",
                "type": "specialty",
                "order_id": id,
                "score": $("#comment_score").val(),
                "description": $("#comment_description").val()
            };
            $.post(
                url,
                data,
                (res) => {
                    console.log(res.resCode);
                    if (res.resCode === "00000") {
                        swal("评论成功！",
                            "",
                            "success");
                        $("#order_comment_div").modal("hide");
                        // location.reload();
                    }
                }
            )
        })
        $("#order_comment_div").modal("show");
    }

    function getCommentById(id) {
        var url = "/order_comment";
        var data = {
            "action": "get_comment",
            "type": "specialty",
            "order_id": id
        };
        $.post(
            url,
            data,
            (res) => {
                console.log(res.resCode);
                if (res.resCode === "00000") {
                    var comment_info = res.comment_info;
                    if (comment_info.score !== undefined && comment_info.score !== null) {
                        var score = comment_info.score;
                        setStars(score);
                        $("#comment_score").val(Number(score));
                    } else {
                        setStars(0);
                    }
                    if (comment_info.comment !== undefined && comment_info.comment !== null && comment_info.comment !== "") {
                        console.log(comment_info.comment);
                        document.querySelector("#comment_description").value = comment_info.comment;
                    } else {
                        document.querySelector("#comment_description").value = "请留下你的评价...";
                    }
                }
            }
        )
    }

    var initBarChart = function () {
        var chart = AmCharts.makeChart("chart_1", {
            "type": "serial",
            "theme": "light",
            "pathToImages": Metronic.getGlobalPluginsPath() + "amcharts/amcharts/images/",
            "autoMargins": false,
            "marginLeft": 30,
            "marginRight": 8,
            "marginTop": 10,
            "marginBottom": 26,

            "fontFamily": 'Open Sans',
            "color": '#888',

            "dataProvider": chartData,
            "valueAxes": [{
                "axisAlpha": 0,
                "position": "left"
            }],
            "startDuration": 1,
            "graphs": [{
                "alphaField": "alpha",
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                "dashLengthField": "dashLengthColumn",
                "fillAlphas": 1,
                "title": "Income",
                "type": "column",
                "valueField": "income"
            }, {
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                "bullet": "round",
                "dashLengthField": "dashLengthLine",
                "lineThickness": 3,
                "bulletSize": 7,
                "bulletBorderAlpha": 1,
                "bulletColor": "#FFFFFF",
                "useLineColorForBulletBorder": true,
                "bulletBorderThickness": 3,
                "fillAlphas": 0,
                "lineAlpha": 1,
                "title": "Expenses",
                "valueField": "expenses"
            }],
            "categoryField": "year",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0,
                "tickLength": 0
            }
        });

        $('#chart_1').closest('.portlet').find('.fullscreen').click(function () {
            chart.invalidateSize();
        });
    }

    //Page return 开始
    return {
        init: function () {
            console.log(123);
            initPageControl();
        },
        onDeleteRecord: function (id) {
            onDeleteRecord(id);
        },
        onModifyRecord: function (id) {
            onModifyRecord(id);
        },
        onViewRecord: function (id) {
            onViewRecord(id);
        },
        onComment: function (id) {
            onCommentClick(id);
        }
    }
}();//Page
/*================================================================================*/

function initRating() {
    var stars = document.querySelectorAll(".stars > li");
    for (var i = 0; i < 5; i++) {
        var star = stars[i];
        star.addEventListener("mouseover", (event) => {
            var score = event.currentTarget.dataset.score;
            $("#comment_score").val(Number(score));
            setStars(score);
        })
    }
}

function setStars(score) {
    var stars = document.querySelectorAll(".stars > li");
    for (var j = 0; j < 5; j++) {
        var t_star = stars[j];
        var t_score = t_star.dataset.score;
        if (t_score <= score) {
            t_star.style.color = "orange";
        } else {
            t_star.style.color = "black";
        }
    }
}
