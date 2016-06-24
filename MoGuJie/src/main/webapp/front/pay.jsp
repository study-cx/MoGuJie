<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html >
<script type="text/javascript">
	var op="${param.op}";
	if(op=="YuEPayFail"){
		alert("对不起，您的余额不足\n请选择其他支付方式！");
	}
</script>
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
		document.getElementById('limittime').innerHTML ="剩余时间: " + hoursRound
				+ hours + minutesRound + min + secondsRound + sec;
		newtime = window.setTimeout("getTime();", 1000);
	}
	/* $(function(){
		var price="${param.price}";
		$("#price").html(price);
		$("#price1").html(price);
	}); */
</script>
</head>

<body onload="getTime()">
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
		<a href="front/index.jsp"><img class="ss5" src="front/images/pay111.png"/></a>
		<img id="pay_1" src="front/images/pay.png">
	</div>
	<div id="pay1_2">
		<img class="title1" src="front/images/pay_2.png"/>
		<span>订单提交成功，请您于<span id="limittime" style="color:red;font-size:18px;"></span>内完成支付（逾期订单将被取消）</span>
		<span class="title2" style="font-size:18px;">应付金额：<span id="price" style="color:red;font-size:20px;">￥${fuKuanInfoBean[0].getTotalprice()}</span></span>
	</div>
	<form action="payment_pay.action" method="post">
		<div id="pay1_3">
			<ul>
				<li>
					<input type="radio" name="yh" value="YuE"/>
				</li>
				<li>余额</li>
				<li>
					可用余额：${loginUser.usaccount}元
				</li>
			</ul>
		</div>
		<div id="pay1_4">
			<h3>其他支付方式：<span>请您选择在线支付银行</span></h3>
			<ul>
				<li><input type="radio" name="yh" value="CMBCHINA-NET"><img src="front/bank_img/cmb.bmp"/></li>
				<li><input type="radio" name="yh" value="BJ-NET"><img src="front/bank_img/bj.bmp"/></li>
				<li><input type="radio" name="yh" value="ABC-NET"><img src="front/bank_img/abc.bmp"/></li>
				<li><input type="radio" name="yh" value="BC-NET"><img src="front/bank_img/bc.bmp"/></li>
				<li><input type="radio" name="yh" value="BCC-NET"><img src="front/bank_img/bcc.bmp"/></li>
			</ul>
			<ul>
				<li><input type="radio" name="yh" value="BH-NET"><img src="front/bank_img/bh.bmp"/></li>
				<li><input type="radio" name="yh" value="CCB-NET"><img src="front/bank_img/ccb.bmp"/></li>
				<li><input type="radio" name="yh" value="CIB-NET"><img src="front/bank_img/cib.bmp"/></li>
				<li><input type="radio" name="yh" value="CMB-NET"><img src="front/bank_img/cmb.bmp"/></li>
				<li><input type="radio" name="yh" value="CMBC-NET"><img src="front/bank_img/cmbc.bmp"/></li>
			</ul>
			<ul>
				<li><input type="radio" name="yh" value="GF-NET"><img src="front/bank_img/gf.bmp"/></li>
				<li><input type="radio" name="yh" value="GS-NET"><img src="front/bank_img/gongShang.bmp"/></li>
				<li><input type="radio" name="yh" value="GD-NET"><img src="front/bank_img/guangda.bmp"/></li>
				<li><input type="radio" name="yh" value="HX-NET"><img src="front/bank_img/hx.bmp"/></li>
				<li><input type="radio" name="yh" value="NJ-NET"><img src="front/bank_img/nanjing.bmp"/></li>
			</ul>
			<ul>
				<li><input type="radio" name="yh" value="NB-NET"><img src="front/bank_img/ningbo.bmp"/></li>
				<li><input type="radio" name="yh" value="PG-NET"><img src="front/bank_img/pingan.bmp"/></li>
				<li><input type="radio" name="yh" value="POST-NET"><img src="front/bank_img/post.bmp"/></li>
				<li><input type="radio" name="yh" value="ZX-NET"><img src="front/bank_img/zx.bmp"/></li>
				<li><input type="radio" name="yh" value="SH-NET"><img src="front/bank_img/sh.bmp"/></li>
			</ul>
		</div>
		<div id="pay1_5">
			<ul>
				<li>实付金额：</li>
				<li><span id="price1">￥${fuKuanInfoBean[0].getTotalprice()}</span></li>
				<li><input type="submit" value="确认并付款"/></li>
			</ul>
		</div>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>

