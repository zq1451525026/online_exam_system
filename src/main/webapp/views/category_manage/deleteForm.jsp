<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/10/5
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
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
        <h4 class="modal-title" id="myModalLabel">删除课程</h4>
    </div>
    <div class="modal-body" id="update-modal-body">
        <!-- body -->
        <div class="container"  >
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="row clearfix">

                        <form   class="form-horizontal" id="updateForm" action="category/doDeleteCourse" method="post" style="text-align: center;width: 550px">
                            <input type="hidden"  name="course_id" value="${deCourse.id}">
                            <input type="hidden"  name="course_name" value="${upCourse.course_name}">
                            <div>
                                确定删除课程“${deCourse.course_name}”吗？
                            </div>
                            <div class="form-group" style="float: left">
                                <button style="margin-left: 220px" type="submit" class="btn btn-primary" id="updateBtn">是</button>
                                &nbsp; &nbsp;
                                <button style="margin-left: 20px" type="button" class="btn btn-default" data-dismiss="modal">否</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

    </div>

</div>