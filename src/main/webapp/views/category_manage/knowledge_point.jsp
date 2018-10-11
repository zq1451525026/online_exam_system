<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="../../common.jsp"%>
    <title>蓝桥在线考试系统</title>

</head>

<body>

<div id="wrapper">

    <%--此处包含左侧--%>
    <%@include file="../../main_left.jsp"%>

    <div id="page-wrapper" class="gray-bg">
        <%--此处包含头部信息--%>
        <div class="row border-bottom">
            <%@include file="../../main_top.jsp"%>
        </div>
        <!--头部导航窗口自定义对应每个界面 如 首页/商品管理/员工详细/自己给超链接-->
        <div class="row wrapper border-bottom white-bg page-heading"  >
            <div class="col-lg-10">

                <h2>导航</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="../../welcome.jsp">首页</a>
                    </li>
                    <li>
                        <a>分类管理</a>
                    </li>
                    <li class="active">
                        <strong>知识点</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">

            </div>
        </div>

        <div class="row wrapper wrapper-content animated fadeInRight">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>知识点</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>

                    <div class="ibox-content" id="aaa">
                        <%-------------------------------%>
                        <form class="form-inline" style="margin-top: 10px;text-align: center" action="knowledge/selectKnowledge" method="post">
                            <div class="form-group">
                                <div class="input-group" style="width: 300px">
                                    <div class="input-group-addon">课程</div>
                                    <select id="course_name" class="form-control" name="course_name">
                                        <option value="">请选择课程名</option>
                                        <c:forEach var="course" items="${coursesList.getResult()}">
                                            <option value="${course.course_name}">${course.course_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">知识点</div>
                                    <input type="text" class="form-control" id="tech_ctgr" name="tech_ctgr" placeholder="请输入知识点">
                                </div>
                            </div>
                            <br><br>
                            <div class="input-group" style="margin-top: 10px">
                                <button type="submit" id="saveBtn" class="btn btn-success">保存</button>
                                <button type="submit" style="margin-left: 50px" class="btn btn-success">查询</button>
                                <button type="reset" class="btn btn-info" style="margin-left: 50px">重置</button>
                            </div>
                        </form>
                        <%-------------------------------%>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title text-left"><span class="fa fa-bar-chart-o"></span>  &nbsp;知识点查询列表</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped"  id="head">
                                <thead>
                                <br>
                                <tr style="text-align: center">
                                    <th class="text-center">ID</th>
                                    <th class="text-center">知识点</th>
                                    <th class="text-center">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="knowledge" items="${knowledgeList.getResult()}">
                                    <tr style="text-align: center" id="tr_${knowledge.id}">
                                        <td>${knowledge.id}</td>
                                        <td>${knowledge.tech_ctgr}</td>
                                        <td>
                                            <a id="toUpdateBtn" knowledges_id="${knowledge.id}" course_id="${knowledge.course_id}" onclick="toUpdate(this)" href="#" class="btn btn-info btn-sm"
                                               data-toggle="modal" data-target="#myModal" data-backdrop="static">
                                                <span class="glyphicon glyphicon-refresh"></span> 更新</a>
                                            <input type="text" hidden value="${knowledge.id}" name="knowledge_id">
                                            <a id="todeletebtn" knowledges_id="${knowledge.id}"  onclick="toDelete(this)"  href="#" class="btn btn-danger btn-sm"
                                            data-toggle="modal" data-target="#deleteModal" data-backdrop="static">
                                            <span class="glyphicon glyphicon-trash"></span>删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                <tr>
                                    <td colspan="5" style="text-align: center">
                                        <br>
                                        第${knowledgeList.getPageNum()}页/共${knowledgeList.getPages()}页&nbsp;&nbsp;
                                        <c:if test="${knowledgeList.getPageNum() gt 1}">
                                            <a href="knowledge/selectAllKnowledge?pageNum=1">第一页</a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${knowledgeList.getPageNum() gt 1}">
                                            <a href="knowledge/selectAllKnowledge?pageNum=${knowledgeList.getPageNum()-1}">上一页</a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${knowledgeList.getPageNum() lt knowledgeList.getPages()}">
                                            <a href="knowledge/selectAllKnowledge?pageNum=${knowledgeList.getPageNum()+1}">下一页</a>&nbsp;&nbsp;
                                        </c:if>
                                        <c:if test="${knowledgeList.getPageNum() lt knowledgeList.getPages()}">
                                            <a href="knowledge/selectAllKnowledge?pageNum=${knowledgeList.getPages()}">末页</a>&nbsp;&nbsp;
                                        </c:if>
                                        总记录数：${knowledgeList.getTotal()}
                                    </td>
                                </tr>
                                </tbody>
                                </table>
                                <br><br><br>
                            </div>
                        </div>
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

<!-- update Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        var no = $(c).attr('knowledges_id');
        //加载删除的信息表单，并加入到模态框的content部分
        $.get('knowledge/deleteKnowledge/' + no, function (html) {
            $('#myModal-content2').append(html);
        }, 'html');
    }

    //也可通过这种方式把其它页面的内容加入到模态框的body部分
    function toUpdate(c) {
        $('#myModal-content').empty();
        var no = $(c).attr('knowledges_id');
        var id = $(c).attr('course_id');
        //加载更新的信息表单，并加入到模态框的content部分
        $.get('knowledge/updateKnowledge/' +no, function (html) {
            $('#myModal-content').append(html);
        }, 'html');
    }


</script>
</body>

</html>
