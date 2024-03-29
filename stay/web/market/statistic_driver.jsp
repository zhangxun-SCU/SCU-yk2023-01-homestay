﻿<%@ page import="homestay.utils.Config" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>驾驶舱 孙硕</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" href="css/comon0.css">
<style>


.grid {
margin-top:5%;
width:80%;
  height: 10px;
  display: grid;
  grid-template-columns: repeat(20, 1fr);
  grid-column-gap: 14px;
}

.line {
  position: relative;
  width: 90%;
  height: 7px;
}
.line::before, .line::after {
  content: '';
  position: absolute;
  width: 4.5rem;
  height: 100%;
  border-radius: 7px;
  background-color: #FF0000;
}
.line::before {
  animation: first-line ease-in-out 4s var(--delay) infinite alternate;
}
.line::after {
  bottom: 0;
  background-color: #B22222;
  width: calc(80% - 10px);
  animation: second-line ease-in-out 4s var(--delay) infinite alternate;
}
.line:nth-child(1) {
  --delay: calc(-0.1s);
}


@keyframes first-line {
  70% {
    width: calc(80% - 10px);
  }
  100% {
    background-color: #FF0000;
  }
}
}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		var html=$(".wrap ul").html()
		$(".wrap ul").append(html)
		var ls=$(".wrap li").length/2+1
		i=0
		ref = setInterval(function(){
			i++
			if(i==ls){
				i=1
				$(".wrap ul").css({marginTop:0})
				$(".wrap ul").animate({marginTop:-'.52'*i+'rem'},1000)
			}
	    	$(".wrap ul").animate({marginTop:-'.52'*i+'rem'},1000)


		},2400);



				var html2=$(".adduser ul").html()
		$(".adduser ul").append(html2)
		var ls2=$(".adduser li").length/2+1
		a=0
		ref = setInterval(function(){
			a++
			if(a==ls2){
				a=1
				$(".adduser ul").css({marginTop:0})
				$(".adduser ul").animate({marginTop:-'.5'*a+'rem'},800)
			}
	    	$(".adduser ul").animate({marginTop:-'.5'*a+'rem'},800)


		},4300);








	})
