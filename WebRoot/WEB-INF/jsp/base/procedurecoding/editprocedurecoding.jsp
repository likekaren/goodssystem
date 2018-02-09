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
	function procedurecodingsave() {
		jquerySubByFId('procedurecodingform', procedurecodingsave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function procedurecodingsave_callback(data) {
		message_alert(data);
	}
</script>
</head>
<body>
	<form id="procedurecodingform" action="${baseurl}procedurecoding/addprocedurecodingsubmit.action"
		method="post">
		<!-- 更新在制品的id -->
		<input   type="hidden" name="procedurecodingCustom.id" value="${procedurecodingCustom.id}"   />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>编码:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.materielcoding" value="${procedurecodingCustom.materielcoding}"
						style="height: 35px;" ></input></td>
					<td>名称编码:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.materielid" value="${procedurecodingCustom.materielid}"
						style="height: 35px;"></input></td>
					<td>工艺:</td>
					<td>
						<select  
						name="procedurecodingCustom.technicsname" value="${procedurecodingCustom.technicsname}"
						style="height: 35px; width:157px">
						<option>剪板</option>
						<option>冲压</option>
						<option>折弯</option>
						<option>机装</option>
						<option>电装</option>
						<option>总装</option>
						</select>
						</td>
				</tr>
				<tr>	
					<td>数量:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.countnum" value="${procedurecodingCustom.countnum}"
						style="height: 35px;"></input></td>
					<td>作业时间:</td>
					<td><input  type="text"  id="time"
						name="procedurecodingCustom.finishtime" value="${procedurecodingCustom.finishtime}"
						style="height: 35px;"></input></td>
					<td>作业人员:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.operator" value="${activeUser.username}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.remark" value="${procedurecodingCustom.remark}"
						style="height: 35px;"></input></td>
		 		</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="procedurecodingsave()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>