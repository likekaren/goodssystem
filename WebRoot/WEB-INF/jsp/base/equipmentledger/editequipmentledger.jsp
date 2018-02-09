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
<title>修改设备台账</title>
<script type="text/javascript">
	function equipmentledgersave() {
		jquerySubByFId('equipmentledgerform', equipmentledgersave_callback, null, "json");
	}
	
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function equipmentledgersave_callback(data) {

		message_alert(data);
		//如果成功自动关闭
		if (data.resultInfo.type == "1") {
			// 设置延迟关闭
			setTimeout("close()",1000);
		}
	}
	
	//回显页面
	function close(){
		if(parent.parent.parent){
			parent.location = '${baseurl}equipmentledger/queryequipmentledger.action';
		}
	}
	
</script>
</head>
<body>
	<form id="equipmentledgerform" action="${baseurl}equipmentledger/editequipmentledgersubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${equipmentledgerCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>编号:</td>
					<td><input class="easyui-textbox" type="text"
						name="equipmentledgerCustom.id" value="${equipmentledgerCustom.id}"
						style="height: 35px;" id="auto"></input></td>

					<td>名称:</td>
					<td><input class="easyui-textbox" type="text"
						name="equipmentledgerCustom.toolname" value="${equipmentledgerCustom.toolname}"
						style="height: 35px;"></input></td>
					<td>规格型号:</td>
					<td><input class="easyui-textbox" type="text"
						name="equipmentledgerCustom.specifications" value="${equipmentledgerCustom.specifications}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>数量:</td>
					<td><input class="easyui-textbox" type="text"
						name="equipmentledgerCustom.toolnumber" value="${equipmentledgerCustom.toolnumber}"
						style="height: 35px;"></input></td>

					<td>生产厂家:</td>
					<td><input class="easyui-textbox" type="text"
						name="equipmentledgerCustom.manufacturer" value="${equipmentledgerCustom.manufacturer}"
						style="height: 35px;"></input></td>
		
					<td>购买日期:</td>
					<td><input class="easyui-textbox" type="text"
						name="equipmentledgerCustom.purchasedate" value="${equipmentledgerCustom.purchasedate}"
						style="height: 35px;"></input></td>
		 		</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="equipmentledgersave()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>