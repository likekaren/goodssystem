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
<title>工位生产数量统计</title>

<script src="${baseurl}/Highcharts-5.0.7/code/highcharts.js"></script> 
<script src="${baseurl}/Highcharts-5.0.7/code/modules/exporting.js"></script>
<script src="${baseurl}/Highcharts-5.0.7/code/themes/dark-unica.js"></script>
<script type="text/javascript">
$(function () {
	// 1.创建异步交互对象
	var xhr = createXmlHttp();
	// 2.设置监听
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				a= xhr.responseText;
			}
		}
	}
	// 3.打开连接
	xhr.open("GET","${baseurl}schedule/querystationcount.action",false);
	// 4.发送
	xhr.send(null);
	strs2=new Array();
	strs2=a.split(",");
	count=new Array();
	for (i = 0; i < strs2.length; i++) {
		count.push(Number(strs2[i]));
	}
	chart = Highcharts.chart('highcharts', {
        chart: {
            type: 'column'
        },
        title: {
            text: '工位生产数量统计'
        },
        subtitle: {
            text: '数据来源：在制品管理'
        },
        xAxis: {
            categories: [
                '剪板区',
                '冲压区',
                '折弯区',
                '机装区',
                '电装区',
                '总装区',
            ],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: '数量'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: '工位已完成数量',
            data: count ,
            color: 'green',
            negativeColor: 'green'
        }]
    });
});

function createXmlHttp(){
	   var xmlHttp;
	   try{ // Firefox, Opera 8.0+, Safari
	        xmlHttp=new XMLHttpRequest();
	    }
	    catch (e){
		   try{// Internet Explorer
		         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
		      }
		    catch (e){
		      try{
		         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
		      }
		      catch (e){}
		      }
	    }

		return xmlHttp;
	 }
	
</script>

<script type="text/javascript">
//设置异步动态刷新数据
function queryData(){
	// 1.创建异步交互对象
	var xhr = createXmlHttp();
	// 2.设置监听
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4){
			if(xhr.status == 200){
				a= xhr.responseText;
			}
		}
	}
	// 3.打开连接
	xhr.open("GET","${baseurl}schedule/querystationcount.action"+"?begintime="+begintimevalue+"&endtime="+endtimevalue,false);
	// 4.发送
	xhr.send(null);
	strs2=new Array();
	strs2=a.split(",");
	count=new Array();
	for (i = 0; i < strs2.length; i++) {
		count.push(Number(strs2[i]));
	}
	

}  

function t(){
	begintimevalue = $("#begintime").datebox('getValue');
	endtimevalue = $("#endtime").datebox('getValue');
	queryData();
	for (i= 0; i< count.length; i++) {
		chart.series[0].data[i].update(count[i]);
	}
}

</script>
</head>
<body>
		
		
		<!-- html的静态布局 -->
		<form id="queryForm" >
			<!-- 查询条件 -->
			<TABLE class="table_search"  align="center" >
				<TBODY>
					<TR>
						<TD class="left">开始时间：</TD>
							<td>
								<input class="easyui-datetimebox"    id="begintime"
								name="procedurecodingCustom.begintime" value="${procedurecodingCustom.begintime}"
								style="width:200px; height:35px;">
								</input>
								
							</td>
						<td>
						<TD class="left">结束时间：</TD>
							<td>
								<input class="easyui-datetimebox"  type="text" id="endtime"
								name="procedurecodingCustom.endtime" value="${procedurecodingCustom.endtime}"
								style="width:200px; height:35px;">
								</input>
							</td>
						<td>
							<div class="search-button">
								<input class="button" onclick="t()" type="button"
									value="查询" />
							</div>
				</TBODY>
			</TABLE>
		</form>
	<div class="demo" id="highcharts" style="height:640px"></div>
</body>
</html>