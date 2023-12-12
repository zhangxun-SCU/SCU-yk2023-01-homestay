var module="device";
var sub="file";
document.domain="localhost";
/*================================================================================*/
jQuery(document).ready(function() {
	// initiate layout and plugins
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	Demo.init(); // init demo features
	Page.init();
});
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里
var Page = function() {
	/*----------------------------------------入口函数  开始----------------------------------------*/
	var initPageControl=function(){
		pageId=$("#page_id").val();
		if(pageId=="device_list"){
			initDeviceList();
		}
		if(pageId=="device_add"){
			initDeviceAdd();
		}
		if(pageId=="device_modify"){
			initDeviceModify();
		}
		if(pageId=="device_file"){
			initDeviceFile();
		}
		if(pageId=="device_view"){
			initDeviceView();
		}
		if(pageId=="device_print_table"){
			initDeviceListPrintTable();
		}
		if(pageId=="print_word_0"){
			initDeviceListPrintWord();
		}
		if(pageId=="device_statistic"){
			initDeviceStatistic();
		}
	};
	/*----------------------------------------入口函数  结束----------------------------------------*/
	var columnsData=undefined;
	var recordResult=undefined;
	var chartData=[{
		"year":2009,
		"income":23.5,
		"expenses":18.1
	},{
		"year":2010,
		"income":26.2,
		"expenses":22.8
	},{
		"year":2011,
		"income":30.1,
		"expenses":23.9
	},{
		"year":2012,
		"income":29.5,
		"expenses":25.1
	},{
		"year":2013,
		"income":30.6,
		"expenses":27.2,
		"dashLengthLine":5,
	},{
		"year":2014,
		"income":34.1,
		"expenses":29.9,
		"dashLengthColumn":5,
		"alpha":0.2,
		"additional":"(projection)"
	}];
	/*----------------------------------------业务函数  开始----------------------------------------*/
	/*------------------------------针对各个页面的入口  开始------------------------------*/
	var initDeviceList=function(){
		initDeviceListControlEvent();
		initDeviceRecordList();
	}
	var initDeviceAdd=function(){
		initDeviceAddControlEvent();
	}
	var initDeviceModify=function(){
		initDeviceModifyControlEvent();
		initDeviceRecordView();
	}
	var initDeviceFile=function(){
		console.log("[initDeviceFile]");
		initDeviceFileControlEvent();
		initDeviceFileView();
	}
	var initDeviceView=function(){
		initDeviceViewControlEvent();
		initDeviceRecordView();
	}
	var initDeviceListPrintWord=function(){
		initDeviceListPrintWordRecord();
	}
	var initDeviceListPrintTable=function(){
		initDeviceListPrintTableRecord();
	}
	var initDeviceStatistic=function(){
		$.ajaxSettings.async=false;
		initDeviceStatisticRecord();
		$.ajaxSettings.async=true;
		initBarChart();
	}

	/*------------------------------针对各个页面的入口 结束------------------------------*/
	var getUrlParam=function(name){
		//获取url中的参数
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg);  //匹配目标参数
		if (r != null) return decodeURI(r[2]); return null; //返回参数值，如果是中文传递，就用decodeURI解决乱码，否则用unescape
	}
	var initDeviceListControlEvent=function(){
		$("#help_button").click(function() {help();});
		$('#add_button').click(function() {onAddRecord();});
		$('#datatable_button').click(function() {onDataTableTab();});
		$('#table_button').click(function() {onTableTab();});
		$('#bar_button').click(function() {onBarTab();});
		$('#record_modify_div #submit_button').click(function() {onModifyDivSubmit();});
		$('#record_add_div #submit_button').click(function() {onAddDivSubmit();});
		$('#query_button').click(function() {onQueryRecord();});
		$('#export_button').click(function() {onExportRecord();});
		$('#print_table_button').click(function() {window.location.href="device_list_print_table.jsp";});
		$('#device_statistic').click(function() {window.location.href="device_statistic.jsp";});
		$('#print_word').click(function() {window.location.href="device_list_print_word.jsp";});
	}
	var initDeviceAddControlEvent=function(){
		$("#help_button").click(function() {help();});
		$('#add_button').click(function() {submitAddRecord();});
	}
	var initDeviceModifyControlEvent=function(){
		$("#help_button").click(function() {help();});
		$('#modify_button').click(function() {submitModifyRecord();});
	}
	var initDeviceViewControlEvent=function(){
		$("#help_button").click(function() {help();});
		$('#return_button').click(function() {returnBack();});
	}
	var initDeviceRecordView=function(){
		var id=getUrlParam("id");
		var data={};
		data.action="get_device_record";
		data.id=id;
		$.post("../../"+module+"_"+sub+"_servlet_action",data,function(json){
			console.log(JSON.stringify(json));
			if(json.result_code==0){
				var list=json.aaData;
				if(list!=undefined && list.length>0){
					for(var i=0;i<list.length;i++){
						var record=list[i];
						$("#device_id").val(record.device_id);
						$("#device_name").val(record.device_name);
					}
				}
			}
		})
	}
	var onAddRecord=function(){
		$("#record_add_div").modal("show");
		//window.location.href="device_add.jsp";
	}
	var submitAddRecord=function(){
		var url="../../device_file_servlet_action";
		var data={};
		data.action="add_device_record";
		data.device_id=$("#device_id").val();
		data.device_name=$("#device_name").val();
		data.device_type=$("#device_type").val();
		$.post(url,data,function(json){
			if(json.result_code==0){
				alert("已经完成设备添加。");
				window.location.href="device_list.jsp";
			}
		});
	}
	var submitModifyRecord=function(){
		if(confirm("您确定要修改该记录吗？")){
			var id=getUrlParam("id");
			var url="../../device_file_servlet_action";
			var data={};
			data.action="modify_device_record";
			data.id=id;
			data.device_id=$("#device_id").val();
			data.device_name=$("#device_name").val();
			$.post(url,data,function(json){
				if(json.result_code==0){
					alert("已经完成设备修改。");
					window.location.href="device_list.jsp";
				}
			});
		}
	}

	
	var initDeviceRecordList=function(){
		getDeviceRecordList();
		getDeviceRecordDatatable();
		getDeviceRecordBar();
	}
	var initDeviceMobileRecord=function(){
		getDeviceMobileRecord();
	}
	var getDeviceRecordList=function(){
		data = {};
		// var data={};
		// data.order_id=$("#record_query_setup #order_id").val();
		// data.buyer_id=$("#record_query_setup #buyer_id").val();
		// data.price=$("#record_query_setup #price").val();
		// data.create_date=$("#record_query_setup #create_date").val();

		console.log(1)
		$.post("../../"+module+"_"+sub+"_servlet_action?action=get_device_record",data,function(json){
			console.log(JSON.stringify(json));
			if(json.result_code==0){
				var list=json.aaData;
				console.log(list);
				var html="";
				if(list!=undefined && list.length>0){
					for(var i=0;i<list.length;i++){
						var record=list[i];
						console.log(record);
						html=html+"									  <tr class=\"active\">";
						html=html+"                                        <td>";
						html=html+"                                            "+record.order_id;
						html=html+"                                        </td>";
						html=html+"                                        <td>";
						html=html+"                                            "+record.buyer_id;
						html=html+"                                        </td>";
						html=html+"                                        <td>";
						html=html+"                                            "+record.price;
						html=html+"                                        </td>";
						html=html+"                                        <td>";
						html=html+"                                            <a href=\"javascript:Page.onModifyRecord("+record.order_id+")\">【修改记录】</a><a href=\"javascript:Page.onDeleteRecord("+record.id+")\">【删除记录】</a>";
						html=html+"                                        </td>";
						html=html+"                                    </tr>";
					}
				}
				$("#record_table_content_div").html(html);
			}
		})
	}
	var onDeleteRecord = function(id){
		if(confirm("您确定要删除这条记录吗？")){
			if(id>-1){
				var url="../../device_file_servlet_action";
				var data={};
				data.action="delete_device_record";
				data.id=id;
				$.post(url,data,function(json){
					if(json.result_code==0){
						window.location.reload();
					}
				})
			}
		}
	};

	var onModifyRecord=function(id){
		//显示出修改前数据
		window.location.href="device_modify.jsp?id="+id;
		for(var i=0;i<resultList.length;i++){
			if(resultList[i].order_id==id){
				$("#record_modify_div #id").val(resultList[i].order_id);
				$("#record_modify_div #device_id").val(resultList[i].device_id);
				$("#record_modify_div #device_name").val(resultList[i].device_name);
				$("#record_modify_div").modal("hide");
			}
		}
		$("#record_modify_div").modal("show");
	}
	var initDeviceFileControlEvent=function(id){
		$('#jump_div #upload_button').click(function() {onJumpUploadFile();});
		$('#ajax_div #upload_button').click(function() {onAjaxUploadFile();});
		console.log("[initDeviceFileControlEvent]");
	}
	var initDeviceFileView=function(id){
		console.log("[initDeviceFileView]");
		getDeviceFile();
	}
	var getDeviceFile=function(){

	}
	var onJumpUploadFile=function(){
		console.log("[onJumpUploadFile]====");
		var deviceId=$("#device_id").val();
		var deviceName=$("#device_name").val();
		jump_form.action="../../device_file_servlet_action?action=upload_file&device_id="+deviceId+"&device_name="+deviceName;
		//jump_form.action="http://192.168.3.111:8888?action=upload_file&device_id="+deviceId+"&device_name="+deviceName;			/*设置提交到TCP工具来接收，TCP工具设置好监听端口例如8888和接收自动存入文件*/
		jump_form.submit();
	}
	//如果出现“No resource with given identifier found”，注意：在谷歌浏览器调试界面找到Network界面导航栏中找到Preserve log，把勾去掉就好了。
	//https://blog.csdn.net/m0_46296300/article/details/126130250
	//发送ajax请求后页面自动刷新的问题
	//https://blog.csdn.net/GCTTTTTT/article/details/123824126
	var onAjaxUploadFile=function(){
		console.log("[onAjaxUploadFile]====");
		var deviceId = $("#device_id").val();
		var deviceName = $("#device_name").val();
		var options = {
			type : 'post', /*设置表单以post方法提交*/
			url : '../../device_file_servlet_action?action=upload_file&device_id='+deviceId+"&device_name="+deviceName, /*设置post提交到的页面*/
			success : function(json) {
				console.log("[onAjaxUploadFile]上传文件返回结果="+JSON.stringify(json));
				if(json.upload_files.length>0){
					var files=json.upload_files;
					var fileUrl = files[0].file_url_name;
					var objectId = files[0].file_object_id;
					$("#current_attachment_name").html("您当前上传的附件第一个是：<span style='color:blue;'><a href='javascript:window.open(\""+fileUrl+"\")'>" + fileUrl + "</a></span>");
					$("#current_attachment_object_id").val(objectId);
					console.log("[onAjaxUploadFile]fileUrl="+fileUrl);
					console.log("[onAjaxUploadFile]objectId="+objectId);
				}else{
					alert("[onAjaxUploadFile]没有上传文件结果返回！");
				}
			},
			error : function(error) {
				alert(error);
			},
			dataType : "json" /*设置返回值类型为文本*/
		};
		$("#ajax_form").ajaxSubmit(options);
	}

	var resultList=[];
	var getDeviceRecordDatatable=function(){
		resultList=[];
		$('.datatable').dataTable( {
			"paging":true,
			"searching":false,
			"oLanguage": {
				"aria": {
					"sortAscending": ": activate to sort column ascending",
					"sortDescending": ": activate to sort column descending"
				},
				"sProcessing":   "处理中...",
				"sLengthMenu":   "_MENU_ 记录/页",
				"sZeroRecords":  "没有匹配的记录",
				"sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
				"sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
				"sInfoFiltered": "(由 _MAX_ 项记录过滤)",
				"sInfoPostFix":  "",
				"sSearch":       "过滤:",
				"oPaginate": {
					"sFirst":    "首页",
					"sPrevious": "上页",
					"sNext":     "下页",
					"sLast":     "末页"
				}
			},
			"aoColumns": [{"mRender": function(data, type, full) {
					sReturn = '<input type="checkbox" class="checkboxes" value="'+full.id+'"/>';
					return sReturn;
				},"orderable": false
			},{"mRender":function(data,type,full){
				sReturn='<div>'+full.order_id+'</div>';
				return sReturn;
				},"orderable":false
			},{"mRender":function(data,type,full){
					sReturn='<div>'+full.buyer_id+'</div>';
					return sReturn;
				},"orderable":false
			},{"mRender":function(data,type,full){
					sReturn='<div>'+full.price+'</div>';
					return sReturn;
				},"orderable":false
			},{"mRender":function(data,type,full){
					sReturn='<div>'+full.create_date+'</div>';
					return sReturn;
				},"orderable":false
			},{"mRender":function(data,type,full){
					resultList.push(full);
					sReturn='<div><a href="javascript:Page.onModifyRecord('+full.id+')">【修改记录】</a><a href="javascript:Page.onDeleteRecord('+full.id+')">【删除记录】</a><a href="javascript:Page.onViewRecord('+full.id+')">【查询记录】</a></div>';
					return sReturn;
				},"orderable":false
			}],
			"aLengthMenu": [[5,10,15,20,25,40,50,-1],[5,10,15,20,25,40,50,"所有记录"]],
			"fnDrawCallback": function(){$(".checkboxes").uniform();$(".group-checkable").uniform();},
			//"sAjaxSource": "get_record.jsp"
			//"data":data.aaData,			//这个用来显示不从后台交互获取数据的情况下，显示当前页面已经有的json数据
			"sAjaxSource": "../../"+module+"_"+sub+"_servlet_action?action=get_device_record"
		});
		$('.datatable').find('.group-checkable').change(function () {
			var set = jQuery(this).attr("data-set");
			var checked = jQuery(this).is(":checked");
			jQuery(set).each(function () {
				if (checked) {
					$(this).attr("checked", true);
					$(this).parents('tr').addClass("active");
				} else {
					$(this).attr("checked", false);
					$(this).parents('tr').removeClass("active");
				}
			});
			jQuery.uniform.update(set);
		});
		$('.datatable').on('change', 'tbody tr .checkboxes', function () {
			$(this).parents('tr').toggleClass("active");
		});
	}

	$('#datatable_button').click(function() {onDataTableTab();});
	$('#table_button').click(function() {onTableTab();});
	$('#bar_button').click(function() {onBarTab();});

	var onDataTableTab=function(){
		$("#datatable_tab").show();
		$("#table_tab").hide();
		$("#bar_tab").hide();
	}
	var onTableTab=function(){
		$("#datatable_tab").hide();
		$("#table_tab").show();
		$("#bar_tab").hide();
	}
	var onBarTab=function(){
		$("#datatable_tab").hide();
		$("#table_tab").hide();
		$("#bar_tab").show();
	}

	var getDeviceRecordBar=function(){
		data={};
		data.order_id=$("#record_query_setup #id").val();
		data.buyer_id=$("#record_query_setup #device_id").val();
		data.price=$("#record_query_setup #device_name").val();
		data.create_date=$("#record_query_setup #create_date").val();
		$.post("../../"+module+"_"+sub+"_servlet_action?action=get_device_record",data,function(json){
			console.log(JSON.stringify(json));
			if(json.result_code==0){
				var list=json.aaData;
				var html="";
				if(list!=undefined && list.length>0){
					for(var i=0;i<list.length;i++){
						var record=list[i];
						html=html+"                        <!-- Nested media object -->";
						html=html+"                        <div class=\"media\">";
						html=html+"                            <a href=\"javascript:;\" class=\"pull-left\">";
						html=html+"                                <img alt=\"\" src=\"../../assets/admin/pages/media/blog/5.jpg\" style=\"width:50px;height:50px;border-radius:50% !important;\" class=\"media-object\">";
						html=html+"                            </a>";
						html=html+"                            <div class=\"media-body\">";
						html=html+"                                <h4 class=\"media-heading\">"+record.order_id+" <span>";
						html=html+"                                                "+record.buyer_id+" / <a href=\"javascript:;\">";
						html=html+"                                                Reply </a>";
						html=html+"                                                </span>";
						html=html+"                                </h4>";
						html=html+"                                <p>";
						html=html+"                                    设备名称："+record.price;
						html=html+"                                </p>";
						html=html+"                            </div>";
						html=html+"                        </div>";
						html=html+"                        <!--end media-->";
						html=html+"                        <hr>";
					}
				}
				$("#record_bar_div").html(html);
			}
		})
	}
	var onModifyDivSubmit=function(){
		submitModifyRecordDiv();
		$("#record_modify_div").modal("hide");
	}
	var onAddDivSubmit=function(){
		submitAddRecordDiv();
		$("#record_add_div").modal("hide");
	}
	var submitModifyRecordDiv=function(){
		if(confirm("您确定要修改该记录吗？")){
			var url="../../device_file_servlet_action";
			var data={};
			data.action="modify_device_record";
			data.id=$("#record_modify_div #id").val();
			data.device_id=$("#record_modify_div #device_id").val();
			data.device_name=$("#record_modify_div #device_name").val();
			$.post(url,data,function(json){
				if(json.result_code==0){
					alert("已经完成设备修改。");
					window.location.reload();
				}
			});
		}
	}
	var submitAddRecordDiv=function(){
		var url="../../device_file_servlet_action";
		var data={};
		data.action="add_device_record";
		data.device_id=$("#record_add_div #device_id").val();
		data.device_name=$("#record_add_div #device_name").val();
		data.device_type=$("#record_add_div #device_type").val();
		$.post(url,data,function(json){
			if(json.result_code==0){
				alert("已经完成设备添加。");
				window.location.reload();
			}
		});
	}
	var onViewRecord=function(id){
		window.location.href="device_view.jsp?id="+id;
	}
	var returnBack=function(){
		history.go(-1);
	}
	var onQueryRecord=function(){
		initDeviceRecordList();
	}
	var onExportRecord=function(){
		console.log("Export Record post");
		var url="../../device_file_servlet_action";
		var data={"action":"export_device_record"};
		$.post(url,data,function(json){
			if(json.result_code==0){
				console.log(JSON.stringify(json));
				$("#record_download_div #download_url").attr("href",json.download_url);
				$("#record_download_div").modal("show");
			}else{
				alert("[onExportRecord]与后端交互错误！"+json.result.msg);
			}
		})
	}
	var initDeviceListPrintTableRecord=function(){
		$("#page_sidebar_wrapper").hide();
		$("#page_header").hide();
		$("#page_content").attr("style","margin-left:0px");
		$("#page_container").attr("style","margin-top:0px");
		var url="../../device_file_servlet_action";
		var data={"action":"get_device_record"};
		$.post(url,data,function(json){
			console.log(JSON.stringify(json));
			var list=json.aaData;
			if(json.result_code==0){
				var list=json.aaData;
				console.log(list);
				if(list!=undefined && list.length>0){
					var html = "";
					for(var i=0;i<list.length;i++){
						var record=list[i];
						html=html+"								<tr>";
						html=html+"									<td class=\"highlight\">";
						html=html+"										<div class=\"success\">";
						html=html+"										</div>";
						html=html+"										<a href=\"javascript:;\">";
						html=html+"										"+record.device_id+" </a>";
						html=html+"									</td>";
						html=html+"									<td class=\"hidden-xs\">";
						html=html+"										 "+record.device_name+"";
						html=html+"									</td>";
						html=html+"									<td>";
						html=html+"										 2560.60$";
						html=html+"									</td>";
						html=html+"									<td>";
						html=html+"										<a href=\"javascript:;\" class=\"btn default btn-xs purple\">";
						html=html+"										<i class=\"fa fa-edit\"></i> Edit </a>";
						html=html+"									</td>";
						html=html+"								</tr>";
					}
					$("#print_table_content_div").html(html);
				}else{
					alert("[print_table]与后端交互错误！"+json.result.msg);
				}
			}
		})
	}

	var initDeviceListPrintWordRecord=function(){
		$("#page_sidebar_wrapper").hide();
		$("#page_header").hide();
		$("#page_content").attr("style","margin-left:0px");
		$("#page_container").attr("style","margin-top:0px");
		var url="../../device_file_servlet_action";
		var data={"action":"get_device_record"};
		$.post(url,data,function(json){
			console.log(JSON.stringify(json));
			var list=json.aaData;
			if(json.result_code==0){
				var list=json.aaData;
				console.log(list);
				if(list!=undefined && list.length>0){
					var html = "";
					for(var i=0;i<list.length;i++){
						var record=list[i];
						html=html+"				<tr>";
						html=html+"                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
						html=html+"  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
						html=html+"  padding:0cm 5.4pt 0cm 5.4pt\">";
						html=html+"                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
						html=html+"                            lang=EN-US>"+record.id+"</span></b></p>";
						html=html+"                </th>";
						html=html+"                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
						html=html+"  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
						html=html+"  padding:0cm 5.4pt 0cm 5.4pt\">";
						html=html+"                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
						html=html+"                            lang=EN-US>"+record.device_id+"</span></b></p>";
						html=html+"                </th>";
						html=html+"                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
						html=html+"  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
						html=html+"  padding:0cm 5.4pt 0cm 5.4pt\">";
						html=html+"                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
						html=html+"                            lang=EN-US>"+record.device_name+"</span></b></p>";
						html=html+"                </th>";
						html=html+"                <th width=138 valign=top style=\"width:103.7pt;border-top:solid windowtext 1.5pt;";
						html=html+"  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;";
						html=html+"  padding:0cm 5.4pt 0cm 5.4pt\">";
						html=html+"                    <p class=MsoNormal align=center style=\"text-align:center\"><b><span";
						html=html+"                            lang=EN-US>Plate Color</span></b></p>";
						html=html+"                </th>";
						html=html+"            </tr>";
					}
					$("#print_word_div_0").html(html);
				}else{
					alert("[print_table]与后端交互错误！"+json.result.msg);
				}
			}
		})
	}

	var initDeviceStatisticRecord=function(){
		var url="../../device_file_servlet_action";
		var data={"action":"get_gps_receive_count_by_hour"};
		console.log("init statistic record");
		$.post(url,data,function(json){
			var html = "";
			console.log(json);
			if(json.result_code==0){
				console.log(JSON.stringify(json));
				var list=json.aaData;
				console.log(list);
				if(list!=undefined ){ //&& list.length>0
					changeResultDataToChartData(list,chartData);
					console.log(JSON.stringify(chartData));
				}else{
					alert("[initDeviceStatisticRecord]与后端交互错误！"+json.result.msg);
				}
			}
		})
	}
	var changeResultDataToChartData=function(list,chartData){
		//list元素是：time_interval,total
		//chartData元素是：data,duation
		for(var i=0;i<list.length;i++){
			list[i].time_interval=i;
			var json={"year":list[i].time_interval,"income":list[i].total,"expenses":list[i].total};
			chartData.push(json);
		}
	}
	var initBarChart=function(){
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
			"color":    '#888',

			"dataProvider":chartData,
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

		$('#chart_1').closest('.portlet').find('.fullscreen').click(function() {
			chart.invalidateSize();
		});
	}

	//Page return 开始
	return {
		init: function() {
			console.log(123);
			initPageControl();
		},
		onDeleteRecord:function(id){
			onDeleteRecord(id);
		},
		onModifyRecord:function(id){
			onModifyRecord(id);
		},
		onViewRecord:function(id){
			onViewRecord(id);
		}
	}
}();//Page
/*================================================================================*/
