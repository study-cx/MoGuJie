 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>收货地址</title>
<base href="<%=basePath%>">
<%@include file="header.jsp" %>
<script type="text/javascript" src="front/jq/addr.js"></script>
<link rel="stylesheet" href="front/css/addr.css" type="text/css"></link></head>
</head>

<body >
<%@include file="head.jsp"%>
<script>

var addressid;
	$.post("addressServlet?d="+new Date(),{op:"findAddrInfo"},function(data){
		var str="";
		$("#addr").html('');
		$.each(data.info,function(index,item){
			addressid=item.addressid;
			str+="<div id='dzxq'>";
			str+="<p><span id='dzxqname'>"+item.adname+"</span>";
			str+="<span id='dzxqprovince'>"+item.province+"</span>"; 
			str+="<span id='dzxqcity'>"+item.city+"</span>"; 
			str+="<span id='dzxqqu'>"+item.street+"</span>";
			str+="<span id='dzxqstreet'>"+item.usaddress+"</span>";
			str+="<span id='dzxqcode'>"+item.adcode+"</span>";
			str+="<span id='dzxqtel'>"+item.adtel+"</span>";
			str+="<span id='lala'><a href='javascript:moren()'>设为默认</a></span>";
			str+="<span id='gan'> |</span><a href='javascript:edit("+item.addressid+")'>编辑</a>";
			str+="<span id='gan'> | </span><a href='javascript:detele("+item.addressid+")'>删除</a></p>";
			str+="</div>";
		});
		$("#addr").append($(str));
	},"json");
	
	</script>

<div id="full">

	<div id="dzgl"><p>地址管理</p></div>
    	<input type="button" value="+ 添加新地址"  id="add" onclick="addaddr()"/><br/><br/>
    	<div id='center1' style="display:none" >
    	<div id="dizhi">
    		<form name='myform' action="address_addr.action" method="post">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	${sessionScope.address }
	省：<span id="xing">*</span> <select id="province"><option id="sheng" name="province"></option></select>
    &nbsp;&nbsp;市：<select id="city"><option id="shi" name="city">--请选择城市--</option><option id="myshi" style="display:none;"></option></select>
     &nbsp;&nbsp;区：<select id="area"><option id="qu" name="street">--请选择地区--</option><option id="myqu" style="display:none;"></option></select>
</form>
      <br/>
    
     &nbsp;&nbsp;&nbsp;邮政编码：<span id="xing">*</span> <input type="text" id="youbian1" name="adcode" onBlur="checkYoubian1()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="ybts1"></span>
     	<br/><br/>
      &nbsp;&nbsp;&nbsp;<span id="jiedao">街道地址：</span>
      <span id="xing1">*</span> <input type="text"  name="usaddress"  id="street1" onBlur="checkStreet1()" style="width:590px;height:70px"/>&nbsp;&nbsp;&nbsp;<span id="jdts1"></span><br/>
      <span id="shuoming">请填写街道地址，最少5个字，最多不能超过100个字</span>
      	<br/><br/>
       收货人姓名：<span id="xing">*</span> <input type="text" name="adname" id="uname1" onBlur="checkName1()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="xmts1"></span>
       	<br/><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机：<span id="xing">*</span> <input type="text" name="adtel" id="tel1" onBlur="checkTel1()" style="width:135px;height:25px"/>&nbsp;&nbsp;&nbsp;<span id="dhts1"></span>
        <br/><br/>
        <input id="really" type="button" value="确认" onClick="really1()" style="background:#FFA701;width:105px;height:35px;border:none">
        <input id="quxiao" type="button" value="取消" onClick="reset1()" style="backgroundcolor:white;width:70px;height:35px">
    	</div>
    	</div>
  	
    		<div id='center2' style="display:none" >
    	<div id="dizhi">
    		<form name='myform'>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	省：<span id="xing">*</span> <select id="s1"></select>
    &nbsp;&nbsp;市：<select id="s2"><option>--请选择城市--</option><option id="myshi" style="display:none;"></option></select>
     &nbsp;&nbsp;区：<select id="s3"><option>--请选择地区--</option><option id="myqu" style="display:none;"></option></select>
</form>
      <br/>
    
     &nbsp;&nbsp;&nbsp;邮政编码：<span id="xing">*</span> <input type="text" id="youbian" name="youbian" onBlur="checkYoubian2()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="ybts2"></span>
     	<br/><br/>
      &nbsp;&nbsp;&nbsp;<span id="jiedao">街道地址：</span>
      <span id="xing1">*</span> <input type="text" name="street"  id="street" onBlur="checkStreet2()" style="width:590px;height:70px"/>&nbsp;&nbsp;&nbsp;<span id="jdts2"></span><br/>
      <span id="shuoming">请填写街道地址，最少5个字，最多不能超过100个字</span>
      	<br/><br/>
       收货人姓名：<span id="xing">*</span> <input type="text" name="uname" id="uname" onBlur="checkName2()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="xmts2"></span>
       	<br/><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机：<span id="xing">*</span> <input type="text" name="tel" id="tel" onBlur="checkTel2()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="dhts2"></span>
        <br/><br/>
        <input id="really" type="button" value="确认" onClick="really2()" style="background:#FFA701;width:105px;height:35px;border:none">
        <input id="quxiao" type="button" value="取消" onClick="reset2()" style="backgroundcolor:white;width:70px;height:35px">
    	</div>
    	</div>
  	
    	<div id="addr">
    	
    	</div>
    </div>
    
     <div id="foot"> 
    	<p id="zi"><a>蘑菇街 | 加入开放平台</a> copyright&copy 2015 Mogujie.com,All Rights Reserved.</p>
        <img src="front/images/foot.png"/>
    </div>

</body>
</html>
                     																		 			                                        	 