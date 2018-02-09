<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${baseurl}/jEasyUIcustom/uimaker/icon.css">

<title>添加维修保养记录</title>
<script type="text/javascript">
	function maintenancesave() {
		//准备使用jquery 提供的ajax Form提交方式
		//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
		//使用ajax form提交时，不用指定url，url就是form中定义的action
		//此种方式和原始的post方式差不多，只不过使用了ajax方式

		//第一个参数：form的id
		//第二个参数：maintenancesave_callback是回调函数，maintenancesave_callback当成一个方法的指针
		//第三个参数：传入的参数， 可以为空
		//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
		//根据form的id找到该form的action地址
		jquerySubByFId('maintenanceform', maintenancesave_callback, null, "json");

	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function maintenancesave_callback(data) {

		message_alert(data);
		//如果成功自动关闭
		if(data.resultInfo.type == "1"){
			// 设置延迟关闭
			setTimeout("close()",1000);
		}
		
	}
	
	//回显页面
	function close(){
		if(parent.parent.parent){
			parent.location="${baseurl}maintenance/querymaintenance.action";
		}
	}
	
	//点击弹窗聚焦
	 window.onload = function (){
			var autoblur = 	document.getElementById("auto");
			autoblur.focus();
			
	}
	
		
	//获取随机数 记录编号
	window.onload = function m(){
   		    var now = new Date();
		    var str = now.getFullYear().toString()+(now.getMonth()+1).toString()+now.getDate().toString()+
		    					+ (Math.round(Math.random()*10000+10000)).toString();
		    document.getElementById('nid').value = str;
		
	}
	
	// 获取当前时间 js
	function t(){
		var now= new Date();
		var y=now.getFullYear();
		var mo=now.getMonth()+1
		mo=mo< 10 ? '0' + mo : mo;
		var da=now.getDate()
		da=da< 10 ? '0' + da : da;
		var h=now.getHours()
		h=h< 10 ? '0' + h : h;
		var m=now.getMinutes()
		m=m< 10 ? '0' + m : m;
		var s=now.getSeconds()
		s=s< 10 ? '0' + s : s;
		
		var tt=y+"-"+mo+"-"+da+" "+h+":"+m+":"+s;
		document.getElementById("time").value=tt;
	}
	// 刷新时间
	setInterval('t()',500);
	
</script>
</head>
<body>
	<form id="maintenanceform" action="${baseurl}maintenance/addmaintenancesubmit.action"
		method="post">
		<!-- 更新在制品的id -->
		<input type="hidden" name="id" value="${maintenanceCustom.id}" />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>记录编号:</td>
					<td><input   type="text"  id="nid"
						name="maintenanceCustom.id" value="${maintenanceCustom.id}"
						style="height: 35px;" id="auto"></input></td>

					<td>名称:</td>
					<td>
					<select name="maintenanceCustom.toolname" required style="width:162px; height: 35px;" >
							<option value="">----请选择名称---</option>
							<c:forEach items="${equList }" var="equ">
									<option  value="${equ.toolname }" >${equ.toolname }</option>
							</c:forEach>
					</select>
						</td>
						
					<td>规格型号:</td>
					<td>
					<select name="maintenanceCustom.specifications" required style="width:162px; height: 35px;" >
							<option value="">----请选择名称---</option>
							<c:forEach items="${equList }" var="equ">
									<option  value="${equ.specifications }" >${equ.specifications }</option>
							</c:forEach>
					</select>
						</td>
				</tr>
				<tr>
					<td>维修保养时间:</td>
					<td><input   type="text" id="time"
						name="maintenanceCustom.mtime" value="${maintenanceCustom.mtime}"
						style="height: 35px;"></input></td>

					<td>维修人员:</td>
					<td><input class="easyui-textbox" type="text"
						name="maintenanceCustom.person" value="${activeUser.username}"
						style="height: 35px;"></input></td>
						
				</tr>
				</table>
				<table >
				<tr>
					<td>维修保养内容:</td>
					<td><textarea  type="text"
						name="maintenanceCustom.note" value="${maintenanceCustom.note}"
						style="width:670px;  height: 80px;"></textarea></td>
			</tr>
			</table>
				<table align="center">
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="maintenancesave()">保存</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>