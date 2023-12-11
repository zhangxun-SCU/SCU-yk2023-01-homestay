<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta name=Generator content="Microsoft Word 15 (filtered)">
    <style>
        <!--
        /* Font Definitions */
        @font-face {
            font-family: 宋体;
            panose-1: 2 1 6 0 3 1 1 1 1 1;
        }

        @font-face {
            font-family: "Cambria Math";
            panose-1: 2 4 5 3 5 4 6 3 2 4;
        }

        @font-face {
            font-family: 等线;
            panose-1: 2 1 6 0 3 1 1 1 1 1;
        }

        @font-face {
            font-family: "\@等线";
            panose-1: 2 1 6 0 3 1 1 1 1 1;
        }

        @font-face {
            font-family: "\@宋体";
            panose-1: 2 1 6 0 3 1 1 1 1 1;
        }

        /* Style Definitions */
        p.MsoNormal, li.MsoNormal, div.MsoNormal {
            margin: 0cm;
            text-align: justify;
            text-justify: inter-ideograph;
            font-size: 10.5pt;
            font-family: 等线;
        }

        .MsoChpDefault {
            font-size: 10.0pt;
            font-family: 等线;
        }

        /* Page Definitions */
        @page WordSection1 {
            size: 595.3pt 841.9pt;
            margin: 72.0pt 90.0pt 72.0pt 90.0pt;
            layout-grid: 15.6pt;
        }

        div.WordSection1 {
            page: WordSection1;
        }

        -->
    </style>

</head>

<body lang=ZH-CN style='word-wrap:break-word;text-justify-trim:punctuation'>

<div class=WordSection1 style='layout-grid:15.6pt'>

    <div align=center>

        <table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
               style='border-collapse:collapse;border:none'>
            <thead>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>订单编号</span></b></p>
            </th>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>商品名称</span></b></p>
            </th>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>商品数量</span></b></p>
            </th>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>商品单价</span></b></p>
            </th>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>商品总价</span></b></p>
            </th>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>卖家</span></b></p>
            </th>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>买家</span></b></p>
            </th>
            <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                <p class=MsoNormal align=center style='text-align:center'><b><span
                        lang=EN-US>订单状态</span></b></p>
            </th>
            </thead>
            <tbody id="print_word_div" name="print_word_div">
            <tr>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>订单编号</span></b></p>
                </th>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>商品名称</span></b></p>
                </th>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>商品数量</span></b></p>
                </th>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>商品单价</span></b></p>
                </th>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>商品总价</span></b></p>
                </th>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>卖家</span></b></p>
                </th>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>买家</span></b></p>
                </th>
                <th width=138 valign=top style='width:103.7pt;border-top:solid windowtext 1.5pt;
  border-left:none;border-bottom:solid windowtext 1.5pt;border-right:none;
  padding:0cm 5.4pt 0cm 5.4pt'>
                    <p class=MsoNormal align=center style='text-align:center'><b><span
                            lang=EN-US>订单状态</span></b></p>
                </th>
            </tr>
            </tbody>
        </table>

    </div>

    <p class=MsoNormal><span lang=EN-US>&nbsp;</span></p>

</div>

</body>
<%--<%@include file="../home/frame/frame_javascript.jsp" %>--%>
<script src="../../assets/js/order/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../assets/js/order/order.js" defer></script>
<input type="hidden" id="page_id" name="page_id" value="print_word">
</html>

