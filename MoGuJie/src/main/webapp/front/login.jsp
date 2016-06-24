<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登录_蘑菇街</title>
<link rel="stylesheet" href="css/login.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="../images/logo_s.png" />
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/login.js" charset="utf-8"></script>
</head>

<body>
	<div class="log">
		<a href="index.jsp"><img src="images/log2.png" /></a>
	</div>
	<form action="user_login" method="post">
		<center>
			<div class="zong">
				<div class="tishi" style="margin-top: 10px; display: none">
					<p id="tishi-t"  style="text-align: center"></p>
				</div>
				<div class="user">
					<input type="text" maxlength="32" class="pwd_text" id="uname"
						name="uname" onblur="checkloginuname()" placeHolder="昵称/邮箱/手机号"
						style="border-color: #CFCFCF; color: #999;">
				</div>
				<div class="pwd">
					<input type="password" maxlength="32" class="pwd_text" id="pass"
						name="uspwd" onblur="checkloginpwd()" value="" placeHolder="密码"
						style="border-color: #CFCFCF; color: #999;"><br />
				</div>
				<div class="wj">
					<a href="" class="wj1">忘记密码？</a>
				</div>
				<div class="denglu">
					<input type="submit" id="denglu" value="登录" />
				</div>
				<div class="zhuce">
					<a href="regist.jsp" class="zhuce1">新用户注册</a>
				</div>
				<div class="error" style="color:red">${sessionScope.errorMsg}</div>
				<c:remove var="errorMsg" scope="session"/> <!-- 清除session中的数据 -->
			</div>
		</center>
	</form>
</body>
</html>
