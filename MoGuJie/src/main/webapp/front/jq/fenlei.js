// JavaScript Document
function show(numb){		

	for(var i=1;i<=10;i++){
		if(numb==i){
			//$(".content1").nth-child(i).addClass("on");
			document.getElementById("pp"+i).style.background='#FFF';
			document.getElementById(i).style.display='block';
			document.getElementById('b'+i).style.display='block';
		}else{
			//$(".content1").nth-child(i).removeClass("on");
			document.getElementById("pp"+i).style.background='#FAFAFA';
			document.getElementById(i).style.display='none';
			document.getElementById('b'+i).style.display='none';
		}
	}
}