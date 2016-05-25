<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<base href="<%=basePath%>">
<link rel="shortcut icon" type="image/x-icon" href="front/images/logo_s.png"/>
<link href="front/css/shopping.css" rel="stylesheet"/>
<link href="front/css/index.css" rel="stylesheet"/>
<script src="front/jq/jquery-1.11.3.js" type="text/javascript"></script>
<script src="front/jq/shopping.js" type="text/javascript"></script>

<script>
	$(function(){
		$.post("cartServlet",{op:"selectCart"},function(data){
			var str="";
		 	$.each(data.carts,function(index,item){
		 		var i=index+1;
			 	str="<tr class='info' id='shangpin"+i+"'>";
	        	str+="<td class='btu'><input name='op' id='shang"+index+"' type='checkbox' style='width:30px;height:30px;' onclick='ch(this.checked,"+index+")'/></td>";
	            str+="<td class='pic'><img src="+item.PCOLOR+"  onmouseout=show('fu"+index+"') onmouseover=change('fu"+index+"')></td>";
	            str+="<td class='pic1'><a class='a'><img src="+item.PCOLOR+" id='fu"+index+"' class='fu"+index+"' style='display:none'/></a></td>";
	            str+="<td class='passage'><a>"+item.PRONAME+"</a></td>";
	            str+="<td class='xinfo'>";
	            str+="<p>颜色："+item.COLOR+"</p>";
	            str+="<p>尺码："+item.CSIZE+"</p>";
	            str+="</td>";
	            str+="<td class='price'>";
	            str+="<p class='yprice'>79.00</p>";
	                str+="<p id='xprice"+index+"' class='xprice'>"+item.PROPRICE+"</p>";
	                str+="<p><span>促销7.0折</span></p>";
	            str+="</td>";
	            str+="<td id='shangp"+index+"' class='number'>"
	                str+="<input type='text' value="+item.SNUMBER+" style='width:45px;' class='nums'/>";
	            str+="</td>";
	            var s1=item.PROPRICE;
	            var s2=item.SNUMBER;
	            var s3=s1*s2;
	            str+="<td id='sp"+index+"' class='sum'>"+s3+"</td>";
	            var ss="shangpin"+i;
	            str+="<td class='delete'><a href='javascript:deleteShangpin("+item.CID+")'>删除</a></td>";
	        	str+="</tr>";
	        	$("#shopinfo").append($(str));
				});
		
		},'json');
	});

</script>
</head>

<body>
<div id="title">
		<div class="head3">
	          <a class="a3" href="front/shopping.jsp"  >购物车</a>
	          <a class="a4" href="front/myorder.jsp"  >我的订单</a>
          </div>
        <div class="head1">
        	<c:if test="${not empty loginUser }">
   				<a href="#"><font >当前登陆用户:${loginUser.uname }</font></a>&nbsp;&nbsp;
				<a href="javascript:loginOut()"><font >[注销]</font></a>
   			</c:if>
   			<c:if test="${empty loginUser }">
	    		<a class="a2" href="login.jsp">登录</a>
          		<a class="a1" href="regist.jsp" >注册</a>
			</c:if>
          </div>
	<a  href="index.jsp"><img src="front/images/stitle.png" /></a>
    <div id="title-right">
    <ul id="black">
    	<li>购物车</li>
        <li>优惠券</li>
        <li>钱包</li>
        <li>足迹</li>
    </ul>
    </div>
</div>
<div id="title1">
	<ul>
    	<li class="tit1"><a>全部商品(<span>4</span>)</a></li>
        <li class="tit2"></li>
        <li>优惠(<span>0</span>)</li>
        <li class="foot">库存紧张(<span>0</span>)</li>
    </ul>
</div>
<div id="button">
	<ul>
    	<li class="bt"><input name="quanxuan" type="checkbox" style="width:30px;height:30px;" onclick="selectAll()"/><span>全选</span></li>
        <li class="goods">商品</li>
        <li class="goodsinfo">商品信息</li>
        <li class="price">单价(元)</li>
        <li class="num">数量</li>
        <li class="sum">小计(元)</li>
        <li class="manager">操作</li>
    </ul>
</div>
<div id="content">
	<table id="shopinfo">
       
    </table>
</div>
<div id="select">
	<ul>
        <li class="sel2"><a>删除失效商品</a></li>
        <li class="sel3">共计<span id="sel31" class="sele">0</span>件商品,总计：</li>
        <li class="sel4" id="totalprice">￥0.00</li>
        <li class="sel5"><a onclick="buy()" id="sel51">去付款 ></a></li>
    </ul>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
