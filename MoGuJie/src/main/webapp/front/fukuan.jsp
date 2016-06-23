<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>确认订单</title>
<base href="<%=basePath%>">
<link rel="stylesheet" href="front/css/indexcopy.css" type="text/css">
<link rel="stylesheet" href="front/css/jiesuan.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="front/images/logo_s.png" />

<script type="text/javascript" src="js/jquery-1.11.3.js"></script>
<script type="text/javascript">
	 $(function() {
		$.post("fuKuanInfo_selectAddress", function(data) {
			var str = "";
			str = "<p>" + data.adname + "</p><input id='myAddr' type='text' name='addressid' hidden='hidden' value='"+data.addressid+"'/>";
			str += "<p>" + data.usaddress + "</p>";
			str += "<p>" + data.province + data.city + data.street
					+ "&nbsp;&nbsp;" + data.adcode + "</p>";
			str += "<p>" + data.adtel + "</p>";
			$("#text12").append($(str));
		}, "json");
	});

	function paying() {
		var usid="${loginUser.usid}";
		var addressid=$("#myAddr").val();
		var price=$("#allprice").html();
		$.post("fuKuanInfo_paying.action",{usid:usid,addressid:addressid},function(data){
			if(data==1){
				//location.href="funKuanInfo_pay.action?usid="+usid+"&price="+price;
				location.href="front/pay.jsp?usid="+usid;
			}
		});
	} 
	
</script>
</head>

<body>
	<%@include file="jiesuanhead.jsp"%>
	<div id="content">
		<div id="content1"></div>
		<div id="content2">
			<img src="front/image/goywuche1.png" />
		</div>
	</div>

	<div id="text">
		<div id="text1">
			<div class="text11">选择收货地址</div>
			<div id="text12" class="text12"></div>
			<div class="haha">
				<a class="newAddress" href="front/addr.jsp">使用新地址</a><br /> <a
					class="shouhuoAddress" href="front/addr.jsp">管理收货地址</a>
			</div>

		</div>

		<div id="text2">
			<div class="text21">确认商品信息</div>
			<div class="text22">
				<table id="table" width="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr class="text221">
						<td>商品</td>
						<td>商品信息</td>
						<td>单价(元)</td>
						<td>数量</td>
						<td>优惠</td>
						<td>小计(元)</td>
					</tr>
					<c:forEach items="${fuKuanInfoBean}" var="item">
						<c:if test="${not empty item}">
							<tr class="text222">
								<td>店铺:橘子外套</td>
							</tr>

							<tr class="text223">
								<td id="text2231"><a href="#"><img class="img1"
										src="${item.prophoto}" /> </a><a href="#" class="hanban">${item.proname}</a>
								</td>
								<td>
									<p>
										颜色：<span id="get_color">${item.color }</span>
									</p>
									<p>
										尺码：<span id="get_size">${item.size}</span>
									</p>
								</td>
								<td>${item.price }</td>
								<td id="get_number">${item.number }</td>
								<input id="deid" type="text" name="deid" hidden="hidden" value="${item.deid}"/>
								<input id="proid" type="text" name="proid" hidden="hidden" value="${item.proid}"/>
								<td>省64.20元</td>
								<td><span id="get_price">${item.price*item.number}</span>元</td>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>


		<div id="foot">
			<div class="foot1">
				<a class="foot12" href="#">
					<div class="foot11">
						<img src="front/image/jiantou.png" />
					</div>
				</a>
				<a class="foot13" href="shopping.jsp">返回购物车</a>
			</div>
			<div id="foot2" class="foot2">
					共有<label>${fuKuanInfoBean[0].totalnumber}</label>件商品

			</div>
			<div class="foot3">
				<span class="foot31">总计：</span>
				<span class="foot32" id="allprice">￥${fuKuanInfoBean[0].totalprice}</span>
			</div>
			<div class="foot4">
				<a href="javascript:paying()">确认并付款</a>
			</div>
		</div>

		<div id="end"></div>
		
</body>
</html>
