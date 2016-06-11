<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>蘑菇街_后台注册</title>
	<link rel="stylesheet" type="text/css" href="../easyui/css/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../easyui/css/icon.css"/>
	<link rel="stylesheet" type="text/css" href="../easyui/css/demo.css"/>
	<link rel="stylesheet" type="text/css" href="../css/index.css"/>
	<link rel="shortcut icon" type="image/x-icon" href="../images/logo_s.png"/>
	
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../easyui/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../easyui/js/easyui-lang-zh_CN.js"></script>
	
	<script type="text/javascript" src="../js/showpic.js"></script>
	<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="js/back_login.js"></script>
	
	<!--编辑器 -->
	<script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="../ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="easyui-layout">
	<div  id="newslogo">
	</div>
	
	<div style="background-color:#9DD3E8;height:585px;"  class="centent">
	<form method="post" action="admin_adminRegiest.action">
		<div id="centent_z">
		<div class="error"
				style="color: red; margin-left: 100px;">${sessionScope.errorMsg}</div>
			<c:remove var="errorMsg" scope="session" />
			<label>&nbsp;用&nbsp;户&nbsp;名：</label><input type="text" onblur="checkzcuname()" id="name_t" name="aname" style="border: 1px solid;height:25px;width:170px;margin-top:100px">
			&nbsp;&nbsp;&nbsp;<span id="name-t" ></span>
			<br/><br/>
			<label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input type="password" onblur="checkzcpwd()"  id="pwd_t" name="apwd" style="border: 1px solid;height:25px;width:170px">
			&nbsp;&nbsp;&nbsp;<span id="tpwd-t" ></span>
			<br/><br/>
			<label>确认密码：</label><input type="password"  id="pwd_t2" onblur="checkzcpwdagain()" style="border: 1px solid;height:25px;width:170px">
			&nbsp;&nbsp;&nbsp;<span id="tpwd-t2" ></span>
			<br/><br/>
			<label>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label><input type="text" onblur="checkzcemail()"  id="email" name="aemail" style="border: 1px solid;height:25px;width:170px">
			&nbsp;&nbsp;&nbsp;<span id="email-t" ></span>
			<br/><br/>
			<input type="button" value="返回" onclick="goToLogin()"  id="login"><input type="submit"  value="注册"  id="regiest"> 
		</div>
	</form>
	</div>
	<div  style="background:#A9FACD;margin:0px;padding:0px;" id="copyright">
		<p><a href="http://www.hyycinfo.com">源辰信息科技有限公司</a>&copy;版权所有 0734-3452345</p>
	</div>
	
</body>
</html>
