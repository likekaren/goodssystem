<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">

<title>添加用户</title>
<script type="text/javascript">
	function ordersCustom() {
		//准备使用jquery 提供的ajax Form提交方式
		//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
		//使用ajax form提交时，不用指定url，url就是form中定义的action
		//此种方式和原始的post方式差不多，只不过使用了ajax方式

		//第一个参数：form的id
		//第二个参数：ordersCustom_callback是回调函数，ordersCustom_callback当成一个方法的指针
		//第三个参数：传入的参数， 可以为空
		//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
		//根据form的id找到该form的action地址
		jquerySubByFId('ordersform', ordersCustom_callback, null, "json");

	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function ordersCustom_callback(data) {
		console.log("返回结果" + data);
		message_alert(data);
		//如果成功，自动关闭
		if (data.resultInfo.type == '1') {
			//延迟1秒执行关闭方法
			setTimeout("toqueryorders()", 1000);
		}
	}
	//回 角色显示页面
	function toqueryorders() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}orders/queryorders.action';
		}
	}
</script>
</head>
<body>
	<form id="ordersform" action="${baseurl}orders/addorderssubmit.action"
		method="post">
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${ordersCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>订单编号:</td>
					<td><input class="easyui-textbox" required type="text"
						name="ordersCustom.ordernum" value="${ordersCustom.ordernum}"
						style="width:200px; height: 35px;"></input></td>

					<td>合同编号:</td>
					<td><input class="easyui-textbox" type="text"
						name="ordersCustom.ordercontract" value="${ordersCustom.ordercontract}"
						style="width:200px; height: 35px;"></input></td>
					<td>生产数量:</td>
					<td><input class="easyui-textbox" required type="text"
						name="ordersCustom.cabinetnumber" value="${ordersCustom.cabinetnumber}"
						style="width:200px; height: 35px;"></input></td>
				</tr>
				<tr>
					<td>开始时间:</td>
					<td><input class="easyui-datetimebox"  required 
						name="ordersCustom.begintime" value="${ordersCustom.begintime}"
						style="width:200px; height:35px;"></input></td>
					<td>结束时间:</td>
					<td><input class="easyui-datetimebox" required
						name="ordersCustom.endtime" value="${ordersCustom.endtime}"
						style="width:200px; height: 35px;"></input></td>
					<td>客户名称:</td>
					<td><input class="easyui-textbox" type="text"
						name="ordersCustom.loadcenter" value="${ordersCustom.loadcenter}"
						style="width:200px; height: 35px;"></input></td>
				</tr>
				<tr>
					<td>柜体类型:</td>
					<td>
							<select required name="ordersCustom.materieltype" style="width:200px; height: 35px;">
								  <option value="0">--请选择柜体类型--</option>
								 <c:forEach items="${ctList}" var="ct">
								 	<option value="${ct.cnum}">${ct.cname}</option>
								 </c:forEach>
							</select>
						</td> 
				</tr>
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="ordersCustom()">提交</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">关闭</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>