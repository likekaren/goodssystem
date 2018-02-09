<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK rel="stylesheet" type="text/css"
	href="${baseurl}js/easyui/styles/default.css">
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<title>修改派工单</title>
<script type="text/javascript">
	function orderdecomposesave() {
		jquerySubByFId('orderdecomposeform', orderdecomposesave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function orderdecomposesave_callback(data) {
		console.log("返回结果" + data);
		message_alert(data);
		//如果成功，自动关闭
		if (data.resultInfo.type == '1') {
			//延迟1秒执行关闭方法
			setTimeout("toqueryorderdecompose()", 1000);
		}
	}
	//回 角色显示页面
	function toqueryorderdecompose() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}decomposeorders/querydecomposeorders.action';
		}
	}
</script>
</head>
<body>
	<form id="orderdecomposeform" action="${baseurl}decomposeorders/editorderdecomposesubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${orderdecomposeCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>名称:</td>
					<td><input class="easyui-textbox" type="text" readonly="readonly"
						 value="${unitname}"
						style="height: 35px;"></input></td>
					<td>柜体类型:</td>
						<td><input class="easyui-textbox"  required  readonly="readonly"
						 value="${cname}"
						style="width:200px; height:35px;"></input></td>

					<td>所属订单:</td>
						<td><input class="easyui-textbox"  required readonly="readonly"
						 value="${ordernum}"
						style="width:200px; height:35px;"></input></td>
					
				</tr>
			
				<tr>
					<td>数量:</td>
					<td><input class="easyui-textbox" type="text" readonly="readonly"
						name="orderdecomposeCustom.odnumber" value="${orderdecomposeCustom.odnumber}"
						style="height: 35px;"></input></td>
					<td>生产日期:</td>
						<td><input class="easyui-datetimebox"  required 
						name="orderdecomposeCustom.begintime" value="${orderdecomposeCustom.begintime}"
						style="width:200px; height:35px;"></input></td>

					<td>结束时日期:</td>
						<td><input class="easyui-datetimebox"  required 
						name="orderdecomposeCustom.endtime" value="${orderdecomposeCustom.endtime}"
						style="width:200px; height:35px;"></input></td>
					
				</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="orderdecomposesave()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>