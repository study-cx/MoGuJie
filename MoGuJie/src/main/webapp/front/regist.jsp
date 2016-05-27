<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>注册_蘑菇街</title>
<link rel="stylesheet" href="css/regist.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="../images/logo_s.png" />
<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="../js/login.js" charset="utf-8"></script>
</head>

<body>
	<div class="log">
		<a href="index.jsp"><img src="images/log2.png" /></a>
	</div>
	<form action="user_register" method="post">
		<div class="zong">

			<center>
				<div class="z-tishi" style="margin-top: 10px; display: none">
					<p id="z-tishi-t"  style="text-align: center">用户不存在</p>
				</div>
				<div class="user">
					<input type="text" maxlength="32" class="pwd_text" id="r_uname"
						name="uname" onblur="checkzcuname()" placeHolder="昵称"
						style="border-color: #CFCFCF; color: #999;"> <span
						id="unamep" style="color: red; font-size: 13px; display: none"></span>
				</div>
				<div class="pwd">
					<input type="password" maxlength="32" class="pwd_text" id="r_pass"
						name="uspwd" onblur="checkzcpwd()" value="" placeHolder="密码"
						style="border-color: #CFCFCF; color: #999;"><br /> <span
						id="upwdp" style="color: red; font-size: 13px; display: none"></span>
				</div>
				<div class="pwd1">
					<input type="password" maxlength="32" class="pwd_text" id="r_pass1"
						onblur="checkzcpwdagain()" value=""
						placeHolder="重复密码" style="border-color: #CFCFCF; color: #999;"><br />
					<span id="upwd1p"
						style="color: red; font-size: 13px; display: none"></span>
				</div>
				<div class="tel">
					<input type="text" maxlength="32" class="pwd_text" id="r_tel"
						name="usphone" onblur="checkzcphone()" placeHolder="手机号"
						style="border-color: #CFCFCF; color: #999;"> <span
						id="utelp" style="color: red; font-size: 13px; display: none"></span>
				</div>
				<div class="email">
					<input type="text" maxlength="32" class="pwd_text" id="r_email"
						name="usemail" onblur="checkzcemail()" placeHolder="邮箱"
						style="border-color: #CFCFCF; color: #999;"> <span
						id="uemailp" style="color: red; font-size: 13px; display: none"></span>
				</div>
			</center>

			<div class="zhuce">
				<input type="submit" id="zhuce" value="注册" />
			</div>
			<div class="xieyi">
				<a href="xieyi.jsp" id="xieyi" target="_blank">《蘑菇街网络服务协议》</a>
			</div>
			<div class="denglu">
				<a href="login.jsp" id="denglu">已有账号</a>
			</div>
		</div>
	</form>
</body>
</html>
