<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

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
        <h4 class="modal-title" id="myModalLabel">更新知识点</h4>
    </div>
    <div class="modal-body" id="update-modal-body">
        <!-- body -->
        <div class="container"  >
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="row clearfix">
                        <form class="form-horizontal" id="updateForm" action="knowledge/saveUpdateKnowledge" method="post" style="text-align: center;width: 550px">
                            <input type="hidden"  name="knowledge_id" value="${upKnowledge.id}">
                            <div class="form-group">
                                <label for="knowledge_id" class="col-sm-3 control-label text-right">ID</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="knowledge_id" name="knowledge_id" value="${upKnowledge.id}" disabled>
                                </div>
                                <br><br>
                                <label for="tech_ctgr" class="col-sm-3 control-label text-right">知识点</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" id="tech_ctgr" name="tech_ctgr" placeholder="${upKnowledge.tech_ctgr}" value="${upKnowledge.tech_ctgr}">
                                </div>
                                <br><br>
                                <label for="tech_ctgr" class="col-sm-3 control-label text-right">课程名</label>
                                <div class="col-sm-6">
                                    <select id="course" class="form-control">
                                        <option value="${upKnowledge.courses.course_name}" name="course_name" >${upKnowledge.courses.course_name}</option>
                                        <c:forEach var="course" items="${upCourseList.getResult()}">
                                            <option value="${course.course_name}" name="course_name">${course.course_name}</option>
                                        </c:forEach>
                                    </select>
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
