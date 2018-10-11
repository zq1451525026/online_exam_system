<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="../../common.jsp" %>
    <title>在线考试系统</title>
    <script src="../../js/jquery-2.2.4.js"></script>
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
                        <strong>批量导入用户</strong>
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
                        <h5>导入学生信息列表</h5>
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
                        <form class="form-inline" style="margin-top: 10px;text-align: center"
                              action="stuManage/uploadFile" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon">授课院校：</div>
                                    <input type="text" class="form-control" id="ctgr_id" name="graduate_School"
                                           placeholder="请输入院校名称">
                                </div>
                                <input type="file" class="form-control" name="upload" placeholder="请插入表格文件">
                                <div class="input-group" style="margin-top: 5px">
                                    <%--查询授课院校--%>
                                    <button type="submit" class="btn btn-success"><span
                                            class="glyphicon glyphicon-search" style="height: 16px;"></span></button>
                                    <%--重置条件--%>
                                    <button type="reset" class="btn btn-info" style="margin-left: 2px"><span
                                            class="glyphicon glyphicon-repeat" style="height: 16px;"></span></button>
                                </div>
                            </div>
                            <br>
                        </form>
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
    function todelete(c) {
        $('#myModal-content2').empty();
        var no = $(c).attr('ctgr_id');
        //加载删除的信息表单，并加入到模态框的content部分
        $.get('list/query2.do?ctgr_id=' + no, function (html) {
            //console.dirxml(html)
            $('#myModal-content2').append(html);
        }, 'html');
    }

    //也可通过这种方式把其它页面的内容加入到模态框的body部分
    function toUpdate(c) {
        $('#myModal-content').empty();

        var no = $(c).attr('ctgr_id');
        //加载更新的信息表单，并加入到模态框的content部分
        $.get('list/query.do?ctgr_id=' + no, function (html) {
            //console.dirxml(html)
            $('#myModal-content').append(html);
        }, 'html');
    }
</script>
</body>

</html>
