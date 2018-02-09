<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新疆昌吉职业技术学院柜体智能制造生产线MES系统</title>
<link type="text/css" rel="stylesheet"
	href="${baseurl}/styles/planLED.css" />
<script src="${baseurl}/js/angular.min.js"></script>
<script src="${baseurl}/js/planLED.js"></script>
</head>
<body ng-app="myApp" ng-controller="planLEDCtrl">
	<div class="content">
		<div class="title">新疆昌吉职业技术学院智能制造生产线MES系统</div>
		<table border="1">
			<tr>
				<th colspan="1" class="car" style="font-size: 40px"></th>
				<th colspan="1">总计划数</th>
				<th colspan="1">已完成数</th>
				<th colspan="1">今日计划数</th>
				<th colspan="1">今日已完成</th>
			</tr>

			<c:forEach var="technicsCustom" items="${technicsCustomList}">
				<%--用EL表达式调用list对象的属性循环输出对象的各个属性值--%>
				<tr>
					<td>${technicsCustom.tcname}</td>
					<td>${technicsCustom.planTotal}</td>
					<td>${technicsCustom.completedNumber}</td>
					<td>${technicsCustom.planToday}</td>
					<td>${technicsCustom.completedToday}</td>
				</tr>

			</c:forEach>
			
		</table>
		<div class="show_time">
			<span ng-bind="nowFormatDate"></span> &nbsp; <span
				ng-bind="nowFormatTime"></span>&nbsp;&nbsp; <span ng-bind="nowWeek"></span>
		</div>
	</div>

	<script type="text/javascript">
	/* 	//每隔 30s  调用一次，
	 	 setInterval(function() {
			window.location.href = "${baseurl}/plan/plan.action";
		}, 10000); //每30秒调用一次方法   */
	</script>
</body>
</html>