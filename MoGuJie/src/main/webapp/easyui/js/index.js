$(function(){

	$('#index_content').tabs('add',{
		title:'蘑菇街',
		selected:true,
		closable:false,
		href:"../back/mogujie.html"
	});
	$("#menu_tree").tree({
		onClick:function(node){
			var obj=$("#index_content");
			if(node.id=="fenlei_manager_one"){//说明是管理员信息管理
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","一级分类")){//则选中
					obj.tabs("select","一级分类");
				}else{
					obj.tabs('add',{
						title:"一级分类",
						closable:true,
						fit:true,
						href:"fenlei.html"
					});
				}

			}else if(node.id=="guanggao_manager"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","广告管理")){//则选中
					obj.tabs("select","广告管理");
				}else{
					obj.tabs('add',{
						title:"广告管理",
						closable:true,
						fit:true,
						href:"guanggao.html"
					});
				}

			}else if(node.id=="users_manager"){//顾客信息浏览
				if(obj.tabs("exists","顾客信息浏览")){//则选中
					obj.tabs("select","顾客信息浏览");
				}else{
					obj.tabs('add',{
						title:"顾客信息浏览",
						closable:true,
						fit:true,
						href:"../back/userInfo.jsp"
					});
				}
			}else if(node.id=="advertise_manager"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","广告位管理")){//则选中
					obj.tabs("select","广告位管理");
				}else{
					obj.tabs('add',{
						title:"广告位管理",
						closable:true,
						fit:true,
						href:"advertise.html"
					});
				}
			}else if(node.id=="userOrder_manager"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","订单信息")){//则选中
					obj.tabs("select","订单信息");
				}else{
					obj.tabs('add',{
						title:"订单信息",
						closable:true,
						fit:true,
						href:"order.html"
					});
				}
			}else if(node.id=="userOrders_manager"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","订单详细信息")){//则选中
					obj.tabs("select","订单详细信息");
				}else{
					obj.tabs('add',{
						title:"订单详细信息",
						closable:true,
						fit:true,
						href:"orders.html"
					});
				}
			}else if(node.id=="admin_manager"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","管理员信息管理")){//则选中
					obj.tabs("select","管理员信息管理");
				}else{
					obj.tabs('add',{
						title:"管理员信息管理",
						closable:true,
						fit:true,
						href:"../back/admin.jsp"
					});
				}

			}else if(node.id=="fenlei_manager_two"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","二级分类")){//则选中
					obj.tabs("select","二级分类");
				}else{
					obj.tabs('add',{
						title:"二级分类",
						closable:true,
						fit:true,
						href:"fenleitwo.html"
					});
				}
			}else if(node.id=="fenlei_manager_three"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","三级分类")){//则选中
					obj.tabs("select","三级分类");
				}else{
					obj.tabs('add',{
						title:"三级分类",
						closable:true,
						fit:true,
						href:"fenleithree.html"
					});
				}
			}else if(node.id=="product_manager"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","商品管理")){//则选中
					obj.tabs("select","商品管理");
				}else{
					obj.tabs('add',{
						title:"商品管理",
						closable:true,
						fit:true,
						href:"product.html"
					});
				}
			}else if(node.id=="products_manager"){
				//判断管理员信息管理界面是否打开
				if(obj.tabs("exists","商品详细管理")){//则选中
					obj.tabs("select","商品详细管理");
				}else{
					obj.tabs('add',{
						title:"商品详细管理",
						closable:true,
						fit:true,
						href:"products.html"
					});
				}
			}
//			else if(node.id=="active_manager"){
//				//判断管理员信息管理界面是否打开
//				if(obj.tabs("exists","活动管理")){//则选中
//					obj.tabs("select","活动管理");
//				}else{
//					obj.tabs('add',{
//						title:"活动管理",
//						closable:true,
//						fit:true,
//						href:"active.html"
//					});
//				}
//			}
		}
	});
});