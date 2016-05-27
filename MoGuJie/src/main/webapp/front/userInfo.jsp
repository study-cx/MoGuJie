<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script>
	//var uname="${loginUser.uname}";
	var uname = "lala";
	$(function() {
		$.post("userBean_findBasicInfo.action", {uname : uname}, function(data) {
			$("#name").val(data.uname);
			$("#birth").val(data.ubirthday);
			$("#ucode").val(data.ucode);
			$("#sheng").html(data.province);
			$("#shi").html(data.city);
			$("#email").val(data.usemail);
			$("#phone").val(data.usphone);
		}, "json");
	});
</script>

<div id="content_10" class="content" style="display: none;">
	<a name="content_10"></a>
	<p class="basic">
		<span>基本资料</span>
	</p>
	<form name="myform1">
		<ul class="basic1" id="basic1" name="basic1">
			<li>昵称：<input name="uname" type="text" value="秋日晨萱"
				onchange="updateName()" id="name"
				style="width: 150px; height: 25px;" />&nbsp;&nbsp;&nbsp;&nbsp; <span
				id="changname"></span></li>
			<li>性别：<input name="usex" type="radio" value="女" checked
				style="border: 0;"> 女&nbsp; <input name="sex" type="radio"
				value="男" style="border: 0;"> 男
			</li>
			<li>生日：<input name="ubirthday" type="text" id="birth"
				style="width: 150px; height: 25px;" /></li>
			<li class="uuu">邮政编码：<input name="ucode" id="ucode"
				style="width: 150px; height: 25px;"></li>
			<li class="place">所在地址： <select name="province" id="selProvince"
				onChange="changeCity( )">
					<option value="" id="sheng">请选择省份</option>
					<option value="湖南省">湖南省</option>
					<option value="广东省">广东省</option>
					<option value="北京省">北京省</option>
					<option value="山东省">山东省</option>
					<option value="吉林省">吉林省</option>
					<option value="甘肃省">甘肃省</option>
					<option value="河北省">河北省</option>
					<option value="湖北省">湖北省</option>
					<option value="辽宁省">辽宁省</option>
					<option value="黑龙江省">黑龙江省</option>
					<option value="青海省">青海省</option>
					<option value="河南省">河南省</option>
					<option value="云南省">云南省</option>
					<option value="江西省">江西省</option>
					<option value="浙江省">浙江省</option>
					<option value="福建省">福建省</option>
					<option value="台湾省">台湾省</option>
					<option value="海南省">海南省</option>
					<option value="陕西省">陕西省</option>
					<option value="山西省">山西省</option>
					<option value="四川省">四川省</option>
					<option value="贵州省">贵州省</option>
					<option value="安徽省">安徽省</option>
			</select> <select name="city" id="selCity">
					<option value="" id="shi">请选择市</option>
			</select>
			</li>
		</ul>
		<p class="bodyinfo">
			<span class="span1">联系方式</span>
		</p>
		<ul class="bodyinfo1">
			<li>邮箱：<input name="usemail" type="text" onblur="checkEmail()"
				id="email" class="easyui-validatebox"
				style="width: 150px; height: 25px;"
				data-options="required:true,validType:'email'" />&nbsp;&nbsp;<span
				id="checkemail"></span></li>
			<li class="phone">手机号：<input name="usphone" type="text"
				onblur="checkPhone()" id="phone" style="width: 150px; height: 25px;"
				class="easyui-validatebox" data-options="required:true" />&nbsp;&nbsp;<span
				id="checkphone"></span></li>
		</ul>
		<p id="button">
			<input id="b1" name="b1" type="button" value="确认修改"
				style="width: 120px; font-size: 20px; background: #F93;"
				onClick="updateBasicInfo()" />
		</p>
	</form>
</div>

<script>
	function updateBasicInfo() {
		var name = $("#name").val();
		var birth = $("#birth").val();
		var ucode = $("#ucode").val();
		var sheng = $("#selProvince").val();
		var shi = $("#selCity").val();
		var email = $("#email").val();
		var phone = $("#phone").val();

		$.post("", {
			name : name,
			birth : birth,
			ucode : ucode,
			sheng : sheng,
			shi : shi,
			email : email,
			phone : phone
		}, function(data) {
			if (data == 1) {
				alert("恭喜您，修改成功！");
			} else {
				alert("修改失败！");
			}
		});
	}
</script>