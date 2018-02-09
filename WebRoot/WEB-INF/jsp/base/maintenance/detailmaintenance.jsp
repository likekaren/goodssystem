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
<title>维修保养记录详情</title>
<script type="text/javascript">
	function maintenancesave() {
		jquerySubByFId('maintenanceform', maintenancesave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function maintenancesave_callback(data) {
		message_alert(data);
	}
</script>
</head>
<body>
	<form id="maintenanceform" action="${baseurl}maintenance/editmaintenancesubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${maintenanceCustom.id}" />
	<TBODY >
			<table cellpadding="5">
				<tr>
					<td>记录编号:</td>
					<td><input   type="text"  id="nid" 	readonly="readonly"
						name="maintenanceCustom.id" value="${maintenanceCustom.id}"
						style="height: 35px;" id="auto"></input></td>

					<td>名称:</td>
					<td>
					<input   type="text"  id="nid" 	readonly="readonly"
						name="maintenanceCustom.toolname" value="${maintenanceCustom.toolname}"
						style="height: 35px;" id="auto"></input>
						</td>
						
					<td>规格型号:</td>
					<td>
					<input   type="text"  id="nid" 	readonly="readonly"
						name="maintenanceCustom.specifications" value="${maintenanceCustom.specifications}"
						style="height: 35px;" id="auto"></input>
						</td>
				</tr>
				<tr>
					<td>维修保养时间:</td>
					<td><input   type="text" id="time"		readonly="readonly"
						name="maintenanceCustom.mtime" value="${maintenanceCustom.mtime}"
						style="height: 35px;"></input></td>

					<td>维修人员:</td>
					<td><input class="easyui-textbox" type="text"	readonly="readonly"
						name="maintenanceCustom.person" value="${maintenanceCustom.person}"
						style="height: 35px;"></input></td>
						
				</tr>
				</table>
				<table >
				<tr>
					<td>维修保养内容:</td>
					<td><textarea  type="text"
						name="maintenanceCustom.note" value="${maintenanceCustom.note}" readonly="readonly"
						style="width:670px;  height: 80px;">${maintenanceCustom.note}</textarea></td>
			</tr>
			</table>
				
	</form>
</body>
</html>