<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<title>修改用户</title>
<script type="text/javascript">
	var storage = window.localStorage;
	var roleid = storage.getItem("editroleid");

	$(function() {
		$('#home-tree').tree(
				{
					url : '${baseurl}role/getrolepermissiontree.action?roleid='
							+ roleid,
					checkbox : true,
					onCheck : function(node, checked) {
						getCheckedNode();
					},
				});
	});

	//所有 选中的 节点的 数组
	var nodesChecked;
	function getCheckedNode() {
		nodesChecked = $('#home-tree').tree('getChecked'); // get checked nodes

	}
	//提交 修改后的权限
	function submitPermission() {

		var length = nodesChecked.length;

		if (length == 0) {
			$.messager.alert('提示', '请选择权限数据 !', 'info');
			return false;
		}

		var arrPermission = new Array(length);

		for (var i = 0; i < nodesChecked.length; i++) {
			//创建 permission 对象
			var permission = new Object();
			//给对象属性赋值
			permission["name"] = nodesChecked[i].text;
			permission["id"] = nodesChecked[i].id;
			permission["parentids"] = roleid;

			arrPermission.push(permission);
		}

		console.log(arrPermission);

		var params = JSON.stringify(arrPermission);

		$.ajax({
			type : "post",
			contentType : "application/json",
			url : "${baseurl}role/editrolepermission_submit.action",
			data : params,
			datatype : "json",
			cache : false,
			success : function(data, textStatus) {
				message_alert(data);
				var type = data.resultInfo.type;
				if (1 == type) {//如果登录成功，这里1秒后执行跳转到首页
					setTimeout("toqueryrole()", 1000);
				}
			},
			error : function(textStatus) {

			}
		});
	}

	//回 角色显示页面
	function toqueryrole() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}role/queryrole.action';
		} else if (parent.parent) {
			window.location = '${baseurl}role/queryrole.action';
		}
	}
</script>
</head>
<body>
	<form id="userform" action="${baseurl}user/editsysusersubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${sysroleCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<td>角色名称:</td>
				<td><span>${sysroleCustom.name}</span></td> &nbsp&nbsp&nbsp
				<td>描述:</td>
				<td><span>${sysroleCustom.describe}</span></td>

			</table>
			<ul id='home-tree'></ul>
			<a href="#" class="easyui-linkbutton"
				style="float: right; margin-right: 150px"
				data-options="iconCls:'icon-save'" onclick="submitPermission()">提交</a>
	</form>


</body>
</html>