//1
function checkYoubian1(){	
	var youbian=$("#youbian1").val();
	var reg1=/^\d{6}$/;
	if(youbian.match(reg1)){
		 $("#ybts1").html("").css("color", "");
	}else{
		 $("#ybts1").html("请正确书写6位数邮编!").css("color", "red");
		 $("#yzbm").val("");
	}
} 
 
function checkStreet1(){
	  var street = $("#street1").val();
	    if ("" == street || street == null) {
	        $("#shuoming").html("街道地址不能为空...").css("color", "#F00");
	    }else{
	    	$("#shuoming").html("请填写街道地址，最少5个字，最多不能超过100个字").css("color", "#999");
	    } 
}

function checkName1(){
	 var uname = $("#uname1").val();
	    if ("" == uname || uname == null) {
	        $("#xmts1").html("用户名不能为空").css("color", "#F00");
	    } else {
	        $("#xmts1").html("").css("color", "#0F0");
	    }
	   
} 

function checkTel1(){
	var tel = $("#tel1").val();
	var reg2=/^1[3-8]\d{9}$/;
	if(tel.match(reg2)){
		$("#dhts1").html("").css("color", "#0F0");		
	}else{
		$("#dhts1").html("手机号码格式输入错误!").css("color", "#F00");
	}
} 

//2
function checkYoubian2(){	
	var youbian=$("#youbian").val();
	var reg3=/^\d{6}$/;
	if(youbian.match(reg3)){
		 $("#ybts2").html("").css("color", "");
	}else{
		 $("#ybts2").html("请正确书写6位数邮编!").css("color", "red");
		 $("#yzbm").val("");
	}
} 

 
function checkStreet2(){
	  var street = $("#street").val();
	    if ("" == street || street == null) {
	        $("#shuoming").html("街道地址不能为空...").css("color", "#F00");
	    }else{
	    	$("#shuoming").html("请填写街道地址，最少5个字，最多不能超过100个字").css("color", "#999");
	    } 
}

function addaddr(){
	$("#center").css("display","block");
}


function checkName2(){
	 var uname = $("#uname").val();
	    if ("" == uname || uname == null) {
	        $("#xmts2").html("用户名不能为空").css("color", "#F00");
	    } else {
	        $("#xmts2").html("").css("color", "#0F0");
	    }
	   
} 

function checkTel2(){
	var tel=$("#tel").val();
	var reg4=/^1[3-8]\d{9}$/;
	if(tel.match(reg4)){
		$("#dhts2").html("").css("color", "#0F0");
	}else{
		$("#dhts2").html("手机号码格式输入错误!").css("color", "#F00");
	}
} 

function quxiao(){
	$("#youbian").val("");
	$("#street").val("");
	$("#uname").val("");
	$("#tel").val("");
}
/*
function moren(){
	$("#lala").html("默认地址");
	$("#lala").css("color","#2F63CF");
	$("#dzxq").css("background","#FDFBEA");
}
*/
function addaddr(){
	$("#center2").css("display","block");
	$("#center1").css("display","none");

}
function reset1(){
	$("#center1").css("display","none");
}
function reset2(){
	$("#youbian").val("");
	$("#street").val("");
	$("#uname").val("");
	$("#tel").val("");
	$("#center2").css("display","none");
}

//编辑
var addressids;
function edit(aa){
	$("#center1").css("display","block");
	$("#center2").css("display","none");
	addressids=aa;
	
	$.post("address_edit.action",{addressids:addressids},function(data){
		
		$("#sheng").html(data.province);
		$("#shi").html(data.city);
		$("#qu").html(data.street);
		$("#youbian1").val(data.adcode);
		$("#street1").val(data.usaddress);
		$("#uname1").val(data.adname);
		$("#tel1").val(data.adtel);
	},"json");
		
}


function deletes(addressid){
	$.post("address_delete.action",{addressid:addressid},function(item){
		
			alert("删除成功...");
			location.href="front/addr.jsp";
		
	});
}


function moren(addressid){
	$.post("address_moren.action",{addressid:addressid},function(data){
		$("#lala").html("默认地址");
		$("#lala").css("color","#2F63CF");
		$("#dzxq").css("background","#FDFBEA");
	});
	
	
}



