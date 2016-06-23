<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<em><!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>蘑菇街</title>
<base href="<%=basePath%>">
<link rel="shortcut icon" type="image/x-icon" href="front/images/logo_s.png"/>

<link rel="stylesheet" href="front/css/toubu.css"/>
<link rel="stylesheet" href="front/css/fenlei.css"/>
<script type="text/jscript" src="front/jq/jquery-1.11.3.js"></script>
<script src="front/jq/fenlei.js" type="text/jscript"/></script>
</head>
<script>
/* $(function(){
	 var categoryidone=
	$.post("categorytwo_findCatetwoType.action",{categoryidone:categoryidone},function(data){
		console.info(data);
	}); 
	$.post("indexServlet?d="+new Date(),{op:"getCategorone"},function(data){
		for(var i=1;i<data.rows.length;i++){
			categoryone=data.rows[i-1];
			console.info(categoryone)
			console.info(categoryTypeone)
			console.info(categoryone.categoryidone)
			
			if(categoryTypeone==categoryone.categoryidone){
				document.getElementById("pp"+i).style.background='#FFF';
				document.getElementById(i).style.display='block';
				document.getElementById('b'+i).style.display='block';
			}else{
				document.getElementById("pp"+i).style.background='#FAFAFA';
				document.getElementById(i).style.display='none';
				document.getElementById('b'+i).style.display='none';
			}
	}
		
	},"json");
	
}); */
</script>
<body>
<%@ include file="head.jsp" %>
<div id="content" >
    <div id="tit_1">
    	<p class="content_1"><a>首页</a>><span>${catetwos[0].categoryTypeone}<span></p> 
    </div> 
    <div class="title1">
    	<p>所有分类></p>
    	<div>
    		<span>相关分类：</span>
	    	<ul>
	    	
	    	 <c:forEach items="${catetwos}" var="item">
	    		<li><a href="category_findProductByType.action?categoryTypetwo=${item.categoryTypetwo}&categoryidone=${catetwos[0].categoryidone}">${item.categoryTypetwo}</a></li>
	    	 </c:forEach> 
	    	</ul>
    	</div>
    </div>
    <div class="content3"  style="display:block" id="b1">
		<c:forEach items="${AllProductInfo}" var="item">
        	<div id="content32">
	            <a href="xiangQing_show.action?proid=${item.proid}"><img src="${item.prophoto}"/></a>
	            <p><a href="xiangQing_show.action?proid=${item.proid}">${item.procontent }</a></p></br>
	            <div class="content321">￥${item.proprice }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.obligateone}</div>
        	</div>
       	</c:forEach>
    </div>
    <div id="foot">
        <img class="ft2" src="front/images/foot2.png"/>
        <img class="ft1" src="front/images/foot1.png"/>
    </div>
</body>
</html>
</em>