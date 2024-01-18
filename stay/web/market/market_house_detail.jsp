


<%--
Created by IntelliJ IDEA.
User: cw
Date: 2023/12/1
Time: 15:00
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="../frame/frame_style.jsp" %>
    <link rel="stylesheet" href="../assets/vendor/sweetalert2/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="../assets/vendor/toastr/css/toastr.min.css">
    <link href="../assets/vendor/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="../assets/vendor/clockpicker/css/bootstrap-clockpicker.min.css" rel="stylesheet">



</head>
<body>

<%--  preloader start  --%>
<%@include file="../frame/frame_preloader.jsp"%>
<!DOCTYPE html>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  top-menu start  --%>
        <%@ include file="/frame/frame_menu.jsp" %>

    <div class="content-body">
        <div class="container-fluid">
            <div  class="row page-titles">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active"onclick="detailBack()"><a >返回</a></li>

                </ol>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xl-3 col-lg-6  col-md-6 col-xxl-5 ">
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade show active">
                                            <img class="img-fluid" src="/images/product/1.jpg" id="first" alt="">
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="second">
                                            <img class="img-fluid" src="images/product/2.jpg" alt="">
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="third">
                                            <img class="img-fluid" src="images/product/3.jpg" alt="">
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="for">
                                            <img class="img-fluid" src="images/product/4.jpg" alt="">
                                        </div>
                                    </div>
                                    <div class="tab-slide-content new-arrival-product mb-4 mb-xl-0">
                                        <!-- Nav tabs -->
                                        <ul class="nav slide-item-list mt-3" role="tablist">
                                            <li role="presentation" class="show">
                                                <a role="tab" data-bs-toggle="tab">
                                                    <img class="img-fluid" src="/good_image/1.jpg" alt="" width="50">
                                                </a>
                                            </li>
                                            <li role="presentation">
                                                <a role="tab" data-bs-toggle="tab"><img class="img-fluid"
                                                                                        src="/good_image/1.jpg" alt=""
                                                                                        width="50"></a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#third" role="tab" data-bs-toggle="tab"><img class="img-fluid"
                                                                                                      src="images/tab/3.jpg"
                                                                                                      alt="" width="50"></a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#for" role="tab" data-bs-toggle="tab"><img class="img-fluid"
                                                                                                    src="images/tab/4.jpg"
                                                                                                    alt="" width="50"></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--Tab slider End-->
                                <div class="col-xl-9 col-lg-6  col-md-6 col-xxl-7 col-sm-12">
                                    <div class="product-detail-content">
                                        <!--Product details-->
                                        <div class="new-arrival-content pr">
                                            <h3 id="good_name"></h3>
                                            <div class="comment-review star-rating">
                                                <ul>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>
                                                    <li><i class="fa fa-star"></i></li>

                                                </ul>
                                                <span class="review-text">(34 reviews) / </span><a class="product-review"
                                                                                                   href=""
                                                                                                   data-bs-toggle="modal"
                                                                                                   data-bs-target="#reviewModal">Write
                                                a review?</a>
                                            </div>
                                            <div class="d-table mb-2">
                                                <p class="price float-start d-block" id="good_price"></p>
                                            </div>
                                            <p>剩余库存: <span id="good_num"></span><span class="item">   <i
                                                    class="fa fa-shopping-basket"></i>

                                                </span>
                                            </p>
                                            <p>位置:<span class="item"></span></p>
                                            <p id ="location"></p>
                                            <p>Product tags:&nbsp;&nbsp;
                                                <span class="badge badge-success light">bags</span>
                                                <span class="badge badge-success light">clothes</span>
                                                <span class="badge badge-success light">shoes</span>
                                                <span class="badge badge-success light">dresses</span>
                                            </p>
                                            <p class="text-content"></p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <span style="min-width:60px">入店日期</span>
                            <input type="text" class="form-control input-default"  placeholder="请选择日期" id="demoTest1" style="min-width: 100px;" lay-key="1">
