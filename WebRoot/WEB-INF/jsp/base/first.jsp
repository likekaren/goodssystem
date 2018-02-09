<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<html>
<head>
<TITLE>新疆昌吉职业技术学院柜体智能制造生产线MES系统</TITLE>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="${baseurl}css/style.css" />
<link rel="stylesheet" type="text/css"
	href="${baseurl}css/skin_/main.css" />
<link rel="stylesheet" type="text/css"
	href="${baseurl}css/jquery.dialog.css" />
</head>
<div id="container">
	<div id="hd">
		<div class="hd-top">
			<h1 class="logo">
				<!-- <a href="javascript:;" class="logo-icon"></a> -->
			</h1>

			<div class="user-info">
				<a href="javascript:;" class="user-avatar"><span></span></a> <span
					class="user-name"> <span>欢迎: </span> &nbsp <span>${activeUser.username}</span>
				</span>
			</div>

			<div class="user-info"
				style="margin-left: 150px; font-size: 20px; color: #fff;">
				<span>新疆昌吉职业技术学院</span>
			</div>

			<div class="setting ue-clear">
				<ul class="setting-main ue-clear" style="margin-right: 10px">
					<li><a href="help.jsp" target="view_window">帮助</a></li>
					<li><a href="javascript:;" class="close-btn exit"></a></li>
				</ul>
			</div>
		</div>
		<div class="hd-bottom">
			<i class="home"><a href="javascript:;"></a></i>
			<div class="nav-wrap">
				<ul class="nav ue-clear">
					<li><a href="javascript:;" onclick="showPlan()">车间大屏</a></li>
					<li><a href="javascript:;" onclick="cutPlan()">剪板区看板</a></li>
					<li><a href="javascript:;" onclick="punchPlan()">冲压区看板</a></li>
					<li><a href="javascript:;" onclick="bendPlan()">折弯区看板</a></li>
					<li><a href="javascript:;" onclick="mfittingPlan()">机装区看板</a></li>
					<li><a href="javascript:;" onclick="efittingPlan()">电装区看板</a></li>
					<li><a href="javascript:;" onclick="ffittingPlan()">总装区看板</a></li>

					<li style="width: 150px"><a  href="javascript:;" onclick="robotOne()">IRB120机器人1号</a></li>
					<li style="width: 150px"><a href="javascript:;" onclick="robotTwo()">IRB120机器人2号</a></li>
					<li style="width: 150px"><a href="javascript:;" onclick="robotThree()">IRB120机器人3号</a></li>
					<li style="width: 150px"><a href="javascript:;" onclick="robotFour()">IRB120机器人4号</a></li>
					<li style="width: 150px"><a href="javascript:;" onclick="robotFive()">IRB120机器人5号</a></li>
					<li style="width: 150px"><a href="javascript:;" onclick="robot()">IRB1410机器人</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="bd">
		<iframe width="100%" height="100%" id="mainIframe"
			src="${baseurl}menu.jsp" frameborder="0"></iframe>
	</div>

	<div id="ft" class="ue-clear">
		<div class="ft1 ue-clear">
			<i class="ft-icon1"></i> <span>湖北工业大学 武汉天之逸科技有限公司 研制 Copyright
				© 2017</span>
		</div>
		<!-- <div class="ft2 ue-clear">
			<span>Call Center</span> <em>V2.0 2017</em> <i class="ft-icon2"></i>
		</div> -->
	</div>
</div>

<div class="exitDialog">
	<div class="content">
		<div class="ui-dialog-icon"></div>
		<div class="ui-dialog-text">
			<p class="dialog-content">你确定要退出系统？</p>
			<p class="tips">如果是请点击“确定”，否则点“取消”</p>

			<div class="buttons">
				<input id="logout_btn" type="button" class="button long2 ok"
					value="确定" /> <input type="button" class="button long2 normal"
					value="取消" />
			</div>
		</div>

	</div>
</div>

