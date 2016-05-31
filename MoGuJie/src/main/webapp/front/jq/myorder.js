//JavaScript Document
//页面切换
var usid="${loginUser.usid}";
function switchover(_this,num){
	var div=document.getElementsByClassName('content');
	for(var i=1;i<=div.length;i++){
		if(num==i){
			document.getElementById('content_'+i).style.display='block';	
			if(num==2){
				var str="";
				$("#content_2").html('');
				$.post("userOrderBean_findNoPayOrder.action",{usid:usid},function(data){
					if(data.length==0){
						str+="<img id='NoImage_1' src='front/images/dingdan_1.png'/>";
						str+="<h3 id='NoImage_2'>哎呀,此状态下没有对应的订单!</h3>";
						str+="<p id='NoImage_3'>去&nbsp;<a  href='front/index.jsp'>首页</a>&nbsp;逛逛吧</p>";
					}else{
						$.each(data,function(index,item){
							var status;
							if(item.ostatus==1){
								status="未付款";
							}
							str+="<table class='dingdanInfo'>";
							str+="<tr class='ding1'>";
							str+="<td>订单编号："+item.orderid+"</td>";
							str+="<td id='dtime'>订单时间："+item.datetime.substring(0,10)+"</td>";
							str+="<td id='dhouse'><a>店铺：yoyo吾裳</a></td>";
							str+="<td id='contact'><a>联系我们</a></td>";
							str+="</tr>";
							str+="<tr class='dingdan1' id='dingdan1'>";
							str+="<td><img src='"+item.prophoto+"' style='width:100px;height:100px;'/></td>";
							str+="<td>";
							str+="<p><a>"+item.procontent+"</a><a>[交易快照]</a></p>";
							str+="<p>颜色："+item.color+"</p>";
							str+="<p>尺码："+item.psize+"</p>";
							str+="</td>";
							str+="<td>";
							str+="<p id='xprice'>"+item.proprice+"</p>";
							str+="</td>";
							str+="<td id='number'>"+item.onumber+"</li>";
							str+="<td id='youf'>";
							str+="<p class='n1'>￥"+item.buyprice+"</p>";
							str+="<p class='n2'>(包邮)</p>";
							str+="</td>";
							str+="<td id='xiang'>";
							str+="<p class='x1'>"+status+"</p>";
							str+="<p class='x2'><a>订单详情</a></p>";
							str+="</td>";
							str+="<td id='del'>";
							str+="<a href='javascript:deleteInfo("+item.orderid+")'>删除订单</a>";
							str+="</td>";
							str+="</tr>";
							str+="</table>";
						});
					}
					$("#content_2").append($(str));
				},"json");
			}
			if(num==3){
				var str=" ";
				$("#content_3").html('');
				$.post("userOrderBean_findPaiedOrder",{usid:usid},function(data){
					if(data.length==0){
						str+="<img id='NoImage_1' src='front/images/dingdan_1.png'/>";
						str+="<h3 id='NoImage_2'>哎呀,此状态下没有对应的订单!</h3>";
						str+="<p id='NoImage_3'>去&nbsp;<a  href='front/index.jsp'>首页</a>&nbsp;逛逛吧</p>";
					}else{
						$.each(data,function(index,item){
							var status;
							if(item.ostatus==2){
								status="待评价";
							}
							str+="<table class='dingdanInfo'>";
							str+="<tr class='ding1'>";
							str+="<td>订单编号："+item.orderid+"</td>";
							str+="<td id='dtime'>订单时间："+item.datetime.substring(0,10)+"</td>";
							str+="<td id='dhouse'><a>店铺：yoyo吾裳</a></td>";
							str+="<td id='contact'><a>联系我们</a></td>";
							str+="</tr>";
							str+="<tr class='dingdan1' id='dingdan1'>";
							str+="<td><img src='"+item.prophoto+"' style='width:100px;height:100px;'/></td>";
							str+="<td>";
							str+="<p><a id='get_proname_1'>"+item.procontent+"</a><a>[交易快照]</a></p>";
							str+="<p>颜色："+item.color+"</p>";
							str+="<p>尺码："+item.psize+"</p>";
							str+="</td>";
							str+="<td>";
							str+="<p id='xprice'>"+item.proprice+"</p>";
							str+="</td>";
							str+="<td id='number'>"+item.onumber+"</li>";
							str+="<td id='youf'>";
							str+="<p class='n1'>￥"+item.buyprice+"</p>";
							str+="<p class='n2'>(包邮)</p>";
							str+="</td>";
							str+="<td id='xiang'>";
							str+="<p class='x1'><a href='javascript:pingjia("+item.orderid+")'>"+status+"</a></p>";
							str+="<p class='x2'><a>订单详情</a></p>";
							str+="</td>";
							str+="<td id='del'>";
							str+="<a href='javascript:deleteInfo("+item.orderid+")'>删除订单</a>";
							str+="</td>";
							str+="</tr>";
							str+="</table>";
						});
					}
					$("#content_3").append($(str));
				},"json");
			}
		}else{
			document.getElementById('content_'+i).style.display='none';
		}
	}
}

