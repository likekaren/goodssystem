<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新疆昌吉职业技术学院智能制造生产线MES系统</title>
<link type="text/css" rel="stylesheet" href="${baseurl}/styles/plan.css" />
<link type="text/css" rel="stylesheet"
	href="${baseurl}/styles/cssReset.css" />
<script src="${baseurl}/js/angular.min.js"></script>
<script src="${baseurl}/js/plan.js"></script>
</head>
<body ng-app="myApp" ng-controller="planCtrl">
	<div id="Head2">
		<div id="Head2_FunctionList">
			<marquee style="width: 100%;" onMouseOver="this.stop()"
				onMouseOut="this.start()" scrollamount=6 scrolldelay=30
				direction=left>
				<span style="font-size: 50px">新疆昌吉职业技术学院 &nbsp;&nbsp;&nbsp;
					智能制造生产线</span>
			</marquee>
		</div>
	</div>
	<div class="content">
		<ul>
			<div class="item">
				<div class="sum">
					<span>半成品A区</span><br /> <span>库存余量：${SemiproductaNumber }</span>
				</div>
				<li class="box"><img src="${baseurl}images/5.png"
					name="picture">
					<div class="intro">存储区</div></li>
			</div>
			<div class="arrow_left">
				<img src="${baseurl}images/arrow_left.png" alt="">
			</div>
			<div class="item">
				<div class="sum">
					<span>计划数：</span> <span>${bend.planTotal }</span> <span></span> <br />
					<span>已完成：</span> <span>${bend.completedNumber }</span> <span></span>
				</div>
				<li class="box">
					<!--第③个--> <img src="${baseurl}images/4.jpg" name="picture">
					<div class="intro">折弯区</div>
				</li>
			</div>

			<div class="arrow_left">
				<img src="${baseurl}images/arrow_left.png" alt="">
			</div>

			<div class="item">
				<div class="sum">
					<span>计划数：</span> <span>${punch.planTotal }</span> <span></span> <br />
					<span>已完成：</span> <span>${punch.completedNumber}</span> <span></span>
				</div>
				<li class="box">
					<!--第③个--> <img src="${baseurl}images/3.png" name="picture">
					<div class="intro">冲压区</div>
				</li>
			</div>
			<div class="arrow_left">
				<img src="${baseurl}images/arrow_left.png" alt="">
			</div>

			<div class="item">
				<div class="sum">
					<span>计划数：</span> <span>${cut.planTotal }</span> <span></span> <br />
					<span>已完成：</span> <span>${cut.completedNumber}</span> <span></span>
				</div>
				<li class="box">
					<!--第③个--> <img src="${baseurl}images/2.png" name="picture">
					<div class="intro">剪板区</div>
				</li>
			</div>

			<div class="arrow_left">
				<img src="${baseurl}images/arrow_left.png" alt="">
			</div>

			<div class="item">
				<div class="sum">
					<span style="color: white;">取料区</span><br /> <span>库存余量:${steelPlateCount }</span>
					<span></span>
				</div>
				<li class="box">
					<!--第③个--> <img src="${baseurl}images/1.png" name="picture">
					<div class="intro">取料区</div>
				</li>
			</div>

			<!--第一排结束-->

			<div class="line"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line" style="margin-right: 10px"></div>
			<div class="line_down"></div>
			<div class="line_down" style="margin-right: 20px"></div>
			<div class="line" style="margin-right: 10px;"></div>
			<!-- 第二排 -->
			<div class="line2"></div>
			<div class="line_down_2" style="margin-left: 10px"></div>
			<div class="line_down_2" style="margin-left: 20px;"></div>
			<div class="line2" style="margin-left: 3px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<div class="line2" style="margin-left: 10px"></div>
			<!--第二排-->
			<div class="item2" style="clear: both;">
				<div class="sum">
					<span style="color: white;">半成品B区</span><br /> <span>库存余量：${SemiproductbNumber }</span>
					<span></span>
				</div>
				<li class="box2">
					<!--第③个--> <img src="${baseurl}images/6.png" name="picture">
					<div class="intro">来料区</div>
				</li>
			</div>

			<div class="arrow_right">
				<img src="${baseurl}images/arrow_right.png" alt="">
			</div>

			<div class="item2">
				<div class="sum">
					<span>计划数：</span> <span>${mfitting.planTotal }</span> <span></span>
					<br /> <span>已完成：</span> <span>${mfitting.completedNumber}</span>
					<span></span>
				</div>
				<li class="box2">
					<!--第③个--> <img src="${baseurl}images/7.png" name="picture">
					<div class="intro">机装区</div> 
				</li>
			</div>
			<div class="arrow_right">
				<img src="${baseurl}images/arrow_right.png" alt="">
			</div>

			<div class="item2">
				<div class="sum">
					<span>计划数：</span> <span>${efitting.planTotal }</span> <span></span>
					<br /> <span>已完成：</span> <span>${efitting.completedNumber}</span>
					<span></span>
				</div>
				<li class="box2">
					<!--第③个--> <img src="${baseurl}images/8.png" name="picture">
					<div class="intro">电装区</div>
				</li>
			</div>

			<div class="arrow_right">
				<img src="${baseurl}images/arrow_right.png" alt="">
			</div>
			<div class="item2">
				<div class="sum">
					<span>计划数：</span> <span>${ffitting.planTotal }</span> <span></span>
					<br /> <span>已完成：</span> <span>${ffitting.completedNumber}</span>
					<span></span>
				</div>
				<li class="box2">
					<!--第③个--> <img src="${baseurl}images/9.png" name="picture">
					<div class="intro">总装区</div>
				</li>
			</div>

			<div class="arrow_right">
				<img src="${baseurl}images/arrow_right.png" alt="">
			</div>
			<div class="item2">
				<div class="sum">
				<div class="intro">成品区</div>	<span></span><br /> <span>库存余量：${product}</span> <span></span>
				</div>
				<li class="box2">
					<!--第③个--> <img src="${baseurl}images/10.png" name="picture">
				<div class="intro">成品区</div>	
				</li>
			</div>
		</ul>
	</div>

	<div class="show_time">
		<span ng-bind="nowFormatDate"></span> &nbsp; <span
			ng-bind="nowFormatTime"></span> <span class="week" ng-bind="nowWeek"></span>
	</div>

	<script type="text/javascript">
		//每隔 60s  调用一次，
		/* 		 	setInterval(function() {
		 window.location.href = "${baseurl}/plan/planLED.action";
		 }, 30000);   */
	</script>
</html>