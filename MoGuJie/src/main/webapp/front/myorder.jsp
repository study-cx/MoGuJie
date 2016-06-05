<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<head>
<meta charset="utf-8">
<title>我的订单</title>
<base href="<%=basePath%>">
<%@include file="header.jsp" %>

<script type="text/javascript">
	var op="${param.op}";
	//console.info(op);
	if(op=="userInfo"){
		alert("恭喜您,基本信息修改成功！\n\返回 \r我的订单");
	}else if(op=="updatePhoto"){
		alert("恭喜您,头像修改成功！\n\返回 \r我的订单");
	}
</script>
</head>

<body >
<%@include file="head.jsp"%>
<div id="title_left">
        <ul class="title1">
        <c:choose>
        	<c:when test="${loginUser.uphoto eq null}">
        	    <li><img class="img1" src="front/images/b2.jpg" style="width:120px;height:100px" id="img1"/></li>
        	</c:when>
        	<c:otherwise>
        		<li><img class="img1" src="${loginUser.uphoto }" style="width:120px;height:100px" id="img1"/></li>
        	</c:otherwise>
        </c:choose>
           	<li><p class="tit1">${loginUser.uname }</p></li>
            <li><p class="tit2">4</p></li><br/><br/>
            <li><span class="tit3">..............................................</span></li>
        </ul>
        <div class="mydiv1"><h3>我的订单</h3><a><span id="bottom1" class="top1" onclick="showJuti1()">&and;</span></a></div>
        <div id="juti1">
            <ul class="order">
                <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,1)"><p><a></a>全部订单</a></p></li>
                <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,2)"><p><a>待付款</a></p></li>
                <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,3)"><p><a>待评价</a></p></li>
                <br/>
                <li><span class="tit3">..............................................</span></li>
                <!--
                <h3>我的钱包</h3>
                <span class="tit3">..............................................</span>
                <h3>我的理财</h3>
                <span class="tit3">..............................................</span>-->
           </ul> 
       </div>
       <div class="mydiv2"><h3>优惠特权</h3><a><span id="bottom2" class="top2" onclick="showJuti2()">&and;</span></a></div>
       <div id="juti2">
           <ul class="youhui">
                <li onmousemove="change(this)" onmouseout="show(this)"><p><a href="front/myvip.jsp" target="_blank">钻石会员</a></p></li>
                <li onmousemove="change(this)" onmouseout="show(this)"><p><a href="front/wodemodou.jsp" target="_blank">我的蘑豆</a></p></li>
                <li onmousemove="change(this)" onmouseout="show(this)"><p><a>我的钱包</a></p></li>
                <li onmousemove="change(this)" onmouseout="show(this)"><p><a>店铺优惠券</a></p></li><br/>
          </ul>
       </div>
       	
            <span class="tit3">..............................................</span>

            <h3 id="address"><a href="front/addr.jsp">地址管理</a></h3>

            <span class="tit3">..............................................</span>
            <!--<li><h3>安全设置</h3></li>
            <li><span class="tit3">..............................................</span></li>
            <li><h3>维权管理</h3></li>
            <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,7)"><p><a>投诉管理</a></p></li>
            <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,8)"><p><a>举报管理</a></p></li>
            <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,9)"><p><a>被盗举证</a></p></li><br/>
            <li><span class="tit3">..............................................</span></li>-->
     	<div class="mydiv3"><h3>账号设置</h3><a><span id="bottom3" class="top3" onclick="showJuti3()">&and;</span></a></div>
        <div id="juti3">
             <ul class="zhanghu">
                <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,10)"><p><a>基本信息</a></p></li>
                <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,11)"><p><a>修改头像</a></p></li>
                <li onmousemove="change(this)" onmouseout="show(this)" onclick="switchover(this,12)"><p><a>安全设置</a></p></li>
             </ul>
         </div>
    </div>
    
    <!--页面切换-->
   <%@include file="AllOrder.jsp" %>
   <!-- 未付款 -->
   <div id="content_2" class="content" style="display:none;">
    	<table class="title">
        	<tr>
        	<td class="shop">商品</td>
            <td class="tprice">单价(元)</td>
            <td class="tnum">数量</td>
            <td class="tfu">实付款(元)</td>
            <td class="statue">交易状态</td>
            <td class="caozuo">操作</td>
            </tr>
        </table>
    </div>
    <!-- 已付款 -->
   <div id="content_3" class="content" style="display:none;">
    	<table class="title">
        	<tr>
        	<td class="shop">商品</td>
            <td class="tprice">单价(元)</td>
            <td class="tnum">数量</td>
            <td class="tfu">实付款(元)</td>
            <td class="statue">交易状态</td>
            <td class="caozuo">操作</td>
            </tr>
        </table>
    </div>
    <div id="content_4" class="content" style="display:none;">
    	<table class="title">
        	<tr>
        	<td class="shop">商品</td>
            <td class="tprice">单价(元)</td>
            <td class="tnum">数量</td>
            <td class="tfu">实付款(元)</td>
            <td class="statue">交易状态</td>
            <td class="caozuo">操作</td>
            </tr>
        </table>
    </div>
    <div id="content_5" class="content" style="display:none;">
    	<a name="content_5"></a>
    	<table class="title">
        	<tr>
        	<td class="shop">商品</td>
            <td class="tprice">单价(元)</td>
            <td class="tnum">数量</td>
            <td class="shouhou">售后</td>
            <td class="tfu">实付款(元)</td>
            <td class="statue">交易状态</td>
            <td class="caozuo">操作</td>
            </tr>
        </table>
        <table class="dingdanInfo">
        	<tr class="ding1">
            	<td>订单编号：973529451355</td>
                <td id="dtime">成交时间：2015-10-31 19:27:18</td>
                <td id="dhouse"><a>店铺：yoyo吾裳</a></td>
                <td id="contact"><a>联系我们</a></td>
            </tr>
            <tr class="dingdan1" id="dingdan1">
            	<td><img src="front/images/order.jpg" style="width:100px;height:100px;"/></td>
                <td>
                    <p><a>秋冬新款鹿皮绒机车毛呢外套</a><a>[交易快照]</a></p>
                    <p>颜色：浅蓝</p>
                    <p>尺码：S</p>
                </td>
                <td>
                	<p id="yprice">187.00</p>
                    <p id="xprice">130.90</p>
                </td>
                <td id="number">1</li>
                <td id="youf">
                	<p class="n1">￥105.00</p>
                    <p class="n2">(包邮)</p>
                </td>
                <td id="xiang">
                	<p class="x1">退货退款</p>
                    <p class="x2"><a>订单详情</a></p>
                </td>
                <td id="del">
                	<a href="javascript:deleteInfo('dingdan1')">删除订单</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="content_6" class="content" style="display:none;">
    	
    </div>
    <div id="content_7" class="content" style="display:none;"></div>
    <div id="content_8" class="content" style="display:none;"></div>
    <div id="content_9" class="content" style="display:none;"></div>

    <%@include file="userInfo.jsp" %>
    <div id="content_11" class="content" style="display:none;">
		<p class="touxiang"><span>修改头像</span></p>
		<form action="userBean_updateImage.action?usid=${loginUser.usid}&uname=${loginUser.uname}" method="post" enctype="multipart/form-data">
		    <ul>
		        <li><span class="title1">当前头像：</span><img src="${loginUser.uphoto }" class="tp" id="tp"/><span id="xiugai"></span></li>
		        <li><span class="title2">上传新头像：</span>
		        	<input type="text" id="tuname"/>
		        	<input type="file" id="photo" name="upload" onchange="showTp(this)" multiple="multiple"/>
		        </li>
		        <li class="con">建议使用正方形的图片，支持JPG、GIF、JPEG格式，100K以内.</li>
		        <li class="button"><input type="submit" value="确定" style="width:80px; height:30px; background:#F93"/></li>
		    </ul>
	    </form>
	</div>
    <%@include file="UpdatePwd.jsp" %>
    <%@ include file="footer.jsp" %>
</body>
</html>
