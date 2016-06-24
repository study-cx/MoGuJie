<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="header" >
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
    <div class="ss">
    	<a href="front/index.jsp"><img class="ss5" src="front/images/lg2.png"/></a>
    	<input type="text" class="ss1" />
        <a href="javascript:AllFind()"><input type="submit" class="ss2" value="搜索" /></a> 
        <img class="ss4" src="front/images/twoweima.png"/>
          
    </div> 
</div>
<script>
function loginOut(){
	$.post("user_loginOut",function(data){
		location.href="front/index.jsp";
		/* var str='<a class="a2" href="login.jsp">登录</a>&nbsp;&nbsp;&nbsp;';
		str+='<a class="a1" href="regist.jsp" >注册</a>'
		$(".head1").html(str); */
	});
}

function AllFind(){
	var SouSuoContent=$('.ss1').val();
	$.post("index_SouSuo",{SouSuoContent:SouSuoContent},function(data){
		location.href="front/fenlei.jsp";
	});
}
</script>