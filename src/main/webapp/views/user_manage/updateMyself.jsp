<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <%@include file="../../common.jsp" %>
    <title>贵美后台管理系统</title>
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
                        <h5>修改我的信息</h5>
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
                            <div class="panel-body">
                                <%--*********--%>
                                <div class="container">
                                    <div class="row clearfix">
                                        <div class="col-md-12 column">
                                            <div class="row clearfix">
                                                <form action="stuManage/update_OLTS_USERS" method="post" class="form-horizontal"
                                                      style="text-align: center;width: 1000px;padding-left: 200px">
                                                    <div class="form-group">
                                                        <label class="col-sm-3 control-label text-right">用户名</label>
                                                        <div class="col-sm-6">
                                                            <input type="hidden" name="id" value="${sessionScope.logUser.id}">
                                                            <input type="hidden" name="stu_no" value="${sessionScope.logUser.stu_no}">
                                                            <input type="hidden" name="user_name" value="${sessionScope.logUser.user_name}">
                                                            <input type="text" class="form-control" name="user_name" disabled
                                                                   value="${sessionScope.logUser.user_name}" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="old_password" class="col-sm-3 control-label text-right">旧密码</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="old_password" name="old_password"
                                                                   value="${sessionScope.logUser.pass_word}" disabled>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="new_password" class="col-sm-3 control-label text-right">新密码</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="new_password" name="pass_word">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="boy" class="col-sm-3 control-label text-right">性别</label>
                                                        <div class="col-sm-6">
                                                            <input type="radio" id="boy" name="gender" value="男" ${('男' eq sessionScope.logUser.gender) ?  'checked':''}>男
                                                            <input type="radio" id="girl" name="gender" value="女" ${('女' eq sessionScope.logUser.gender) ?  'checked':''}>女
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="birthday" class="col-sm-3 control-label text-right">出生日期</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="birthday" name="birthday" placeholder="xxxx/xx/xx"
                                                                   value="<fmt:formatDate value="${sessionScope.logUser.birthday}" pattern="yyyy/MM/dd"/>">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="id_card" class="col-sm-3 control-label text-right">身份证号</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="id_card" name="id_card_no"
                                                                   value="${sessionScope.logUser.id_card_no}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="mobile" class="col-sm-3 control-label text-right">手机号</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="mobile" name="mobile"
                                                                   value="${sessionScope.logUser.mobile}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="qq_number" class="col-sm-3 control-label text-right">QQ号</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="qq_number" name="qq"
                                                                   value="${sessionScope.logUser.qq}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="email" class="col-sm-3 control-label text-right">电子邮箱</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="email" name="email" placeholder="xxxxx@xx.com"
                                                                   value="${sessionScope.logUser.email}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="hometown" class="col-sm-3 control-label text-right">籍贯</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="hometown" name="nation_place"
                                                                   value="${sessionScope.logUser.nation_place}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="major" class="col-sm-3 control-label text-right">专业</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="major" name="marjor"
                                                                   value="${sessionScope.logUser.marjor}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="edu_Background" class="col-sm-3 control-label">学历</label>
                                                        <div class="col-sm-6">
                                                            <select name="edu_Background" id="edu_Background" class="form-control">
                                                                <option value="专科以下" ${sessionScope.logUser.edu_Background eq "专科以下"?"selected":""}>
                                                                    专科以下
                                                                </option>
                                                                <option value="专科" ${sessionScope.logUser.edu_Background eq "专科"?"selected":""}>
                                                                    专科
                                                                </option>
                                                                <option value="本科" ${sessionScope.logUser.edu_Background eq "本科"?"selected":""}>
                                                                    本科
                                                                </option>
                                                                <option value="研究生" ${sessionScope.logUser.edu_Background eq "研究生"?"selected":""}>
                                                                    研究生
                                                                </option>
                                                                <option value="博士" ${sessionScope.logUser.edu_Background eq "博士"?"selected":""}>
                                                                    博士
                                                                </option>
                                                                <option value="博士以上" ${sessionScope.logUser.edu_Background eq "博士以上"?"selected":""}>
                                                                    博士以上
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="graduate" class="col-sm-3 control-label text-right">毕业院校</label>
                                                        <div class="col-sm-6">
                                                            <input type="text" class="form-control" id="graduate" name="graduate_School"
                                                                   value="${sessionScope.logUser.graduate_School}">
                                                        </div>
                                                    </div>

                                                    <div class="form-group" style="float: left;margin-left: 120px">
                                                        <button style="margin-left: 200px" type="button" class="btn btn-default">
                                                            <a href="stuManage/select?id=3">关闭</a>
                                                        </button>
                                                        &nbsp; &nbsp;
                                                        <button type="submit" class="btn btn-primary" id="updateBtn">保存</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--*********--%>
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
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

            </div>
        </div>
    </div>
</div>
</body>

</html>
