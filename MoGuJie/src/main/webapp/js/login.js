
//登陆用户名验证
function checkloginuname() {
    var uname = $("#uname").val();
    if ("" == uname || uname == null) {
        $(".tishi").html("用户名不能为空...").css({color: "#F00",display:"block"});
    } else {
        $(".tishi").html("用户名格式正确...").css({color: "#0F0",display:"block"});
    }
}

//登陆密码验证
function checkloginpwd() {
    var pwd = $("#pass").val();
    if ("" == pwd || pwd == null) {
        $(".tishi").html("您的密码不能为空...").css({color: "#F00",display:"block"});
    } else {
        $(".tishi").html("密码格式正确...").css({color: "#0F0",display:"block"});
    }
}

//验证注册用户名
function checkzcuname() {
    var uname = $("#r_uname").val();
    var reg = /^([a-zA-Z0-9\u4E00-\u9FA5_-]{2,12})/;
    if (uname.match(reg)) {
        $.post("../userServlet?d="+new Date(),{op:"checkuname",uname: uname},
        function(data) {
            if (parseInt(data) > 0) {
                $(".z-tishi").html("该名称可以使用...").css({color: "#0F0",display:"block"});
            } else {
                $(".z-tishi").html("用户名已经存在...").css({color: "#F00",display:"block"});
            }
        });
    } else {
        $("#r_uname").val("");
        $(".z-tishi").html("用户名格式不正确...").css({color: "#F00",display:"block"});
    }
}

//验证注册密码
function checkzcpwd() {
    var pwd = $("#r_pass").val();
    var reg = /^([a-zA-Z0-9_-]{6,20})/;
    if (pwd.match(reg)) {
        $("#zcpwdp").html("可以使用该密码...").css({color: "#0F0",display:"block"});
    } else {
        $("#r_pass").val("");
        $(".z-tishi").html("密码不合格...").css({color: "#F00",display:"block"});
    }
}

//验证重复密码
function checkzcpwdagain() {
    var pwdagain = $("#r_pass1").val();
    var pwd = $("#r_pass").val();
    if (pwdagain == pwd && pwd != "" && pwd != null) {
        $(".z-tishi").html("密码重复确认正确...").css({color: "#0F0",display:"block"});
    } else {
        $(".z-tishi").html("密码不一致请重新输入...").css({color: "#F00",display:"block"});
        $("#r_pass1").val("");
    }
}
//验证手机
function checkzcphone() {
	    var phone = $("#r_tel").val();
	    var reg =/^1[3-8]\d{9}$/;
	    if (phone.match(reg)) {
	        $.post("../userServlet?d="+new Date(),{
	            op: "checkphone",
	            phone: phone
	        },
	        function(data) {
	            if (parseInt(data) > 0) {
	                $(".z-tishi").html("该手机号码可以使用...").css({color: "#0F0",display:"block"});
	            } else {
	                $(".z-tishi").html("该手机号码已被注册...").css({color: "#F00",display:"block"});
	                $("#r_tel").val("");
	            }
	        });
	    } else {
	        $(".z-tishi").html("手机号码格式不正确...").css({color: "#F00",display:"block"});
	        $("#r_tel").val("");
	    }
}

//验证邮箱
function checkzcemail() {
    var email = $("#r_email").val();
    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    if (email.match(reg)) {
        $.post("../userServlet?d="+new Date(),{
            op: "checkemail",
            email: email
        },
        function(data) {
            if (parseInt(data) > 0) {
                $(".z-tishi").html("该邮箱可以使用...").css({color: "#0F0",display:"block"});
            } else {
                $(".z-tishi").html("该邮箱已被注册...").css({color: "#F00",display:"block"});
                $("#r_email").val("");
            }
        });
    } else {
        $(".z-tishi").html("邮箱格式不正确...").css({color: "#F00",display:"block"});
        $("#r_email").val("");
    }
}



//会员登录
function userlogin(){
	var uname=$.trim($("#uname").val());
	var pwd=$.trim($("#pass").val());
	
	$.post("../userServlet?d="+new Date(),{op:"userLogin",uname:uname,pwd:pwd},function(data){
		if(parseInt($.trim(data))==0){
			alert("用户名或密码错误...");
		}else{
			window.location.href="../front/index.jsp";
		}
	});
}


//会员注册
function userzc(){
	var uname=$.trim($("#r_uname").val());
	var pwd=$.trim($("#r_pass").val());
	var email=$.trim($("#r_email").val());
	var phone=$.trim($("#r_tel").val());
		$.post("../userServlet?d="+new Date(),{op:"addUsersInfo",uname:uname,pwd:pwd,email:email,phone:phone},function(data){
			if(parseInt($.trim(data))){
				alert("恭喜注册成功...");
				window.location.href="../front/index.jsp";
			}else{
				alert("真抱歉，注册失败...");
			}
		});
		
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