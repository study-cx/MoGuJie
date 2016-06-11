<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<table id="usreInfo_info" data-options="fit:true"></table>
<script>
	var update_usid;
	$(function() {
		var datagrid;
		var op;
		var editRow = undefined;
		var flag;

		datagrid = $('#usreInfo_info')
				.datagrid(
						{
							url : 'user_getAllUserInfo.action',
							fitColumns : true,
							striped : true,
							loadMsg : "数据加载中...",
							pagination : true,
							rownumbers : true,
							columns : [ [
									{
										field : 'usids',
										title : '复选框',
										width : 100,
										align : 'center',
										checkbox : true
									},
									{
										field : 'usid',
										title : '顾客编号',
										width : 100,
										align : 'center',
										sortable : true
									},
									{
										field : 'uname',
										title : '顾客昵称',
										width : 100,
										align : 'center',
										editor : {
											type : "text",
											options : {
												required : true
											}
										}
									},
									{
										field : 'uspwd',
										title : '密码',
										width : 100,
										align : 'center',
										editor : {
											type : "text",
											options : {
												required : true
											}
										}
									},
									{
										field : 'usemail',
										title : '邮箱',
										width : 100,
										align : 'center',
										editor : {
											type : "text",
											options : {
												required : true
											}
										}
									},
									{
										field : '_operate',
										title : '操作',
										width : 100,
										align : 'center',
										formatter : function(value, rowData,
												index) {
											//console.info(JSON.parse(a));//将字符串转换为对象
											//console.info(JSON.stringify(rowData));
											return '<a class="icon-search1 icon-padding" href="javascript:showUserInfoDetail(\''
													+ rowData.usid
													+ '\')">详细</a>';
										}
									} ] ],
							toolbar : [
									{
										text : "修改",
										iconCls : 'icon-edit',
										handler : function() {
											//获取所有被选中的行
											var rows = datagrid
													.datagrid("getChecked")[0];
											if (rows == undefined) {
												$.messager.show({
													title : '温馨提示',
													msg : '请选择你要修改的数据...',
													timeout : 2000,
													showType : 'slide'
												});
											} else {
												update_usid = rows.usid;
												$("#update_users_userInfo").dialog("open");
												var obj = $("#update_users_userInfo");
												$.post("user_findUserInfo.action",{usid : update_usid},function(data) {
														$("#update_users_name").val(data.uname);
														$("#update_users_pwd").val(data.uspwd);
														$("#update_users_ucode").val(data.ucode);
														$("#update_users_email").val(data.usemail);
														$("#update_users_phone").val(data.usphone);
														$("#update_users_account").val(data.usaccount);
														$("#update_users_birth").datebox('setValue',data.ubirthdays);

														var pics = data.uphoto;
														if (pics == null) {
															var str = "<img src='../images/zanwu.jpg' width='100px' height='100px'>&nbsp;";
															$("#update_user_pic").html($(str));
														} else {
															var str = "<img src='../"+pics+"' width='100px' height='100px'>&nbsp;";
															$("#update_user_pic").html($(str));
														}
													}, "json");
											}
										}
									},
									{
										text : "删除",
										iconCls : 'icon-remove',
										handler : function() {
											//获取所有被选中的行
											var rows = datagrid
													.datagrid("getChecked");
											if (rows.length <= 0) {//没有选择任何一行
												$.messager.show({
													title : '温馨提示',
													msg : '请选择你要删除的数据...',
													timeout : 2000,
													showType : 'slide'
												});
											} else {
												$.messager
														.confirm(
																'确认信息',
																'你确定要删除选中的数据吗？',
																function(r) {
																	if (r) {
																		var usids = "";
																		for (var i = 0; i < rows.length - 1; i++) {
																			usids += rows[i].usid
																					+ ",";
																		}
																		usids += rows[i].usid;

																		//将要删除的tid发送到服务器
																		$
																				.post(
																						"../userServlet",
																						{
																							op : "delUserInfo",
																							usids : usids
																						},
																						function(
																								data) {
																							if (data == 1) {//删除成功
																								$.messager
																										.show({
																											title : '删除提示',
																											msg : '新闻信息删除成功...',
																											timeout : 2000,
																											showType : 'slide'
																										});
																								datagrid
																										.datagrid("reload");//重新加载数据一次
																							} else {
																								$.messager
																										.alert(
																												'失败提示',
																												'新闻信息删除失败...',
																												'error');
																							}
																						});
																	}
																});
											}
										}
									} ]
						});
	});
</script>

<style>
#user_pic_show {
	float: right;
	margin-top: -20px;
	margin-right: 600px;
}

#show_users_pic {
	float: right;
	margin-top: -20px;
	margin-right: 600px;
}

#update_user_pic {
	float: right;
	margin-top: -20px;
	margin-right: 600px;
}

.a {
	margin-left: 200px;
}
</style>


