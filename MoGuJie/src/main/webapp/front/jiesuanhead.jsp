<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