</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-responsive-md">
                                    <thead>
                                    <tr>
                                        <th><strong></strong></th>
                                        <th><strong>房间名</strong></th>
                                        <th><strong>房间剩余</strong></th>
                                        <th><strong>房间单价</strong></th>
                                        <th><strong>预定数量</strong></th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody id="room_list">
                                    <tr>
                                        <td><strong>03</strong></td>
                                        <td>Mr. Bobby</td>
                                        <td><span class="badge light badge-warning">1</span></td>
                                        <td>Dr. Jackson</td>
                                        <td>01 August 2020</td>
                                        <td>$21.56</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<%--  script start  --%>
<%@include file="../frame/frame_javascript.jsp"%>
<%--  script end  --%>
</body>
<script src="../assets/js/styleSwitcher.js"></script>
<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/vendor/toastr/js/toastr.min.js"></script>


<!-- Required vendors -->
<script src="./vendor/global/global.min.js"></script>
<script src="./vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="./vendor/chart.js/Chart.bundle.min.js"></script>
<!-- Apex Chart -->
<script src="./vendor/apexchart/apexchart.js"></script>



<!-- Daterangepicker -->
<!-- momment js is must -->
<script src="../assets/vendor/moment/moment.min.js"></script>
<script src="../assets/vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- clockpicker -->
<script src="../assets/vendor/clockpicker/js/bootstrap-clockpicker.min.js"></script>
<!-- asColorPicker -->
<script src="../assets/vendor/jquery-asColor/jquery-asColor.min.js"></script>
<script src="../assets/vendor/jquery-asGradient/jquery-asGradient.min.js"></script>
<script src="../assets/vendor/jquery-asColorPicker/js/jquery-asColorPicker.min.js"></script>
<!-- Material color picker -->
<script src="../assets/vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<!-- pickdate -->
<script src="../assets/vendor/pickadate/picker.js"></script>
<script src="../assets/vendor/pickadate/picker.time.js"></script>
<script src="../assets/vendor/pickadate/picker.date.js"></script>

<!-- Daterangepicker -->
<script src="../assets/js/plugins-init/bs-daterange-picker-init.js"></script>
<!-- Clockpicker init -->
<script src="../assets/js/plugins-init/clock-picker-init.js"></script>
<!-- asColorPicker init -->
<script src="../assets/js/plugins-init/jquery-asColorPicker.init.js"></script>
<!-- Material color picker init -->
<script src="../assets/js/plugins-init/material-date-picker-init.js"></script>
<!-- Pickdate -->
<script src="../assets/js/plugins-init/pickadate-init.js"></script>

<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>

