<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<%@page import="java.net.InetAddress"%>
<%
	String localurl = InetAddress.getLocalHost().getHostAddress()
			.toString();
%>
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
<title>物料条码管理</title>
</head>
<body>
	<div id="main">
		<!-- html的静态布局 -->
		<form id="barcodequeryForm">
			<!-- 查询条件 -->
			<TABLE class="table_search">
				<TBODY>
					<TR>
						<TD class="left">条码号：</td>
						<td><INPUT type="text" name="barCodeCustom.barcodenumber" /></TD>
						<TD class="left">物料名：</TD>
						<td><INPUT type="text" name="barCodeCustom.name" /></TD>

						<TD class="left">时间：</TD>
						<td><INPUT type="text" name="barCodeCustom.createtime" /></TD>

						<TD class="left">操作者：</TD>
						<td><INPUT type="text" name="barCodeCustom.operatorname" /></TD>

						</select>
						</TD>
						<td>
							<div class="search-button">
								<input class="button" onclick="querybarcode()" type="button"
									value="搜索一下" />
							</div>
				</TBODY>
			</TABLE>
			<!-- 查询列表 -->
			<TABLE border=0 cellSpacing=0 cellPadding=0 width="99%" align=center>
				<div class="table">
					<div class="opt ue-clear">
				<!-- 		<span class="sortarea"> <span class="sort"> <label>排序：</label>
								<span class="name"> <i class="icon"></i> <span
									class="text">名称</span>
							</span>
						</span> <i class="list"></i> <i class="card"></i>
						</span>  -->
						
						<span class="optarea"> <a href="javascript:adduser();"
							class="add"> <i class="icon"></i> <span class="text">添加</span>
							
							
								<!-- </a> <a href="javascript:;" class="delete"> <i class="icon"></i> <span
						class="text">删除</span> -->
					<!-- 	</a> <a href="javascript:;" class="statistics"> <i class="icon"></i>
								<span class="text">统计</span>
						</a> <a href="javascript:;" class="config"> <i class="icon"></i> <span
								class="text">配置</span>
						</a> -->
						</span>
					</div>
				</div>
				<table id="barcodelist"></table>

				<TBODY>
					<TR>
						<TD>
							<table id="barcodelist"></table>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</form>

		<form id="barcodedeleteform"
			action="${baseurl}component/deletebarcode.action" method="post">
			<input type="hidden" id="delete_id" name="id" />
		</form>
</body>
<script type="text/javascript">
	//datagrid列定义
	var columns_v = [ [
			{
				field : 'barcodenumber',//对应json中的key
				title : '条码号',
				width : 200
			},
			{
				field : 'name',//对应json中的key
				title : '部件名 ',
				width : 200
			},
			{
				field : 'cnum',//对应json中的key
				title : '柜体型号',
				width : 200
			},
			{
				field : 'cabinettype',//对应json中的key
				title : '所属柜体名',
				width : 200
			},
			{
				field : 'createtime',//对应json中的key
				title : '时间',
				width : 200
			},
			{
				field : 'operatorname',//对应json中的key
				title : '操作者',
				width : 120
			},
			{
				field : 'opt2',
				title : '打印条码',
				width : 80,
				formatter : function(value, row, index) {
					return "<a href=javascript:printbarcode('"
							+ row.barcodenumber + "','" + row.name + "','"
							+ row.cabinettype + "','" + row.cnum + "')>打印条码</a>";
				}
			},
			{
				field : 'opt1',
				title : '删除',
				width : 80,
				formatter : function(value, row, index) {
					return "<a href=javascript:deleteuser('" + row.id
							+ "')>删除</a>";
				}
			} ] ];

	//datagrid 加载数据
	$(function() {
		$('#barcodelist').datagrid({
			title : '用户查询',//数据列表标题
			nowrap : true,//单元格中的数据不换行，如果为true表示不换行，不换行情况下数据加载性能高，如果为false就是换行，换行数据加载性能不高
			striped : true,//条纹显示效果
			url : '${baseurl}component/querybarcode_result.action',//加载数据的连接，引连接请求过来是json数据
			idField : 'id',//此字段很重要，数据结果集的唯一约束(重要)，如果写错影响 获取当前选中行的方法执行
			loadMsg : '',
			columns : columns_v,
			pagination : true,//是否显示分页
			rownumbers : true,//是否显示行号
			pageList : [ 18, 30, 45 ],
		});
	});

	//查询方法
	function querybarcode() {
		//datagrid的方法load方法要求传入json数据，最终将 json转成key/value数据传入action
		//将form表单数据提取出来，组成一个json
		var formdata = $("#barcodequeryForm").serializeJson();
		$('#barcodelist').datagrid('load', formdata);
	}

	//删除用户方法
	function deleteuser(id) {
		//第一个参数是提示信息，第二个参数，取消执行的函数指针，第三个参是，确定执行的函数指针
		_confirm('您确认删除吗？', null,
				function() {

					//将要删除的id赋值给deleteid，deleteid在barcodedeleteform中
					$("#delete_id").val(id);
					//使用ajax的from提交执行删除
					//barcodedeleteform：form的id，userdel_callback：删除回调函数，
					//第三个参数是url的参数
					//第四个参数是datatype，表示服务器返回的类型
					jquerySubByFId('barcodedeleteform', userdel_callback, null,
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
			setTimeout("querybarcode()", 1000);
		}
	}
	//添加用户
	function adduser() {
		createmodalwindow("添加部件条码信息", 300, 350,
				'${baseurl}component/addbarcode.action');
	}
	//打印条码
	function printbarcode(barcodenumber, name, cabinettype,cnum) {

		//cabinettype
		
		var postData = {
			barcode : barcodenumber,
			productName : cnum+cabinettype,
			componentName : name,
		};
		//alert(JSON.stringify(postData));
		
		var url ='http://127.0.0.1:8082/PrintBarcode/print.action';
		$.ajax({
			type : "POST",
			url : url,
			dataType : "text",
			contentType : "application/json;charset=UTF-8",
			data : JSON.stringify(postData),
			success : function(data) {
				//alert(data);
			},
		 error:function(){
			 $.messager.alert('提示','请开启打印机服务!','error');
         }
		});
	}
</script>

</html>