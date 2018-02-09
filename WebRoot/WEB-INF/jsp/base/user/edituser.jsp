<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK rel="stylesheet" type="text/css"
	href="${baseurl}js/easyui/styles/default.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<title>修改用户</title>
<script type="text/javascript">
	function sysusersave() {
		jquerySubByFId('userform', sysusersave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function sysusersave_callback(data) {
		console.log("返回结果" + data)
		message_alert(data);
		//如果成功，自动关闭
		if (data.resultInfo.type == '1') {
			//延迟1秒执行关闭方法
			setTimeout("toqueryuser()", 1000);
		}

	}

	//回 角色显示页面
	function toqueryuser() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}user/queryuser.action';
		}
	}
</script>
</head>
<body>
	<form id="userform" action="${baseurl}user/edituser_submit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${sysUserCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>账号:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.usercode" value="${sysUserCustom.usercode}"
						style="height: 35px;"></input></td>

					<td>姓名:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.username" value="${sysUserCustom.username}"
						style="height: 35px;"></input></td>
					<td>登录密码:</td>
					<td><input type="password" name="sysUserCustom.password"
						placeholder="若修改则在此处填写" style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.age" value="${sysUserCustom.age}"
						style="height: 35px;"></input></td>

					<td>性别:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.sex" value="${sysUserCustom.sex}"
						style="height: 35px;"></input></td>
					<td>工号:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.jobnumber" value="${sysUserCustom.jobnumber}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.tel" value="${sysUserCustom.tel}"
						style="height: 35px;"></input></td>

					<td>部门:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.department"
						value="${sysUserCustom.department}" style="height: 35px;"></input></td>

					<td>工种:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.worktype" value="${sysUserCustom.worktype}"
						style="height: 35px;"></input></td>
				</tr>

				<tr>
					<td>职称:</td>
					<td><input class="easyui-textbox" type="text"
						name="sysUserCustom.positionaltitles"
						value="${sysUserCustom.positionaltitles}" style="height: 35px;"></input></td>

					<td>系统角色:</td>
					<td><select name="sysUserCustom.roleName">
							<option value="">--选择角色--</option>
							<c:forEach items="${sysUserCustom.roleList}" var="roleList">
								<option value="${roleList.name }">${roleList.name }</option>
							</c:forEach>
					</select></TD>

				</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="sysusersave()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>