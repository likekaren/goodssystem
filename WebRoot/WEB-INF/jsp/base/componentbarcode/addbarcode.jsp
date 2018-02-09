<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="materielList" value="${materielList}" scope="application" />
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
<title>添加部件条码信息2</title>
<script language="JavaScript" type="text/javascript">
	//获得部件名称下拉框的对象
	function getName() {
		//获得柜体类型下拉框的对象
		var sltName = document.form1.cname;
		//获取选择的 柜体 的名字
		var cname = sltName.value
		console.log(cname);

		//异步 请求 柜体 对应的 部件 信息
		$.ajax({
			type : "POST",
			contentType : "application/json",
			url : "${baseurl}component/querycomponent.action",
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
		var sltmaterial = document.form1.material;
		sltmaterial.length = 1;
		//将城市数组中的值填充到城市下拉框中
		for ( var i = 0; i < data.length; i++) {
			sltmaterial[i + 1] = new Option(data[i].unitname, data[i].unitname);
		}
	}

	function addbarcode() {
		var sltName = document.form1.cname;
		//获取选择的 柜体 的名字
		var cname = sltName.value
		var sltmaterial = document.form1.material;
		var material = sltmaterial.value

		if (material == "未查询到部件信息。") {
			$.messager.alert('提示', '未查询到部件信息,无法添加', 'error');
			return false;
		}

		//传入 后台的参数
		var param = {
			"unitname" : material,
			"cname" : cname
		}

		$.ajax({
			url : "${baseurl}component/addbarcode_submit.action",
			type : "post",
			data : param,
			async : false,
			dataType : "json",
			cache : false,
			error : function(data) {
				message_alert(data);
			},
			success : function(data) {
				message_alert(data);
				//如果成功，自动关闭
				if (data.resultInfo.type == '1') {
					//延迟1秒执行关闭方法
					setTimeout("toquerybarcode()", 1000);
				}
			}
		});

	}

	//回 条码显示页面
	function toquerybarcode() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}component/querybarcode.action';
		}
	}
</script>
</HEAD>

<BODY>
	<FORM action="${baseurl}component/addbarcode_submit.action"
		method="post" name="form1">
		<select name="cname" onChange="getName()" style="margin-left: 40px">
			<option value="">------选择柜体类型------</option>
			<c:forEach items="${ctypeList}" var="ctypeList">
				<option value="${ctypeList.cname}">${ctypeList.cname }</option>
			</c:forEach>
		</select> 
		
		<br/>
		
		<SELECT NAME="material" style="margin-top: 30px;margin-left: 40px">
			<OPTION VALUE="0">------请选择编码部件------</OPTION>
			<c:forEach items="${materielList}" var="materielList">
				<option value="${materielList.unitname}">${materielList.unitname }</option>
			</c:forEach>
		</SELECT> <a class="easyui-linkbutton"
			style="float: right; margin-right: 150px;margin-top: 30px"
			data-options="iconCls:'icon-save'" onclick="addbarcode()">提交</a>

	</FORM>
</BODY>
</html>