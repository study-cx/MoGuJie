function goToRegiest(){
	window.location.href="regiest.html"
}
function goToLogin(){
	window.location.href="login.html"
}


//登陆用户名验证
function checkloginuname() {
  var uname = $("#name").val();
  if ("" == uname || uname == null) {
      $("#g-name-t").html("用户名不能为空...").css("color","#F00");
  } else {
      $("#g-name-t").html("用户名格式正确...").css("color","#000");
  }
}

//登陆密码验证
function checkloginpwd() {
  var pwd = $("#pwd").val();
  if ("" == pwd || pwd == null) {
      $("#g-pwd-t").html("您的密码不能为空...").css("color","#F00");
  } else {
      $("#g-pwd-t").html("密码格式正确...").css("color","#000");
  }
}

//验证注册用户名
function checkzcuname() {
  var aname = $("#name_t").val();
  var reg = /^([a-zA-Z0-9\u4E00-\u9FA5_-]{2,12})/;
  if (aname.match(reg)) {
      $.post("../adminServlet?d="+new Date(),{op:"checkuname",aname: aname},
      function(data) {
          if (parseInt(data) > 0) {
              $("#name-t").html("该名称可以使用...").css("color","#000");
          } else {
              $("#name-t").html("用户名已经存在...").css("color","#F00");
          }
      });
  } else {
      $("#pwd_t").val("");
      $("#name-t").html("用户名格式不正确...").css("color","#F00");
  }
}

//验证注册密码
function checkzcpwd() {
  var pwd = $("#pwd_t").val();
  var reg = /^([a-zA-Z0-9_-]{6,20})/;
  if (pwd.match(reg)) {
      $("#tpwd-t").html("可以使用该密码...").css("color","#000");
  } else {
      $("#pwd_t").val("");
      $("#tpwd-t").html("密码不合格...").css("color","#F00");
  }
}

//验证重复密码
function checkzcpwdagain() {
  var pwdagain = $("#pwd_t2").val();
  var pwd = $("#pwd_t").val();
  if (pwdagain == pwd && pwd != "" && pwd != null) {
      $("#tpwd-t2").html("密码重复确认正确...").css("color","#000");
  } else {
      $("#tpwd-t2").html("密码不一致请重新输入...").css("color","#F00");
      $("#pwd_t2").val("");
  }
}

//验证邮箱
function checkzcemail() {
  var aemail = $("#email").val();
  var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
  if (aemail.match(reg)) {
      $.post("../adminServlet?d="+new Date(),{
          op: "checkemail",
          aemail: aemail
      },
      function(data) {
          if (parseInt(data) > 0) {
              $("#email-t").html("该邮箱可以使用...").css("color","#000");
          } else {
              $("#email-t").html("该邮箱已被注册...").css("color","#F00");
              $("#email").val("");
          }
      });
  } else {
      $("#email-t").html("邮箱格式不正确...").css("color","#F00");
      $("#email").val("");
  }
}



//会员登录
function adminlogin(){
	var aname=$.trim($("#name").val());
	var apwd=$.trim($("#pwd").val());
	
	$.post("../adminServlet?d="+new Date(),{op:"adminLogin",aname:aname,apwd:apwd},function(data){
		if(parseInt($.trim(data))==0){
			alert("用户名或密码错误...");
		}else{
			window.location.href="../back/index.jsp";
		}
	});
}


//会员注册
function adminzc(){
	var aname=$.trim($("#name_t").val());
	var apwd=$.trim($("#pwd_t").val());
	var aemail=$.trim($("#email").val());
	if(aname==""  && apwd=="" && aemail==""){
		alert("您还未填写任何内容");
	}else{
		if(aname!="" && apwd!="" && aemail!=""){
			$.post("../adminServlet?d="+new Date(),{op:"addAdminInfo",aname:aname,apwd:apwd,aemail,aemail},function(data){
				if(parseInt($.trim(data))){
					alert("恭喜注册成功...");
					window.location.href="../back_login/login.html";
				}else{
					alert("真抱歉，注册失败...");
				}
			});
		}else if(aname==""){
			alert("用户名不能为空");
		}else if(apwd==""){
			alert("密码不能为空");
		}else if(aemail==""){
			alert("邮箱不能为空");
		}
	}
	
		
		
}


$.fn.mywin=function(position){
	if (position&&position instanceof Object){
		var positionleft=position.left;
		var positiontop=position.top;

		var currentwin=this;
		var mywidth =currentwin.outerWidth(true);
		var myheight = currentwin.outerHeight(true);

		var left=0;
		var top=0;
		var width=0;
		var height=0;
		var scrollleft=0;
		var scrolltop=0;
	

		function getWinInfo(){
			width=$(window).width();
			height=$(window).height();
			scrollleft=$(window).scrollLeft();
			scrolltop=$(window).scrollTop();
		}

		function calleft(positionleft,scrollleft,width,mywidth){
			if(positionleft!=""&&typeof(positionleft)=="string"){
				if(positionleft=="center"){
					left=scrollleft+(width-mywidth)/2;
				}else if(positionleft=="left"){
					left=scrollleft;
				}else if (positionleft == "right"){
					left=scrollleft+width-mywidth;
				}else{
					left=scrollleft+(width-mywidth)/2;
				}
			}else if(positionleft != ""&&typeof(positionleft)=="number"){
				left=positionleft+scrollleft;
			}else{
				left=0;
			}
			
		}
		
		function caltop(positiontop,scrolltop,height,myheight){
			if(positiontop!=""&&typeof(positiontop)=="string"){
				if(positiontop=="center"){
					top=scrolltop+(height-myheight)/2;
				}else if(positiontop == "top"){
					top=scrolltop;
				}else if(positiontop=="bottom"){
					top = scrolltop+height-myheight;
				}else{
					top=scrolltop+(height-myheight)/2;
				}
			}else if(positiontop!=""&&typeof(positiontop)=="number"){
				top=positiontop+scrolltop;
			}else{
				top=0;
			}
		}

		getWinInfo();
		calleft(positionleft, scrollleft,width,mywidth);
		caltop(positiontop,scrolltop,height,myheight);

		$(window).scroll(function(){
			getWinInfo();
			calleft(positionleft,scrollleft,width,mywidth);
			caltop(positiontop,scrolltop,height,myheight);
			currentwin.css("left",left).css("top",top);
		});

		$(window).resize(function(){
			getWinInfo();
			calleft(positionleft, scrollleft, width, mywidth);
			caltop(positiontop, scrolltop, height, myheight);
			currentwin.animate({left : left,top : top}, 300);
		});
		
		currentwin.css("left",left).css("top", top).fadeIn("slow");
	}
	return this;
}