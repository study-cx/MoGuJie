<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script>
	function UpdatePwd(){
		var oldPwd=$("#oldpwd").val();
		var newPwd=$("#npwd").val();
		var yan=$("#yan2").val();
		if(yan!=""){
			$.post("userServlet",{op:"updatePwd",oldPwd:oldPwd,newPwd:newPwd},function(data){
				$.post("userServlet?d="+new Date(),{op:"checkyan",yan:yan},function(data1){
					data1=parseInt($.trim(data1));
					if(data1==1){
						if(data==1){
							alert("恭喜您,密码修改成功!");
							$("#ypwd").val(" ");
							$("#npwd").val(" ");
							location.href="front/myorder.jsp";
						}else{
							$.post("userServlet",{op:"CheckOldPwd",oldPwd:oldPwd},function(data2){
								if(data2==1){
									alert("密码修改失败!");
								}else{
									alert("原密码填写错误,请重新输入!");
								}
							});
						}
					}else{
						alert("请输入正确的验证码!");
						$("#tyan").val("");
					}
				});
			});
				
		}else{
			alert("请输入验证码!");
		}
	}
	
	function changeMyCaliCode(obj){
		obj.src="front/valiCodeImg.jsp?d="+new Date();
	}
	
</script>
<div id="content_12" class="content" style="display:none;">
    	 <p class="secure"><span>安全设置</span></p>
         <ul>
        	 <li>你的账户安全等级：<span class="dengji">中</span><img src="front/images/updatepwd_1.png"/></li>
             <li class="dname">
             	<ul>
             		<li class="n1"><img src="front/images/updatepwd_6.png"/></li>
                    <li class="n2">登录名</li>
                    <li class="n3">秋日晨萱</li>
                </ul>
             </li>
             <li class="dpwd">
             	<ul>
                	<li class="p1"><img src="front/images/updatepwd_6.png"/></li>
                    <li class="p2">登录密码</li>
                    <li class="p3">已设置</li>
                    <li class="p4"><a id="shezhi" class="shezhi" onclick="showmima()">设置</a></li>
                </ul>
             </li>
             <li class="ypwd" id="ypwd" style="display:none">
             	<ul>
                    <li class="x1">----------------------------------------------------------------------------------------------------------------</li>
                    <li class="x2">现有密码：<input type="password" style="width:200px; height:23px;" id="oldpwd" /></li>
                    <li class="x3">输入新密码：<input type="password" style="width:200px; height:23px;" onblur="NewPwd()" id="npwd"/><span id="checkNpwd"></span></li>
                    <li class="x4">重新输入密码：<input type="password" style="width:200px; height:23px;" onblur="Cpwd()" id="cpwd"/><span id="checkCpwd"></span></li>
                    <li class="x5">验证码：<input type="text" style="width:80px; height:30px;" id="yan2" onblur="Yanzheng()"/>
                    					  <img id="yan1" src="front/valiCodeImg.jsp" onClick="changeMyCaliCode(this)" style="width:80px;height:40px;"/>
                                         	<span id="tyan">单击图片换一张</span>
                    </li>
                    <li class="x6"><input type="button" value="修改" onClick="UpdatePwd()" style="width:80px; height:30px;" id="tque"/></li>
                </ul>
             </li>
             <li class="tupan1">
             	<ul>
             		<li class="s2"><img src="front/images/updatepwd_2.png"/></li>
                    <li class="s3"><img src="front/images/updatepwd_3.png"/></li>
                </ul>
             </li>
             <li class="tupan2">
             	<ul>
                	<li class="s4"><img src="front/images/updatepwd_4.png"/></li>
                    <li class="s5"><img src="front/images/updatepwd_5.png"/></li>
                </ul>
             </li>
         </ul>
    </div>