//
$(function(){
	/*
	大多数浏览器都有读取和操作 XML 的内建 XML 解析器,微软IE基于ActiveX的MSXML
	解析器把 XML 转换为 JavaScript 可访问的XML DOM对象
	*/

	function createIEXmlDom(){
		var arrs=["MSXML2.DOMDocument.6.0","MSXML2.DOMDocument.5.0","MSXML2.DOMDocument.4.0","MSXML2.DOMDocument.3.0","MSXML2.DOMDocument","Microsoft.XmlDom"];
		var ieXmlDom;
		for(var i=0;i<arrs.length;i++){
			try{
				ieXmlDom=new ActiveXObject(arrs[i]);
				return ieXmlDom;
			}catch(e){
				
			}
		}
		throw new Error("对不起,您的浏览器不支持...");
	}

	function xmlDom(){
		var dom;
		if(window.ActiveXObject){  //IE获取XML文档对象
			dom=createIEXmlDom();
		}else if(document.implementation&&document.implementation.createDocument){ //implementation：正在运行的程序
			//第一个参数是命名空间   第二个参数是跟标签   第三个一个doc类型
			dom=document.implementation.createDocument("","",null);
		}else{ //抛出异常
			throw new Error("对不起,您的浏览器不支持...");
		}
		return dom;
	}

	window.onload=function(){
		var dom;
		if(window.DOMParser&&!window.ActiveXObject){
			var xmlhttp=new XMLHttpRequest();
			xmlhttp.open("GET","city.xml",false);
			xmlhttp.send(null);
			if(xmlhttp.readyState==4){
				dom=xmlhttp.responseXML.documentElement;
			}
		}else{
			dom=xmlDom();
			dom.async=false;
			dom.load("city.xml");
		}
		
		//获取显示三级级联的三个下拉对象
		var pro=document.getElementById("province");
		var city=document.getElementById("city");
		var area=document.getElementById("area");
		
		//获取所有的省份
		var pros=dom.getElementsByTagName("province");
		
		for(var i=0;i<pros.length;i++){
			addOption(pros[i],pro);
		}
		
		//当省份发生改变时，后面的城市跟着改变,所以给省份的下拉对象添加一个onchange事件
		pro.onchange=function(){
			//获取当前选中的省份的编号
			var flag=pro.value;
			
			//清空以前的数据
			city.length=1;
			
			for(var i=0;i<pros.length;i++){
				//如果选中的省份的编号跟当前循环的对象编号一样
				if(pros[i].nodeType==1&&flag==pros[i].getAttribute("name")){
					//取出该省份下的所有市
					var cities=pros[i].childNodes;
					for(var j=0;j<cities.length;j++){
						if(cities[j].nodeType==1){
							addOption(cities[j],city);
						}
					}
					break;
				}
			}
		}
		
		//当城市发生变化的时候
		city.onchange=function(){
			var num=pro.value; //获取当前选中的省份
			var code=city.value; //获取当前选中的城市的编号
			area.length=1;//清空县下拉对象中原有的数据
			
			for(var i=0;i<pros.length;i++){
				//如果选中的省份的编号跟当前循环的对象编号一样
				if(pros[i].nodeType==1&&num==pros[i].getAttribute("name")){
					//获取当前省份下面的所有市
					var cities=pros[i].childNodes;
					
					
					//当前循环的城市跟选中的城市相同
					for(var j=0;j<cities.length;j++){
						if(cities[j].nodeType==1&&cities[j].getAttribute("name")==code){
							//获取当前城市下的所有地区
							var areas=cities[j].childNodes;
							
							for(var k=0;k<areas.length;k++){
								if(areas[k].nodeType==1){
									addOption(areas[k],area);
								}
							}
						}
					}
				}
			}
		}
	}

	//第一个是要添加的节点对象，第二个是要添加到的对象
	function addOption(node,obj){
		if(node.nodeType==1){
			var opt=document.createElement("option");
			opt.appendChild( document.createTextNode( node.getAttribute("name") ) );
			opt.setAttribute("value",node.getAttribute("name"));
			obj.appendChild(opt);
			//<option value=''>湖南省</option>
		}
	}
});




