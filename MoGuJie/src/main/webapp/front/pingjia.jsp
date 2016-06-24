<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html >
<head>
<meta charset="utf-8">
<title>评价</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="front/css/pingjia.css" type="text/css"></link>
</head>
<%@include file="header.jsp"%>
</head>
<script>
	function hello() {
		var content = $.trim($("#pjsp").val());
		var box = $.trim($("#danxuan"));
		var radio = document.getElementsByTagName("input");
		var obligateone =$('input[name="pingjia"]:checked').val();
		for (var i = 0; i < radio.length; i++) {
			if (radio[i].checked == true) {
				var satisfaction = radio[i].value;
			}
		}
		$.post("feedBack_addPingJia.action", {content:content,obligateone:obligateone},function(data) {
			alert(data);
			if (data > 0) {
				alert("评价成功！");
				location.href="front/myorder.jsp";
			} else {
				alert("评价失败！");
			}
		}, 'json');
	}
</script>
<body>
	<%@include file="head.jsp"%>
	<form action="" method="post">
		<div id="background">
			<p id="jieshi">其他买家,需要您的建议哦！</p>

			<div id="shangping">
				<div id="zuo1">
					<span>评价商品</span>
				</div>
				<input id="pjsp" type="text"
					style="width: 438px; height: 118px; border: none" />
			</div>
			<br /> <br />
			<p id="gysp">关于商品:</p>
			
			<br />
			<div id="danxuan">
				<input name="pingjia" type="radio" value="非常不满意" />非常不满意&nbsp;&nbsp;&nbsp;
				<input name="pingjia" type="radio" value="不满意" />不满意&nbsp;&nbsp;&nbsp;
				<input name="pingjia" type="radio" value="一般" />一般&nbsp;&nbsp;&nbsp;
				<input name="pingjia" type="radio" value="满意" />满意&nbsp;&nbsp;&nbsp;
				<input name="pingjia" type="radio" value="非常满意" />非常满意&nbsp;&nbsp;&nbsp;
			</div>
	</form>
	<br />
	<br />
	<input type="button" id="tjpj" value="提交评价" onClick="hello()" />
	</div>
	<%@include file="footer.jsp"%>
</body>
</html>
