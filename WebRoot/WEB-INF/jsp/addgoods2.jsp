<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">

<title>添加设备台账</title>
<script type="text/javascript">
	function goodssave() {
		//准备使用jquery 提供的ajax Form提交方式
		//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
		//使用ajax form提交时，不用指定url，url就是form中定义的action
		//此种方式和原始的post方式差不多，只不过使用了ajax方式

		//第一个参数：form的id
		//第二个参数：goodssave_callback是回调函数，goodssave_callback当成一个方法的指针
		//第三个参数：传入的参数， 可以为空
		//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
		//根据form的id找到该form的action地址
		jquerySubByFId('itemform', goodssave_callback, null, "json");

	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function goodssave_callback(data) {

		message_alert(data);
		//如果成功自动关闭
		
	}
	
	//回显页面
	function close(){
		if(parent.parent.parent){
			parent.location = "${baseurl}goodssystem/querygoods.action";
		}
	}
	
	
	//点击弹窗聚焦
	 window.onload = function (){
			var autoblur = 	document.getElementById("auto");
			autoblur.focus();
			
	}
	
</script>
</head>
<body>
	<form id="itemform" action="${baseurl}goodssystem/addgoodsSubmit.action"
		method="post">
		<!-- 更新在制品的id -->
		<input type="hidden" name="id" value="${goods.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>商品名称:</td>
					<td><input class="easyui-textbox" type="text" required
						name="goodsname" value="${goods.goodsname}"
						style="height: 35px;"></input></td>

					<td>管理员编号:</td>
					<td><input class="easyui-textbox" type="text" required
						name="userid" value="${goods.userid}"
						style="height: 35px;"></input></td>
					<td>仓库编号:</td>
					<td><input class="easyui-textbox" type="text"  required
						name="depotid" value="${goods.depotid}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>区域编号:</td>
					<td><input class="easyui-textbox" type="text"  required
						name="areaid" value="${goods.areaid}"
						style="height: 35px;"></input></td>

					<td>货架编号:</td>
					<td><input class="easyui-textbox" type="text" required
						name="zoneid" value="${goods.zoneid}"
						style="height: 35px;"></input></td>
		
					<td>商品数量:</td>
					<td><input class="easyui-textbox" type="text" required
						name="goodsnum" value="${goods.goodsnum}"
						style="height: 35px;"></input></td>
		 		</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="goodssave()">保存</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>