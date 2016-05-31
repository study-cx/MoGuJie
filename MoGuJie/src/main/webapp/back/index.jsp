<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>蘑菇街</title>
	<link rel="stylesheet" type="text/css" href="../easyui/css/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="../easyui/css/icon.css"/>
	<link rel="stylesheet" type="text/css" href="../easyui/css/demo.css"/>
	<link rel="stylesheet" type="text/css" href="../css/index.css"/>
	<link rel="shortcut icon" type="image/x-icon" href="../images/logo_s.png"/>
	
	<script type="text/javascript" src="../js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="../easyui/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="../easyui/js/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="../easyui/js/index.js"></script>
	
	<script type="text/javascript" src="../js/showpic.js"></script>
	<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
	
	<!--编辑器 -->
	<script type="text/javascript" src="../ueditor/ueditor.config.js"></script>
	<script type="text/javascript" src="../ueditor/ueditor.all.min.js"></script>
	<script type="text/javascript" src="../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" id="newslogo">
		<div id="top_login_right">
	    			<a href="#"><font color="red" size="5">当前登陆用户:${loginAdmin.aname }</font></a>&nbsp;&nbsp;
					<a href="javascript:loginOut()"><font color="#FF0000" size="2">[注销]</font></a>
		</div>
	</div>
	
	<div data-options="region:'west',split:true,title:'导航'" style="width:200px;padding:10px;">
		<ul class="easyui-tree" id="menu_tree">
			<li>
				<span>蘑菇街后台菜单</span>
				<ul>
					<li id="admin_manager">管理员信息管理</li>
					<li id="users_manager">顾客信息浏览</li>
					<li data-options="state:'open'">
						<span>商品</span>
						<ul>
						<li id="product_manager">
							<span>商品管理</span>
						<li id="products_manager">
							<span>商品详细管理</span>
						 </ul>
					</li>
					<li data-options="state:'open'">
						<span>广告</span>
						<ul>
						<li id="advertise_manager">
							<span>广告位管理</span>
						<li id="guanggao_manager">
							<span>广告管理</span>
						 </ul>
					</li>
					<li data-options="state:'open'">
						<span>订单管理</span>
						<ul>
						<li id="userOrder_manager">
							<span>订单信息</span>
						<li id="userOrders_manager">
							<span>订单详细信息</span>
						 </ul>
					</li>
					<li data-options="state:'open'">
						<span>分类管理</span>
						<ul>
							<li id="fenlei_manager_one">
								<span>一级分类</span>
							</li>
							<li id="fenlei_manager_two">
								<span>二级分类</span>
							</li>
							<li id="fenlei_manager_three">
								<span>三级分类</span>
							</li>
						</ul>
					</li>
					<!--  
					<li data-options="state:'open'">
						<span>活动</span>
						<ul>
						<li id="active_manager">
							<span>活动管理</span>
						<li id="activeInfo_manager">
							<span>活动信息管理</span>
						 </ul>
					</li>
					-->
				</ul>
			</li>
		</ul>
	</div>
	<div data-options="region:'east',split:true,collapsed:true,title:'帮助'" style="width:100px;">
		<img src="../images/two.png" width="90px" height="90px"/>
	
	</div>
	<div data-options="region:'south',border:false" style="background:#A9FACD;margin:0px;padding:0px;" id="copyright">
		<p><a href="http://www.hyycinfo.com">源辰信息科技有限公司</a>&copy;版权所有 0734-3452345</p>
	</div>
	<div data-options="region:'center',title:'内容'">
		<div id="index_content" class="easyui-tabs" data-options="fit:true">  
    
		</div>  	
	</div>
</body>
</html>
<script type="text/javascript">
function loginOut(){
	$.post("adminServlet?d="+new Date(),{op:"loginOut"},function(data){});
	window.location.href="../back_login/login.html";
}
</script>