<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>蓝桥在线考试系统</title>
    <%@include file="../../common.jsp"%>

    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--css-->
    <link href="js/meituanui/css/bootstrap.min.css" rel="stylesheet">
    <link href="js/meituanui/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="js/meituanui/css/animate.css" rel="stylesheet">
    <link href="js/meituanui/css/style.css" rel="stylesheet">
    <script src="js/jquery-2.2.4.js"></script>

    <link rel="stylesheet" href="js/prettify/prettify-iteye.css">
    <script src="js/prettify/prettify.js"></script>

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

    <script type="text/javascript">
        $(function() {
            $('#addText').click(function() {
                var fmt = '<pre class="prettyprint linenums lang-iava" class="pretty-code">\n\n</pre>\n\n';
                var main = document.getElementById('question');
                main.value = main.value + fmt;
            });
        })
    </script>
</head>

<body onload="prettyPrint()">

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
                        <strong>新增单选题</strong>
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
                        <h5>新增单选题</h5>
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
                        <div class="ibox-content" style="text-align: center ;height: 100%;float: left"  >
                                <form  action="question/insert_smd" method="post" id="single_add">
                                    <div class="col-md-8 column" style="float: left;margin:0px 0px 0px 35px">
                                        <span class="form-label"><span style="color: red">*</span>单选题题干：</span><br>
                                        <textarea name="question"  id="question" class="add-question-ta" style="width: 600px;height: 150px"></textarea>
                                        <br><button type="button" id="addText" style="width: 110px;height: 30px; margin: 0px 0px 0px 480px">复制代码格式</button>
                                    </div>

                                    <%---     关联      --%>

                                    <div class="col-md-8 column"  style="margin:0px 0px 0px 65px;margin-top: 20px">
                                        <div class="row clearfix">
                                            <div class="col-md-4 column">
                                                <span style="float: left"><span style="color: red">*</span>课程：</span>
                                                <div style="width: 300px;height: 150px" >
                                                    <select name="coursesId" id="courseid" class="df-input-narrow" size="4"  style="width: 300px;">
                                                        <option value="" selected>=请选择=</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4 column" style="margin:0px 0px 0px 80px" >
                                                <span style="float: left" ><span style="color: red">*</span>知识点：</span>
                                                <div style="width: 300px;height: 150px">
                                                    <select name="tech_cate_id" id="techId" class="df-input-narrow" size="4"  style="width: 300px;">
                                                        <option value="" selected>=请选择=</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <br><br><br><br>
                                    <%--选项--%>
                                    <div class="row clearfix" style="margin:0px 0px 0px 65px">
                                            <div class="col-md-10 column">
                                                <div class="col-md-1 column">
                                                    <span>选项</span>
                                                </div>
                                                <div class="col-md-6 column">
                                                    <span>内容</span>
                                                </div>
                                                <div class="col-md-1 column">
                                                    <span>正确答案</span>
                                                </div>
                                            </div>


                                            <div class="col-md-10 column" >
                                                <div class="col-md-1 column">
                                                    <span class="form-label"><span style="color: red">*</span>A.</span>
                                                </div>
                                                <div class="col-md-6 column" style="float: left">
                                                    <textarea name="option_A" class="add-question-ta" style="width: 360px;height: 30px"></textarea>

                                                </div>
                                                <div class="col-md-1 column">
                                                    <input name="correct" type="radio" value="A">
                                                </div>
                                            </div>


                                            <div class="col-md-10 column">
                                                <div class="col-md-1 column">
                                                    <span class="form-label"><span style="color: red">*</span>B.</span>
                                                </div>
                                                <div class="col-md-6 column">
                                                    <textarea name="option_B" class="add-question-ta" style="width: 360px;height: 30px"></textarea>
                                                </div>
                                                <div class="col-md-1 column">
                                                    <input name="correct" type="radio" value="B">
                                                </div>
                                            </div>

                                            <div class="col-md-10 column">
                                                <div class="col-md-1 column" >
                                                    <span class="form-label"><span style="color: red">*</span>C.</span>
                                                </div>
                                                <div class="col-md-6 column">
                                                    <textarea name="option_C" class="add-question-ta" style="width: 360px;height: 30px"></textarea>
                                                </div>
                                                <div class="col-md-1 column">
                                                    <input name="correct" type="radio" value="C">
                                                </div>
                                            </div>

                                            <div class="col-md-10 column">
                                                <div class="col-md-1 column">
                                                    <span class="form-label"><span style="color: red">*</span>D.</span>
                                                </div>
                                                <div class="col-md-6 column">
                                                    <textarea name="option_D" class="add-question-ta" style="width: 360px;height: 30px"></textarea>
                                                </div>
                                                <div class="col-md-1 column">
                                                    <input name="correct" type="radio" value="D">
                                                </div>
                                            </div>
                                    </div>
                                    <br>
                                    <input type="hidden" name="question_type" value="1">
                                    <div style="margin: 0px 0px 0px 300px ;float: left">
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