<%@ taglib prefix="e" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
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

    <%--下拉列表--%>
    <script language="javascript">
        $(function () {
            // 加载区下拉列表
            console.log("触发");
            $.ajax({
                url: "courses/load_course",
                data: {}, //请求参数，jquery会把它序列化这种形式传输：n=v&n2=v2...
                type: "GET", // 请求的方式(GET, POST)，默认是GET
                dataType: "json", // 响应数据的类型：text, html, xml, json, script
                success: function (resp) {
//			console.log(resp);
                    $("#courseId").empty();
                    $("#courseId").append("<option value=''>--请选择--</option>");

                    $.each(resp, function (i,v) {
                        // <option value="1111">text</option>
                        var option = new Option(v.course_name, v.id);
                        $("#courseId").append(option);
                    });
                    //重新选中区县
                    var courses = $('#courses').val();
                    $('#qxid option[value="' + courses + '"]').prop("selected", true);
                }
            });

            //选择区县时加载街道下拉列表
            $("#courseId").change(function () {
                var courseId = this.options[this.selectedIndex].value;
                console.log(courseId);

                $.get("courses/load_tech_by_id",{"knowledgeId": courseId},function (resp) {
                    console.log(resp);
                    $("#knowledgeId").empty();
                    $("#knowledgeId").append("<option value=''>--请选择--</option>");

                    $.each(resp, function (i,v) {
                        var option = new Option(v.techctgr, v.id);
                        $("#knowledgeId").append(option);
                    });
                },"json");
            });
        })
    </script>

    <%--全选--%>
    <script type="text/javascript">
        $(function () {
            $('#selectAll').click(function () {
                if (this.checked) {
                    $('[name = "selects"]').prop("checked", true);
                } else {
                    $('[name = "selects"]').prop("checked", false);
                }
            })
        });
    </script>

    <%--展开收起--%>
    <script type="text/javascript">
        $(function () {
            $('#symbol').click(function () {
                $('.option').toggle();
            })
        })
    </script>

    <%--查找试卷--%>
    <script language="javascript">
        $(function () {
            console.log("触发");
            $.ajax({
                url: "testquestion/load_examination",
                data: {}, //请求参数，jquery会把它序列化这种形式传输：n=v&n2=v2...
                type: "GET", // 请求的方式(GET, POST)，默认是GET
                dataType: "json", // 响应数据的类型：text, html, xml, json, script
                success: function (resp) {
//			console.log(resp);
                    $("#selecttest").empty();
                    $("#selecttest").append("<option value=''>--请选择--</option>");

                    $.each(resp, function (i, v) {
                        // <option value="1111">text</option>
                        var option = new Option(v.exam_no,v.exam_no);
                        $("#selecttest").append(option);
                    });
                    /* //重新选中区县
                     var courses = $('#courses').val();
                     $('#qxid option[value="' + courses + '"]').prop("selected", true);*/
                }
            })
        });
    </script>

    <%--分页显示--%>
    <script type="text/javascript">
        $(function () {
            $('#query').click(function () {
                $('#paging').toggle();
            })
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
        <!--头部导航窗口自定义对应每个界面 如 首页/商品管理/员工详细/自己给超链接-->
        <div class="row wrapper wrapper-content animated fadeInRight">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>考卷出多选题查询</h5>
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
                    <div class="ibox-content" style="text-align: center;float: left;width: 100%"  >
                        <form  method="post" id="simple_add" action="testquestion/select">
                            <div align="center">
                                <font color="black"><strong>多选题题题干：</strong></font>&nbsp;
                                <input type="text" name="question" id="question" value="" style="width: 230px;height: 28px">&nbsp;&nbsp;
                                <font size="-1" color="black"><b>(模糊查询)</b></font>
                            </div>
                            <br>
                            <%--搜索框--%>
                            <div class="row clearfix">
                                <div class="col-md-4 column" style="padding-left: 270px;">
                                    <span style="float: left;"><span style="color: red">*</span>课程：</span>
                                    <br>
                                    <div style="width: 300px;height: 150px" >
                                        <select name="coursesId" id="courseId" class="df-input-narrow" size="7"  style="width: 300px;">
                                            <option value="" selected>=请选择=</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 column" style="margin:0px 0px 0px 80px;padding-left: 110px;" >
                                    <span style="float: left" ><span style="color: red">*</span>知识点：</span>
                                    <div style="width: 300px;height: 150px">
                                        <select name="knowledgeId" id="knowledgeId" class="df-input-narrow" size="7"  style="width: 300px;">
                                            <option value="" selected>=请选择=</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <%--查询按钮--%>
                            <div class="buttons" style="padding-right: 60px;">
                                <button type="submit" name="query" id="query" class="btn btn-primary" style="width: 100px">
                                    查&nbsp;询</button>
                                &nbsp;&nbsp;
                                <button type="reset" class="btn btn-default" style="width: 100px">重&nbsp;置</button>
                            </div>
                            <input type="hidden" name="question_type" value="2">
                        </form>

                        <%----%>
                        <form method="post" action="testquestion/insert"  style="padding-left: 170px;">
                            <br><br>
                            <div class="col-md-8 column" align="left" >
                                <%--显示搜索内容--%>
                                <div style="font-size: large;text-align: left" class="search">
                                    <c:forEach var="pager" items="${page}" >
                                        <br>
                                        <tr>
                                        <span id="topicmark">
                                            <input type="checkbox" name="selects" id="selects">
                                            &nbsp;
                                        </span>
                                            <td id="topic">${pager.question_id}.&nbsp;${pager.smd_questions.question}</td>
                                            <br>
                                        </tr>

                                        <tr >
                                            <div class="option" style="display: none">
                                                <td id="option1">A.&nbsp;${pager.option_A}</td>
                                                <br>
                                                <td id="option2">B.&nbsp;${pager.option_B}</td>
                                                <br>
                                                <td id="option3">C.&nbsp;${pager.option_C}</td>
                                                <br>
                                                <td id="option4">D.&nbsp;${pager.option_D}</td>
                                                <br>
                                                <td id="option0"><font color="red">正确答案：${pager.smd_questions.correct}&nbsp;</font>
                                                    &nbsp;&nbsp;&nbsp;
                                                    <div style="padding-left: 150px;">
                                                    <a id="toUpdateBtn" questionID="${pager.question_id}"  onclick="toUpdate(this)" href="#" class="btn btn-info btn-sm"
                                                       data-toggle="modal" data-target="#updateModal" data-backdrop="static">
                                                        <span class="glyphicon glyphicon-refresh"></span> 更新</a>

                                                    <a id="todeletebtn" questionID="${pager.question_id}" onclick="toDelete(this)"  href="#" class="btn btn-danger btn-sm"
                                                       data-toggle="modal" data-target="#deleteModal" data-backdrop="static">
                                                        <span class="glyphicon glyphicon-trash"></span>删除</a>
                                                    </div>
                                                </td></div>
                                        </tr>

                                    </c:forEach>
                                    <%--分页--%>
                                    <div  id="paging">
                                        <tr>
                                            <td>
                                                <br>
                                                总记录数：${page.getTotal()}&nbsp;&nbsp; 第${page.getPageNum()}页/共${page.getPages()}页
                                                <c:if test="${page.getPageNum() gt 1}">
                                                    <a href="testquestion/searchFsp?pageNum=1">首页</a>
                                                </c:if>
                                                <c:if test="${page.getPageNum() gt 1}">
                                                    <a href="testquestion/searchFsp?pageNum=${page.getPageNum()-1}">上一页</a>
                                                </c:if>
                                                <c:if test="${page.getPageNum() lt page.getPages()}">
                                                    <a href="testquestion/searchFsp?pageNum=${page.getPageNum()+1}">下一页</a>
                                                </c:if>
                                                <c:if test="${page.getPageNum() lt page.getPages()}">
                                                    <a href="testquestion/searchFsp?pageNum=${page.getPages()}">尾页</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </div>
                                </div>
                                <%--搜索--%>
                                <br>
                                <div style="font-size: large;padding-left: 30px;">
                                    <a style="text-decoration:none;" title="全部展开/全部收起 选项">
                                        <button type="button" id="symbol" class="btn btn-primary" value="" >展开/收起</button>
                                    </a>
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name="selectAll" id="selectAll" /> 全选
                                    <br><br>
                                    <font color="black"><strong>考卷编号：</strong></font>
                                    <select name="selecttest" id="selecttest" class="df-input-narrow" size="1"  style="width: 300px;">
                                        <option value="" selected>=请选择=</option>
                                    </select>
                                    <button type="submit" name="sousuo" id="sousuo" style="width: 60px;">选择</button>
                                    <font color="red" size="-1"><b>*(注：考点拼音简称)</b></font>
                                    <br><br>
                                    <div style="padding-left: 370px;">
                                        <button type="submit" class="btn btn-primary" style="width: 100px;" >加入多选题</button>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="question_type" value="2">
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

<%--update Modal--%>
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div style="margin-top: 200px" class="modal-content" id="myModal-content">
            <!--信息表单的内容部分，加入到这里 -->
        </div>
    </div>
</div>


<!-- delete Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div style="margin-top: 200px" class="modal-content" id="myModal-content2">
            <!--信息表单的内容部分，加入到这里 -->
        </div>
    </div>
</div>

<script>
    function  toDelete(c) {
        $('#myModal-content2').empty();
        var questionID = $(c).attr('questionID');
        //加载删除的信息表单，并加入到模态框的content部分
        $.get('testquestion/delete/' + questionID, function (html) {
            //console.dirxml(html)
            $('#myModal-content2').append(html);
        }, 'html');
    }

    //也可通过这种方式把其它页面的内容加入到模态框的body部分
    function toUpdate(c) {
        $('#myModal-content').empty();
        var questionID = $(c).attr('questionID');
        //加载更新的信息表单，并加入到模态框的content部分
        $.get('testquestion/update/' + questionID, function (html) {
            //console.dirxml(html)
            $('#myModal-content').append(html);
        }, 'html');
    }
</script>

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