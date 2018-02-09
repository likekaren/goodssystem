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

<title>添加在制品</title>
<script type="text/javascript">
	function procedurecodingsave() {
		//准备使用jquery 提供的ajax Form提交方式
		//将form的id传入，方法自动将form中的数据组成成key/value数据，通过ajax提交，提交方法类型为form中定义的method，
		//使用ajax form提交时，不用指定url，url就是form中定义的action
		//此种方式和原始的post方式差不多，只不过使用了ajax方式

		//第一个参数：form的id
		//第二个参数：procedurecodingsave_callback是回调函数，procedurecodingsave_callback当成一个方法的指针
		//第三个参数：传入的参数， 可以为空
		//第四个参数：dataType预期服务器返回的数据类型,这里action返回json
		//根据form的id找到该form的action地址
		jquerySubByFId('procedurecodingform', procedurecodingsave_callback, null, "json");

	}
	//ajax调用的回调函数，ajax请求完成调用此函数，传入的参数是action返回的结果
	function procedurecodingsave_callback(data) {

		message_alert(data);
	}
	
	
	// 获取当前时间 js
	function t(){
		var now= new Date();
		var y=now.getFullYear();
		var mo=now.getMonth()+1;
		var da=now.getDate();
		var h=now.getHours();
		var m=now.getMinutes();
		var s=now.getSeconds();
		
		var tt=y+"/"+mo+"/"+da+"  "+h+":"+m+":"+s;
		document.getElementById("time").value=tt;
	}
	// 刷新时间
	setInterval('t()',500);
	
	window.onload = function(){
		document.getElementById("focus").focus();
	}
	
	//异步获取
	function checkcode(){
		// 获得文件框值:
		var code = document.getElementById("focus").value;
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("mname").value = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${baseurl}procedurecoding/requirenamebycode.action?time="+new Date().getTime()+"&code="+code,true);
		// 4.发送
		xhr.send(null);
	}
	
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
</head>
<body>
	<form id="procedurecodingform" action="${baseurl}procedurecoding/addprocedurecodingsubmit.action"
		method="post">
		<!-- 更新在制品的id -->
		<input   type="hidden" name="procedurecodingCustom.id" value="${procedurecodingCustom.id}"   />
		<TBODY>
			<table cellpadding="5">
				<tr>
					<td>编码:</td>
					<td><input  type="text"	id="focus"
						name="procedurecodingCustom.materielcoding" value="${procedurecodingCustom.materielcoding}"
						style="height: 28px;" onkeyup="checkcode()" ></input></td>
					<td>名称:</td>
					<td><input id="mname" type="text"
						name="procedurecodingCustom.mname" value="${procedurecodingCustom.mname}"
						style="height: 35px;"></input></td>
					<td>作业区域:</td>
					<td>
						<input  
						name="procedurecodingCustom.pc" value="${ procedurecodingCustom.pc }"
						style="height: 35px; width:157px" />
					
						</td>
				</tr>
				<tr>	
					<td>数量:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.countnum" value="1"
						style="height: 35px;" readonly="readonly"></input></td>
					<td>作业时间:</td>
					<td><input  type="text"  id="time"
						name="procedurecodingCustom.finishtime" value="${procedurecodingCustom.finishtime}"
						style="height: 35px;"></input></td>
					<td>作业人员:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.operator" value="${activeUser.username}"
						style="height: 35px;"></input></td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><input class="easyui-textbox" type="text"
						name="procedurecodingCustom.remark" value="${procedurecodingCustom.remark}"
						style="height: 35px;"></input></td>
		 		</tr>
		 		
				<tr>
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="procedurecodingsave()">保存</a> <a
						id="closebtn" style="margin-left: 100px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>