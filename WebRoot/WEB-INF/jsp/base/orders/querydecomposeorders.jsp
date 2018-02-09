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
<link rel="stylesheet" type="text/css"
	href="${baseurl}css/skin_/table.css" />
<title>派工单管理</title>
</head>
<body>
	<div id="main">
				<table id="ordersrlist"></table>

		<form id="orderdecomposedeleteform"
			action="${baseurl}decomposeorders/deletedecomposeorders.action" method="post">
			<input type="hidden" id="delete_id" name="id" />
		</form>
		
		<!-- 派工单发布操作 -->
		<form id="publishworkorderform"
			action="${baseurl}decomposeorders/publishworkorder.action" method="post">
			<input type="hidden" id="decompose_id" name="id" />
		</form>
</body>
<script type="text/javascript">
	//datagrid列定义
	var columns_v = [ [ {
		field : 'unitname',//对应json中的key
		title : '名称',
		width : 120
	}, {
		field : 'cname',//对应json中的key
		title : '柜体类型',
		width : 120
	}, {
		field : 'ordernum',//对应json中的key
		title : '所属订单',
		width : 120
	},{
		field : 'odnumber',//对应json中的key
		title : '生产数量',
		width : 60
	},{
		field : 'tasktime',//对应json中的key
		title : '单件(分钟)',
		width : 80
	},{
		field : 'totaltime',//对应json中的key
		title : '合计工时(小时)',
		width : 90
	}, {
		field : 'btime',//对应json中的key
		title : '生产日期',
		width : 100
	}, {
		field : 'etime',//对应json中的key
		title : '结束日期',
		width : 100
	}, {
		field : 'remark',//对应json中的key
		title : '是否发布',
		width : 80
	}, {
		field : 'opt2',
		title : '排产',
		width : 60,
		formatter : function(value, row, index) {
			return "<a href=javascript:editorderdecompose('" + row.id + "')>排产</a>";
		}
	} ,{
		field : 'opt3',
		title : '派工单发布',
		width : 80,
		formatter : function(value, row, index) {
			return "<a href=javascript:publishworkorder('" + row.id + "')>派工单发布</a>";
		}
	}, {
		field : 'opt1',
		title : '删除',
		width : 60,
		formatter : function(value, row, index) {
			return "<a href=javascript:deleteorderdecompose('" + row.id + "')>删除</a>";
		}
	}] ];

	//datagrid 加载数据
	$(function() {
		$('#ordersrlist').datagrid({
			title : '派工单',//数据列表标题
			nowrap : true,//单元格中的数据不换行，如果为true表示不换行，不换行情况下数据加载性能高，如果为false就是换行，换行数据加载性能不高
			striped : true,//条纹显示效果
			url : '${baseurl}decomposeorders/querydecomposeorders_result.action',//加载数据的连接，引连接请求过来是json数据
			idField : 'id',//此字段很重要，数据结果集的唯一约束(重要)，如果写错影响 获取当前选中行的方法执行
			loadMsg : '',
			columns : columns_v,
			pagination : true,//是否显示分页
			rownumbers : true,//是否显示行号
			pageList : [ 18, 30, 45 ],
		});
	});

	//查询方法
	function queryorderdecompose() {
		//datagrid的方法load方法要求传入json数据，最终将 json转成key/value数据传入action
		//将form表单数据提取出来，组成一个json
		var formdata = $("#ordersqueryForm").serializeJson();
		$('#ordersrlist').datagrid('load', formdata);
	}

	//删除派工单方法
	function deleteorderdecompose(id) {
		//第一个参数是提示信息，第二个参数，取消执行的函数指针，第三个参是，确定执行的函数指针
		_confirm('您确认删除吗？', null,
				function() {

					//将要删除的id赋值给deleteid，deleteid在orderdecomposedeleteform中
					$("#delete_id").val(id);
					//使用ajax的from提交执行删除
					//orderdecomposedeleteform：form的id，ordersdecompose_callback：删除回调函数，
					//第三个参数是url的参数
					//第四个参数是datatype，表示服务器返回的类型
					jquerySubByFId('orderdecomposedeleteform', ordersdecompose_callback, null,
							"json");
				});
	}
	//删除派工单的回调
	function ordersdecompose_callback(data) {
		message_alert(data);
		//刷新 页面
		//在提交成功后重新加载 datagrid
		//取出提交结果
		var type = data.resultInfo.type;
		if (type == 1) {
			//成功结果
			//重新加载 datagrid
			queryorderdecompose();
		}
	}
	
	//派工单发布的方法
	function publishworkorder(id) {
		//第一个参数是提示信息，第二个参数，取消执行的函数指针，第三个参是，确定执行的函数指针
		_confirm('您确认发布派工单吗？', null,
				function() {

					//将要删除的id赋值给deleteid，deleteid在orderdecomposedeleteform中
					$("#decompose_id").val(id);
					//使用ajax的from提交执行删除
					//orderdecomposedeleteform：form的id，ordersdecompose_callback：删除回调函数，
					//第三个参数是url的参数
					//第四个参数是datatype，表示服务器返回的类型
					jquerySubByFId('publishworkorderform', ordersdecompose_callback, null,
							"json");
				});
	}
	//分解订单的回调
	function ordersdecompose_callback(data) {
		message_alert(data);
		//刷新 页面
		//在提交成功后重新加载 datagrid
		//取出提交结果
		var type = data.resultInfo.type;
		if (type == 1) {
			//成功结果
			//重新加载 datagrid
			queryorderdecompose();
		}
	}
	
	//修改订单
	function editorderdecompose(id) {
		//打开修改窗口
		createmodalwindow("排产", 900, 380,
				'${baseurl}decomposeorders/editorderdecompose.action?id=' + id);
	}

	//添加订单
	function addorders(id) {
		//打开修改窗口
		createmodalwindow("添加订单", 800, 260,
				'${baseurl}orders/addorders.action?id=' + id);
	}
</script>

</html>