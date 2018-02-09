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
<title>查看质检信息</title>
<script type="text/javascript">
	function qualitychecksave() {
		jquerySubByFId('qualitycheckform', qualitychecksave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function qualitychecksave_callback(data) {
		message_alert(data);
	}
</script>
</head>
<body>
	<form id="qualitycheckform" action="${baseurl}qualitycheck/editqualitychecksubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${qualitycheckCustom.id}" />
		<table cellpadding="5" align="center">
				<tr>
					<td>编号:</td>
					<td><input class="easyui-textbox" type="text" required readonly="readonly"
						name="qualitycheckCustom.checkcode" value="${qualitycheckCustom.checkcode}"
						style="height: 35px;" id="auto"></input></td>
					<td>名称:</td>
                    <td><input  type="text" id="name" required readonly="readonly"
                        name="qualitycheckCustom.name" value="${qualitycheckCustom.name}"
                        style="height: 28px;"></input></td>
                        <td>质检时间:</td>
					<td><input class="easyui-datetimebox" type="text" required readonly="readonly"
						name="qualitycheckCustom.checktime" value="${qualitycheckCustom.checktime}"
						style="width:200px;height: 35px;"></input></td>
                    </tr>
                    <tr>
					<td>质检结果:</td>
					<td>
					<input class="easyui-textbox" type="text" required readonly="readonly"
						name="qualitycheckCustom.conclusion" value="${qualitycheckCustom.conclusion}"
						style="height: 35px;" id="auto"></input>
					</td>
					<td>质检员:</td>
					<td><input class="easyui-textbox" type="text" readonly="readonly"
						name="qualitycheckCustom.inspector" value="${qualitycheckCustom.inspector}"
						style="height: 35px;"></input></td>
				</tr>
			</table>
			<table align="center">	
			<tr>
			
					<td>质检情况说明:</td>
					<td><textarea   style="width:800px;height: 100px;" readonly="readonly"
					name="qualitycheckCustom.note">${qualitycheckCustom.note}</textarea></td>
			</tr>
			</table >
	</form>
</body>
</html>