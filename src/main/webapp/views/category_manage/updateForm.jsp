<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/10/4
  Time: 21:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="container">
    <div class="modal-header"  >
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">更新课程名</h4>
    </div>
    <div class="modal-body" id="update-modal-body">
        <!-- body -->
        <div class="container"  >
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="row clearfix">

                        <form   class="form-horizontal" id="updateForm" action="category/saveUpdateCourse" method="post" style="text-align: center;width: 550px">
                            <input type="hidden"  name="course_id" value="${upCourse.id}">
                            <%--<input type="hidden"  name="course_name" value="${upCourse.course_name}">--%>
                            <div class="form-group">
                                <label for="course_id" class="col-sm-3 control-label text-right">ID</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="course_id" name="course_id" value="${upCourse.id}" disabled>
                                </div>
                                <br><br>
                                <label for="course_name" class="col-sm-3 control-label text-right">课程名</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="course_name" name="course_name" placeholder="${upCourse.course_name}" value="${upCourse.course_name}">
                                </div>
                            </div>

                            <div class="form-group" style="float: left">
                                <button style="margin-left: 200px" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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