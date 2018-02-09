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

<title>添加工具管理</title>
<script type="text/javascript">
	function toolmanagementsave() {
		//准备使用jquery 提供的ajax Form提交方式
		//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
		//使用ajax form提交时，不用指定url，url就是form中定义的action
		//此种方式和原始的post方式差不多，只不过使用了ajax方式

		//第一个参数：form的id
		//第二个参数：toolmanagementsave_callback是回调函数，toolmanagementsave_callback当成一个方法的指针
		//第三个参数：传入的参数， 可以为空
		//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
		//根据form的id找到该form的action地址
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
	
	//点击弹窗聚焦
	 window.onload = function (){
			var autoblur = 	document.getElementById("auto");
			autoblur.focus();
			
	}
	
</script>
</head>
<body>
	<form id="toolmanagementform" action="${baseurl}toolmanagement/addtoolmanagementsubmit.action"
		method="post">
		<!-- 更新id -->
		<input type="hidden" name="id" value="${toolmanagementCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>工具编号:</td>
					<td><input class="easyui-textbox" required type="text"
						name="toolmanagementCustom.id" value="${toolmanagementCustom.id}"
						style="height: 35px;" id="auto"></input></td>

					<td>名称:</td>
					<td><input class="easyui-textbox" required type="text"
						name="toolmanagementCustom.toolname" value="${toolmanagementCustom.toolname}"
						style="height: 35px;"></input></td>
					<td>规格型号:</td>
					<td><input class="easyui-textbox" required type="text"
						name="toolmanagementCustom.specifications" value="${toolmanagementCustom.specifications}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>数量:</td>
					<td><input class="easyui-textbox" required type="text"
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
						iconCls="icon-ok" href="#" onclick="toolmanagementsave()">保存</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>