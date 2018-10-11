<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../common.jsp" %>
    <title>在线考试系统</title>
    <script src="../../js/jquery-2.2.4.js"></script>

    <script type="text/javascript">
        $(function () {
            $('#deleteAll').click(function () {
                if (this.checked) {
                    $('[name = "line"]').prop("checked", true);
                } else {
                    $('[name = "line"]').prop("checked", false);
                }
            })
        });
    </script>
    <script type="text/javascript">
        function clock() {
            var time = new Date();
            time = time.toLocaleTimeString();
            document.getElementById('h5').innerHTML=time;
        }
        setInterval(clock, 1000);
    </script>
</head>

<body>
<div id="wrapper">
    <%--此处包含左侧--%>
    <%@include file="../../main_left.jsp" %>

    <div id="page-wrapper" class="gray-bg">
        <%--此处包含头部信息--%>
        <div class="row border-bottom">
            <%@include file="../../main_top.jsp" %>
        </div>
        <!--头部导航窗口自定义对应每个界面 如 首页/商品管理/员工详细/自己给超链接-->
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>导航</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="../../welcome.jsp">首页</a>
                    </li>
                    <li>
                        <a>用户管理</a>
                    </li>
                    <li class="active">
                        <strong>用户信息批量操作</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2" id="h5">
            </div>
        </div>

        <div class="row wrapper wrapper-content animated fadeInRight">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>学生用户信息</h5>
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
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title text-left"><span class="fa fa-bar-chart-o"></span> &nbsp;学生用户信息
                                </h3>
                            </div>

                            <form class="form-inline" style="margin-top: 10px;margin-bottom: 0px; text-align: center"
                                  action="stuManage/select?clear=0&pageNum=" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">授课院校：</div>
                                        <input type="text" class="form-control" id="sch_id" name="graduate_School"
                                               placeholder="${olts_users.graduate_School !='' ? olts_users.graduate_School:'请输入授课院校'}"
                                               onfocus="this.placeholder=''"
                                               onblur="this.placeholder='${olts_users.graduate_School !='' ? olts_users.graduate_School:'请输入授课院校'}'">
                                    </div>
                                    <div class="input-group" style="margin-top: 5px">
                                        <%--查询授课院校--%>
                                        <button type="submit" class="btn btn-success"><span
                                                class="glyphicon glyphicon-search" style="height: 16px;"></span>
                                        </button>
                                        <%--重置条件--%>
                                        <button type="reset" class="btn btn-info" style="margin-left: 2px"><span
                                                class="glyphicon glyphicon-repeat" style="height: 16px;"></span>
                                        </button>
                                    </div>
                                </div>
                                <br>
                            </form>

                            <div class="panel-body">
                                <table class="table table-striped" id="head">
                                    <thead>
                                    <tr style="text-align: center">
                                        <th class="text-center">序号</th>
                                        <th class="text-center">姓名</th>
                                        <th class="text-center">身份证号码</th>
                                        <th class="text-center">专业</th>
                                        <th class="text-center">最高学历</th>
                                        <th class="text-center">手机号</th>
                                        <th class="text-center">QQ号</th>
                                        <th class="text-center">授课院校</th>
                                        <th class="text-center">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <%Integer pageNum = (Integer) session.getAttribute("pageNum");%>
                                    <%int i = 1;%>
                                    <%--批量删除的表单--%>
                                    <form action="stuManage/delete" method="post">
                                        <c:forEach var="student" items="${students}">
                                            <tr style="text-align: center" id="tr_${student.getStu_no()}">
                                                <td>
                                                    <input type="checkbox" name="line" value=${student.getId()}>
                                                    <%=10 * (pageNum - 1) + i++%>
                                                </td>
                                                <td>${student.getUser_name()}</td>
                                                <td>${student.getId_card_no()}</td>
                                                <td>${student.getMarjor()}</td>
                                                <td>${student.getEdu_Background()}</td>
                                                <td>${student.getMobile()}</td>
                                                <td>${student.getQq()}</td>
                                                <td>${student.getGraduate_School()}</td>

                                                <td>
                                                    <a href="stuManage/update/${student.getId()}" id="toUpdateBtn"
                                                       class="btn btn-info btn-sm"
                                                       data-toggle="modal" data-target="#myModal">
                                                        <span class="glyphicon glyphicon-refresh"></span> 修改</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr class="page-nav">
                                            <td colspan='9'>
                                                总记录：${students.getTotal()} &nbsp;&nbsp;
                                                第${students.getPageNum()}页/共${students.getPages()}页
                                                &nbsp;&nbsp; &nbsp;&nbsp;
                                                <c:if test="${students.getPageNum() gt 1}">
                                                    <a href="stuManage/select?pageNum=1&clear=0">第一页</a> &nbsp;
                                                </c:if>
                                                <c:if test="${students.getPageNum() gt 1}">
                                                    <a href="stuManage/select?clear=0&pageNum=${students.getPageNum()-1}">上一页</a>&nbsp;
                                                </c:if>
                                                <c:if test="${students.getPageNum() lt students.getPages()}">
                                                    <a href="stuManage/select?clear=0&pageNum=${students.getPageNum()+1}">下一页</a>&nbsp;
                                                </c:if>
                                                <c:if test="${students.getPageNum() lt students.getPages()}">
                                                    <a href="stuManage/select?clear=0&pageNum=${students.getPages()}">末页</a>&nbsp;
                                                </c:if>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="9" style="text-align: left;padding-left: 15px">
                                                <input type="chec


                                                kbox" id="deleteAll" name="deleteAll">&nbsp;全选&nbsp;
                                                <button type="submit">批量删除</button>
                                            </td>
                                        </tr>
                                    </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--结尾信息-->
        <div class="footer">
            <div class="pull-right" style="font-size: 12px">
                贵美<strong>后台</strong> 管理系统
            </div>
            <div style="font-size: 12px">
                烧脑分队 倾情奉献 &copy; 2018-2019
            </div>
        </div>
    </div>
</div>

<%--update--%>
<div class="container">
    <!-- 模态框 -->
    <div class="modal fade" id="myModal" style="margin-top: 1px">
        <div class="modal-dialog">
            <div class="modal-content">
                模态框出错了好吧，快去查看目标页面代码是否有误
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $('#myModal').on('hide.bs.modal', function () {
            window.location.reload()
        });
    })
</script>
</html>