<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>
<script>
    var cartBack = function () {
        window.history.go(-1);
    };
    var todaystr="";
    var tomorowstr="";
    var url = window.location.href;
    var good_id = url.split('=')[1];
    var data;
    var room_list;

    $.post('/getTime',{},function (json) {
        console.log(JSON.stringify(json));
        todaystr=json.today;
        console.log(todaystr);
        tomorowstr=json.tomorrow;
        var today=todaystr.split('-')[1]+'/'+todaystr.split('-')[2]+'/'+todaystr.split('-')[0];
        var tomorrow=tomorowstr.split('-')[1]+'/'+tomorowstr.split('-')[2]+'/'+tomorowstr.split('-')[0];
        $('#demoTest1').daterangepicker({
            buttonClasses: ['btn', 'btn-sm'],
            applyClass: 'btn-danger',
            cancelClass: 'btn-inverse',
            minDate:today,


        });

        document.getElementById("demoTest1").value=today+' - '+tomorrow;
        data = {"good_id": good_id,"good_type":"house","in_date":todaystr,"out_date":tomorowstr};
        console.log(data);
        $.post('/getHouseDetail', data, function (json) {
            if (json.code == 0) {
                console.log(JSON.stringify(json));
                document.getElementById("good_name").innerText = json.good_name;
                document.getElementById("first").src = json.main_image;
                document.getElementById("location").innerText=json.location;
                room_list=json.room_list;
                var html="";
                for(var i=0;i<room_list.length;i++)
                {
                    var room=room_list[i];
                    html = html + "<tr>";
                    html = html + "<td>";
                    html = html + "<div class=\"new-arrivals-img-contnent\"  style='width: 200px; height: 200px;display: flex;justify-content: center;align-items: center;'>";
                    html = html + "<img class=\"img-fluid\" src=\"" + room.imageurl + "\" width='200' alt=\"\" style='display: flex;justify-content: center;align-items: center;' >";
                    html = html + "</div>";
                    html = html + "</td>";


                    html = html + "<td>";
                    html=html+room.room_name;
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<span class=\"badge light badge-warning\">";
                    html=html+"剩余: " +room.res_num+" 间";

                    html = html + "</span>";
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<div class=\"d-flex align-items-center\">";
                    html = html + "<span  class=\"text-warning\" style=\"font-size: 150%;font-weight: bold\">";
                    html = html + room.room_price;
                    html = html + "</span>";
                    html = html + "<span  class=\"text-warning\" style=\"font-size: 150%;font-weight: bold\">￥</span>";
                    html = html + "</div>";
                   html = html + "</td>";
                    html = html + "<td>";
                    html=html+"<input id=\"nn"+room.room_id+"\" type=\"number\" name=\"num\"class=\"form-control input-btn input-number\" value=\"1\" min=\"1\"max=\""+room.res_num+"\"onchange=\"if(value>"+room.res_num+") value="+room.res_num+"\">";
                    html = html + "</td>";
                    html = html + "<td>";
                    html = html + "<div class=\"shopping-cart mb-2\">";
                    html = html + "<a class=\"btn btn-info view_comments\" onclick=\"viewComments('" + room.room_id + "')\">";
                    html = html + "<i class=\"fa fa-comment me-2\">";
                    html = html + "</i>查看评论";
                    html = html + "</a>";
                    html = html + "</div>";
                    if(room.res_num==0)
                    {
                        html=html+"<div class=\"shopping-cart\" onclick=\"showNoRoom()\">";
                        html=html+"<a class=\"btn btn-light\" href=\"javascript:void();\">";html=html+"<i class=\"fa fa-shopping-basket me-2\">";html=html+"</i>立即预定";
                        html=html+"</a>";
                        html=html+"</div>";
                    }
                    else{
                        html=html+"<div class=\"shopping-cart\" onclick=\"purChase("+room.room_id+")\">";
                        html=html+"<a class=\"btn btn-warning\" href=\"javascript:void();\">";html=html+"<i class=\"fa fa-shopping-basket me-2\">";html=html+"</i>立即预定";
                        html=html+"</a>";
                        html=html+"</div>";
                    }

                    html = html + "</td>";
                    html = html + "</tr>";

                };
                document.getElementById("room_list").innerHTML=html;
            }
        });

        document.getElementById("demoTest1").onchange=function(){
            var date=this.value;
            var in_date=date.split(' ')[0];
            var out_date=date.split(' ')[2];
            out_date=''+out_date.split('/')[2]+'-'+out_date.split('/')[0]+'-'+out_date.split('/')[1];
            in_date=''+in_date.split('/')[2]+'-'+in_date.split('/')[0]+'-'+in_date.split('/')[1];
            console.log(in_date);
            console.log(out_date);
            data['in_date']=in_date;
            data['out_date']=out_date;
            console.log(JSON.stringify(data));
            $.post('/getHouseDetail', data, function (json) {
                if (json.code == 0) {
                    console.log(JSON.stringify(json));
                    document.getElementById("good_name").innerText = json.good_name;
                    document.getElementById("first").src = json.main_image;
                    document.getElementById("location").innerText=json.location;
                    room_list=json.room_list;
                    var html="";
                    for(var i=0;i<room_list.length;i++)
                    {
                        var room=room_list[i];
                        html = html + "<tr>";
                        html = html + "<td>";
                        html = html + "<div class=\"new-arrivals-img-contnent\"  style='width: 200px; height: 200px;display: flex;justify-content: center;align-items: center;'>";
                        html = html + "<img class=\"img-fluid\" src=\"" + room.imageurl + "\" width='200' alt=\"\" style='display: flex;justify-content: center;align-items: center;' >";
                        html = html + "</div>";
                        html = html + "</td>";


                        html = html + "<td>";
                        html=html+room.room_name;
                        html = html + "</td>";
                        html = html + "<td>";
                        html = html + "<span class=\"badge light badge-warning\">";
                        html=html+"剩余: " +room.res_num+" 间";

                        html = html + "</span>";
                        html = html + "</td>";
                        html = html + "<td>";
                        html = html + "<div class=\"d-flex align-items-center\">";
                        html = html + "<span  class=\"text-warning\" style=\"font-size: 150%;font-weight: bold\">";
                        html = html + room.room_price;
                        html = html + "</span>";
                        html = html + "<span  class=\"text-warning\" style=\"font-size: 150%;font-weight: bold\">￥</span>";
                        html = html + "</div>";
                        html = html + "</td>";
                        html = html + "<td>";
                        html=html+"<input id=\"nn"+room.room_id+"\" type=\"number\" name=\"num\"class=\"form-control input-btn input-number\" value=\"1\" min=\"1\"max=\""+room.res_num+"\" onchange=\"if (value >"+room.res_num+") value="+room.res_num+"\" >";
                        html = html + "</td>";
                        html = html + "<td>";
                        html = html + "<div class=\"shopping-cart mb-2\">";
                        html = html + "<a class=\"btn btn-info view_comments\" onclick=\"viewComments('" + room.room_id + "')\">";
                        html = html + "<i class=\"fa fa-comment me-2\">";
                        html = html + "</i>查看评论";
                        html = html + "</a>";
                        html = html + "</div>";
                        html=html+"<div class=\"shopping-cart\" onclick=\"purChase("+room.room_id+")\">";
                        html=html+"<a class=\"btn btn-warning\" href=\"javascript:void();\">";html=html+"<iclass=\"fa fa-shopping-basket me-2\">";html=html+"</i>立即预定";
                        html=html+"</a>";
                        html=html+"</div>";
                        html = html + "</td>";
                        html = html + "</tr>";

                    };
                    document.getElementById("room_list").innerHTML=html;


                }
            });


        }

    });
    var showNoRoom=function()
    {
        sweetAlert("没有房间了", "去看看别的吧~", "error");
    }
    var purChase=function(room_id){
        var need_num=document.getElementById("nn"+room_id).value;
        var date=document.getElementById("demoTest1").value;
        var in_date=date.split(' ')[0];
        var out_date=date.split(' ')[2];
        out_date=''+out_date.split('/')[2]+'-'+out_date.split('/')[0]+'-'+out_date.split('/')[1];
        in_date=''+in_date.split('/')[2]+'-'+in_date.split('/')[0]+'-'+in_date.split('/')[1];
        var aadata={"need_num":need_num,"house_id":good_id,"room_id":room_id,"in_date":in_date,"out_date":out_date};
        var checkgoodsstring = JSON.stringify(aadata);
        let data=new Date().getTime();
        let new_data=new Date(data+6000);
        document.cookie="checkhouse="+checkgoodsstring+";expires="+new_data.toUTCString();
        window.location.href="confirm_order_room.jsp";
    }

    function viewComments(room_id) {
        window.location.href = "./room_comments.jsp?house_id=" + good_id + "&room_id=" + room_id;
    }









</script>

</html>

