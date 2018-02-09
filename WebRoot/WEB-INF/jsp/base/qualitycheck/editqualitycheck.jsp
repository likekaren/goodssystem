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
<title>编辑质检信息</title>
<script type="text/javascript">
	function qualitychecksave() {
		jquerySubByFId('qualitycheckform', qualitychecksave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function qualitychecksave_callback(data) {
		console.log("返回结果" + data);
		message_alert(data);
		//如果成功，自动关闭
		if (data.resultInfo.type == '1') {
			//延迟1秒执行关闭方法
			setTimeout("toqueryqualitycheck()", 1000);
		}
	}
	//回 角色显示页面
	function toqueryqualitycheck() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}qualitycheck/queryqualitycheck.action';
		}
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
					<td><input class="easyui-datetimebox" type="text" required
						name="qualitycheckCustom.checktime" value="${qualitycheckCustom.checktime}"
						style="width:200px;height: 35px;"></input></td>
                     </tr>
                     <tr>
                     <td>质检结果:</td>
					<td><select required name="qualitycheckCustom.conclusion" style="width:162px; height: 35px;">
						  <option value="${list1}">${list1}</option>
						  <option value="${list2}">${list2}</option>
					</select>
					</td>	
					<td>质检员:</td>
					<td><input class="easyui-textbox" type="text"
						name="qualitycheckCustom.inspector" value="${qualitycheckCustom.inspector}"
						style="height: 35px;"></input></td>
				</tr>
			</table>
			<table align="center">	
			<tr>
					<td>质检情况说明:</td>
					<td><textarea   style="width:800px;height: 100px;"
					name="qualitycheckCustom.note">${qualitycheckCustom.note}</textarea></td>
			</tr>
			</table >
			<table align="center">
				<tr >
					<td colspan=4 align=right class=category ><a id="submitbtn"
						 class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="qualitychecksave()">提交</a> <a
						id="closebtn" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>