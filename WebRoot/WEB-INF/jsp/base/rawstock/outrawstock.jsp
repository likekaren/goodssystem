<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<LINK rel="stylesheet" type="text/css"
	href="${baseurl}js/easyui/styles/default.css">
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<title>出库</title>
<script type="text/javascript">
	//获得部件名称下拉框的对象
	function getName() {
		//获得柜体类型下拉框的对象
		var sltName = document.form1.name;
		//获取选择的 柜体 的名字
		var cname = sltName.value
		console.log(cname);
		//异步 请求 柜体 对应的 部件 信息
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${baseurl}rawstock/querycode.action",
			data : cname,
			datatype : "json",
			cache : false,
			success : function(data, textStatus) {
				console.log(data);
				console.log(data.length);
				setComponent(data)
			},
			error : function(textStatus) {
			}
		});
	
	}
	function setComponent(data) {
		var sltmaterial = document.form1.code;
		sltmaterial.length = 1;
		//
		for ( var i = 0; i < data.length; i++) {
			sltmaterial[i + 1] = new Option(data[i].remark1, data[i].remark1);
		}
	}
	function outrawstocksave() {
		jquerySubByFId('outrawstockform', outrawstocksave_callback, null, "json");
	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function outrawstocksave_callback(data) {
		console.log("返回结果" + data)
		message_alert(data);
		//如果成功，自动关闭
		if (data.resultInfo.type == '1') {
			//延迟1秒执行关闭方法
			setTimeout("toqueryrawstock()", 1000);
		}
	}
	//回 角色显示页面
	function toqueryrawstock() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}rawstock/queryrawstock.action';
		}
	}
</script>
</head>
<body>
	<form id="outrawstockform" action="${baseurl}rawstock/outrawstocksubmit.action"
		method="post" name="form1">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${rawstockCustom.id}" />
		<TBODY>
			<table cellpadding="5">
					<tr>
					<td>名称:</td>
					<td>
						<select required name="name" onChange="getName()" style="width:162px; height: 35px;">
							 <option value="">--请选择物料--</option>
							 <c:forEach items="${list}" var="ct">
							 	<option value="${ct.rtname}">${ct.rtname}</option>
							 </c:forEach>
						</select>
					</td>	
					<td>零件代码:</td>
					<td>
						<SELECT NAME="code" tyle="width:162px; height: 35px;">
							<OPTION VALUE="">--请选择零件代码--</OPTION>
							<c:forEach items="${rawstockCustom}" var="rawstockCustom">
								<option value="${rawstockCustom.remark1}">${rawstockCustom.remark1 }</option>
							</c:forEach>
						</SELECT> 
					</td>
					<td>出库数量:</td>
					<td><input required class="easyui-textbox" type="text"
						name="outstorenum" value="${rawstockCustom.outstorenum}"
						style="width:200px;height: 35px;"></input></td>
				</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="outrawstocksave()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>