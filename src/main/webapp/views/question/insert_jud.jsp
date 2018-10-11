<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
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


    <script src="js/jquery-2.2.4.js"></script>

    <script language="javascript">
        $(function () {
            // 加载区下拉列表
            console.log("触发");
            $.ajax({
                url: "question/load_course",
                data: {}, //请求参数，jquery会把它序列化这种形式传输：n=v&n2=v2...
                type: "GET", // 请求的方式(GET, POST)，默认是GET
                dataType: "json", // 响应数据的类型：text, html, xml, json, script
                success: function (resp) {
//			console.log(resp);
                    $("#courseid").empty();
                    $("#courseid").append("<option value=''>--请选择--</option>");

                    $.each(resp, function (i,v) {
                        // <option value="1111">text</option>
                        var option = new Option(v.course_name, v.id);
                        $("#courseid").append(option);
                    });
                }
            });

            //选择区县时加载街道下拉列表
            $("#courseid").change(function () {
                var courseid = this.options[this.selectedIndex].value;
                console.log(courseid);

                $.get("question/load_tech_by_id",{"id": courseid},function (resp) {
                    console.log(resp);
                    $("#techId").empty();
                    $("#techId").append("<option value=''>--请选择--</option>");

                    $.each(resp, function (i,v) {
                        var option = new Option(v.tech_ctgr, v.id);
                        $("#techId").append(option);
                    });
                },"json");
            });
        })

    </script>
</head>

<body>

<div id="wrapper">

    <%--此处包含左侧--%>
    <%@include file="../../main_left.jsp"%>

    <div id="page-wrapper" class="gray-bg">
        <div class="row border-bottom">
            <%--此处包含头部信息--%>
            <%@include file="../../main_top.jsp"%>
        </div>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>导航</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="../../welcome.jsp">首页</a>
                    </li>
                    <li>
                        <a>试题新增</a>
                    </li>
                    <li class="active">
                        <strong>新增判断题</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2" id="h5">
            </div>
        </div>
        <!--头部导航窗口自定义对应每个界面 如 首页/商品管理/员工详细/自己给超链接-->
        <div class="row wrapper wrapper-content animated fadeInRight">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>新增判断题</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <!--主要修改页面 高度为自动  在美团后台里面扣自己想要的样式自己导入样式库-->
                    <div class="ibox-content" style="text-align: center ;height: 100%;width:100%;float: left"  >
                        <div class="panel panel-primary" style="height: 100%">
                            <div class="panel-heading">
                                <h3 class="panel-title text-left"><span class="fa fa-bar-chart-o"></span> &nbsp;新增判断
                                </h3>
                            </div>
                        <form  action="question/insert2" method="post" id="jud_add">
                            <div class="col-md-8 column"  style="margin:0px 0px 0px 180px;margin-top: 20px">
                                <div class="row clearfix">
                                    <div class="col-md-4 column">
                                        <span style="float: left"><span style="color: red">*</span>课程：</span>
                                        <div style="width: 300px;height: 200px" >
                                            <select name="coursesId" id="courseid" class="df-input-narrow" size="5"  style="width: 300px;">
                                                <option value="" selected>=请选择=</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-4 column" style="margin:0px 0px 0px 75px" >
                                        <span style="float: left" ><span style="color: red">*</span>知识点：</span>
                                        <div style="width: 300px;height: 200px">
                                            <select name="tech_cate_id" id="techId" class="df-input-narrow" size="5"  style="width: 300px;">
                                                <option value="" selected>=请选择=</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--选项--%>
                            <div class="row clearfix" style="margin:0px 0px 0px 200px">
                                <div class="col-md-10 column">
                                    <div class="col-md-6 column">
                                        <span>内容</span>
                                        <textarea  name="question" class="add-question-ta" style="width: 400px;height: 100px"></textarea>
                                    </div>

                                    <div class="col-md-2 column" style="margin:0px 0px 0px 60px" >
                                        <span>正确答案</span><br>
                                        <input name="correct" type="radio" value="T">对<br>
                                        <input name="correct" type="radio" value="F">错<br>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <input type="hidden" name="question_type" value="3">
                            <div style="margin: 0px 0px 0px 400px ;float: left">
                                <button type="submit" class="btn btn-primary" style="width: 80px">保存</button>
                                &nbsp;&nbsp;
                                <button type="reset" class="btn btn-default" style="width: 80px">重置</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--结尾信息-->

    </div>
        <div class="footer">
            <div class="pull-right" style="font-size: 12px">
                蓝桥<strong>在线</strong> 考试系统
            </div>
            <div style="font-size: 12px">
                烧脑分队  倾情奉献 &copy; 2018-2019
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