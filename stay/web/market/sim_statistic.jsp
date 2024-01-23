<%--
  Created by IntelliJ IDEA.
  User: cw
  Date: 2023/12/1
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="author" content="" />
    <meta name="robots" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Invome : Invome Admin  Bootstrap 5 Template" />
    <meta property="og:title" content="Invome : Invome Admin  Bootstrap 5 Template" />
    <meta property="og:description" content="Invome : Invome Admin  Bootstrap 5 Template" />
    <meta property="og:image" content="https://invome.dexignlab.com/xhtml/social-image.png" />
    <meta name="format-detection" content="telephone=no">
    <title>Title</title>
    <%@include file="/frame/frame_style.jsp" %>
</head>
<body>

<%--  preloader start  --%>
<%@include file="/frame/frame_preloader.jsp"%>
<%--  preloader end  --%>
<div id="main-wrapper">
    <%--  menu start  --%>
    <%@include file="/frame/frame_menu.jsp"%>
    <%--  end  --%>

    <div class="content-body">
        <canvas id="aa" style="display: block; height: 263px; width: 526px;" width="723" height="361" class="chartjs-render-monitor"></canvas>
    </div>

    <%--  footer start  --%>
    <%@include file="/frame/frame_footer.jsp" %>
    <%--  footer end  --%>
</div>
<%--  script start  --%>

<%@include file="/frame/frame_javascript.jsp" %>
<script src="../assets/js/styleSwitcher.js"></script>
<script src="../assets/vendor/sweetalert2/dist/sweetalert2.min.js"></script>
<script src="../assets/vendor/toastr/js/toastr.min.js"></script>
<script src="../assets/vendor/global/global.min.js"></script>
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<!-- Apex Chart -->
<script src="../assets/vendor/apexchart/apexchart.js"></script>

<script src="../assets/vendor/jquery-nice-select/js/jquery.nice-select.min.js"></script>

<!-- Chart ChartJS plugin files -->
<script src="../assets/vendor/chart.js/Chart.bundle.min.js"></script>
<script src="../assets/js/plugins-init/chartjs-init.js"></script>

<script src="../assets/js/custom.min.js"></script>
<script src="../assets/js/dlabnav-init.js"></script>
<script src="../assets/js/demo.js"></script>
<script src="../assets/js/styleSwitcher.js"></script>
<script>

    var barChart1 = function() {
        if (jQuery('#aa').length > 0) {
            let data2 = {"action": "sta"};
            $.post('/getCartGood', data2, function (json) {
                if (json.code == 0) {
                    console.log(json);
                    const barChart_1 = document.getElementById("aa").getContext('2d');
                    barChart_1.height = 100;
                    new Chart(barChart_1, {
                        type: 'bar',
                        data: {
                            defaultFontFamily: 'Poppins',
                            labels: json.good_name,
                            datasets: [
                                {
                                    label: "My First dataset",
                                    data: json.price,
                                    borderColor: 'rgba(249, 58, 11, 1)',
                                    borderWidth: "0",
                                    backgroundColor: 'rgba(249, 58, 11, 1)'
                                }
                            ]
                        },
                        options: {
                            legend: false,
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true
                                    }
                                }],
                                xAxes: [{
                                    // Change here
                                    barPercentage: 0.5
                                }]
                            }
                        }
                    });
                }
            })}};
        barChart1();
</script>
<%--  script end  --%>
</body>
</html>



