<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script>
	$.post("userOrderServlet?d="+new Date(),{op:"findAllOrder"},function(data){
		var str="";
		$.each(data.orderInfo,function(index,item){
			var status;
			if(item.OSTATUS==2){
				status="待评价";
			}else if(item.OSTATUS==1){
				status="未付款";
			}
			str+="<table class='dingdanInfo'>";
			str+="<tr class='ding1'>";
			str+="<td>订单编号："+item.ORDERID+"</td>";
			str+="<td id='dtime'>订单时间："+item.DATETIME+"</td>";
			str+="<td id='dhouse'><a>店铺：yoyo吾裳</a></td>";
			str+="<td id='contact'><a>联系我们</a></td>";
			str+="</tr>";
			str+="<tr class='dingdan1' id='dingdan1'>";
			str+="<td><img src='"+item.PROPHOTO+"' style='width:100px;height:100px;'/></td>";
			str+="<td>";
			str+="<p><a>"+item.PROCONTENT+"</a><a>[交易快照]</a></p>";
			str+="<p>颜色："+item.COLOR+"</p>";
			str+="<p>尺码："+item.PSIZE+"</p>";
			str+="</td>";
			str+="<td>";
			str+="<p id='xprice'>"+item.PROPRICE+"</p>";
			str+="</td>";
			str+="<td id='number'>"+item.ONUMBER+"</li>";
			str+="<td id='youf'>";
			str+="<p class='n1'>￥"+item.BUYPRICE+"</p>";
			str+="<p class='n2'>(包邮)</p>";
			str+="</td>";
			str+="<td id='xiang'>";
			str+="<p class='x1'>"+status+"</p>";
			str+="<p class='x2'><a>订单详情</a></p>";
			str+="</td>";
			str+="<td id='del'>";
			str+="<a href='javascript:deleteInfo("+item.ORDERID+")'>删除订单</a>";
			str+="</td>";
			str+="</tr>";
			str+="</table>";
		});
		$("#content_1").append($(str));
	},"json");
</script>
 <div id="content_1" class="content" style="display:block;">
    	<table class="title">
        	<tr>
        	<td class="shop">商品</td>
            <td class="tprice">单价(元)</td>
            <td class="tnum">数量</td>
            <td class="tfu">实付款(元)</td>
            <td class="statue">交易状态</td>
            <td class="caozuo">操作</td>
            </tr>
        </table>
       
    </div>