//记号

$(function(){
	/*
	大多数浏览器都有读取和操作 XML 的内建 XML 解析器,微软IE基于ActiveX的MSXML
	解析器把 XML 转换为 JavaScript 可访问的XML DOM对象
	*/

	function createIEXmlDom(){
		var arrs=["MSXML2.DOMDocument.6.0","MSXML2.DOMDocument.5.0","MSXML2.DOMDocument.4.0","MSXML2.DOMDocument.3.0","MSXML2.DOMDocument","Microsoft.XmlDom"];
		var ieXmlDom;
		for(var i=0;i<arrs.length;i++){
			try{
				ieXmlDom=new ActiveXObject(arrs[i]);
				return ieXmlDom;
			}catch(e){
				
			}
		}
		throw new Error("对不起,您的浏览器不支持...");
	}

	function xmlDom(){
		var dom;
		if(window.ActiveXObject){  //IE获取XML文档对象
			dom=createIEXmlDom();
		}else if(document.implementation&&document.implementation.createDocument){ //implementation：正在运行的程序
			//第一个参数是命名空间   第二个参数是跟标签   第三个一个doc类型
			dom=document.implementation.createDocument("","",null);
		}else{ //抛出异常
			throw new Error("对不起,您的浏览器不支持...");
		}
		return dom;
	}

	window.onload=function(){
		var dom;
		if(window.DOMParser&&!window.ActiveXObject){
			var xmlhttp=new XMLHttpRequest();
			xmlhttp.open("GET","city.xml",false);
			xmlhttp.send(null);
			if(xmlhttp.readyState==4){
				dom=xmlhttp.responseXML.documentElement;
			}
		}else{
			dom=xmlDom();
			dom.async=false;
			dom.load("city.xml");
		}
		
		//获取显示三级级联的三个下拉对象
		var pro=document.getElementById("s1");
		var city=document.getElementById("s2");
		var area=document.getElementById("s3");
		
		//获取所有的省份
		var pros=dom.getElementsByTagName("province");
		
		for(var i=0;i<pros.length;i++){
			addOption(pros[i],pro);
		}
		
		//当省份发生改变时，后面的城市跟着改变,所以给省份的下拉对象添加一个onchange事件
		pro.onchange=function(){
			//获取当前选中的省份的编号
			var flag=pro.value;
			
			//清空以前的数据
			city.length=1;
			
			for(var i=0;i<pros.length;i++){
				//如果选中的省份的编号跟当前循环的对象编号一样
				if(pros[i].nodeType==1&&flag==pros[i].getAttribute("name")){
					//取出该省份下的所有市
					var cities=pros[i].childNodes;
					for(var j=0;j<cities.length;j++){
						if(cities[j].nodeType==1){
							addOption(cities[j],city);
						}
					}
					break;
				}
			}
		}
		
		//当城市发生变化的时候
		city.onchange=function(){
			var num=pro.value; //获取当前选中的省份
			var code=city.value; //获取当前选中的城市的编号
			area.length=1;//清空县下拉对象中原有的数据
			
			for(var i=0;i<pros.length;i++){
				//如果选中的省份的编号跟当前循环的对象编号一样
				if(pros[i].nodeType==1&&num==pros[i].getAttribute("name")){
					//获取当前省份下面的所有市
					var cities=pros[i].childNodes;
					
					
					//当前循环的城市跟选中的城市相同
					for(var j=0;j<cities.length;j++){
						if(cities[j].nodeType==1&&cities[j].getAttribute("name")==code){
							//获取当前城市下的所有地区
							var areas=cities[j].childNodes;
							
							for(var k=0;k<areas.length;k++){
								if(areas[k].nodeType==1){
									addOption(areas[k],area);
								}
							}
						}
					}
				}
			}
		}
	}

	//第一个是要添加的节点对象，第二个是要添加到的对象
	function addOption(node,obj){
		if(node.nodeType==1){
			var opt=document.createElement("option");
			opt.appendChild( document.createTextNode( node.getAttribute("name") ) );
			opt.setAttribute("value",node.getAttribute("name"));
			obj.appendChild(opt);
			//<option value=''>湖南省</option>
		}
	}
});



