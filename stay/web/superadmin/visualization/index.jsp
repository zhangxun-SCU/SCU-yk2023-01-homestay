<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理大数据统计</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/echarts.min.js"></script>
    <script type="text/javascript" src="js/js.js"></script>
    <script type="text/javascript" src="js/jquery.liMarquee.js"></script>
    <script type="text/javascript" src="js/jquery.cxselect.min.js"></script>

    <link rel="stylesheet" href="css/comon0.css">
</head>
<body>
<div style="background:#000d4a url(images/bg.jpg) center top;">
    <div class="loading">
        <div class="loadbox"><img src="images/loading.gif"> 页面加载中...</div>
    </div>
    <div class="back"></div>
    <div class="head">
        <div class="weather"><span id="showTime"></span></div>
        <h1>用户管理大数据统计</h1>

    </div>
    <script>
        var t = null;
        t = setTimeout(time, 1000);/*開始运行*/
        function time() {
            clearTimeout(t);/*清除定时器*/
            dt = new Date();
            var y = dt.getFullYear();
            var mt = dt.getMonth() + 1;
            var day = dt.getDate();
            var h = dt.getHours();
            var m = dt.getMinutes();
            var s = dt.getSeconds();
            document.getElementById("showTime").innerHTML = y + "年" + mt + "月" + day + "日 " + h + "时" + m + "分" + s + "秒";
            t = setTimeout(time, 1000);
        }

    </script>
    <div class="mainbox">
        <ul class="clearfix">
            <li>
                <div class="boxall" style="height:400px; display: none;">
                    <div class="alltitle">标题样式</div>
                    <div class="navboxall" id="echart5"></div>
                </div>
                <div class="boxall" style="height:260px;">
                    <div class="alltitle">实时评论状态</div>
                    <div class="navboxall">
                        <div class="wraptit">
                            <span>单号</span><span>品名</span><span>评论者</span><span>时间</span>
                        </div>
                        <div class="wrap">
                            <ul>
                                <li><p><span>GD110</span><span>Test1</span><span>zy</span><span>21小时</span>
                                </p>
                                </li>
                                <li><p><span>GD110</span><span>Test1</span><span>Sunshuo</span><span>142天</span></p>
                                </li>
                                <li><p><span>GD120</span><span>Test2</span><span>hubert</span><span>6天</span></p>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="boxall" style="height:260px; visibility: hidden">
                    <div class="alltitle">用户比例</div>
                    <div class="navboxall" id="echart1"></div>
                </div>
            </li>
            <li>

                <div class="boxall" style="height:230px">
                    <div class="clearfix navboxall" style="height: 100%">
                        <div class="pulll_left num">
                            <div class="numbt">用户总数</div>
                            <div class="numtxt">8</div>
                        </div>
                        <div class="pulll_right zhibiao" style="visibility: hidden">
                            <div class="zb1"><span>超级管理员</span>
                                <div id="zb1"></div>
                            </div>
                            <div class="zb2"><span>管理员</span>
                                <div id="zb2"></div>
                            </div>
                            <div class="zb3"><span>商家/普通用户</span>
                                <div id="zb3"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="boxall" style="height:350px; display: none;">
                    <div class="alltitle">4</div>
                    <div class="navboxall" id="echart4"></div>

                </div>
                <div class="boxall" style="height:340px; display: none;">
                    <div class="alltitle">3</div>
                    <div class="navboxall" id="echart3"></div>
                </div>
            </li>
            <li>
                <div class="boxall" style="height:300px">
                    <div class="alltitle">评论TOP</div>
                    <div class="navboxall">
                        <table class="table1" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th scope="col">排名</th>
                                <th scope="col">商品</th>
                                <th scope="col">评论数</th>
                                <th scope="col">平均评分</th>
                            </tr>
                            <tr>
                                <td><span>1</span></td>
                                <td>Test2</td>
                                <td>1<br></td>
                                <td>5<br></td>
                            </tr>
                            <tr>
                                <td><span>2</span></td>
                                <td>测试商品22</td>
                                <td>1</td>
                                <td>2</td>
                            </tr>

                            <tr>
                                <td><span>3</span></td>
                                <td>Test1</td>
                                <td>2</td>
                                <td>1</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="boxall" style="height: 300px; display: none;">
                    <div class="alltitle">table2</div>
                    <div class="navboxall">
                        <table class="table1" width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th scope="col">排名</th>
                                <th scope="col">公司</th>
                                <th scope="col">数量</th>
                                <th scope="col">增长率</th>
                            </tr>
                            <tr>
                                <td><span>1</span></td>
                                <td>腾讯科技</td>
                                <td>114万<br></td>
                                <td>100%<br></td>
                            </tr>
                            <tr>
                                <td><span>2</span></td>
                                <td>百度公司</td>
                                <td>923823万</td>
                                <td>21%</td>
                            </tr>

                            <tr>
                                <td><span>3</span></td>
                                <td>新浪</td>
                                <td>1240253万</td>
                                <td>12%</td>
                            </tr>
                            <tr>
                                <td><span>4</span></td>
                                <td>网易</td>
                                <td>1.2亿</td>
                                <td>39%</td>
                            </tr>
                            <tr>
                                <td><span>5</span></td>
                                <td>雅虎</td>
                                <td>13423万</td>
                                <td>9%</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                </div>

                <div class="boxall" style="height:320px; visibility: hidden;">
                    <div class="alltitle">2</div>
                    <div class="navboxall" id="echart2"></div>
                </div>


            </li>
        </ul>

    </div>
</div>

<script>
    $(function () {
        $('.wrap,.adduser').liMarquee({
            direction: 'up',/*身上滚动*/
            runshort: false,/*内容不足时不滚动*/
            scrollamount: 20/*速度*/
        });
    });

</script>


</body>
</html>