</script>
<body style='overflow:-Scroll;overflow-y:hidden'>
    <div class="loading">
        <div class="loadbox"> <img src="images/loading.gif"> 页面加载中... </div>
    </div>
    <div class="head">
        <h1>驾驶舱 孙硕</h1>
        <div class="weather"><span id="showTime"></span></div>
		<script>
            var t = null;
            t = setTimeout(time, 1000); 
            function time() {
                clearTimeout(t); 
                dt = new Date();
                var y = dt.getFullYear();
                var mt = dt.getMonth() + 1;
                var day = dt.getDate();
                var h = dt.getHours(); 
                var m = dt.getMinutes(); 
                var s = dt.getSeconds(); 
                document.getElementById("showTime").innerHTML = y + "年" + mt + "月" + day + "-" + h + "时" + m + "分" + s + "秒";
                t = setTimeout(time, 1000);  
            }

        </script>
    </div>
    <div class="mainbox">
        <ul class="clearfix">
            <li>
                <div class="boxall" style="height: 5.2rem">
                    <div class="alltitle">基础统计</div>

                    <div class="sycm">
                        <ul class="clearfix">
                            <li><h2 id="a"></h2><span>民宿订单数量</span></li>
                            <li><h2 id="b"></h2><span>特产订单数量</span></li>
                            <li><h2  id="c"></h2><span>环比增长</span></li>
                        </ul>
                        <div style="border-bottom: 1px solid rgba(255,255,255,.1)"></div>
                        <ul class="clearfix">
                            <li><h2 id="d">824</h2><span>特产商品数量</span></li>
                            <li><h2 id="e">710</h2><span>民宿商品数量</span></li>
                            <li><h2 id="f">200</h2><span>房间商品数量</span></li>
                        </ul>


                    </div>
					 <div class="addnew" >
                        <div class="tit02"><span>三维统计</span></div>
                        <div class="allnav" style="height: 2.2rem" id="wbzl"></div>
                    </div>
                    <div class="boxfoot"></div>
                </div>

            </li>
            <li>
                <div class="bar">
                    <div class="barbox ">
                        <ul class="clearfix">
                            <li  class="pulll_left counter" >
								<span id="h1">10</span>
							</li>
                            <li class="pulll_left counter" >
                                <span id="i1">6</span>
                            </li>
                        </ul>
                    </div>
                    <div class="barbox2">
                        <ul class="clearfix">
                            <li class="pulll_left">用户数量</li>
                            <li class="pulll_left">普通用户数量</li>
                        </ul>
                    </div>
                </div>
				<div class="bar">
                    <div class="barbox">
                        <ul class="clearfix">
                            <li class="pulll_left counter" ><span id="j1">3</span></li>
                            <li class="pulll_left counter"><span id="k1">1</span></li>
                        </ul>
                    </div>
                    <div class="barbox2">
                        <ul class="clearfix">
                            <li class="pulll_left">管理员数量</li>
                            <li class="pulll_left">超级管理员数量</li>
                        </ul>
                    </div>
                </div>
                <div class="map">
                    <div class="map1"><img src="images/lbx.png"></div>
                    <div class="map2"><img src="images/jt.png"></div>
                    <div class="map3"><img src="images/map.png"></div>
                    <div class="map4" id="map_1"></div>
                </div>

            </li>
            <li>
                <div class="boxall" style="height:5.2rem">
                    <div class="alltitle">消费统计</div>
                    
                    <div class="clearfix">
                        <div class="sy" style="width:300px;" id="yqbj"></div>
                    </div>
                    <div class="addnew" >
                        <div class="tit02"><span>高消费订单展示</span></div>
                        <div class="adduser"  style="height: 2.0rem">
                            <ul >
                                <li class="clearfix"> <span class="pulll_left">SO1705715440001</span> <span class="pulll_right">2024-01-20 09:50:40 </span> </li>
                                <li class="clearfix"> <span class="pulll_left">SO1705326874362</span> <span class="pulll_right">2024-01-15 21:54:34 </span> </li>
                                <li class="clearfix"> <span class="pulll_left">SO1705892238520</span> <span class="pulll_right">2024-01-22 10:57:18</span> </li>
                                <li class="clearfix"> <span class="pulll_left">SO1705326874362</span> <span class="pulll_right">2024-01-22 10:57:01 </span> </li>
								<li class="clearfix"> <span class="pulll_left">SO1705670216986</span> <span class="pulll_right">2024-01-19 21:16:56</span> </li>
								<li class="clearfix"> <span class="pulll_left">SO1705670211632</span> <span class="pulll_right">2024-01-19 21:16:51 </span> </li>
                            </ul>
                        </div>
                    </div>
                    <div class="boxfoot"></div>
                </div>
                <div class="boxall" style="height: 1.4rem">
                    <div class="alltitle"></div>
						<div class="grid">
							<span class="line"></span>
						</div>
						 <div >


						</div>
                    <div class="boxfoot"></div>
                </div>

            </li>
        </ul>
 
    </div>
    <div class="back"></div>
    <script type="text/javascript" src="js/echarts.min.js"></script>
	 <script type="text/javascript" src="js/echarts-gl.min.js"></script>
	    <script language="JavaScript" src="js/echarts-tool.js"></script>
<script type="text/javascript" src="js/timelineOption.js"></script>

  
   
    <script type="text/javascript">

    </script>
    <script type="text/javascript" src="js/jquery.waypoints.min.js"></script>
    <script type="text/javascript" src="js/jquery.countup.min.js"></script>
    <script type="text/javascript">

        $('.counter').countUp();
        var data={"action":"sun"}
        $.post('<%=Config.getInstance().getString("default.urlheader")%>/getDriveData',data,function (json) {
            document.getElementById("a").innerText=json.num_room_order;
            document.getElementById("b").innerText=json.num_specialty_order;
            document.getElementById("c").innerText=json.num_room_order+json.num_specialty_order;
            document.getElementById("d").innerText=json.num_specialty;
            document.getElementById("e").innerText=json.num_house;
            document.getElementById("f").innerText=json.num_room;

            document.getElementById("i1").innerText=json.num_normal_user;
            document.getElementById("j1").innerText=json.num_admin_user;
            document.getElementById("k1").innerText.json.num_super_ser;
        })

    </script>


</body>
</html>
