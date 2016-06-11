<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div id="show_news_info_find" style="width:100%,text-align:left"> 
	<span>商品类型编号: </span><input type="text" name="categoryidtwo" id="categoryidtwo"/>
	<span>一级商品类型: </span><input type="text" name="categoryTypeone" id="categoryTypeone"/>
	<span>二级商品类型: </span><input type="text" name="categoryTypetwo" id="categoryTypetwo"/>
	&nbsp;&nbsp;<a href="javascript:findCategorytwo()" class="easyui-linkbutton" data-options="iconCls:'icon-add'">查询</a>
</div>
<table id="typetwo_info" ></table>
<script>
	var datagrid;
	var editRow=undefined;
	var op;
	var flag;
	var statusObj=[{sid:0,sname:'不可用'},{sid:1,sname:'可用'}];
	var tt=new Array();
	$.post("categoryone_getAllTypeone",function(data){
		for(var i=0;i<data.length;i++){
		    t1=new Object();
			t1.sid=parseInt(data[i].categoryidone);
			t1.sname=data[i].categorytypeone;
			tt.push(t1);  
		}
		
			
		datagrid=$('#typetwo_info').datagrid({   
	    url:'categorytwo_getPageTypeInfo',
	    fitColumns:true,
	    striped:true,
	    loadMsg:"数据加载中...",
	    pagination:true,
	    rownumbers:true,
	    sortName:'categoryidtwo',
	    sortOrder:'asc',
	    remoteSort:false,
	    columns:[[ 
			{field:'categoryidtwos',title:'选择',width:100,align:'center',checkbox:true}, 
	        {field:'categoryidtwo',title:'商品类型编号',width:100,align:'center',sortable:true},
	        {field:'categoryidone',title:'一级商品类型',width:100,align:'center',
	        	formatter:function(value,row,index){
	        		for(var i=0;i<tt.length;i++){
	        			if(tt[i].sid==value){
	        				return tt[i].sname;
	        			}
	        		} 
	        		return value;
	        	},editor:{
	        		type:'combobox',
	        		options:{
			        	required:true,
			        	valueField:'sid',
			        	textField:'sname',
			        	data:tt}
	        	}	
	        },  
		
	        {field:'categorytypetwo',title:'二级商品类型',width:100,align:'center',editor:{type:"text",options:{required:true}}},
	        {field:'obligateone',title:'状态',width:100,align:'center',editor:{type:'combobox',options:{
	        	required:true,valueField:'sid',textField:'sname',data:statusObj}},
	        	formatter:function( value,row,index){
	        		for(var i=0;i<statusObj.length;i++){
	        			if(statusObj[i].sid==value){
	        				return statusObj[i].sname;
	        			}
	        		}
	        		 return value;
	        	}	
	        } 
	    ]],
	    toolbar:[{
	    	text:"添加",
			iconCls:'icon-add',
			handler:function(){
				op="categorytwo_addTypeInfo"; //当前的操作
				flag="添加";
				//先判断有没有正在编辑的行
				if(editRow!=undefined){  //说明有行正在被编辑，则还原当前的修改
					datagrid.datagrid("rejectChanges"); //回滚自创建以来或自上次调用AcceptChanges，所有的变化数据。
					datagrid.datagrid("endEdit",editRow); //关闭当前正在编辑的行
					editRow=undefined;
				}else{ //在表格的最前面添加一行
					datagrid.datagrid("insertRow",{index:0,row:{}});
					
					//打开编辑器
					datagrid.datagrid("beginEdit",0);
					editRow=0;//记录当前正在被编辑的行
				}
			}
		},{
	    	text:"修改",
			iconCls:'icon-edit',
			handler:function(){
				//获取要修改的行
				var rows=datagrid.datagrid("getChecked")[0];
				if(rows==undefined){
					$.messager.show({title:'温馨提示',msg:'请选择您要修改的的数据...',timeout:2000,showType:'slide'});	
				}else{
					op="categorytwo_updateTypeInfo";
					flag="修改";
					if(editRow!=undefined){  //说明有行正在被编辑，则还原当前的修改
						datagrid.datagrid("rejectChanges"); //回滚自创建以来或自上次调用AcceptChanges，所有的变化数据。
						datagrid.datagrid("endEdit",editRow); //关闭当前正在编辑的行
						editRow=undefined;
					}else{ 
						//获取当前选择行的索引
						var index=datagrid.datagrid("getRowIndex",rows);
					
						datagrid.datagrid("updateRow",{index:index,row:rows});
						
						//打开编辑器
						datagrid.datagrid("beginEdit",index);
						editRow=index;//记录当前正在被编辑的行
					}
				}
			}
		},{
	    	text:"删除",
			iconCls:'icon-remove',
			handler:function(){
				//获取所有被选中的行
				var rows=datagrid.datagrid("getChecked");
				if(rows.length<=0){ //没有选择任何一行
					$.messager.show({
						title:'温馨提示',
						msg:'请选择您要删除的数据...',
						timeout:2000,
						showType:'slide'
					});
				}else{
					$.messager.confirm('信息确认', '您确定更要删除选中的数据吗?', function(r){
						if (r){
							var categoryidtwos="";
							for(var i=0;i<rows.length-1;i++){
								categoryidtwos+=rows[i].categoryidtwo+",";
							}
							categoryidtwos+=rows[i].categoryidtwo;
							
							//将要删除aid发送到服务器
							$.post("categorytwo_delTypeInfo",{categoryidtwos:categoryidtwos},function(data){
								if(data==1){ 
									$.messager.show({
										title:'删除提示',
										msg:'类型信息删除成功...',
										timeout:2000,
										showType:'slide'
									});
									datagrid.datagrid("reload"); //重新加载数据一次
								}else{
									$.messager.alert('失败提示','类型信息删除失败...','error');
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
				datagrid.datagrid("endEdit",editRow); //关闭当前正在编辑的行
				
				//获取当前被修改的数据
				var rows=datagrid.datagrid("getChanges")[0];
				if(rows==undefined){
					datagrid.datagrid("rejectChanges"); //回滚自创建以来或自上次调用AcceptChanges，所有的变化数据。
					datagrid.datagrid("unselectAll");
					editRow=undefined;
				}else{
					
					$.post(op,rows,function(data){
						data=parseInt( $.trim(data));
						if(data==1){ //添加成功
							$.messager.show({
								title:'成功提示',
								msg:'类型信息'+flag+'成功...',
								timeout:2000,
								showType:'slide'
							});
						}else{
							$.messager.alert('失败提示','类型信息'+flag+'失败...','error');
						}
						rows=null;
						datagrid.datagrid("reload"); //重新加载数据一次
						editRow=undefined;
						datagrid.datagrid("rejectChanges"); //回滚自创建以来或自上次调用AcceptChanges，所有的变化数据。
						datagrid.datagrid("unselectAll");
					});
				}
			}
		},{
			text:'撤销',
			iconCls:'icon-redo',
			handler:function(){
				datagrid.datagrid("rejectChanges"); //回滚自创建以来或自上次调用AcceptChanges，所有的变化数据。
				datagrid.datagrid("endEdit",editRow);
				editRow=undefined;
			}
		}]
	});  
	},"json"); 


function findCategorytwo(){
	var categoryidtwo=$.trim( $("#categoryidtwo").val() );
	var categoryTypeone=$.trim($("#categoryTypeone").val());
	var categoryTypetwo=$.trim($("#categoryTypetwo").val());
	
	$('#type_info').datagrid({   
	    url:'../typeTwoServlet',  
		queryParams:{op:"findCategorytwo",categoryidtwo:categoryidtwo,categoryTypeone:categoryTypeone,categoryTypetwo:categoryTypetwo}
	});
}
</script>



