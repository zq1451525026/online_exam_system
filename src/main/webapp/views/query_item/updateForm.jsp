<%--
  Created by IntelliJ IDEA.
  User: XWPC
  Date: 2018/10/10
  Time: 21:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="testquestion/update" method="post">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
        </button>
        <input type="hidden" name="question_id" value="${question_id}">
        <label>题干：&nbsp;&nbsp;<input name="question" style="width: 430px;height: 40px" class="in" value="${smdOptions.smd_questions.question}"></label>
    </div>
    <br>
    <div style="padding-left: 80px">
        <label>选项A:&nbsp;&nbsp;<input name="option_A" style="width: 320px;height: 35px" class="in" value="${smdOptions.option_A}"></label>
        <br>
        <br>
        <label>选项B:&nbsp;&nbsp;<input name="option_B" style="width: 320px;height: 35px" class="in" value="${smdOptions.option_B}"></label>
        <br>
        <br>
        <label>选项C:&nbsp;&nbsp;<input name="option_C" style="width: 320px;height: 35px" class="in" value="${smdOptions.option_C}"></label>
        <br>
        <br>
        <label>选项D:&nbsp;&nbsp;<input name="option_D" style="width: 320px;height: 35px" class="in" value="${smdOptions.option_D}"></label>
        <br>
        <br>
    </div>
    <label style="padding-left: 430px"><button type="submit" class="btn btn-primary" style="width: 80px">提交</button></label>
    <br><br>
</form>

