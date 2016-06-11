<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>蘑菇街</title>
<base href="<%=basePath%>">
<%@ include file="header.jsp" %>
</head>

<body>
<%@ include file="head.jsp" %>
<div id="middle">
    <div class="fl">
        <div class="fl1">
          <ul class="fl2">
          
              <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[0].categoryidone }" style="color:#000">${cateone[0].categorytypeone}</a></li>
                            <li class="fl5">
                                <ul class="fl6" style="display:none">
                                <c:forEach items="${catetwo }" var="item">
                                	<c:if test="${item.categoryidone eq cateone[0].categoryidone }">
                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
                                	</c:if>
                                </c:forEach>
                                    
                                </ul>
                             </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[1].categoryidone }" style="color:#000">${cateone[1].categorytypeone}</a></li>
                    <li class="fl5">
                                <ul class="fl6" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[1].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                     </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[2].categoryidone }" style="color:#000">${cateone[2].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl6" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[2].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                                </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[3].categoryidone }" style="color:#000">${cateone[3].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl6" style="display:none">
                                   <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[3].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                                </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[4].categoryidone }" style="color:#000">${cateone[4].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl6" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[4].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                                </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[5].categoryidone }" style="color:#000">${cateone[5].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl6" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[5].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                                </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[6].categoryidone }" style="color:#000">${cateone[6].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl6" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[6].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                                </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[7].categoryidone }" style="color:#000">${cateone[7].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl6" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[7].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                                </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[8].categoryidone }" style="color:#000">${cateone[8].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl6" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[8].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>
                                </li>
                <li class="fl4"></li>
                <li class="fl3"><a href="categorytwo_findCatetwoType.action?categoryidone=${cateone[9].categoryidone }" style="color:#000">${cateone[9].categorytypeone}</a></li>
                <li class="fl5">
                                <ul class="fl7" style="display:none">
                                    <c:forEach items="${catetwo }" var="item">
	                                	<c:if test="${item.categoryidone eq cateone[9].categoryidone }">
	                                		<li><a href="#" style="color:#000">${item.categorytypetwo }</a></li>
	                                	</c:if>
                                	</c:forEach>
                                </ul>  
                                </li>
           </ul>
        </div>
    </div>
   
    <div class="zong">
        <div class="gundong">
        	
        </div>
        <div id="container">
            <div id="example">
                <div id="slides">
                    <div class="slides_container">
                        <c:forEach items="${weizhi }" var="item">
	                		<c:if test="${item.weizhi eq '中间' }">
		                		<div class="z1">
		                		    <a href="xiangQing_show.action?proid=${item.proid })"><img src="${item.gPhoto}" width="660" height="400" ></a>
		                		</div>
	                		</c:if>
                		</c:forEach>
                	</div>
           	 	</div>
        	</div>
		</div>
	</div>
	<div class="pb">
	<c:forEach items="${weizhi }" var="item">
		<c:if test="${item.weizhi eq '旁边上' }">
	    	<a href="xiangQing_show.action?proid=${item.proid }"><img class="pb1" src="${item.gPhoto}"/></a>
	    </c:if>
	</c:forEach>
	        <img class="pb3" src="front/images/pb3.png"/>
     <c:forEach items="${weizhi }" var="item"> 
        <c:if test="${item.weizhi eq '旁边下' }">
    		<a href="xiangQing_show.action?proid=${item.proid }"><img class="pb1" src="${item.gPhoto}"/></a>
	    </c:if>
	  </c:forEach>
	 </div>
</div>
<div class="cc">
	<div class="cc1"></div>
	<div class="cc2"></div>
	<div class="cc1"></div>
</div>

<div class="mogugood">
	<ul>
		<c:forEach items="${liangping}" var="item">
			<li><a href="xiangQing_show.action?proid=${item.proid}"><img alt="${item.proname }" src="${item.prophoto }"/></a>
				<a href="${item.proid}">${item.proname}</a>
			</li>
		</c:forEach>
	</ul>
</div>
<div class="cc">
	<div class="cc1"></div>
	<div class="cc3"></div>
	<div class="cc1"></div>
</div>

<div class="renqinvxie">
	<ul>

		<c:forEach items="${renqinvxie}" var="item">
			<li><a href="xiangQing_show?proid=${item.proid}"><img alt="${item.proname }" src="${item.prophoto }"/></a>
			</li>
			
		</c:forEach>
	</ul>
</div>
<%@ include file="footer.jsp" %>
<script type="text/javascript">
function showProductInfo(proid){
	$.post("xiangQing_show.action",{proid:proid},function(data){
		//location.href="front/spxq.jsp";
	});
}

function setCategoryTypeone(categoryidone) {
	console.info(categoryidone)
	$.post("indexServlet?d="+new Date(),{op:"setCategoryTypeone",categoryidone:categoryidone},function(data){
		location.href="front/fenlei.jsp";
	});
}
</script>
</body>
</html>
