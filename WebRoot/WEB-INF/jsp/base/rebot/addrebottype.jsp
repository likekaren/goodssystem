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

<title>添加机器人类型</title>
<script type="text/javascript">
	function rebottypesave() {
		//准备使用jquery 提供的ajax Form提交方式
		//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
		//使用ajax form提交时，不用指定url，url就是form中定义的action
		//此种方式和原始的post方式差不多，只不过使用了ajax方式

		//第一个参数：form的id
		//第二个参数：rebottypesave_callback是回调函数，rebottypesave_callback当成一个方法的指针
		//第三个参数：传入的参数， 可以为空
		//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
		//根据form的id找到该form的action地址
		jquerySubByFId('rebottypeform', rebottypesave_callback, null, "json");

	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function rebottypesave_callback(data) {
		console.log("返回结果" + data)
		message_alert(data);
		//如果成功，自动关闭
		if (data.resultInfo.type == '1') {
			//延迟1秒执行关闭方法
			setTimeout("toqueryrebottype()", 1000);
		}
	}
	//回 角色显示页面
	function toqueryrebottype() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}rebottype/queryrebottype.action';
		}
	}
</script>
</head>
<body>
	<form id="rebottypeform" action="${baseurl}rebottype/addrebottypesubmit.action"
		method="post">
		<!-- 更新rebottype的id -->
		<input type="hidden" name="id" value="${rebottypeCustom.id}" />
			<table cellpadding="5">
				<tr>
					<td>名称:</td>
					<td><input required class="easyui-textbox" type="text"
						name="rebottypeCustom.name" value="${rebottypeCustom.name}"
						style="height: 35px;"></input></td>
					
					<td>型号:</td>
					<td><input required  class="easyui-textbox" type="text"
						name="rebottypeCustom.type" value="${rebottypeCustom.type}"
						style="height: 35px;"></input></td>
						
				</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="rebottypesave()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>