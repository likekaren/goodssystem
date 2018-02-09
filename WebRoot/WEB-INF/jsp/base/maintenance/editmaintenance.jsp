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
<title>修改维修保养记录</title>
<script type="text/javascript">
	function maintenancesave() {
		jquerySubByFId('maintenanceform', maintenancesave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function maintenancesave_callback(data) {

		message_alert(data);
		//如果成功自动关闭
		if(data.resultInfo.type == "1"){
			// 设置延迟关闭
			setTimeout("close()",1000);
		}
		
	}
	
	//回显页面
	function close(){
		if(parent.parent.parent){
			parent.location="${baseurl}maintenance/querymaintenance.action";
		}
	}
</script>
</head>
<body>
	<form id="maintenanceform" action="${baseurl}maintenance/editmaintenancesubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${maintenanceCustom.id}" />
	<TBODY>
			<table cellpadding="5">
				<tr>
					<td>记录编号:</td>
					<td><input   type="text"  id="nid"
						name="maintenanceCustom.id" value="${maintenanceCustom.id}"
						style="height: 35px;" id="auto"></input></td>

					<td>名称:</td>
					<td>
					<select name="maintenanceCustom.toolname" style="width:162px; height: 35px;" >
							<option value="">----请选择名称---</option>
							<c:forEach items="${equList }" var="equ">
									<option  value="${equ.toolname }" >${equ.toolname }</option>
							</c:forEach>
					</select>
						</td>
						
					<td>规格型号:</td>
					<td>
					<select name="maintenanceCustom.specifications" style="width:162px; height: 35px;" >
							<option value="">----请选择名称---</option>
							<c:forEach items="${equList }" var="equ">
									<option  value="${equ.specifications }" >${equ.specifications }</option>
							</c:forEach>
					</select>
						</td>
				</tr>
				<tr>
					<td>维修保养时间:</td>
					<td><input   type="text" id="time"
						name="maintenanceCustom.mtime" value="${maintenanceCustom.mtime}"
						style="height: 35px;"></input></td>

					<td>维修人员:</td>
					<td><input class="easyui-textbox" type="text"
						name="maintenanceCustom.person" value="${maintenanceCustom.person}"
						style="height: 35px;"></input></td>
						
				</tr>
				</table>
				<table >
				<tr>
					<td>维修保养内容:</td>
					<td><textarea  type="text"
						name="maintenanceCustom.note" value="${maintenanceCustom.note}"
						style="width:670px;  height: 80px;">${maintenanceCustom.note}</textarea></td>
			</tr>
			</table>
				<table align="center">
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="maintenancesave()">保存</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>