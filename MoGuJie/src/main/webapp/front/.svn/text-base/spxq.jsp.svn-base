<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>商品详情</title>
<base href="<%=basePath%>">
<%@ include file="head2.jsp" %>
<link href="front/css/spxq.css" rel="stylesheet">
<style type="text/css">
</style>
<script type="text/javascript" src="front/jq/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="front/jq/spxq.js"></script>


</head>

<body>
<%@ include file="jiesuanhead.jsp" %>
<!-- 
<div id="head1">
	<img src="front/images/head.png"/>
</div>
<div id="head2"><img src="front/images/head2.png"/></div>
<
<div id="head3">

	<input id="shurukuang" type="text" value="输入你想要的商品" style="width:420px;height:28px">
    <input id="sqz" type="button" value="搜全站" style="width:75px;height:30px;background:#EF2F23;border:none">
    <input id="sbd" type="button" value="搜本店" style="width:75px;height:30px"> 
    <img id="zhong" src="front/images/zhu.png"/>
    <img src="front/images/zhong.png"/>
  
</div>
  -->
<div id="nav">
	<img id="shuang" src="front/images/shuang11.png">
	<ul>
    	<li><a href="">首页</a></li>
        <li id="qbsp1"><a href="">全部商品</a></li>
        <li><a href="">小脚裤/牛仔裤</a></li>
        <li><a href="">大衣/西装</a></li>
        <li><a href="">秋季新品</a></li>
        <li><a href="">外套上衣</a></li>
    </ul>
</div>
 

<div id="zhangshi">
	<img src="${productInfo[0].PROPHOTO}" id="b1" style="display:block;height:600px;width:397px"/>
	<img src="${productInfo[1].PROPHOTO}" id="b2" style="display:none;height:600px;width:397px"/>
	<img src="${productInfo[2].PROPHOTO}" id="b3" style="display:none;height:600px;width:397px"/>
	<img src="${productInfo[3].PROPHOTO}" id="b4" style="display:none;height:600px;width:397px"/>
	<ul>
		<li><img onMouseOver="change1(1)" id='a1' class='one' src='${productInfo[0].PROPHOTO}' style="height:70px;width:70px"/></li>
		<li><img onMouseOver="change1(2)" id='a2' src='${productInfo[1].PROPHOTO}' style="height:70px;width:70px"/></li>
		<li><img onMouseOver="change1(3)" id='a3' src='${productInfo[2].PROPHOTO}' style="height:70px;width:70px"/></li>
		<li><img onMouseOver="change1(4)" id='a4' src='${productInfo[3].PROPHOTO}' style="height:70px;width:70px"/></li>
	</ul>
	<div id='qbsp2' style="display:none">
		<ul type='square' >
			<li><a href=''>棉衣/棉服</a></li>
			<li><a href=''>针织衫/毛衣</a></li>
			<li><a href=''>短裙/半身裙</a></li>
			<li><a href=''>外套上衣</a></li>
			<li><a href=''>小脚裤/牛仔裤</a></li>
			<li><a href=''>雪纺衫/蕾丝衫</a></li>
		</ul>
	</div>
</div>

