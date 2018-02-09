/**
 * Created by yxf on 2017/1/15 0015.
 */

var app = angular.module('myApp', []);
app.controller('planLEDCtrl', function ($scope, $http, $timeout) {

    //初始化 时间  和 日期
    $scope.nowFormatTime = getNowFormatTime();
    $scope.nowFormatDate = getNowFormatDate();
    $scope.nowWeek = getWeek();
    //每隔 30s  调用一次，
    setInterval(function () {
        $scope.nowFormatTime = getNowFormatTime();
        $scope.nowFormatDate = getNowFormatDate();
        //刷新数据模型
        $scope.$apply();
    }, 1000); //每30秒调用一次方法
    //获取当前的日期
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var hours = date.getHours();
        var minute = date.getMinutes();
        // var currentdate = year + seperator1 + month + seperator1 + strDate+" "+hours+":"+minute;
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }

    // 获取当前的时间
    function getNowFormatTime() {
        var date = new Date();
        var hours = date.getHours();
        if (hours <= 9) {
            hours = "0" + hours;
        }
        var minute = date.getMinutes();
        if (minute <= 9) {
            minute = "0" + minute;
        }
        
        var seconds = date.getSeconds();
        if (seconds <= 9) {
        	seconds = "0" + seconds;
        }
        var currentTime = hours + ":" + minute+ ":" + seconds;
        return currentTime;
        return currentTime;
    }

    //获取 星期几
    function  getWeek() {
        var a = new Array("日", "一", "二", "三", "四", "五", "六");
        var week = new Date().getDay();
        var str = "星期"+ a[week];
        return str;
    }

});
