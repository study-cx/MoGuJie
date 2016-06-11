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
    	<li><a href="front/index.jsp">首页</a></li>
        <li id="qbsp1"><a href="">全部商品</a></li>
        <li><a href="">小脚裤/牛仔裤</a></li>
        <li><a href="">大衣/西装</a></li>
        <li><a href="">秋季新品</a></li>
        <li><a href="">外套上衣</a></li>
    </ul>
</div>
 

<div id="zhangshi">


	<c:forEach items="${color}" var="item" varStatus="vs">

		<c:choose>
		<c:when test="${vs.index ==0}">
			<img src="${item.pcolor}" id="b${vs.index}" style="display:block;height:600px;width:397px"/>
		</c:when>
		<c:otherwise>
			<img src="${item.pcolor}" id="b${vs.index}" style="display:none;height:600px;width:397px"/>
		</c:otherwise>
		</c:choose>
	</c:forEach>

	<ul id="hahah">
		<c:forEach items="${color}" var="item" varStatus="vs">
		 	<c:choose>
				<c:when test="${vs.index ==0}">
					<li><img onMouseOver="change1(${vs.index})" id='a${vs.index}' class='one' src='${item.pcolor}' style="height:70px;width:70px"/></li>
				</c:when>
			<c:otherwise>
				<li><img onMouseOver="change1(${vs.index})" id='a${vs.index}' src='${item.pcolor}' style="height:70px;width:70px"/></li>
			</c:otherwise>
		</c:choose>
			
		</c:forEach>
	
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
	<h2 id="title">${spxqproduct[0].proname}</h2>
	<input type="hidden" class="proid" value="${spxqproduct[0].proid}"> 
	
    <!--<img id="jiage" src="front/images/jiage.png"/><br/>  -->
    <div id="product_price">
    	<br/>
    	<p>
    	<span>价格：</span>
    	<a id="price">${spxqproduct[0].proprice }</a>
    	<span class="sales">销售量：${spxqproduct[0].obligateone}</span>
    	</p></br>
    </div>
    <div id="goods" style="display:block">
    	<div id="showcolor">
            <div class="yanse">颜色：</div>
            <c:forEach items="${color }" var="item" begin="0" end="3" varStatus="status">
                <div class="yy" id="c${status.index}" class="yanse123" onClick="show2(${status.index})">${item.color }</div>
            </c:forEach>
        </div>
        
        <div id="showcolor1">
             <div id="size">尺码：</div>
             <c:forEach items="${psize }" var="item" begin="0" end="20" varStatus="status">
                <div class="ss"  id="e${status.index}" onClick="show4(${status.index})">${item.psize}</div>
            </c:forEach>
         </div>             
                          
        <p id="number">数量：<button onClick="jianfa()" id="jian" style="width:26px;height:27px">-</button>
                            <input type="text" id="shuliang" value="1" style="width:45px;height:27px"/>
                            <button onClick="jiafa()" id="jia" style="width:26px;height:27px">+</button>
                            <span id="kucun">库存量<span id="sq"></span></span>
                            </p> 
                       
     <input id="buy" type="button" onClick="NowBuy()" value="立即购买"  style="width:200px;height:50px;background:#EF2F23;color:white"/>
     <input id="gowuche" type="button"  value="加入购物车" onClick="gowuche()" style="width:200px;height:50px"/>
     </div>
     
     <div id="xuanze" style="display:none">
        <div id="gou">&nbsp;&nbsp;&nbsp;选择商品信息<img src="front/images/close.png" onClick="showclose()"> </div>
        <p id="color">
        	
           	<div id="showcolor2">
                <div class="yanse">颜色：</div>
                 <c:forEach items="${color }" var="item" begin="0" end="10" varStatus="status">
                	<div class="yy1" id="g${status.index}" onClick="show5(${status.index})">${item.color }</div>
           	 	</c:forEach>
        	</div>
         <div id="showcolor3">
             <div id="size">尺码：</div>
              <c:forEach items="${psize }" var="item" begin="0" end="20" varStatus="status">
                	<div class="ss" id="f${status.index}" onClick="show6(${status.index})">${item.psize}</div>
           	 </c:forEach>
         </div>     
        <p id="number">数量：<button onClick="jian()" id="jian" style="width:26px;height:27px">-</button>
                            <input type="text" id="shuliangs" value="1" style="width:45px;height:27px"/>
                            <button onClick="jia()" id="jia" style="width:26px;height:27px">+</button></p> <span id="kucun"></span>
        <input id="queding" type="button"  value="确定" onClick="JiaRuGouWuChe()" style="width:80px;height:35px;;background:#EF2F23;color:white;font-size:16px;fone-weight:bold;">           
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
            <img src="${spxqproduct[0].prophoto}"/>          
    	 </div>    
    
    <div id="2" class="ljpj" style="display:none">
        <br/>
        <p class="pingjia">
        	<c:forEach items="${feedback}" var="item">
        		<div class="feedback">
        		<img src="front/images/feedback.jpg">
        			<a class="feedback1">${item.uname}</a><a class="feedback2">${item.fdate}</a><br/>
        			<div >
        			${item.content}
        			</div>
        		</div>
        	</c:forEach>
        
        </p><br/>
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
