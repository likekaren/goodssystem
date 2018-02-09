<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}css/skin_/table.css" />
<title>生产计划统计</title>

<script src="${baseurl}/Highcharts-5.0.7/code/highcharts.js"></script>
<script src="${baseurl}/Highcharts-5.0.7/code/modules/exporting.js"></script>
<script src="${baseurl}/Highcharts-5.0.7/code/themes/dark-unica.js"></script>
<script type="text/javascript">
	$(function() {
		var ctypeidvalue = document.form1.ctypeid.value;
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					a = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET", "${baseurl}schedule/querybom.action?ctypeid="+ctypeidvalue, false);
		// 4.发送
		xhr.send(null);
		strs = new Array();
		strs = a.split(",");

		var xhr1 = createXmlHttp();
		// 2.设置监听
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4) {
				if (xhr1.status == 200) {
					b = xhr1.responseText;
				}
			}
		}
		// 3.打开连接
		xhr1.open("GET", "${baseurl}schedule/querycount.action?ctypeid="+ctypeidvalue, false);
		// 4.发送
		xhr1.send(null);
		c = b.split("#");
		count = new Array();
		count = c[0].split(",");
		count2 = new Array();
		for (i = 0; i < count.length; i++) {
			var array_element = count[i];
			var num = Number(array_element);
			count2.push(num);
		}

		count3 = new Array();
		count3 = c[1].split(",");
		count4 = new Array();
		for (i = 0; i < count3.length; i++) {
			var array_element = count3[i];
			var num = Number(array_element);
			count4.push(num);
		}

		chart = Highcharts
				.chart(
						'highcharts',
						{
							chart : {
								type : 'bar',
							},
							title : {
								text : '生产进度统计'
							},
							subtitle : {
								text : '数据来源: 在制品管理'
							},
							xAxis : {
								categories : strs,
								title : {
									text : null
								}
							},
							yAxis : {
								min : 0,
								title : {
									text : '数量',
									align : 'high'
								},
								labels : {
									overflow : 'justify'
								}
							},
							tooltip : {
								valueSuffix : '件'
							},
							plotOptions : {
								bar : {
									dataLabels : {
										enabled : true
									}
								}
							},
							legend : {
								layout : 'vertical',
								align : 'right',
								verticalAlign : 'top',
								x : -40,
								y : 100,
								floating : true,
								borderWidth : 1,
								backgroundColor : ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
								shadow : true
							},
							credits : {
								enabled : false
							},
							series : [ {
								name : '已完成的数量',
								data : count2,
								color : 'green',
								negativeColor : 'green'
							}, {
								name : '总数',
								data : count4,
								color : 'red',
								negativeColor : 'red'
							} ]
						});
	});

	function createXmlHttp() {
		var xmlHttp;
		try { // Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {// Internet Explorer
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}

		return xmlHttp;
	}
</script>
<script type="text/javascript">
	//设置异步动态刷新数据
	function queryData() {
		// 1.创建异步交互对象
		var ctypeidvalue = document.form1.ctypeid.value;
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					a = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET", "${baseurl}schedule/querybom.action?ctypeid="+ctypeidvalue, false);
		// 4.发送
		xhr.send(null);
		strs = new Array();
		strs = a.split(",");
		var xhr1 = createXmlHttp();
		// 2.设置监听
		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4) {
				if (xhr1.status == 200) {
					b = xhr1.responseText;
				}
			}
		}
		// 3.打开连接
		xhr1.open("GET", "${baseurl}schedule/querycount.action?ctypeid="+ctypeidvalue, false);
		// 4.发送
		xhr1.send(null);
		c = b.split("#");
		count = new Array();
		count = c[0].split(",");
		count2 = new Array();
		for (i = 0; i < count.length; i++) {
			var array_element = count[i];
			var num = Number(array_element);
			count2.push(num);
		}
		count3 = new Array();
		count3 = c[1].split(",");
		count4 = new Array();
		count4=[];
		for (i = 0; i < count3.length; i++) {
			var array_element = count3[i];
			var num = Number(array_element);
			count4.push(num);
		}
		
	}

	function t() {
		queryData();
		chart.xAxis[0].setCategories(strs);
		chart.series[0].setData(count2);
		chart.series[1].setData(count4);
	}
	
	
	function search(){
	var ctypeidvalue = document.form1.ctypeid.value;
	t();
}
	// 刷新时间
	//setInterval('t()', 30000);
	
</script>
</head>
<body>
	
		<!-- html的静态布局 -->
		<form id="queryForm" name="form1">
			<!-- 查询条件 -->
			<TABLE class="table_search"  align="center" >
				<TBODY>
					<TR>
						<TD class="left">柜体类型：</TD>
							<td>
								<select  name="ctypeid"  style="width:162px; height: 35px;">
								 <c:forEach items="${ctypeList}" var="ct">
								 	<option value="${ct.id}">${ct.cname}</option>
								 </c:forEach>
								</select>
							</td>
						<td>
							<div class="search-button">
								<input class="button" onclick="search()" type="button"
									value="查询" />
							</div>
				</TBODY>
			</TABLE>
		</form>
	<div class="demo" id="highcharts" style="height: 780px"></div>

</body>
</html>