function pingjia(orderid){
	var proname=$("#get_proname_1").html();
	$.post("feedServlet?d="+new Date(),{op:"selectfeedback",orderid:orderid,proname:proname},function(data){
		location.href="front/pingjia.jsp";
	});
}
function change(_this){
	_this.className='over';  //li标签添加类名
}

function show(_this){
	_this.className='out';	
}

//删除订单
/*function deleteInfo(orderid){
	var delElement=document.getElementById(orderid);	
	var flag=confirm('确定删除此订单?');
	if(flag==true){
		delElement.parentNode.removeChild(delElement);	
	}
}*/
function deleteInfo(orderid){
	var flag=confirm('确定删除此订单?');
	if(flag==true){
		$.post("userOrderServlet?d="+new Date(),{op:"deleteOrder",orderid:orderid},function(data){
			if(data==1){
				alert("删除成功!");
				window.location.href="front/myorder.jsp";
			}else{
				alert("删除失败!");
			}
		});
	}
}


//基本信息的js
//修改用户名的警告
function updateName(){
	var name=document.getElementById('name').value;

	if(name!=null || ''.equals(name)){
		document.getElementById('changname').innerHTML="*昵称只能修改一次哦^_^";
		document.getElementById('changname').style.color='#F63';	
	}	
}


//城市级联
var prov=new Array();
prov['湖南省']=['长沙市','常德市','益阳市','衡阳市','郴州市','岳阳市','怀化市','娄底市','邵阳市','湘潭市','株洲市','永州市','张家界市','湘西土家族苗族自治州'];
prov['广东省']=['广州市','佛山市','深圳市','观澜市','珠海市','汕头市','佛山市','韶关市','湛江市','江门市','茂名市','惠州市','梅州市','肇庆市','汕尾市','河源市','阳江市','清远市','揭阳市','中山市','潮州市','云浮市'];
prov['湖北省']=['武汉市','黄 石 市 ','襄 樊 市','荆 州 市','宜 昌 市','十 堰 市','孝 感 市','荆 门 市','鄂 州 市','黄 冈 市 ','咸 宁 市'];
prov['山东省']=['沈阳市','济南市','泰安市','潍坊市','德州市','滨州市','莱芜市','青岛市','烟台市','日照市','东营市','济宁市','荷泽市','聊城市','临沂市','枣庄市'];
prov['北京省']=['东城区','西城区','崇文区','宣武区',' 朝阳区','丰台区','石景山区','海淀区','门头沟区','房山区','通州区','顺义区','昌平区','大兴区','怀柔区','平谷区',' 密云县','延庆县'];

function changeCity(){
	var pro=document.myform1.selProvince;
	for(var i=0;i<pro.length;i++){
		//判断是否有选中的选项
		if(pro[i].selected==true){
			//通过省份名创建城市选项
			add(pro[i].value);
		}
	}
}

//将城市信息添加到下拉列表中
function add(provice){
	document.myform1.selCity.length=0;
	for(var i=0;i<prov[provice].length;i++){
		var op=new Option(prov[provice][i],prov[provice][i]);	
		document.myform1.selCity.options.add(op);
	}
}


//核对邮箱
var reg;
var email;
function checkEmail(){
	reg=/^\w+@\w+.[(com)|(cn)]+$/;	
	email=document.getElementById('email').value;
	//console.info(email);

	if(!reg.test(email)){
		document.getElementById('checkemail').innerHTML="邮箱格式输入错误!";
		document.getElementById('checkemail').style.color='red';
		return false;	
	}else{
		document.getElementById('checkemail').innerHTML='邮箱格式输入正确';
		document.getElementById('checkemail').style.color='green';
		return true;
	}
	return true;
}

//核对手机号
var reg1;
var phone;
function checkPhone(){
	reg1=/^1[3-8]\d{9}$/;	
	phone=document.getElementById('phone').value;
	//console.info(phone);
	if(!reg1.test(phone)){
		document.getElementById('checkphone').innerHTML="手机号格式输入错误!";
		document.getElementById('checkphone').style.color='red';
		return false;	
	}else{
		document.getElementById('checkphone').innerHTML='手机号格式输入正确';
		document.getElementById('checkphone').style.color='green';
		return true;
	}
	return true;
}

/*//确认修改
	function check(){
		var name=document.getElementById('name').value;

		if(name!='' && reg.test(email) && reg1.test(phone)){
			//alert("!");
			document.getElementById('b1').style.background="#F93";	
		}	
	}

	window.onload=function(){
		var mytime=window.setInterval("check()",100);	
	}*/

