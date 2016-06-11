<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>蘑菇街_后台登录</title>
<link rel="stylesheet" type="text/css" href="../easyui/css/easyui.css" />
<link rel="stylesheet" type="text/css" href="../easyui/css/icon.css" />
<link rel="stylesheet" type="text/css" href="../easyui/css/demo.css" />
<link rel="stylesheet" type="text/css" href="../css/index.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="../images/logo_s.png" />

<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../easyui/js/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="../js/showpic.js"></script>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript" src="js/back_login.js"></script>

</head>
<body class="easyui-layout">
	<div id="newslogo"></div>

	<div style="background-color: #9DD3E8; height: 585px;" class="centent">
		<div id="centent_z">
			<form method="post" action="admin_login.action">
				<label>用户名：</label><input type="text" onblur="checkloginuname()"id="aname" name="aname"style="border: 1px solid; height: 25px; width: 170px; margin-top: 150px">&nbsp;&nbsp;&nbsp;<span id="g-name-t"></span><br />
				<br /> 
				<label>密&nbsp;&nbsp;&nbsp; 码：</label><input type="password"onblur="checkloginpwd()" id="apwd" name="apwd"style="border: 1px solid; height: 25px; width: 170px">&nbsp;&nbsp;&nbsp;<span id="g-pwd-t"></span><br />
				<br />
				<div class="error"
				style="color: red; margin-left: 100px;">${sessionScope.errorMsg}</div>
			<c:remove var="errorMsg" scope="session" />
			<!-- 清除session中的数据 -->
				 <input type="button" value="注册" onclick="goToRegiest()"id="regiest"><input type="submit" value="登录" id="login">
			</form>
		</div>
	</div>
	<div style="background: #A9FACD; margin: 0px; padding: 0px;"
		id="copyright">
		<p>
			<a href="http://www.hyycinfo.com">源辰信息科技有限公司</a>&copy;版权所有
			0734-3452345
		</p>
	</div>

</body>
</html>