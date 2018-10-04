<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/3
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav metismenu" id="side-menu">
            <!--右上角头像、昵称、与职位 需要与数据库交互-->
            <li class="nav-header">
                <div class="dropdown profile-element"> <span>
                            <img alt="image" class="img-circle" style="width: 80px;height: 80px" src="js/meituanui/img/logo.jpg" />
                             </span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="clear"> <span class="block m-t-xs"> <strong class="font-bold">昵称：${logUser.user_name}</strong></span>
                            <span class="text-muted text-xs block">职位：${logUser.user_type}</span> </span> </a>
                </div>
                <div class="logo-element">
                    选项
                </div>
            </li>
            <!--试题新增-->
            <li id="1" class="${param.id eq 1 ? 'active':''}">
                <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">试题新增</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="xxxx?id=1">新增单选题</a></li>
                    <li><a href="xxxx?id=1">新增多选题</a></li>
                    <li><a href="xxxx?id=1">新增判断题</a></li>
                    <li><a href="xxxx?id=1">新增简答题</a></li>
                    <li><a href="xxxx?id=1">新增编程题</a></li>
                </ul>
            </li>
            <!--试题查询-->
            <li id="2" class="${param.id eq 2 ? 'active':''}">
                <a href="#"><i class="fa fa-th-large"></i> <span class="nav-label">试题查询</span> <span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="xxxx?id=2" >单选题查询</a></li>
                    <li><a href="xxxx?id=2">多选题查询</a></li>
                    <li><a href="xxxx?id=2">判断题查询</a></li>
                    <li><a href="xxxx?id=2">简答题查询</a></li>
                    <li><a href="xxxx?id=2">编程题查询</a></li>
                </ul>
            </li>
            <!--用户管理-->
            <li id="3" class="${param.id eq 3 ? 'active':''}">
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">用户管理</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="views/user_manage/stu_import.jsp?id=3">批量导入用户</a></li>
                    <li><a href="views/user_manage/stu_operation.jsp?id=3">批量操作用户</a></li>
                    <li><a href="views/user_manage/stu_update.jsp?id=3">修改用户信息</a></li>
                </ul>
            </li>
            <!--分类管理-->
            <li id="4" class="${param.id eq 4 ? 'active':''}">
                <a href="#"><i class="fa fa-bar-chart-o"></i> <span class="nav-label">分类管理</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="xxxx?id=4">课程名</a></li>
                    <li><a href="xxxx?id=4">知识点</a></li>
                </ul>
            </li>
            <!--考试管理-->
            <li id="5" class="${param.id eq 5 ? 'active':''}">
                <a href="#"><i class="fa  fa-th-large"></i> <span class="nav-label">考试管理</span><span class="fa arrow"></span></a>
                <ul class="nav nav-second-level collapse">
                    <li><a href="xxxx?id=5">考试</a></li>
                    <li><a href="xxxx?id=5">主观题阅卷</a></li>
                    <li><a href="xxxx?id=5">查看成绩</a></li>
                    <li><a href="xxxx?id=5">考卷维护</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>