<div id="show_userInfo" class="easyui-dialog" title="用户详情" data-options="fit:true,iconCls:'icon-add',resizable:true,modal:true,closed:true">
	<form  action="" style="padding:20px;float:left;display:inline-block"><br /><br /><br />
	<label>用户头像：</label>
	<div id="show_users_pic"></div><br /><br /><br /><br /><br /><br />
	<label>用户昵称：</label><input type="text" name="title" id="show_users_name" class="myinput" readonly="readonly" /> <label class="a">用户生日：</label>
	<input type="text" name="birth" id="show_users_birth" class="myinput" readonly="readonly" /><br /><br />
	<label>邮箱地址：</label><input type="text" name="email" id="show_users_email" class="myinput" readonly="readonly" /> <label class="a">用户邮编：</label>
	<input type="text" name="ucode" id="show_users_ucode" class="myinput" readonly="readonly" /><br /><br />
	<label>联系方式：</label><input type="text" name="phone" id="show_users_phone" class="myinput" readonly="readonly" /> <label class="a">用户余额：</label>
	<input type="text" name="account" id="show_users_account"class="myinput" readonly="readonly" />
	</form>
	</div>

	<div id="update_users_userInfo" class="easyui-dialog" title="修改顾客信息" data-options="fit:true,iconCls:'icon-add',resizable:true,modal:true,closed:true">
		<form action="user_updateUserInfo.action" method="post" style="padding:20px;float:left;display:inline-block" enctype="multipart/form-data" ><br />
		<br />
		<label>用户头像：</label><fieldset id="update_user_pic">头像预览</fieldset>
		 <input type="file" name="uphotos" id="users_pic_update" onchange="previewMultipleImage(this,'update_user_pic')" /> <br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<label>用户昵称：</label> <input type="text" name="uname" id="update_users_name" class="myinput" required />
		<label class="a">用户生日：</label><input name="ubirthday" id="update_users_birth" class="easyui-datebox myinput" required /> <br />
		<br />
		<label>邮箱地址：</label> <input type="text" name="usemail" id="update_users_email" class="easyui-validatebox" data-options="required:true,validType:'email'" /> 
		<label class="a">用户邮编：</label><input type="text" name="ucode" id="update_users_ucode" /> <br />
		<br />
		<label>联系方式：</label> <input type="text" name="usphone" id="update_users_phone" />
	    <label class="a">用户余额：</label> <input type="text" name="usaccount" id="update_users_account" /> <br />
		<br />
		<!-- <input type="submit" value="确认修改" />  -->
		 <a href="javascript:updateUserInfo()" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a> 
	</form>
	
</div>

		<script>
			//用户详情
			function showUserInfoDetail(usid) {
				$("#show_userInfo").dialog("open");
				$
						.post(
								"user_findUserInfo.action",
								{
									usid : usid
								},
								function(data) {
									$("#show_users_name").val(data.uname);
									$("#show_users_ucode").val(data.ucode);
									$("#show_users_email").val(data.usemail);
									$("#show_users_phone").val(data.usphone);
									$("#show_users_account")
											.val(data.usaccount);
									$("#show_users_birth").val(data.ubirthdays);

									var pics = data.uphoto;
									if (pics == null) {
										var str = "<img src='../images/zanwu.jpg' width='100px' height='100px'>&nbsp;";
										$("#show_users_pic").html($(str));
									} else {
										var str = "<img src='../"+pics+"' width='100px' height='100px'>&nbsp;";
										$("#show_users_pic").html($(str));
									}
								}, "json");
			}

			//修改顾客信息
			function updateUserInfo() {
				var uname = $("#update_users_name").val();
				var usemail = $("#update_users_email").val();
				var ucode = $("#update_users_ucode").val();
				var usphone = $("#update_users_phone").val();
				var usaccount = $("#update_users_account").val();
				var ubirthday = $("#update_users_birth").datebox('getValue');
				$.ajaxFileUpload({
					url:"user_updateUserInfo.action",
					secureuri:false,
					fileElementId:"users_pic_update",
					dataType:"json",
					data:{
						usid : update_usid,
						uname : uname,
						usemail : usemail,
						ucode : ucode,
						usphone : usphone,
						usaccount : usaccount,
						ubirthday : ubirthday	
					},
					success:function(data,status){
						if(parseInt($.trim(data))==1){
							$.messager.show({
								title : '成功提示',
								msg : '顾客信息修改成功...',
								timeout : 2000,
								showType : 'slide'
							});
							$("#update_users_userInfo").dialog("close");
							$("#usreInfo_info").datagrid("reload");
							
						}else{
							$.messager.alert("失败提示", "顾客信息修改失败....", "error");
						}
					},
					error:function(data,status,e){
						$.messager.alert("错误提示","顾客信息修改错误...\n"+e,"error");
					}
				});
			}
			
		</script>