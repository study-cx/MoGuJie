<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<head>
<meta charset="utf-8">
<title>支付</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="front/css/pay.css"/>
<%@include file="header.jsp"%>
<script>
	function getTime() {
		now = new Date();
		y2k = new Date("Jan 1 2016 00:60:00");
		days = (y2k - now) / 1000 / 60 / 60 / 24;
		daysRound = Math.floor(days);
		hours = (y2k - now) / 1000 / 60 / 60 - (24 * daysRound);
		hoursRound = Math.floor(hours);
		minutes = (y2k - now) / 1000 / 60 - (24 * 60 * daysRound)
				- (60 * hoursRound);
		minutesRound = Math.floor(minutes);
		seconds = (y2k - now) / 1000 - (24 * 60 * 60 * daysRound)
				- (60 * 60 * hoursRound) - (60 * minutesRound);
		secondsRound = Math.round(seconds);
		sec = (secondsRound == 1) ? " second." : " 秒.";
		min = (minutesRound == 1) ? " minute" : " 分 ";
		hours = (hoursRound == 1) ? " hours" : " 小时";
		document.getElementById('limittime').innerHTML = "剩余时间: " + hoursRound
				+ hours + minutesRound + min + secondsRound + sec;
		newtime = window.setTimeout("getTime();", 1000);
	}
</script>
</head>

<body>
	<div class="head2">
	 	<div class="head3">
	          <a class="a3" href="front/shopping.jsp"  target="_blank">购物车</a>
	          <a class="a4" href="front/myorder.jsp"  target="_blank">我的订单</a>
          </div>
        <div class="head1">
        	<c:if test="${not empty loginUser }">
   				<a href="#"><font >当前登陆用户:${loginUser.uname }</font></a>&nbsp;&nbsp;
				<a href="javascript:loginOut()"><font >[注销]</font></a>
   			</c:if>
   			<c:if test="${empty loginUser }">
	    		<a class="a2" href="front/login.jsp">登录</a>
          		<a class="a1" href="front/regist.jsp" >注册</a>
			</c:if>
          </div>
         
   </div>
	<div id="pay1_1">
		<a href="front/index.jsp"><img class="ss5" src="front/images/lg2.png"/></a>
		<img id="pay_1" src="front/images/pay.png">
	</div>
	<div id="pay1_2"></div>
	<div>
		<p>
			<img src="front/images/pay_2.png"/>
			<span>订单提交成功，请您于<a id="limittime"></a>内完成支付（逾期订单将被取消）</span>
		</p>
	</div>
</body>
</html>
