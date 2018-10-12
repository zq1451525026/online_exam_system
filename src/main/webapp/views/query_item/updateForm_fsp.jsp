<%--
  Created by IntelliJ IDEA.
  User: XWPC
  Date: 2018/10/11
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">×
    </button>
    <label>题干：&nbsp;&nbsp;<input name="question" style="width: 430px;height: 40px" class="in" value="${smdOptions.smd_questions.question}"></label>
</div>
<br>
<div style="padding-left: 80px">
    <label>正确答案:&nbsp;&nbsp;<input name="option0" style="width: 320px;height: 35px" class="in" value="${smdOptions.std_answer}"></label>
    <br>

</div>
<label style="padding-left: 430px"><button type="submit" class="btn btn-primary" style="width: 80px">提交</button></label>
<br><br>
