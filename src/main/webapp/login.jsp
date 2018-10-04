<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/8/31
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>登录</title>

    <link href="js/meituanui/css/bootstrap.min.css" rel="stylesheet">
    <link href="js/meituanui/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="js/meituanui/css/animate.css" rel="stylesheet">
    <link href="js/meituanui/css/style.css" rel="stylesheet">
</head>

<style>
    #back{
        background-color:rgba(55,55,55,0.5);
    }

</style>
<body class="gray-bg" background="images/hua.jpg">

<div class="loginColumns animated fadeInDown">
    <div class="row">

        <div class="col-md-6">
            <h2 class="font-bold" style="color: #00ee00;font-family: 宋体;font-size: 35px">Welcome to 蓝桥在线考试系统</h2>
            <h3>&nbsp;&nbsp;疾风知劲草</h3>
            <h3>&nbsp;&nbsp;板荡识诚臣</h3>
            <h3>乘风破浪会有时</h3>
            <h3>直挂云帆济沧海</h3>

        </div>


        <div class="col-md-6">
            <div class="ibox-content" id="back" >
               <form class="m-t" role="form" action="user/login"  style="margin-top: 100px;margin-bottom: 100px;" >
                    <div class="form-group">
                        <input type="text" class="form-control" id="user_name" name="user_name"  placeholder="user_name">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pass_word" name="pass_word"  placeholder="pass_word">
                    </div>
                   <div class="form-group">
                       <div class="col-md-12 text-center">
                           <button type="submit" class="btn btn-primary btn-md login-btn-sumbit">&nbsp;login&nbsp;</button>&nbsp;&nbsp;
                           <button type="reset" class="btn btn-default btn-md login-btn-reset">&nbsp;reset&nbsp;</button>
                       </div>
                   </div>
                </form>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-6" style="color:green">
            烧脑分队  倾情奉献
        </div>
        <div class="col-md-6 text-right" style="color:green">
            <small>&copy; 2018-2019</small>
        </div>
    </div>
</div>
</body>
</html>
