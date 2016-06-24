<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<table id="admin_info" data-options="fit:true"></table>
<script>
$(function(){
	var datagrid;
	var editRow=undefined;
	var op;
	var flag;
	
	datagrid=$('#admin_info').datagrid({   
	    url:'admin_getPageAdminInfo.action',  
	    fitColumns:true,
	    striped:true,
	    loadMsg:"数据加载中...",
	    pagination:true,
	    rownumbers:true,
	    sortName:'aid',
	    sortOrder:'asc',
	    remoteSort:false,
	    columns:[[   
	        {field:'aids',title:'管理员编号',width:100,align:'center',checkbox:true}, 
	        {field:'aid',title:'管理员编号',width:100,align:'center',sortable:true},   
	        {field:'aname',title:'管理员姓名',width:100,align:'center',editor:{type:"text",options:{required:true}}},
	        {field:'apwd',title:'管理员密码',width:100,align:'center',editor:{type:"text",options:{required:true}}}, 
	        {field:'aemail',title:'管理员邮箱',width:100,align:'center',editor:{type:"text",options:{required:true}}} 
	    ]], 
	    toolbar:[
	    {
	    	text:"添加",
			iconCls:'icon-add',
			handler:function(){
				op="admin_addAdminInfo.action";//当前行的操作
				//先判断有没有正在编辑的行
				flag="添加";
				if(editRow!=undefined){//说明有行正在被编辑，则还原当前的修改
					datagrid.datagrid("rejectChanges");//回滚自创建以来或上次调用AcceptChanges,所有的变化的数据
					datagrid.datagrid("endEdit",editRow);//关闭当前正在编辑的行
					editRow=undefined;
				}else{//在表格的最前面添加一行
					datagrid.datagrid("insertRow",{index:0,row:{}});
					//打开编辑器
					datagrid.datagrid("beginEdit",0);
					editRow=0;//记录当前正在被编辑的行
				}
			}
		},{
	    	text:"删除",
				iconCls:'icon-remove',
				handler:function(){
					//获取所有被选中的行
					var rows=datagrid.datagrid("getChecked");
					if(rows.length<=0){
						$.messager.show({
							title:'温馨提示',
							msg:'请选择您要删除的数据...',
							timeout:2000,
							showType:'slide'
						});
					}else{
						$.messager.confirm('信息确认', '您确定要删除选中的数据吗?', function(r){
							if (r){
								var aids="";
								for(var i=0;i<rows.length-1;i++){
									aids+=rows[i].aid+",";
								}
								aids+=rows[i].aid;
								//将要删除的aid发送到服务器
								$.post("admin_del.action",{aids:aids},function(data){
									if(data>0){//删除成功
										$.messager.show({
											title:'删除提示',
											msg:'管理员信息删除成功...',
											timeout:2000,
											showType:'slide'
										});
										datagrid.datagrid("reload");//数据重新加载一次
									}else{//添加失败
										$.messager.alert('失败提示','管理员信息删除失败!','error');
									}
								});
							}
						});
					}
				}
		},{
			text:"保存",
			iconCls:'icon-save',
			handler:function(){
				datagrid.datagrid("endEdit",editRow);//关闭当前正在编辑的行
				
				//获取当前被修改的数据
				var rows=datagrid.datagrid("getChanges")[0];
				if(rows==undefined){
					datagrid.datagrid("rejectChanges");//回滚自创建以来或上次调用AcceptChanges,所有的变化的数据
					datagrid.datagrid("unselectAll");
					editRow=undefined;
				}else{
					$.post(op,rows,function(data){
						data=parseInt($.trim(data));
						if(data==1){//添加成功
							$.messager.show({
								title:'成功提示',
								msg:'管理员信息'+flag+'成功...',
								timeout:2000,
								showType:'slide'
							});
						}else{//添加失败
							$.messager.alert('失败提示','管理员信息'+flag+'失败!','error');
						}
						rows=null;
						datagrid.datagrid("reload");//数据重新加载一次
						editRow=undefined;
						datagrid.datagrid("rejectChanges");//回滚自创建以来或上次调用AcceptChanges,所有的变化的数据
						datagrid.datagrid("unselectAll");
					});
				}
			}
		},{
			text:"撤销",
			iconCls:'icon-redo',
			handler:function(){
				datagrid.datagrid("rejectChanges");//回滚自创建以来或上次调用AcceptChanges,所有的变化的数据
				datagrid.datagrid("endEdit",editRow);//关闭当前正在编辑的行
				editRow=undefined;
			}
		}]
	}); 
});
</script>