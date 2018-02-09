/**
 * Created by yxf on 2017/1/15 0015.
 */
// 首页 index
var app = angular.module('myApp', []);
app.controller('planDetailCtrl', function($scope, $http, $timeout) {



	// 将数据 填写到页面：
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

		$scope.result = data.partsPlanList;

	}
	// 自动刷新
	setInterval(function() {
		getPlanDetail();
		// 刷新数据模型
		//$scope.$apply();
	}, 1000);

});
