// JavaScript Document
	var total=0;
	var shuliang=0;
	function change(img){
		var cd=document.getElementById(img).style.display="block";
	}
	function show(imgs){
		var cd=document.getElementById(imgs).style.display="none";	
	}

	//全选
	function selectAll(){
		//获取所有的复选框
		total=0;
		shuliang=0;
		var flag=false;
		var allCheckBox=document.getElementsByName('op');
		var quan=document.getElementsByName('quanxuan')[0].checked;
		if(quan==true){
			for(var i=0;i<allCheckBox.length;i++){
				//判断当前选中对象是否为复选框
				if(allCheckBox[i].type=='checkbox'){
					//将复选框设置为选中
					allCheckBox[i].checked=true;	
					flag=true;
				}
			}
		}else {
			for(var i=0;i<allCheckBox.length;i++){
				//判断当前选中对象是否为复选框
				if(allCheckBox[i].type=='checkbox'){
					//将复选框设置为选中
					allCheckBox[i].checked=false;	
					flag=false;
				}
			}
		}
		if(flag==true){
			productCountss();
			document.getElementById('sel51').style.background='#F13C37';
			}
		if(flag==false){
			total=0;
			document.getElementById('totalprice').innerHTML=0.00+'￥';	
			document.getElementById('sel31').innerHTML=0;
			document.getElementById('sel51').style.background='#CCC';
		}
	}
	
	//点击某个复选框
    function ch(checkValue,jifen){
		color();
		if(checkValue==true){
			document.getElementsByName('quanxuan')[0].checked=false;
			productCount(jifen);
		}
		if(checkValue==false){
			document.getElementsByName('quanxuan')[0].checked=false;
			productCounts(jifen);
		}
		var allCheckBox =document.getElementsByName("op");	
		for(var i=0;i<allCheckBox.length;i++){
			if(allCheckBox[i].checked==false&&allCheckBox[i].type=='checkbox'){
				//若有复选框没有被选中，则取消全选
				document.getElementsByName('quanxuan')[0].checked=false;
				return;
			}		
		}	
		document.getElementsByName('quanxuan')[0].checked=true;
	}
	
	//选择店铺，全选或全不选商品
	function dianpu(){
		var shangpin=document.getElementById("shangpin");
		var dianpu1=document.getElementById("dianpu1").checked;
		if(dianpu1==true){
			for(var i=0;i<shangpin.length;i++){
				//判断当前选中对象是否为复选框
				if(shangpin[i].type=='checkbox'){
					//将复选框设置为选中
					shangpin[i].checked=true;	
				}
			}
			document.getElementById("shangpin").checked=true;
		}else {
			for(var i=0;i<shangpin.length;i++){
				//判断当前选中对象是否为复选框
				if(shangpin[i].type=='checkbox'){
					//将复选框设置为选中
					shangpin[i].checked=false;	
				}
			}
		}
	}
	
	
	//删除商品
	
	function deleteShangpin(cid){
		$.post("cart_deleteCart.action",{cid:cid},function(data){
			if(data>0){
				window.location.reload();
			}else{
				alert("删除信息失败！");
			}
		},'json');
	}
	
	//金额加法
	function productCount(jifen){
		var price=0;
		var num=0;
		//访问表格中的所有行的信息
		//var danjia=document.getElementById('sp'+jifen);
		var danjia=document.getElementById('xprice'+jifen);
		price=danjia.innerHTML;
		num=document.getElementById('shangp'+jifen).getElementsByTagName('input')[0].value;
		total+=price*num;
		shuliang=parseInt(shuliang)+parseInt(num);
		document.getElementById('totalprice').innerHTML=total+'￥';
		document.getElementById('sel31').innerHTML=shuliang;
	}
	//金额减法
	function productCounts(jifen){
		var price=0;
		var num=0;
		color();
		//访问表格中的所有行的信息
		//var danjia=document.getElementById('sp'+jifen);
		var danjia=document.getElementById('xprice'+jifen);

		price=danjia.innerHTML;
		num=document.getElementById('shangp'+jifen).getElementsByTagName('input')[0].value;
		total-=price*num;
		shuliang=parseInt(shuliang)-parseInt(num);
		document.getElementById('totalprice').innerHTML=total+'￥';
		document.getElementById('sel31').innerHTML=shuliang;
	}
	//计算表格里面商品的总金额
	function productCountss(){
		var price=0;
		var num=0;
		//访问表格中的所有行的信息
		var myTabletr=document.getElementById('shopinfo').getElementsByTagName('tr');
		for(var i=0;i<myTabletr.length;i++){
			//price=myTabletr[i].getElementsByTagName('td')[5].innerHTML;
			price=document.getElementById("xprice"+i).innerHTML;
			num=myTabletr[i].getElementsByTagName('td')[6].getElementsByTagName('input')[0].value;
			total+=price*num;
			shuliang=parseInt(shuliang)+parseInt(num);
			}
		document.getElementById('totalprice').innerHTML=total+'￥';
		document.getElementById('sel31').innerHTML=shuliang;
	}

function color(){
	var color=document.getElementsByName('op');
	for(var i=0;i<color.length;i++){
		if(color[i].checked==true){
			document.getElementById('sel51').style.background='#F13C37';
			break;
			}else{
			document.getElementById('sel51').style.background='#CCC';	
			}
		
		}
	}
//获取选中的商品，以便在结算页面显示
function buy(){
	var cid;
	$.post("fuKuanInfo_deleteInfo");
	var allCheckBox=document.getElementsByName('op');
	var quan=document.getElementsByName('quanxuan')[0].checked;
	var rows = document.getElementById("shopinfo").rows; 
	
	/*if(quan==true){
		for(var i=0;i<allCheckBox.length;i++){
			//重新查找购物车里面的所有，用现成的方法
		}
	}else{*/
		
		for(var i=0;i<allCheckBox.length;i++){
			//如果复选框被选中
			if(allCheckBox[i].checked==true){
				
				var row = allCheckBox[i].parentElement.parentElement.rowIndex; 
				var ss=rows[row].cells[8].innerHTML;
				cid=ss.substring(35,ss.length-9);
				$.post("fuKuanInfo_saveCartInfo",{cid:cid},function(data){
					window.location.href="front/fukuan.jsp";
				});
				cid="";
			}
		}
	//}
}
