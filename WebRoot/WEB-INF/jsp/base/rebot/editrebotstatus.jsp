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

<title>修改机器人状态信息</title>
<script type="text/javascript">
function rebotstatussave() {
	//准备使用jquery 提供的ajax Form提交方式
	//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
	//使用ajax form提交时，不用指定url，url就是form中定义的action
	//此种方式和原始的post方式差不多，只不过使用了ajax方式

	//第一个参数：form的id
	//第二个参数：rebotstatussave_callback是回调函数，rebotstatussave_callback当成一个方法的指针
	//第三个参数：传入的参数， 可以为空
	//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
	//根据form的id找到该form的action地址
	jquerySubByFId('rebotstatusform', rebotstatussave_callback, null, "json");

}
//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
function rebotstatussave_callback(data) {
	console.log("返回结果" + data)
	message_alert(data);
	//如果成功，自动关闭
	if (data.resultInfo.type == '1') {
		//延迟1秒执行关闭方法
		setTimeout("toqueryrebotstatus()", 1000);
	}
}
//回 角色显示页面
function toqueryrebotstatus() {
	if (parent.parent.parent) {
		//让第二层页面执行跳转
		parent.location = '${baseurl}rebotstatus/queryrebotstatus.action';
	}
}
</script>
</head>
<body>
	<form id="rebotstatusform" action="${baseurl}rebotstatus/editrebotstatussubmit.action"
		method="post" name="form">
		<!-- 更新在制品的id -->
		<input type="hidden" name="rebotstatusCustom.id" value="${rebotstatusCustom.id}" />
			<table cellpadding="5" align="center">
				<tr>
					<TD class="left">机器人：</td>
							<td><input required  class="easyui-textbox" type="text"  readonly="readonly"
						name="rebottypeCustom.type" value="${rebotstatusCustom.name}"
						style="height: 35px;"></input></td>
						<TD class="left">部件：</TD>
						<td><input required  class="easyui-textbox" type="text"  readonly="readonly"
						name="rebottypeCustom.type" value="${rebotstatusCustom.unitname}"
						style="height: 35px;"></input></td>
					<TD class="left">时间：</TD>
					<td><input id="time"  type="text" required 
						name="rebotstatusCustom.time" value="${rebotstatusCustom.time}"
						style="width:200px;height: 35px;"></input></td>
                  </tr>
                  <tr>
					<td>检测结果:</td>
					<td><select required name="rebotstatusCustom.status" style="width:162px; height: 35px;">
						  <option value="${list1}">${list1}</option>
						  <option value="${list2}">${list2}</option>
					</select>
					</td>
						
					<td>检测人:</td>
					<td><input class="easyui-textbox" type="text"
						name="rebotstatusCustom.operator" value="${rebotstatusCustom.operator}"
						style="height: 35px;"></input></td>
				</tr>
			</table>
			<table align="center">	
			<tr>
				<td>检测情况说明:</td>
					<td><textarea   style="width:800px;height: 100px;"
					name="rebotstatusCustom.note">${rebotstatusCustom.note}</textarea></td>
			</tr>
			</table >
			<table align="center">
				<tr >
					<td colspan=4 align=right class=category ><a id="submitbtn"
						 class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="rebotstatussave()">保存</a> <a
						id="closebtn" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>