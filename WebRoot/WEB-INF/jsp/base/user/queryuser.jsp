<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css"
	href="${baseurl}/css/jquery.grid.css" />
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}css/skin_/table.css" />
<title>用户管理</title>
</head>
<body>
	<div id="main">

		<!-- html的静态布局 -->
		<form id="sysuserqueryForm">
			<!-- 查询条件 -->
			<TABLE class="table_search">
				<TBODY>
					<TR>
						<TD class="left">用户账号：</td>
						<td><INPUT type="text" name="sysUserCustom.usercode" /></TD>
						<TD class="left">用户名称：</TD>
						<td><INPUT type="text" name="sysUserCustom.username" /></TD>

						<TD class="left">部门名称：</TD>
						<td><INPUT type="text" name="sysUserCustom.department" /></TD>

						<TD class="left">用户工号：</TD>
						<td><INPUT type="text" name="sysUserCustom.jobnumber" /></TD>

						</select>
						</TD>
						<td>
							<div class="search-button">
								<input class="button" onclick="queryuser()" type="button"
									value="搜索一下" />
							</div>
				</TBODY>
			</TABLE>

			<!-- 查询列表 -->
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
				<div class="table">
					<div class="opt ue-clear">
						<!-- <span class="sortarea"> <span class="sort"> <label>排序：</label>
								<span class="name"> <i class="icon"></i> <span
									class="text">名称</span>
							</span> -->
						<!-- </span> <i class="list"></i> <i class="card"></i> -->
						</span> <span class="optarea"> <a href="javascript:adduser();"
							class="add"> <i class="icon"></i> <span class="text">添加</span>


								<!-- </a> <a href="javascript:;" class="delete"> <i class="icon"></i> <span
						class="text">删除</span> -->
						<!-- </a> <a href="javascript:;" class="statistics"> <i class="icon"></i>
								<span class="text">统计</span>
						</a> <a href="javascript:;" class="config"> <i class="icon"></i> <span
								class="text">配置</span>
						</a>
						</span> -->
					</div>
				</div>
				<table id="sysuserlist"></table>

				<TBODY>
					<TR>
						<TD>
							<table id="sysuserlist"></table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>



		<form id="sysuserdeleteform" action="${baseurl}user/deleteuser.action"
			method="post">
			<input type="hidden" id="delete_id" name="id" />
		</form>
</body>
<script type="text/javascript">
	
	//datagrid列定义
	var columns_v = [ [ {
		field : 'usercode',//对应json中的key
		title : '用户账号',
		width : 120
	}, {
		field : 'username',//对应json中的key
		title : '用户姓名 ',
		width : 120
	}, {
		field : 'age',//对应json中的key
		title : '年龄',
		width : 120
	}, {
		field : 'sex',//对应json中的key
		title : '性别',
		width : 120
	}, {
		field : 'jobnumber',//对应json中的key
		title : '工号',
		width : 120
	}, {
		field : 'worktype',//对应json中的key
		title : '工种',
		width : 120
	}, {
		field : 'positionaltitles',//对应json中的key
		title : '职称',
		width : 120
	},

	{
		field : 'department',//对应json中的key
		title : '部门',
		width : 120
	}, {
		field : 'tel',//对应json中的key
		title : '电话',
		width : 120
	}, {
		field : 'roleName',//对应json中的key
		title : '系统角色',
		width : 120
	}, {
		field : 'opt2',
		title : '修改',
		width : 120,
		formatter : function(value, row, index) {
			return "<a href=javascript:edituser('" + row.id + "')>修改</a>";
		}
	}, {
		field : 'opt1',
		title : '删除',
		width : 120,
		formatter : function(value, row, index) {
			return "<a href=javascript:deleteuser('" + row.id + "')>删除</a>";
		}
	} ] ];

	//datagrid 加载数据
	$(function() {
		$('#sysuserlist').datagrid({
			title : '用户查询',//数据列表标题
			nowrap : true,//单元格中的数据不换行，如果为true表示不换行，不换行情况下数据加载性能高，如果为false就是换行，换行数据加载性能不高
			striped : true,//条纹显示效果
			url : '${baseurl}user/queryuser_submit.action',//加载数据的连接，引连接请求过来是json数据
			idField : 'id',//此字段很重要，数据结果集的唯一约束(重要)，如果写错影响 获取当前选中行的方法执行
			loadMsg : '',
			columns : columns_v,
			pagination : true,//是否显示分页
			rownumbers : true,//是否显示行号
			pageList : [ 8, 15, 30 ],
		});
	});

	//查询方法
	function queryuser() {
		//datagrid的方法load方法要求传入json数据，最终将 json转成key/value数据传入action
		//将form表单数据提取出来，组成一个json
		var formdata = $("#sysuserqueryForm").serializeJson();
		$('#sysuserlist').datagrid('load', formdata);
	}

	//删除用户方法
	function deleteuser(id) {
		//第一个参数是提示信息，第二个参数，取消执行的函数指针，第三个参是，确定执行的函数指针
		_confirm('您确认删除吗？', null,
				function() {

					//将要删除的id赋值给deleteid，deleteid在sysuserdeleteform中
					$("#delete_id").val(id);
					//使用ajax的from提交执行删除
					//sysuserdeleteform：form的id，userdel_callback：删除回调函数，
					//第三个参数是url的参数
					//第四个参数是datatype，表示服务器返回的类型
					jquerySubByFId('sysuserdeleteform', userdel_callback, null,
							"json");
				});
	}
	//删除用户的回调
	function userdel_callback(data) {
		message_alert(data);
		//刷新 页面
		//在提交成功后重新加载 datagrid
		//取出提交结果
		var type = data.resultInfo.type;
		if (type == 1) {
			//成功结果
			//重新加载 datagrid
			queryuser();
		}
	}
	//修改用户
	function edituser(id) {
		//打开修改窗口
		createmodalwindow("修改用户信息", 800, 360,
				'${baseurl}user/edituser.action?id=' + id);
	}

	//添加用户
	function adduser() {
		//打开修改窗口
		createmodalwindow("添加用户信息", 800, 360, '${baseurl}user/adduser.action');
	}
</script>

</html>