//左边功能实现
function showJuti1(){
	var but=document.getElementById('bottom1');//获取箭头	
	var title=document.getElementById('juti1');

	if(title.style.display=='none'){
		title.style.display='block';	
		but.className='top1';
		document.getElementById("bottom1").innerHTML="&and;";
	}else{
		title.style.display='none';	
		but.className='bottom1';
		document.getElementById("bottom1").innerHTML="&gt;";	
	}
}



function showJuti2(){
	var but=document.getElementById('bottom2');//获取箭头	
	var title=document.getElementById('juti2');

	if(title.style.display=='none'){
		title.style.display='block';	
		but.className='top2';
		document.getElementById("bottom2").innerHTML="&and;";
	}else{
		title.style.display='none';	
		but.className='bottom2';
		document.getElementById("bottom2").innerHTML="&gt;";	
	}
}
function showJuti3(){
	var but=document.getElementById('bottom3');//获取箭头	
	var title=document.getElementById('juti3');

	if(title.style.display=='none'){
		title.style.display='block';	
		but.className='top3';
		document.getElementById("bottom3").innerHTML="&and;";
	}else{
		title.style.display='none';	
		but.className='bottom3';	
		document.getElementById("bottom3").innerHTML="&gt;";	
	}
}

//显示修改密码
function showmima(){
	var but=document.getElementById('ypwd');
	var she=document.getElementById('shezhi');
	if(but.style.display=='none'){
		she.innerHTML='收起';
		but.style.display='block';	
	}else{
		she.innerHTML='设置';
		but.style.display='none';
	}
}

//输入新的密码
var pwd;
function NewPwd(){
	pwd=document.getElementById('npwd').value;

	if(pwd==""){
		document.getElementById('checkNpwd').innerHTML='请输入新的密码！';
		document.getElementById('checkNpwd').style.color='#F00';
	}
}

//重新输入密码
function Cpwd(){
	var cpwd=document.getElementById('cpwd').value;
	if(pwd==cpwd &&pwd!=""){
		document.getElementById('checkCpwd').innerHTML='两次密码输入一致！';
		document.getElementById('checkCpwd').style.color='#0F0';
	}else{
		if(pwd!="" && cpwd!=""){
			document.getElementById('checkCpwd').innerHTML='两次密码输入不一致！';
			document.getElementById('checkCpwd').style.color='#F00';
		}
	}	
}

/*//验证码
var res;
var tyan
function Huan(){
	var chars = ['0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	res="";
	for(var i=0;i<4;i++){
		var id=Math.ceil(Math.random()*35);
		res+=chars[id];
	}	
	document.getElementById('yan1').value=res;
}*/

/*function Yanzheng(){
	var yan=$("#yan2").val();
	$.post("userServlet?d="+new Date(),{op:"checkyan",yan:yan},function(data){
		data=parseInt($.trim(data));
		if(data==1){
			$("#tyan").html("验证码输入正确").css("color", "#0F0");
		}else{
			$("#tyan").html("验证码输入错误!").css("color", "#F00");
			$("#tyan").val("");
		}
	});
}*/
/*
//确认密码修改
function checkPwd(){
	var yPwd=$("#oldpwd").val();
	var npwd=$('#checkNpwd').val();
	var cpwd=document.getElementById('checkCpwd').style.color;
	if(ypwd!="" && npwd!="red" && cpwd=="green" && tyan.style.color=="green"){
		document.getElementById('tque').style.background="#F93";
	}	
}	


window.onload=function(){
	var mytime=window.setInterval("checkPwd()",100);	
}*/


//更改头像
var file;
var fr;
function showTp(source){
	file=source.files[0];
	if(!/image\/\w+/.test(file.type)){

	}else{
		document.getElementById('tuname').value=file.name;
		if(window.FileReader){
			fr=new FileReader();
			fr.onloadend=function(e){
				document.getElementById('tp').src=e.target.result;	
			};
			fr.readAsDataURL(file);
		}
	}
}
//确定头像修改
function UpTp(){
	var title=document.getElementById('xiugai');
	if(window.FileReader){
		fr=new FileReader();
		fr.onloadend=function(e){
			document.getElementById('tp').src=e.target.result;	
			document.getElementById('img1').src=e.target.result;
		};
		fr.readAsDataURL(file);
	}
	$.ajaxFileUpload({
		url:"userServlet?op=UpdatePhoto",
		secureuri:false,
		fileElementId:"photo",
		dataType:"json",
		success:function(data,status){
			if(parseInt($.trim(data))==1){
				title.innerHTML='头像修改成功！';
				title.style.color='green';	
			}else{
				title.innerHTML='头像修改失败！';
				title.style.color='red';	
			}
			$("#tuname").val("");
		}
	});

}
