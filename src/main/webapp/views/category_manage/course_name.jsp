<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/10/4
  Time: 15:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="../../common.jsp"%>
    <title>课程名</title>
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
                        <strong>课程名</strong>
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
                        <h5>课程名</h5>
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
                        课程新增
                        <form class="form-inline" style="margin-top: 2px;text-align: center" action="category/insertCourse?id=3" method="post">

                            <div class="form-group">
                                <div class="input-group" style="width: 300px">
                                    <div class="input-group-addon">课程名</div>
                                    <input type="text" class="form-control" id="course_name" name="course_name" placeholder="请输入课程名">
                                </div>
                                <button type="submit" class="btn btn-success" style="margin-left: 50px">保存</button>
                                <button type="reset" class="btn btn-info" style="margin-left: 50px">重置</button>
                            </div>
                            <br>
                        </form>
                        <%-------------------------------%>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title text-left"><span class="fa fa-bar-chart-o"></span>  &nbsp;课程分类列表</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-striped"  id="head">
                                    <thead>
                                    <tr style="text-align: center">
                                        <th class="text-center">ID</th>
                                        <th class="text-center">课程名</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="courses" items="${coursesList.getResult()}">
                                        <tr style="text-align: center" id="tr_${courses.id}">
                                            <td>${courses.id}</td>
                                            <td>${courses.course_name}</td>
                                            <td>
                                                <a id="toUpdateBtn" courses_id="${courses.id}"  onclick="toUpdate(this)" href="#" class="btn btn-info btn-sm"
                                                   data-toggle="modal" data-target="#myModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-refresh"></span> 更新</a>
                                                <input type="text" hidden value="${courses.id}" name="course_id">
                                                <a id="todeletebtn" courses_id="${courses.id}"  onclick="toDelete(this)"  href="#" class="btn btn-danger btn-sm"
                                                   data-toggle="modal" data-target="#deleteModal" data-backdrop="static">
                                                    <span class="glyphicon glyphicon-trash"></span>删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                    <tr>
                                        <td colspan="5" style="text-align: center">
                                            <br>
                                            第${coursesList.getPageNum()}页/共${coursesList.getPages()}页&nbsp;&nbsp;
                                            <c:if test="${coursesList.getPageNum() gt 1}">
                                                <a href="category/selectAllCourses?pageNum=1">第一页</a>&nbsp;&nbsp;
                                            </c:if>
                                            <c:if test="${coursesList.getPageNum() gt 1}">
                                                <a href="category/selectAllCourses?pageNum=${coursesList.getPageNum()-1}">上一页</a>&nbsp;&nbsp;
                                            </c:if>
                                            <c:if test="${coursesList.getPageNum() lt coursesList.getPages()}">
                                                <a href="category/selectAllCourses?pageNum=${coursesList.getPageNum()+1}">下一页</a>&nbsp;&nbsp;
                                            </c:if>
                                            <c:if test="${coursesList.getPageNum() lt coursesList.getPages()}">
                                                <a href="category/selectAllCourses?pageNum=${coursesList.getPages()}">末页</a>&nbsp;&nbsp;
                                            </c:if>
                                            总记录数：${coursesList.getTotal()}
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
        var no = $(c).attr('courses_id');
        //加载删除的信息表单，并加入到模态框的content部分
        $.get('category/deleteCourse/' + no, function (html) {
            $('#myModal-content2').append(html);
        }, 'html');
    }

    //也可通过这种方式把其它页面的内容加入到模态框的body部分
    function toUpdate(c) {
        $('#myModal-content').empty();
        var no = $(c).attr('courses_id');
        //加载更新的信息表单，并加入到模态框的content部分
        $.get('category/updateCourse/' + no, function (html) {
            $('#myModal-content').append(html);
        }, 'html');
    }
</script>
</body>

</html>