</body>
<script type="text/javascript" src="js/core.js"></script>
<script type="text/javascript" src="js/jquery.dialog.js"></script>
<script type="text/javascript">
	$("#bd").height($(window).height() - $("#hd").outerHeight() - 26);

	$(window).resize(function(e) {
		$("#bd").height($(window).height() - $("#hd").outerHeight() - 26);

	});

	$('.exitDialog').Dialog({
		title : '提示信息',
		autoOpen : false,
		width : 400,
		height : 200
	});

	$('.exit').click(function() {
		$('.exitDialog').Dialog('open');
	});

	$('.exitDialog input[type=button]').click(function(e) {
		$('.exitDialog').Dialog('close');

		if ($(this).hasClass('ok')) {
			window.location = '${baseurl}loginout.action';
		}
	});

	(function() {
		var totalWidth = 0, current = 1;

		$.each($('.nav').find('li'), function() {
			totalWidth += $(this).outerWidth();
		});

		$('.nav').width(totalWidth);

		function currentLeft() {
			return -(current - 1) * 93;
		}

		$('.nav-btn a')
				.click(
						function(e) {
							var tempWidth = totalWidth
									- (Math.abs($('.nav').css('left')
											.split('p')[0]) + $('.nav-wrap')
											.width());
							if ($(this).hasClass('nav-prev-btn')) {
								if (parseInt($('.nav').css('left').split('p')[0]) < 0) {
									current--;
									Math
											.abs($('.nav').css('left').split(
													'p')[0]) > 93 ? $('.nav')
											.animate({
												'left' : currentLeft()
											}, 200) : $('.nav').animate({
										'left' : 0
									}, 200);
								}
							} else {

								if (tempWidth > 0) {

									current++;
									tempWidth > 93 ? $('.nav').animate({
										'left' : currentLeft()
									}, 200) : $('.nav').animate(
											{
												'left' : $('.nav').css('left')
														.split('p')[0]
														- tempWidth
											}, 200);
								}
							}
						});

		$.each($('.skin-opt li'), function(index, element) {
			if ((index + 1) % 3 == 0) {
				$(this).addClass('third');
			}
			$(this).css('background', $(this).attr('attr-color'));
		});

		$('.setting-skin').click(function(e) {
			$('.skin-opt').show();
		});

		$('.skin-opt').click(function(e) {
			if ($(e.target).is('li')) {
				alert($(e.target).attr('attr-color'));
			}
		});

		$('.hd-top .user-info .more-info').click(function(e) {
			$(this).toggleClass('active');
			$('.user-opt').toggle();
		});

		$('.logo-icon').click(function(e) {
			$(this).toggleClass('active');
			$('.system-switch').toggle();
		});

		hideElement($('.user-opt'), $('.more-info'), function(current, target) {

			$('.more-info').removeClass('active');
		});

		hideElement($('.skin-opt'), $('.switch-bar'));

		hideElement($('.system-switch'), $('.logo-icon'), function(current,
				target) {

			$('.logo-icon').removeClass('active');
		});

	})();

	//跳转 大屏幕
	function showPlan() {
		//window.open('${baseurl}plan/planLED.action', 'big', 'fullscreen=yes')
		window.open("${baseurl}plan/planLED.action");
	}
	//小看板 
	//剪板区
	function cutPlan() {
		window.open("${baseurl}plan/planDetail/cut.action");
	}
	function punchPlan() {
		window.open("${baseurl}plan/planDetail/punch.action");
	}
	function bendPlan() {
		window.open("${baseurl}plan/planDetail/bend.action");
	}
	function mfittingPlan() {
		window.open("${baseurl}plan/planDetail/mfitting.action");
	}
	function efittingPlan() {
		window.open("${baseurl}plan/planDetail/efitting.action");
	}

	function ffittingPlan() {
		window.open("${baseurl}plan/planDetail/ffitting.action");
	}
/* 机器人 */
	function robotOne() {
		window.open("${baseurl}robot/robot/IRB120多功能机器人1号.action");
	}
	function robotTwo() {
		window.open("${baseurl}robot/robot/IRB120多功能机器人2号.action");
	}
	function robotThree() {
		window.open("${baseurl}robot/robot/IRB120多功能机器人3号.action");
	}
	function robotFour() {
		window.open("${baseurl}robot/robot/IRB120多功能机器人4号.action");
	}
	function robotFive() {
		window.open("${baseurl}robot/robot/IRB120多功能机器人5号.action");
	}
	function robot() {
		window.open("${baseurl}robot/robot/IRB1410多功能机器人.action");
	}
</script>
</HTML>
