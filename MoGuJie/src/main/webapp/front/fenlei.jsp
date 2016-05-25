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
<body>
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
	    		<a class="a2" href="login.jsp">登录</a>
          		<a class="a1" href="regist.jsp" >注册</a>
			</c:if>
          </div>
         
   </div>
    <div class="ss">
    	<a href="index.jsp"><img class="ss5" src="front/images/lg2.png"/></a>
    	<input type="text" class="ss1" />
        <input type="submit" class="ss2" value="搜索" /> 
        <img class="ss4" src="front/images/twoweima.png"/>
          
    </div> 
</div>
<script>
function loginOut(){
	$.post("userServlet?d="+new Date(),{op:"loginOut"},function(data){
		var str='<a class="a2" href="login.jsp">登录</a>&nbsp;&nbsp;&nbsp;';
		str+='<a class="a1" href="regist.jsp" >注册</a>'
		$(".head1").html(str);
	});
}

$.post("productServlet?d="+new Date(),{op:"findAllFeileiProduct"},function(data){});

function showProductInfo(proid){
	$.post("productServlet?d="+new Date(),{op:"showProductInfo",proid:proid},function(data){
		location.href="front/spxq.jsp";
	});
}
$(function(){
	var categoryone;
	var categoryTypeone;
	$.post("indexServlet?d="+new Date(),{op:"getCategoryTypeone"},function(data){
		categoryTypeone=data;
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
	
});
</script>
<div id="content" >
	<div class="content1">
    	<ul>
        	<li><a href="javascript:show(1)" id="pp1">${cateone[0].categoryTypeone}</a></li>
            <li><a href="javascript:show(2)" id="pp2">${cateone[1].categoryTypeone}</a></li>
            <li><a href="javascript:show(3)" id="pp3">${cateone[2].categoryTypeone}</a></li>
            <li><a href="javascript:show(4)" id="pp4">${cateone[3].categoryTypeone}</a></li>
            <li><a href="javascript:show(5)" id="pp5">${cateone[4].categoryTypeone}</a></li>
            <li><a href="javascript:show(6)" id="pp6">${cateone[5].categoryTypeone}</a></li>
            <li><a href="javascript:show(7)" id="pp7">${cateone[6].categoryTypeone}</a></li>
            <li><a href="javascript:show(8)" id="pp8">${cateone[7].categoryTypeone}</a></li>
            <li><a href="javascript:show(9)" id="pp9">${cateone[8].categoryTypeone}</a></li>
            <li><a href="javascript:show(10)" id="pp10">${cateone[9].categoryTypeone}</a></li>
            <!--<li><a href="javascript:show(11)" id="pp11">家居</a></li>
            <li><a href="javascript:show(12)" id="pp12">百货</a></li>
            <li><a href="javascript:show(13)" id="pp13">食品</a></li>-->
        </ul>
    </div>
    
    <div class="content2"  style="display:block" id="1">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd>
            <a><img id="content211" src="front/image/upload_ie2tmmrug4ydkntegmzdambqhayde_120x120.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[0].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/upload_iezwemdchfrwgnlegmzdambqgyyde_120x120.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img src="front/image/guaogao1.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/upload_iezdantdgrtdmn3bgmzdambqmmyde_120x120.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/upload_iezginzvgyzdintegmzdambqmmyde_120x120.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:block" id="b1">
		<h3 class="content31">${cateone[0].categoryTypeone}</h3>
		<c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[0].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p></br>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>
    
    <div class="content2"  style="display:none" id="2">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/qunzi1.jpg"/></a>
            	<ul>
                  <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[1].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/qunzi2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img src="front/image/guaogao1.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/qunzi3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/qunzi4.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b2">
		<h3 class="content31">${cateone[1].categoryTypeone}</h3>
        <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[1].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>
    
     <div class="content2"  style="display:none" id="3">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/kuzi.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[2].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/kuzi1.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img src="front/image/kuzi4.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/kuzi2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/kuzi3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b3">
		<h3 class="content31">${cateone[2].categoryTypeone}</h3>
       <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[2].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
    </c:forEach>
    </div>

     <div class="content2"  style="display:none" id="4">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/neiyi.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[3].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/neiyi1.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img  src="front/image/nieyi4.png"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/neiyi2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/neiyi3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b4">
		<h3 class="content31">${cateone[3].categoryTypeone}</h3>
        <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[3].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>

    <div class="content2"  style="display:none" id="5">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/xiezi.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[4].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/xiezi1.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img  src="front/image/xiezi4.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/xiezi2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/xiezi3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b5">
		<h3 class="content31">${cateone[4].categoryTypeone}</h3>
       <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[4].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>

     <div class="content2"  style="display:none" id="6">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/baobao.jpg"/></a>
            	<ul>
                  <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[5].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/baobao1.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img  src="front/image/baobao4.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/baobao2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/baobao3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
     <div class="content3"  style="display:none" id="b6">
		<h3 class="content31">${cateone[5].categoryTypeone}</h3>
         <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[5].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>

	<div class="content2"  style="display:none" id="7">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/upload_ie2tmmrug4ydkntegmzdambqhayde_120x120.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[6].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/upload_iezwemdchfrwgnlegmzdambqgyyde_120x120.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img src="front/image/guaogao1.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/upload_iezdantdgrtdmn3bgmzdambqmmyde_120x120.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/upload_iezginzvgyzdintegmzdambqmmyde_120x120.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b7">
		<h3 class="content31">${cateone[6].categoryTypeone}</h3>
        <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[6].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       </c:forEach>
    </div>
   
    <div class="content2"  style="display:none" id="8">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/qunzi1.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[7].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/qunzi2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img src="front/image/guaogao1.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/qunzi3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/qunzi4.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b8">
		<h3 class="content31">${cateone[7].categoryTypeone}</h3>
        <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[7].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>
    
     <div class="content2"  style="display:none" id="9">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/kuzi.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[8].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/kuzi1.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img src="front/image/kuzi4.jpg"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/kuzi2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/kuzi3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b9">
		<h3 class="content31">${cateone[8].categoryTypeone}</h3>
        <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[8].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>

     <div class="content2"  style="display:none" id="10">
    	<div class="content21">
        	<dt id="content212">双十一热销</dt>
            <dd><a><img id="content211" src="front/image/neiyi.jpg"/></a>
            	<ul>
                   <c:forEach items="${catetwo }" var="item">
                      	<c:if test="${item.categoryidone eq cateone[9].categoryidone }">
                      		<li><a href="#" style="color:#000">${item.categoryTypetwo }</a></li>
                      	</c:if>
                   </c:forEach>
                </ul>
            </dd>
           
        </div>
        <div class="content22">
        	<dt id="content212">经典内搭</dt>
            <dd><a><img id="content211" src="front/image/neiyi1.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        
        </div>
        <div class="content2img"><img  src="front/image/nieyi4.png"/></div>
        <div class="content23">
        	<dt id="content212">必备外套</dt>
            <dd><a><img id="content211" src="front/image/neiyi2.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
        <div class="content24">
        	<dt id="content212">流行元素</dt>
            <dd><a><img id="content211" src="front/image/neiyi3.jpg"/></a>
            	<ul>
                   <li><a>冬季新品</a></li>
                   <li><a>时尚套装</a></li>
                   <li><a>毛呢外套</a></li>
                   <li><a>韩版风衣</a></li>
                   <li><a>棉衣</a></li>
                   <li><a>字母卫衣</a></li>
                   <li><a>毛衣</a></li>
                   <li><a>羽绒服</a></li>
                   <li><a>套头针织衫</a></li>
                   <li><a>白衬衫</a></li>
                   <li><a>运动套装</a></li>
                </ul>
        </div>
    </div>
    
    
    <div class="content3"  style="display:none" id="b10">
		<h3 class="content31">${cateone[9].categoryTypeone}</h3>
         <c:forEach items="${fenleiInfo }" var="item">
        	<c:if test="${item.CATEGORYTYPEONE eq cateone[9].categoryTypeone }">
	        	<div id="content32">
	            <a href="javascript:showProductInfo(${item.PROID })"><img src="${item.PROPHOTO}"/></a>
	            <p><a>${item.PROCONTENT }</a></p>
	            <div class="content321">￥${item.PROPRICE }</div>
	            <div class="content322">&nbsp;&nbsp;&nbsp;&nbsp;${item.COUNTS}</div>
	        	</div>
           </c:if>
       	</c:forEach>
    </div>

</div>


    <div id="foot">
        <img class="ft2" src="front/images/foot2.png"/>
        <img class="ft1" src="front/images/foot1.png"/>
    </div>
</body>
</html>
</em>