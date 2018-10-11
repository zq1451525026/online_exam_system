<%--
  Created by IntelliJ IDEA.
  User: 王良
  Date: 2018/10/5
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <script src="../../js/jquery-2.2.4.js"></script>
</head>
<body>

<div id="container">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">更新学生信息</h4>
    </div>

    <div class="modal-body" id="update-modal-body">
        <!-- body -->
        <div class="container" style="width: 550px;">
            <div class="row clearfix" style="width: 540px;">
                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <form action="stuManage/update_student" method="post" class="form-horizontal"
                              style="width: 400px;margin-left: 90px; ;">
                            <div class="form-group">
                                <label class="col-sm-3 control-label text-right">用户名</label>
                                <div class="col-sm-6">
                                    <input type="hidden" name="id" value="${stu.id}">
                                    <input type="hidden" name="stu_no" value="${stu.stu_no}">
                                    <input type="hidden" name="user_name" value="${stu.user_name}">
                                    <input type="text" class="form-control" name="user_name" disabled
                                           value="${stu.user_name}" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="old_password" class="col-sm-3 control-label text-right">旧密码</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="old_password" name="old_password"
                                           value="${stu.pass_word}" disabled>
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
                                    <input type="radio" id="boy" name="gender" value="男" ${('男' eq stu.gender) ?  'checked':''}>男
                                    <input type="radio" id="girl" name="gender" value="女" ${('女' eq stu.gender) ?  'checked':''}>女
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="birthday" class="col-sm-3 control-label text-right">出生日期</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="birthday" name="birthday" placeholder="xxxx/xx/xx"
                                           value="<fmt:formatDate value="${stu.birthday}" pattern="yyyy/MM/dd"/>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_card" class="col-sm-3 control-label text-right">身份证号</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="id_card" name="id_card_no"
                                           value="${stu.id_card_no}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mobile" class="col-sm-3 control-label text-right">手机号</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="mobile" name="mobile"
                                           value="${stu.mobile}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="qq_number" class="col-sm-3 control-label text-right">QQ号</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="qq_number" name="qq"
                                           value="${stu.qq}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email" class="col-sm-3 control-label text-right">电子邮箱</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="email" name="email" placeholder="xxxxx@xx.com"
                                           value="${stu.email}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="hometown" class="col-sm-3 control-label text-right">籍贯</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="hometown" name="nation_place"
                                           value="${stu.nation_place}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="major" class="col-sm-3 control-label text-right">专业</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="major" name="marjor"
                                           value="${stu.marjor}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edu_Background" class="col-sm-3 control-label">学历</label>
                                <div class="col-sm-6">
                                    <select name="edu_Background" id="edu_Background" class="form-control">
                                        <option value="专科以下" ${stu.edu_Background eq "专科以下"?"selected":""}>
                                            专科以下
                                        </option>
                                        <option value="专科" ${stu.edu_Background eq "专科"?"selected":""}>
                                            专科
                                        </option>
                                        <option value="本科" ${stu.edu_Background eq "本科"?"selected":""}>
                                            本科
                                        </option>
                                        <option value="研究生" ${stu.edu_Background eq "研究生"?"selected":""}>
                                            研究生
                                        </option>
                                        <option value="博士" ${stu.edu_Background eq "博士"?"selected":""}>
                                            博士
                                        </option>
                                        <option value="博士以上" ${stu.edu_Background eq "博士以上"?"selected":""}>
                                            博士以上
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="graduate" class="col-sm-3 control-label text-right">毕业院校</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="graduate" name="graduate_School"
                                           value="${stu.graduate_School}">
                                </div>
                            </div>

                            <div class="form-group" style="float: left">
                                <button style="margin-left: 150px" type="button" class="btn btn-default"
                                        data-dismiss="modal">关闭
                                </button>
                                &nbsp; &nbsp;
                                <button type="submit" class="btn btn-primary" id="updateBtn">保存</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>