// JavaScript Document
	function  change(_this,num){
		
		for(var i=1;i<=3;i++){
			if(num==i){
				document.getElementById(i).style.display='block';	
			}else{
				document.getElementById(i).style.display='none';	
			}
		}
	}
	
	function show1(){
		document.getElementById('smxz').style.display='block';
	}
	function no(){
		document.getElementById('smxz').style.display='none';
	}
	function change1(num){
		var le=$("#hahah li").length;
			for(var j=0;j<le;j++){
				if(num==j){
					document.getElementById('b'+j).style.display='block';
					document.getElementById('a'+j).style.opacity=1;
				}else{
					document.getElementById('b'+j).style.display='none';
					document.getElementById('a'+j).style.opacity=0.5;
				}
			}	
	}

function show2(num){
	
	var sq=$("#c"+num);
	var lq=sq.attr("class");
	var le=$("#showcolor div").length-1;
	if(lq=='yy'){
		
		for(i=0;i<le;i++){
			if(num==i){
				var pp=parseInt(i)+1;
				document.getElementById('b'+i).style.display='block';
				var s=document.getElementById('c'+i);
				s.className='yi';
			}else{
				var pp=parseInt(i)+1;
				document.getElementById('b1').style.display='none';
				document.getElementById('b'+i).style.display='none';
				var s=document.getElementById('c'+i);
				s.className='yy';
			}
		}
	}else{
		var s=document.getElementById('c'+num);
		s.className='yy';	
		document.getElementById('b1').style.display='block';
		document.getElementById('b2').style.display='none';
		document.getElementById('b3').style.display='none';
		document.getElementById('b4').style.display='none';
		}
}


function show3(num){
	for(var n=1;n<=3;n++){
		if(num==n){
			document.getElementById("d"+n).style.display="none";	
			document.getElementById("c"+n).style.display="block";
		}
	}
}

function show4(num){
	var sq=$("#e"+num);
	var lq=sq.attr("class");
	var le=$("#showcolor1 div").length-1;
	
	if(lq=='ss'){
		for(i=0;i<le;i++){
			if(num==i){
				var s=document.getElementById('e'+i);
				s.className='s';
				var color=$(".yi").html();
				var psize=$(".s").html();
				var proid=$(".proid").val();
				
				$.post("xiangQing_shownumber.action",{proid:proid,color:color,psize:psize},function(data){
					if(data==null){
						$("#sq").html(0);
					}else{
						$("#sq").html(data);
					}
					
				},'json');
				
			}else{
				
				var s=document.getElementById('e'+i);
				s.className='ss';
			}
		}
	}else{
		document.getElementById('e'+num).className="ss";
		}
}
function show5(num){
	var sq=$("#g"+num);
	var lq=sq.attr("class");
	var le=$("#showcolor2 div").length-1;
	if(lq=='yy1'){
		for(i=0;i<le;i++){
			if(num==i){
				var pp=parseInt(i)+1;
				document.getElementById('b'+i).style.display='block';
				var s=document.getElementById('g'+i);
				s.className='yi1';
			}else{
				var pp=parseInt(i)+1;
				document.getElementById('b1').style.display='none';
				document.getElementById('b'+i).style.display='none';
				var s=document.getElementById('g'+i);
				s.className='yy1';
			}
		}
	}else{
		var s=document.getElementById('g'+num);
		s.className='yy1';	
		document.getElementById('b1').style.display='block';
		document.getElementById('b2').style.display='none';
		document.getElementById('b3').style.display='none';
		document.getElementById('b4').style.display='none';
		}
}
function show6(num){
	var sq=$("#f"+num);
	var lq=sq.attr("class");
	var le=$("#showcolor3 div").length-1;
	
	if(lq=='ss'){
		for(i=0;i<le;i++){
			if(num==i){
				var s=document.getElementById('f'+i);
				s.className='s';
			}else{
				var s=document.getElementById('f'+i);
				s.className='ss';
			}
		}
	}else{
		document.getElementById('f'+num).className="ss";
		}
}

//点击加入购物车
function gowuche(){
	document.getElementById("xuanze").style.display="block";
	document.getElementById("goods").style.display="none";
}

function showclose(){
	document.getElementById("xuanze").style.display="none";
	document.getElementById("goods").style.display="block";
}

//确定加入购物车
function JiaRuGouWuChe(){
	var proid=$(".proid").val();
	var proname=$("#title").html();
	var price=$("#price").html();
	var size=$(".s").html();
	var number=$("#shuliangs").val();
	var color=$(".yi1").html();
	$.post("xiangQingAction_AddGouWuChe",{proid:proid,price:price,color:color,csize:csize,snumber:snumber},function(data){
		if(data==1){
			alert("添加成功，稍后请去购物车结算！");
			document.getElementById("xuanze").style.display="none";
			document.getElementById("goods").style.display="block";
		}else{
			alert("购物车添加失败！");
		}
	});
}

//立即购买
function NowBuy(){
	var proname=$("#title").html();
	var price=$("#price").html();
	var size=$(".s").html();
	var number=$("#shuliang").val();
	var color=$(".yi").html();
	var proid=$(".proid").val();
	/*$.post("fukuanServlet",{op:"deleteInfo"});*/
	$.post("fuKuanInfo_jieesuanInfo",{proname:proname,price:price,color:color,size:size,number:number,proid:proid},function(data){
		if(data==1){
			location.href="front/fukuan.jsp";
		}
	},'json');
}
$(function(){
	$('#qbsp1').bind({
		mouseover:function(){
			$('#qbsp2').css({display:"block"});
		},
		mouseout:function(){
			$('#qbsp2').css({display:"none"});
		}
	});
	
	$('#qbsp2').bind({
		mouseover:function(){
			$('#qbsp2').css({display:"block"});
		},
		mouseout:function(){
			$('#qbsp2').css({display:"none"});
		}
	});
	
});
function jianfa(){
	var s=$('#shuliang').val();
	var a=parseInt(s);
	if(a>0){
		document.getElementById('shuliang').value=a-1;
	}else{
		document.getElementById('shuliang').value=0;
		}
	
	}
function jiafa(){
	var s=$('#shuliang').val();
	var a=parseInt(s);
	document.getElementById('shuliang').value=a+1;
	
	}
	
function jian(){
	var s=$('#shuliangs').val();
	var a=parseInt(s);
	if(a>0){
		document.getElementById('shuliangs').value=a-1;
	}else{
		document.getElementById('shuliangs').value=0;
		}
	
	}
function jia(){
	var s=$('#shuliangs').val();
	var a=parseInt(s);
	document.getElementById('shuliangs').value=a+1;
	
	}
	

