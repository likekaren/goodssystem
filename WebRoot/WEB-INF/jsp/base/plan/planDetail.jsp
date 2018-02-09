<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>新疆昌吉职业技术学院柜体智能制造生产线MES系统</title>
<!-- Bootstrap Core CSS -->
<link href="${baseurl}styles/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="${baseurl}styles/planDetail.css" rel='stylesheet'
	type='text/css' />
<link rel="stylesheet" href="${baseurl}styles/bootstrap.min.css">
<script src="${baseurl}js/jquery.min.js"></script>
<script src="${baseurl}js/bootstrap.min.js"></script>
<script src="${baseurl}js/angular.min.js"></script>

<!--环形进度条-->
<script src="${baseurl}js/circle.js"></script>
<style type="text/css" mce_bogus="1">
table th {
	white-space: nowrap;
}

table td {
	white-space: nowrap;
}

body,table {
	font-size: 15px;
}

table {
	empty-cells: show;
	border-collapse: collapse;
	margin: 0 auto;
}

h1,h2,h3 {
	font-size: 12px;
	margin: 0;
	padding: 0;
}

table.tab_css_1 {
	border: 1px solid #cad9ea;
	color: #666;
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

</head>
<body ng-app="myApp" ng-controller="myCtrl">
	<div class="show_title">
		<h2>${tcTitle }</h2>
	</div>
	<section class="box-content box-3" id="staff">
		<div class="container">
			<div class="row center">
				<div class="circle" style="left: 100px; margin-top: 250px">
					<div class="pie_left">
						<div class="left"></div>
					</div>
					<div class="pie_right">
						<div class="right"></div>
					</div>
					<div class="mask">
						<span id="rate"></span>%
					</div>
					<div style="margin-top: 220px; color: white; font-size: 20px">
						<b>总计划已完成百分比</b>
					</div>
				</div>
				<!--生产计划-->
				<div class="box_sum">
					<div class="panel panel-info">
						<div class="panel-heading" style="font-size: 20px">生产计划</div>
						<table class="table">
							<tr>
								<td><h4>总计划数:</h4></td>
								<td><h4 id="td1"></h4></td>
							</tr>
							<tr>
								<td><h4>已完成数:</h4></td>
								<td><h4 id="td2"></h4></td>
							</tr>
							<tr>
								<td><h4>今日计划数:</h4></td>
								<td><h4 id="td3"></h4></td>
							</tr>
							<tr>
								<td><h4>今日完成数:</h4></td>
								<td><h4 id="td4"></h4></td>
							</tr>

						</table>
					</div>
				</div>
				<div class="box_sum2">
					<div class="panel panel-info">
						<div class="panel-heading" style="font-size: 20px">生产进度</div>
						<div style="overflow: auto; height: 320px; width: 420x">
							<table border="1" class="tab_css_1">
								<thead>
									<th>名称</th>
									<th>总计划数</th>
									<th>已完成数</th>
									<th>今日计划数</th>
									<th>今日已完成</th>
								</thead>
								<tr class="tr_css" align="center" ng-repeat="item in result">
									<td ng-bind="item.ctname"></td>
									<td ng-bind="item.planTotal"></td>
									<td ng-bind="item.completedNumber"></td>
									<td ng-bind="item.planToday"></td>
									<td ng-bind="item.completedToday"></td>
								</tr>

							</table>
						</div>
					</div>

				</div>
				<!--冲压区-->
				<div class="row heading">
					<div class="col-lg-12">
						<div class="intro">${tDesc}</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	</div>

	<div class="coppy-right">
		<div class="wrap-footer">
			<div class="clearfix">
				<span> 版权：湖北工业大学 &nbsp; 武汉天之逸科技有限公司 研制 &nbsp; </span>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	getPlanDetail();
	function getPlanDetail() {
		$.ajax({
			url : "${baseurl}plan/queryplandetail_result/" + '${tcname_page}'
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
				setplanDetail(data)
			}
		});
	}

	//将数据 填写到页面：
	function setplanDetail(data) {
		var planTotal = data.planTotal;
		$("#td1").text(planTotal);
		var completedNumber = data.completedNumber;
		$("#td2").text(completedNumber);
		var planToday = data.planToday;
		$("#td3").text(planToday);
		var completedToday = data.completedToday;
		$("#td4").text(completedToday);
		var completionRate = data.completionRate;
		$("#rate").text(completionRate);

		var app = angular.module('myApp', []);
		app.controller('myCtrl', function($scope) {
			$scope.result = data.partsPlanList;
		});
	}

	//自动刷新
	setInterval(function() {
		getPlanDetail();
	}, 60000);
</script>
</html>

