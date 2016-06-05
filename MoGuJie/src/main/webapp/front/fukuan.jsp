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
		 /*
		var cc = 0;
		var aa = 0;
		$
				.post(
						"../fukuanServlet",
						{
							op : "findCartInfo"
						},
						function(data) {
							var str = "";
							var info = data.cids;
							if (info != "") {
								$
										.each(
												info,
												function(index, item) {
													str = "<tr class='text222'>";
													str += "	<td>店铺:橘子外套</td>";
													str += "</tr>";
													str += "<tr name='cc' class='text223'>";
													var ss = "../"
															+ item[0].PCOLOR;
													str += "	<td id='text2231'><a ><img class='img1' src="+ss+"></a><a id='hanban'  class='hanban'>"
															+ item[0].PRONAME
															+ "</a></td>";
													str += "    <td>";
													str += "    	<p class='color'>颜色："
															+ item[0].COLOR
															+ "</p>";
													str += "      <p class='size'>尺码："
															+ item[0].CSIZE
															+ "</p>";
													str += "    </td>";
													str += "    <td>"
															+ item[0].PROPRICE
															+ "</td>";
													str += "    <td>"
															+ item[0].SNUMBER
															+ "</td>";
													str += "    <td>省64.20元</td>";
													var s1 = item[0].PROPRICE;
													var s2 = item[0].SNUMBER;
													var s3 = s1 * s2;
													str += "    <td>" + s3
															+ "元</td>";
													str += "</tr>";
													$("#table").append($(str));
													cc += item[0].PROPRICE
															* item[0].SNUMBER;
													aa += parseInt(item[0].SNUMBER);

												});

								var ss1 = "<span class='foot31'>总计：</span><span class='foot32'>￥"
										+ cc + "</span>";
								$(".foot3").append($(ss1));
								var ss2 = "<span>共有<label>" + aa
										+ "</label>件商品</span>";
								$("#foot2").append($(ss2));
							}
						}, "json");*/
		$.post("fuKuanInfo_selectAddress", function(data) {
			
			var str = "";
			//$.each(data, function(index, item) {
				str = "<p>" + data.adname + "</p>";
				str += "<p>" + data.usaddress + "</p>";
				str += "<p>" + data.province + data.city + data.street
						+ "&nbsp;&nbsp;" + data.adcode + "</p>";
				str += "<p>" + data.adtel + "</p>";
				$("#text12").append($(str));
			//});
		}, "json");
	});

	function paying() {
		var proname = $(".hanban").html();
		var color = $("#get_color").html();
		var size = $("#get_size").html();
		var number = $("#get_number").html();
		var price = $("#get_price").html();
		$.post("../fukuanServlet", {
			op : "surePaying",
			proname : proname,
			color : color,
			size : size,
			number : number,
			price : price
		}, function(data) {
			if (data == 1) {
				alert("付款成功，请耐心等待卖家发货！");
			} else {
				alert("付款失败，请重新支付!");
			}
		});
	} 
</script>
<script type="text/javascript">
	function pay() {
		var ss = document.getElementsByName('cc');
		for (var i = 0; i < ss.length; i++) {
			var s1 = $(".hanban")[i].innerHTML;
			var s2 = $(".color")[i].innerHTML;
			var s3 = $(".size")[i].innerHTML;
			console.info(s1);

			console.info(s2);
			console.info(s3);

		}
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
								<td id="get_number">${number }</td>
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

				<c:forEach items="${fuKuanInfoBean }" var="item">
					<c:if test="${not empty item}">
					共有<label>${item.number}</label>件商品
					</c:if>
				</c:forEach>
			</div>
			<div class="foot3">

			<c:forEach items="${fuKuanInfoBean}" var="item">
					<c:if test="${not empty item}">
						<span class="foot31">总计：</span>
						<span class="foot32">￥${item.price*item.number}</span>
						</c:if>
			</c:forEach>
			</div>
			<div class="foot4">
				<a href="">确认并付款</a>
			</div>
		</div>

		<div id="end"></div>
</body>
</html>
