<%--
  Created by IntelliJ IDEA.
  User: XWPC
  Date: 2018/10/11
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <form action="testquestion/delete" method="post">
        <input type="hidden" value="${question_id}" name="question_id">
    <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">x
    </button>
    <br><br>
    <label style="font-size: large;padding-left: 180px">是否确认删除该题目?</label>
    <br><br>
    <label style="padding-left: 230px">
        <button type="submit" class="btn btn-primary" style="width: 80px">确认</button>
    </label>
    <br><br>
    </form>
</div>