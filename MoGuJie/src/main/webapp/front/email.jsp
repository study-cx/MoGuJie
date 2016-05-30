<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>邮箱验证</title>
</head>
<style type="text/css">
*{
	padding:0px auto;
	margin:0px auto;
	}
body{
	margin:0px auto;
	width:100%;
	height:100%;
	background:url(../images/email2.jpg);
	background-size:100%;
	}
.email{
	width:600px;
	height:400px;
	margin-top:100px;}


</style>
<body>
<form action="user_registers" method="post">
	<div class="email">
    	<div><h3>您的邮箱还未激活!在找回密码的同时,您的账号将被成功激活。</h3><br/><br/>
        邮箱验证码已经发送至您的邮箱，请在下框输入验证信息：<br/><br/>
        邮箱验证码：<input name="email" type="text" width="200px" height="50px"><br/><br/>
        <input type="submit" value=" " style="background:url(../images/tijiao.jpg) no-repeat; width:80px; height:30px;">
        </div>
    </div>
</form>
</body>
</html>
