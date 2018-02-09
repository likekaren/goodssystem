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
<title>工单查询</title>
</head>
<body>
	
		
		<!-- html的静态布局 -->
		<form id="workorderqueryForm">
			<!-- 查询条件 -->
			<TABLE class="table_search"   >
				<TBODY>
					<TR>
						<TD class="left">工单编号：</td>
						<td><INPUT type="text" name="publishworkorderCustom.publishworkordenum" /></TD>
						<TD class="left">工位：</TD>
						<td>
							<select required name="publishworkorderCustom.tcname" style="width:162px; height: 35px;">
							  <option value="">--请选择工位--</option>
							 <c:forEach items="${list}" var="list">
							 	<option value="${list.tcname}">${list.tcname}</option>
							 </c:forEach>
							</select>
						</TD>
						<TD class="left">时间：</TD>
							<td>
								<input class="easyui-datetimebox"   
								name="publishworkorderCustom.begintime" value="${publishworkorderCustom.begintime}"
								style="width:200px; height:35px;">
								</input>
							</td>
						<td>
							<div class="search-button">
								<input class="button" onclick="queryworkorder()" type="button"
									value="查询" />
							</div>
				</TBODY>
			</TABLE>
			
		
		</div>
		</form>
		
		
		
		<table id="workorderlist"></table>

		<form id="workorderdeleteform"
			action="${baseurl}workorder/deleteworkorder.action" method="post">
			<input type="hidden" id="delete_id" name="id" />
		</form>
		
</body>
<script type="text/javascript">
	//datagrid列定义
	var columns_v = [ [{
		field : 'publishworkordenum',//对应json中的key
		title : '工单编号 ',
		width : 160
	}, {
		field : 'cname',//对应json中的key
		title : '柜体类型',
		width : 120
	}, {
		field : 'unitcode',//对应json中的key
		title : '代码',
		width : 120
	}, {
		field : 'ordernum',//对应json中的key
		title : '所属订单',
		width : 130
	}, {
		field : 'unitname',//对应json中的key
		title : '名称 ',
		width : 100
	}, {
		field : 'tcname',//对应json中的key
		title : '工位名称',
		width : 80
	}, {
		field : 'pwonumber',//对应json中的key
		title : '生产数量',
		width : 80
	}, {
		field : 'finishNum',//对应json中的key
		title : '已生产数量',
		width : 80
	}, {
		field : 'btime',//对应json中的key
		title : '开始时间',
		width : 100
	}, {
		field : 'etime',//对应json中的key
		title : '结束时间',
		width : 100
	},{
		field : 'opt1',
		title : '删除',
		width : 120,
		formatter : function(value, row, index) {
			return "<a href=javascript:deleteworkorder('" + row.id + "')>删除</a>";
		}
	}
	] ];

	//datagrid 加载数据
	$(function() {
		$('#workorderlist').datagrid({
			title : '工单',//数据列表标题
			nowrap : true,//单元格中的数据不换行，如果为true表示不换行，不换行情况下数据加载性能高，如果为false就是换行，换行数据加载性能不高
			striped : true,//条纹显示效果
			url : '${baseurl}workorder/queryworkorder_result.action',//加载数据的连接，引连接请求过来是json数据
			idField : 'id',//此字段很重要，数据结果集的唯一约束(重要)，如果写错影响 获取当前选中行的方法执行
			loadMsg : '',
			columns : columns_v,
			pagination : true,//是否显示分页
			rownumbers : true,//是否显示行号
			pageList : [ 18, 30, 45 ],
		});
	});

	//查询方法
	function queryworkorder() {
		//datagrid的方法load方法要求传入json数据，最终将 json转成key/value数据传入action
		//将form表单数据提取出来，组成一个json
		var formdata = $("#workorderqueryForm").serializeJson();
		$('#workorderlist').datagrid('load', formdata);
	}

	//删除订单方法
	function deleteworkorder(id) {
		//第一个参数是提示信息，第二个参数，取消执行的函数指针，第三个参是，确定执行的函数指针
		_confirm('您确认删除吗？', null,
				function() {

					//将要删除的id赋值给deleteid，deleteid在workorderdeleteform中
					$("#delete_id").val(id);
					//使用ajax的from提交执行删除
					//workorderdeleteform：form的id，workorderdecompose_callback：删除回调函数，
					//第三个参数是url的参数
					//第四个参数是datatype，表示服务器返回的类型
					jquerySubByFId('workorderdeleteform', workorderdecompose_callback, null,
							"json");
				});
	}
	//删除订单的回调
	function workorderdecompose_callback(data) {
		message_alert(data);
		//刷新 页面
		//在提交成功后重新加载 datagrid
		//取出提交结果
		var type = data.resultInfo.type;
		if (type == 1) {
			//成功结果
			//重新加载 datagrid
			queryworkorder();
		}
	}
	
	
	

</script>

</html>