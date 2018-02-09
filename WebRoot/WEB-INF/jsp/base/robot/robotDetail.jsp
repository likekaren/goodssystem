<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<link href="${baseurl}styles/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="${baseurl}styles/robot.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="${baseurl}styles/bootstrap.min.css">
<script src="${baseurl}js/jquery.min.js"></script>
<script src="${baseurl}js/bootstrap.min.js"></script>
<script src="${baseurl}js/angular.min.js"></script>
<style type="text/css" mce_bogus="1">
table th {
	white-space: nowrap;
}

table td {
	white-space: nowrap;
}

body,table {
	font-size: 18px;
}

table {
	empty-cells: show;
	border-collapse: collapse;
	margin: 0 auto;
}

table.tab_css_1 {
	border: 1px solid #cad9ea;
	color: #666;
	margin-left: 1px;
}

table.tab_css_1 th {
	background-repeat: repeat-x;
	height: 40px;
}

table.tab_css_1 td,table.tab_css_1 th {
	border: 1px solid #cad9ea;
	padding: 0 1em 0;
}

table.tab_css_1 tr.tr_css {
	background-color: #f5fafe;
	height: 40px;
}
</style>

<body ng-app="myApp" ng-controller="myCtrl">
	<div class="content">

		<div class="title">多功能机器人看板</div>
		<div class="robot">
			<img src="${baseurl}images/robot.png" alt="" />
		</div>

		<div class="detail">
			<div class="panel panel-info">
				<div class="panel-heading"
					style="font-size: 22px; text-align: center;">生产进度</div>
				<div style="overflow: auto; height: 480px; width: 1100px">
					<table border="1" class="tab_css_1">
						<thead>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;模块名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>模块状态</th>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;异常情况&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
							<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;检测时间&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
						</thead>
						<tr class="tr_css" align="center" ng-repeat="item in result">
							<td ng-bind="item.name"></td>
							<td ng-bind="item.robotComponentName"></td>
							<td ng-bind="item.status"></td>
							<td ng-bind="item.note"></td>
							<td ng-bind="item.time"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	

	
	</div>
	
		<div style="width: 100%;height: 40px;background: black;float: left;text-align: center;;line-height: 40px;
		color: white;margin-top: 136px">
		武汉天之逸科技有限公司 研制 &nbsp;
		</div>

</body>
<script type="text/javascript">
	getRobotDetail();
	function getRobotDetail() {
		$.ajax({
			url : "${baseurl}/robot/queryrobot/" + '${robotTypeName}'
					+ ".action",
			type : "post",
			//data : param,
			async : false,
			dataType : "json",
			cache : false,
			error : function(data) {
				alert('请求数据失败');
			},
			success : function(data) {
				console.log(data);
				setRobotDetail(data);
			}
		});
	}

	//将数据 填写到页面：
	function setRobotDetail(data) {

		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope) {
			$scope.result = data;
		});
	}

	//自动刷新
	setInterval(function() {
		getRobotDetail();
	}, 60000);
</script>

</html>