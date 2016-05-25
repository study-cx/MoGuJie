<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>蘑菇街</title>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

<script>
	$(function(){
		$("#pic").mywin({left:"center",top:"center"});
		$(".bg").fadeIn("3000","linear");
		
		$.post("indexServlet?d="+new Date(),{op:"indexDataInfo"},function(data){
			if(parseInt($.trim(data))==1){
				
				location.href="front/index.jsp";
			}
			
		});
	});
</script>
<style>
	#pic{
		width: 100px;
		height:100px;
		position:absolute;
	}
	
</style>
</head>

<body>
	<h1>欢迎进入蘑菇街！！！</h1>
	<div id="bg" class="bg" style="display:none;"></div>
	<div id="pic">
		<img src="images/loading.gif"/>
	</div>
</body>
</html>
