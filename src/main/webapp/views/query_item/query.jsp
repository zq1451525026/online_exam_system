<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <%@include file="../../common.jsp"%>
  <title>蓝桥在线考试系统</title>
</head>

<body>

<div id="wrapper">

  <%--此处包含左侧--%>
  <%@include file="../../main_left.jsp"%>

  <div id="page-wrapper" class="gray-bg">
    <%--此处包含头部信息--%>
    <div class="row border-bottom">
      <%@include file="../../main_top.jsp"%>
    </div>
    <!--头部导航窗口自定义对应每个界面 如 首页/商品管理/员工详细/自己给超链接-->
    <div class="row wrapper border-bottom white-bg page-heading"  >
      <div class="col-lg-10">

        <h2>导航</h2>
        <ol class="breadcrumb">
          <li>
            <a href="../../welcome.jsp">首页</a>
          </li>
          <li>
            <a>商品分类</a>
          </li>
          <li class="active">
            <strong>查询分类</strong>
          </li>
        </ol>
      </div>
      <div class="col-lg-2">

      </div>
    </div>

    <div class="row wrapper wrapper-content animated fadeInRight">
      <div class="col-lg-12">
        <div class="ibox float-e-margins">
          <div class="ibox-title">
            <h5>标题栏</h5>
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
            <form class="form-inline" style="margin-top: 10px;text-align: center" action="chose/list.do?id=3" method="post">
              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-addon">编号</div>
                  <input type="text" class="form-control" id="ctgr_id" name="ctgr_id" placeholder="请输入编号">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-addon">小分类</div>
                  <input type="text" class="form-control" id="ctgr_name" name="ctgr_name" placeholder="请输入小分类">
                </div>
              </div>
              <div class="form-group">
                <div class="input-group">
                  <div class="input-group-addon">大分类</div>
                  <%--<input type="text" class="form-control" id="big_ctgr" name="big_ctgr" placeholder="请输入大分类">--%>
                    <select name="big_ctgr" id="big_ctgr" class="form-control">
                      <option value="">------全选------</option>
                        <optiongroup >
                        <%--<%
                            List<Ctgr> ctgrs = new CtgrDao().findAll();
                            for (Ctgr ctgr : ctgrs) {
                        %>
                        <option value="<%=ctgr.getBig_name()%>"><%=ctgr.getBig_name()%></option>
                        <%
                            }
                        %>--%></optiongroup>
                    </select>
                </div>
              </div>
              <br>
              <div class="input-group" style="margin-top: 10px">
                <button type="submit" class="btn btn-success">查询</button>
                <button type="reset" class="btn btn-info" style="margin-left: 50px">重置</button>
              </div>
            </form>
            <%-------------------------------%>
            <div class="panel panel-primary">
                <div class="panel-heading">
                  <h3 class="panel-title text-left"><span class="fa fa-bar-chart-o"></span>  &nbsp;商品分类列表</h3>
                </div>
                <div class="panel-body">
                     <table class="table table-striped"  id="head">
                          <thead>
                          <br>
                          <tr style="text-align: center">
                            <th class="text-center">序号</th>
                            <th class="text-center">ID</th>
                            <th class="text-center">小分类</th>
                            <th class="text-center">大分类</th>
                            <th class="text-center">基本操作</th>
                          </tr>
              </thead>
              <tbody>
              <% int i = 1;%>
              <c:forEach var="cat" items="${categories}">
                <tr style="text-align: center" id="tr_${cat.ctgr_id}">
                  <td>
                    <%
                      String pageNo = request.getParameter("pageNo");
                      Integer page1;
                      if (pageNo == null) {
                        page1 = 1;
                      } else {
                          page1 = Integer.valueOf(pageNo);
                      }
                      /*out.print(6*(page1-1)+i);*/
                      i++;
                    %>
                  </td>
                  <td>${cat.ctgr_id}</td>
                  <td>${cat.ctgr_name}</td>
                  <td>${cat.big_ctgr}</td>
                  <td>
                    <a id="toUpdateBtn" ctgr_id="${cat.ctgr_id}"  onclick="toUpdate(this)" href="#" class="btn btn-info btn-sm"
                       data-toggle="modal" data-target="#myModal" data-backdrop="static">
                      <span class="glyphicon glyphicon-refresh"></span> 更新</a>


                    <a id="todeletebtn" ctgr_id="${cat.ctgr_id}"  onclick="todelete(this)"  href="#" class="btn btn-danger btn-sm"
                       data-toggle="modal" data-target="#deleteModal" data-backdrop="static">
                      <span class="glyphicon glyphicon-trash"></span>删除</a>

                  </td>
                </tr>
              </c:forEach>


              <tr>
                <td colspan="5" style="text-align: center">
                  <br>
                  <c:if test="${not page1.first}">
                    <a href="chose/page.do?pageNo=1">第一页</a>&nbsp;&nbsp;
                  </c:if>
                  <c:if test="${page1.pageNo gt 1}">
                    <a href="chose/page.do?pageNo=${page1.pageNo-1}">上一页</a>&nbsp;&nbsp;
                  </c:if>
                  <c:if test="${page1.pageNo lt page1.totalPage}">
                    <a href="chose/page.do?pageNo=${page1.pageNo+1}">下一页</a>&nbsp;&nbsp;
                  </c:if>
                  <c:if test="${not page1.last}">
                    <a href="chose/page.do?pageNo=${page1.totalPage}">最后一页</a>
                  </c:if>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <font color="#347AB7">当前第${page1.pageNo}页，共${page1.totalPage}页</font>
                </td>
              </tr>
              </tbody>
            </table>
            <br><br><br>
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
        烧脑分队  倾情奉献 &copy; 2018-2019
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
    function  todelete(c) {
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
