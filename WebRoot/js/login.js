/**
 * Created by yxf on 2017/1/15 0015.
 */
// 首页 index
var app = angular.module('myApp', []);
app.controller('loginCtrl', function($scope, $http, $timeout) {

	//用户登录，数据提交
	$scope.login_submit = function() {
		$http.get('http://localhost:8080/MES/login_submit.action', {
			params : {
				pwd : '5',
				userName : 'yuxiaofan'
			}
		}).success(function(data, status, headers, config) {
			// 加载成功之后做一些事
		}).error(function(data, status, headers, config) {
			// 处理错误
		});
	}

});
