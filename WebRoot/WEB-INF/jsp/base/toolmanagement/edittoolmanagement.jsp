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
<title>修改用户</title>
<script type="text/javascript">
	function toolmanagementsave() {
		jquerySubByFId('toolmanagementform', toolmanagementsave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function toolmanagementsave_callback(data) {

		message_alert(data);
		//成功则延迟关闭
		if(data.resultInfo.type == "1"){
			setTimeout("close()",1000);
		}
		
	}
	//延迟
	function close(){
		if(parent.parent.parent){
			parent.location = "${baseurl}toolmanagement/querytoolmanagement.action";
		}
	}
</script>
</head>
<body>
	<form id="toolmanagementform" action="${baseurl}toolmanagement/edittoolmanagementsubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${toolmanagementCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>编号:</td>
					<td><input class="easyui-textbox" type="text"
						name="toolmanagementCustom.id" value="${toolmanagementCustom.id}"
						style="height: 35px;" id="auto"></input></td>

					<td>名称:</td>
					<td><input class="easyui-textbox" type="text"
						name="toolmanagementCustom.toolname" value="${toolmanagementCustom.toolname}"
						style="height: 35px;"></input></td>
					<td>规格型号:</td>
					<td><input class="easyui-textbox" type="text"
						name="toolmanagementCustom.specifications" value="${toolmanagementCustom.specifications}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>数量:</td>
					<td><input class="easyui-textbox" type="text"
						name="toolmanagementCustom.toolnumber" value="${toolmanagementCustom.toolnumber}"
						style="height: 35px;"></input></td>

					<td>生产厂家:</td>
					<td><input class="easyui-textbox" type="text"
						name="toolmanagementCustom.manufacturer" value="${toolmanagementCustom.manufacturer}"
						style="height: 35px;"></input></td>
		
					<td>备注:</td>
					<td><input class="easyui-textbox" type="text"
						name="toolmanagementCustom.remark" value="${toolmanagementCustom.remark}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="toolmanagementsave()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>