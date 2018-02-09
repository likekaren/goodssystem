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
<title>添加角色</title>
<script type="text/javascript">
	//初始化 tree 的数据
	$(function() {
		$('#home-tree').tree({
			url : '${baseurl}permission/getpermissiontree.action',
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
		//输入的 角色名称
		var roleName = $("#roleName").val()
		//输入的 角色描述
		var roleDescribe = $("#roleDescribe").val()
		if (roleName == "") {
			$.messager.alert('提示', '请输入角色名称', 'error');
			return false;
		}
		if (roleDescribe == "") {
			$.messager.alert('提示', '请输入角色描述', 'error');
			return false;
		}
		var length = nodesChecked.length;
		if (length === 0) {
			$.messager.alert('提示', '请选择权限信息', 'error');
			return false;
		}
		var arrPermission = new Array(length);
		for ( var i = 0; i < nodesChecked.length; i++) {
			//创建 permission 对象
			var permission = new Object();
			//给对象属性赋值
			permission["name"] = nodesChecked[i].text;
			permission["id"] = nodesChecked[i].id;
			//简单化处理
			permission["type"] = roleName;
			permission["url"] = roleDescribe;

			arrPermission.push(permission);
		}

		console.log(arrPermission);

		var params = JSON.stringify(arrPermission);

		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${baseurl}role/addrole_submit.action",
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
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>角色名称:</td>
					<td><input class="easyui-textbox" type="text" id="roleName"
						name="role_name" value="" style="height: 35px;"></input></td>

					<td>角色描述:</td>
					<td><input class="easyui-textbox" type="text"
						id="roleDescribe" name="role_describe" value=""
						style="height: 35px;"></input></td>

				</tr>

			</table>
			<ul id='home-tree'></ul>
			<a href="#" class="easyui-linkbutton"
				style="float: right; margin-right: 150px"
				data-options="iconCls:'icon-save'" onclick="submitPermission()">提交</a>
	</form>


</body>
</html>