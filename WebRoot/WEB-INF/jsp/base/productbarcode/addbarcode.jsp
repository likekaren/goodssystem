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
<title>添加产品条码信息</title>
<script language="JavaScript" type="text/javascript">
	function addbarcode() {
		var sltName = document.form1.cname;
		//获取选择的 柜体 的名字
		var cname = sltName.value

		//传入 后台的参数
		var param = {
			"cname" : cname
		}

		$.ajax({
			url : "${baseurl}product/addbarcode_submit.action",
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
			parent.location = '${baseurl}product/querybarcode.action';
		}
	}
</script>
</HEAD>

<BODY>
	<FORM action="${baseurl}product/addbarcode_submit.action" method="post"
		name="form1">
		<select name="cname" style="margin-top: 15px;margin-left: 75px">
			<option value="">--选择柜体类型--</option>
			<c:forEach items="${ctypeList}" var="ctypeList">
				<option value="${ctypeList.cname}">${ctypeList.cname }</option>
			</c:forEach>
		</select> <a href="#" class="easyui-linkbutton"
			style="margin-top: 50px; margin-left: 110px"
			data-options="iconCls:'icon-save'" onclick="addbarcode()">提交</a>

	</FORM>
</BODY>
</html>