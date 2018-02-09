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
<title>成品区</title>
</head>
<body>
	<div id="main">
		<div class="table">
			<div class="opt ue-clear">
				<span class="optarea"> 
				<a href="javascript:outfproduct();" class="statistics"> <i class="icon"></i>
						<span class="text">出库</span>
				</a> 
				</span>
			</div>
		</div>
		<table id="fproductlist"></table>

		<form id="fproductdeleteform"
			action="${baseurl}fproduct/deletefproductaction" method="post">
			<input type="hidden" id="delete_id" name="id" />
		</form>
</body>
<script type="text/javascript">
	//datagrid列定义
	var columns_v = [ [{
		field : 'cname',//对应json中的key
		title : '名称',
		width : 120
	}, {
		field : 'putstorenum',//对应json中的key
		title : '入库数量',
		width : 80
	}, {
		field : 'outstorenum',//对应json中的key
		title : '出库数量',
		width : 80
	}, {
		field : 'remainnum',//对应json中的key
		title : '库存余量',
		width : 80
	}, {
		field : 'rtime',//对应json中的key
		title : '时间',
		width : 150
	} ] ];

	//datagrid 加载数据
	$(function() {
		$('#fproductlist').datagrid({
			title : '',//数据列表标题
			nowrap : true,//单元格中的数据不换行，如果为true表示不换行，不换行情况下数据加载性能高，如果为false就是换行，换行数据加载性能不高
			striped : true,//条纹显示效果
			url : '${baseurl}fproduct/queryfproduct_result.action',//加载数据的连接，引连接请求过来是json数据
			idField : 'id',//此字段很重要，数据结果集的唯一约束(重要)，如果写错影响 获取当前选中行的方法执行
			loadMsg : '',
			columns : columns_v,
			pagination : true,//是否显示分页
			rownumbers : true,//是否显示行号
			pageList : [ 18, 30, 45 ],
		});
	});

	//查询方法
	function queryfproduct() {
		//datagrid的方法load方法要求传入json数据，最终将 json转成key/value数据传入action
		//将form表单数据提取出来，组成一个json
		var formdata = $("#fproductqueryForm").serializeJson();
		$('#fproductlist').datagrid('load', formdata);
	}

	//删除用户方法
	function deletefproduct(id) {
		//第一个参数是提示信息，第二个参数，取消执行的函数指针，第三个参是，确定执行的函数指针
		_confirm('您确认删除吗？', null,
				function() {

					//将要删除的id赋值给deleteid，deleteid在fproductdeleteform中
					$("#delete_id").val(id);
					//使用ajax的from提交执行删除
					//fproductdeleteform：form的id，userdel_callback：删除回调函数，
					//第三个参数是url的参数
					//第四个参数是datatype，表示服务器返回的类型
					jquerySubByFId('fproductdeleteform', fproductdel_callback, null,
							"json");
				});
	}
	//删除用户的回调
	function fproductdel_callback(data) {
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
	//修改
	function editfproduct(id) {
		//打开修改窗口
		createmodalwindow("修改物料信息", 800, 260,
				'${baseurl}fproduct/editfproduct.action?id=' + id);
	}

	
	//入库
	function outfproduct(id) {
		//打开修改窗口
		createmodalwindow("出库", 900, 380,
				'${baseurl}fproduct/outfproduct.action?id=' + id);
	}
	
	

</script>

</html>