<div id="right" >
	<h2 id="title">${productInfo[0].PROCONTENT}</h2>
    <!--<img id="jiage" src="front/images/jiage.png"/><br/>  -->
    <div id="product_price">
    	<br/>
    	<p>
    	<span>价格：</span>
    	<a id="price">${productInfo[0].PROPRICE }</a>
    	<span class="sales">销售量：${productInfo[0].COUNTS}</span>
    	</p></br>
    </div>
    <div id="goods" style="display:block">
    	<div id="showcolor">
            <div class="yanse">颜色：</div>
            <c:forEach items="${allColor }" var="item" begin="0" end="3" varStatus="status">
                <div class="yy" id="c${status.index+1}" class="yanse123" onClick="show2(${status.index+1})">${item.color }</div>
            </c:forEach>
        </div>
        
        <div id="showcolor1">
             <div id="size">尺码：</div>
             <c:forEach items="${allSize }" var="item" begin="0" end="20" varStatus="status">
                <div class="ss" id="e${status.index+1}" onClick="show4(${status.index+1})">${item.psize}</div>
            </c:forEach>
         </div>             
                          
        <p id="number">数量：<button onClick="jianfa()" id="jian" style="width:26px;height:27px">-</button>
                            <input type="text" id="shuliang" value="1" style="width:45px;height:27px"/>
                            <button onClick="jiafa()" id="jia" style="width:26px;height:27px">+</button>
                            <span id="kucun">库存量${productInfo[0].PRONUMBER}</span>
                            </p> 
                       
     <input id="buy" type="button" onClick="NowBuy()" value="立即购买"  style="width:200px;height:50px;background:#EF2F23;color:white"/>
     <input id="gowuche" type="button"  value="加入购物车" onClick="gowuche()" style="width:200px;height:50px"/>
     </div>
     
     <div id="xuanze" style="display:none">
        <div id="gou">&nbsp;&nbsp;&nbsp;选择商品信息<img src="front/images/close.png" onClick="showclose()"> </div>
        <p id="color">
        	
           	<div id="showcolor">
                <div class="yanse">颜色：</div>
                 <c:forEach items="${allColor }" var="item" begin="0" end="10" varStatus="status">
                	<div class="yy1" id="g${status.index+1}" onClick="show5(${status.index+1})">${item.color }</div>
           	 	</c:forEach>
        	</div>
         <div id="showcolor1">
             <div id="size">尺码：</div>
              <c:forEach items="${allSize }" var="item" begin="0" end="20" varStatus="status">
                	<div class="ss" id="f${status.index+1}" onClick="show6(${status.index+1})">${item.psize}</div>
           	 </c:forEach>
         </div>     
        <p id="number">数量：<button onClick="jian()" id="jian" style="width:26px;height:27px">-</button>
                            <input type="text" id="shuliangs" value="1" style="width:45px;height:27px"/>
                            <button onClick="jia()" id="jia" style="width:26px;height:27px">+</button></p> <span id="kucun"></span>
        <input id="queding" type="button"  value="确定" onClick="JiaRuGouWuChe(${loginUser.usid})" style="width:80px;height:35px;;background:#EF2F23;color:white;font-size:16px;fone-weight:bold;">           
	</div>


</div>

 
<div id="xia">
	<div id="dianpu">
   	  <div id="bbmd">
    	<p class="title">贝贝麻豆 <img src="front/images/conversation.png"/></p>
        </div>
        <div id="fuwu">
        <ul class="miaoshu">
        	<li>描述</li>
            <li>质量</li>
            <li>价格</li>
            <li class="last">服务</li>
        </ul>
        <ul class="fenshu">
        	<li>4.82</li>
            <li>4.79</li>
            <li>4.79</li>
            <li class="last">4.80</li>
        </ul>
        <button id="jrdp" width="65px" height="30px">进入店铺</button>
        </div>
 		<div id="img">
        <img src="front/images/bbmd_xiaodian.png"/>
        </div>
        <div id="zhichi">
        <span> 本店铺由小店提供支持</span>
        </div>
    </div>
    <div id="spxq_nav">
    	<ul>
        	<li onMouseDown="change(this,1)"><a href="javascript:void(0)">商品详情</a></li>
           	<li onMouseDown="change(this,2)"><a href="javascript:void(0)">累计评价</a></li>
            <li onMouseDown="change(this,3)"><a href="javascript:void(0)">本店同类商品</a></li>   
            <li onMouseOver="show1()" onMouseOut="no()" class="last"><a href="javascript:void(0)">手机扫码下单</a></li> 
        </ul>
    </div>
         <div id="1" class="spxq" style="display:block">
    		<img src="front/images/spxq.png"/>
            <img src="front/images/spxq_1.png"/>          
    	 </div>    
    
    <div id="2" class="ljpj" style="display:none">
        <br/>
        <p class="pingjia">累计评价(0)</p><br/>
    </div>
    
    <div id="3" class="tlsp" style="display:none">  	
        <br/>
        <p class="tonglei" >本店同类商品</p>
        <br/>
        <img src="front/images/tlsp_1.png"/>
        <img src="front/images/tlsp_2.png"/>
    </div>
    
    <div id="smxz" style="display:none">
    	<img src="front/images/erweima.png"/>
    </div>
</div>
<div id="foot">
	<img class="zuo" src="front/images/foot_1.png"/>
    <ul>
    	<li class="biaoti">公司</li>
        <li><a>关于我</a>们</li>
        <li><a>招聘信息</a></li>
        <li><a>联系我们</a></li>
    </ul>
    <ul>
    	<li class="biaoti">消费者</li>
        <li><a>帮助中心</a></li>
        <li><a>意见反馈</a></li>
        <li><a>手机版下载</a></li>
    </ul>
    <ul>
    	<li class="biaoti">商家</li>
        <li><a>免费开店</a></li>
        <li><a>商家社区</a></li>
        <li><a>商家入驻</a></li>
        <li><a>管理后台</a></li>
    </ul>  
  <img class="you" src="front/images/foot_2.png"/>  
</div>
</body>
</html>
