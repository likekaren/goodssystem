<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
}

body {
	background: url(${baseurl}img/bg.png) no-repeat;
	width: 100%;
	height: 100%;
	background-size: 100% 100%;
	position: absolute;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(src='img/bg4.png',
		sizingMethod='scale');
}

.welcome {
	width: 80%;
	height: 50px;
	text-align: center;
	line-height: 50px;
	margin: 0 auto;
	margin-top: 55px;
	color: yellow;
	font-size: 60px;
}

.error-info {
	width: 15%;
	height: 30px;
	float: right;
	margin-top: 40%;
	text-align: center;
	line-height: 30px;
}
</style>
<body>

	<!--<h4></h4>-->
	<div class="welcome">新疆昌吉职业技术学院欢迎您!</div>

	<div class="error-info">${exceptionResultInfo}</div>
</body>
</html>


