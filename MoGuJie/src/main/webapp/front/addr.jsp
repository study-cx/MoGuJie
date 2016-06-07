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
	$.post("address_list.action",function(data){
		console.info(data);
		var flag="";
		var str="";
		for(var i=0;i<data.length;i++){
			if(data[i].statue==0){
				str="</span><span  id='lala'><a  href='javascript:moren("+data[i].addressid+")'>默认地址</a></span>";
				flag="<div class='sshaha'>";
			}else{
				str="</span><span id='lala'><a href='javascript:moren("+data[i].addressid+")'>设为默认</a></span>";
				flag="<div id='dzxq'>";
			}
			
			$("#addr").append(flag+"<p><span id='dzxqname'>"
					+data[i].adname+"</span><span id='dzxqprovince'>"
					+data[i].province+"</span><span id='dzxqcity'>"
					+data[i].city+"</span><span id='dzxqqu'>"
					+data[i].street+"</span><span id='dzxqstreet'>"
					+data[i].usaddress+"</span><span id='dzxqcode'>"
					+data[i].adcode+"</span><span id='dzxqtel'>"
					+data[i].adtel+str
					+"<span id='gan'> |</span><a href='javascript:edit("+data[i].addressid+")'>编辑</a>"
					+"<span id='gan'> |</span><a href='javascript:deletes("+data[i].addressid+")'>删除</a>"
				+"</div>");
			
		}
	}, 'json');

	</script>


<div id="full">

	<div id="dzgl"><p>地址管理</p></div>
    	<input type="button" value="+ 添加新地址"  id="add" onclick="addaddr()"/><br/><br/>
    	<div id='center1' style="display:none" >
    	<div id="dizhi">
    		<form name='myform' action="address_update.action" method="post">
    	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	省：<span id="xing">*</span> <select id="province" name="province"><option id="sheng"></option></select>
    &nbsp;&nbsp;市：<select id="city"  name="city"><option id="shi">--请选择城市--</option><option id="myshi" style="display:none;"></option></select>
     &nbsp;&nbsp;区：<select id="area" name="street"><option id="qu" >--请选择地区--</option><option id="myqu" style="display:none;"></option></select>

      <br/> <br/>
    
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
        <input id="really" type="submit" value="确认" onClick="really1()" style="background:#FFA701;width:105px;height:35px;border:none">
        <input id="quxiao" type="button" value="取消" onClick="reset1()" style="backgroundcolor:white;width:70px;height:35px">
    	</form>
    	</div>
    	</div>
  	
    		<div id='center2' style="display:none" >
    	<div id="dizhi">
    		<form name='myform' action="address_addr.action" method="post">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	省：<span id="xing">*</span> <select id="s1" name="province"></select>
    &nbsp;&nbsp;市：<select id="s2" name="city"><option >--请选择城市--</option><option id="myshi" style="display:none;"></option></select>
     &nbsp;&nbsp;区：<select id="s3"  name="street"><option >--请选择地区--</option><option id="myqu" style="display:none;"></option></select>

      <br/> <br/>
    
     &nbsp;&nbsp;&nbsp;邮政编码：<span id="xing">*</span> <input type="text" id="youbian" name="adcode" onBlur="checkYoubian2()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="ybts2"></span>
     	<br/><br/>
      &nbsp;&nbsp;&nbsp;<span id="jiedao">街道地址：</span>
      <span id="xing1">*</span> <input type="text"  name="usaddress"  id="street" onBlur="checkStreet2()" style="width:590px;height:70px"/>&nbsp;&nbsp;&nbsp;<span id="jdts2"></span><br/>
      <span id="shuoming">请填写街道地址，最少5个字，最多不能超过100个字</span>
      	<br/><br/>
       收货人姓名：<span id="xing">*</span> <input type="text" name="adname" id="uname" onBlur="checkName2()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="xmts2"></span>
       	<br/><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机：<span id="xing">*</span> <input type="text" name="adtel" id="tel" onBlur="checkTel2()" style="width:135px;height:25px">&nbsp;&nbsp;&nbsp;<span id="dhts2"></span>
        <br/><br/>
        <input id="really" type="submit" value="确认" style="background:#FFA701;width:105px;height:35px;border:none">
        <input id="quxiao" type="button" value="取消" onClick="reset2()" style="backgroundcolor:white;width:70px;height:35px">
    	</form>
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
                     																		 			                                        	 