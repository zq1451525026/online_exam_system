<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>蓝桥在线考试系统</title>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--css-->
    <link href="js/meituanui/css/bootstrap.min.css" rel="stylesheet">
    <link href="js/meituanui/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="js/meituanui/css/animate.css" rel="stylesheet">
    <link href="js/meituanui/css/style.css" rel="stylesheet">
</head>

<body>

<div id="wrapper">

    <%--此处包含左侧--%>
    <%@include file="main_left.jsp"%>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <%--此处包含头部信息--%>
            <%@include file="main_top.jsp"%>
        </div>
        <!--头部导航窗口自定义对应每个界面 如 首页/商品管理/员工详细/自己给超链接-->
        <div class="row wrapper wrapper-content animated fadeInRight">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>在线考试系统</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content" style="text-align: center ;height: 465px"  >

                        <!--主要修改页面 高度为自动  在美团后台里面扣自己想要的样式自己导入样式库-->
                        <h1 class="welcome" style="margin-top: 180px; font-size: 50px; color: #2c3895; font-family: 宋体;">欢迎来到蓝桥在线考试系统</h1>

                    </div>
                </div>
            </div>
        </div>
        <!--结尾信息-->
        <div class="footer">
            <div class="pull-right" style="font-size: 12px">
                蓝桥<strong>在线</strong> 考试系统
            </div>
            <div style="font-size: 12px">
                烧脑分队  倾情奉献 &copy; 2018-2019
            </div>
        </div>
    </div>
</div>
</body>

<!--js-->
<!-- Mainly scripts -->&lt;%&ndash;
<script src="js/meituanui/js/jquery-2.1.1.js"></script>
<script src="js/meituanui/js/bootstrap.min.js"></script>
<script src="js/meituanui/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/meituanui/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="js/meituanui/js/inspinia.js"></script>
<script src="js/meituanui/js/plugins/pace/pace.min.js"></script>&ndash;%&gt;
</html>