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
		console.log("返回结果" + data);
		message_alert(data);
		//如果成功，自动关闭
		if (data.resultInfo.type == '1') {
			//延迟1秒执行关闭方法
			setTimeout("toqueryprocedurecoding()", 1000);
		}
	}
	//回 角色显示页面
	function toqueryprocedurecoding() {
		if (parent.parent.parent) {
			//让第二层页面执行跳转
			parent.location = '${baseurl}procedurecoding/queryprocedurecoding.action?pc=bend';
		}
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
					a = xhr.responseText;
					tt =t();
					name = document.getElementById("un").value;
					if (a!=null&&a!="") {
						$("#cut").append(a+"</td><td width=‘120’>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.pc' value=折弯>"+"</td><td width=‘120’>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.countnum' value=1>"+"</td><td width=‘120’>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.finishtime' value="+"\""+tt+"\""+"/>"+"</td>"+"<td width=‘120’>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.operator' value="+"\""+name+"\""+"/>"+"<td width=‘120’><input type='button' value='删除' onclick='deleteRow(this)'></td>"+"</tr>");
						document.getElementById("focus").value=null;
						a=null;
					}
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${baseurl}procedurecoding/requirenamebycode.action?time="+new Date().getTime()+"&code="+code,true);
		// 4.发送
		xhr.send(null);
	}
	
	function procedurecodingadd(){
		if (a!=null&&a!="") {
			$("#cut").append(a+"</td><td>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.pc' value=折弯>"+"</td><td>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.countnum' value=1>"+"</td><td>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.finishtime' value="+"\""+tt+"\""+"/>"+"</td>"+"<td>"+"<input readonly='readonly' style='border:0'  type='text' name='procedurecodingCustom.operator' value="+"\""+name+"\""+"/>"+"<td><input type='button' value='删除' onclick='deleteRow(this)'></td>"+"</tr>");
		}
	}
	
	function deleteRow(r)
	  {
	  var i=r.parentNode.parentNode.rowIndex
	  document.getElementById('cut').deleteRow(i)
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
		return tt;
	}
	
	window.onload = function(){
		document.getElementById("focus").focus();
	}
	
	//绑定回车键
	  function BindEnter() {
		  if (event.keyCode == 13) {
		      event.cancelBubble = true;
		      event.returnValue = false;
		      procedurecodingadd();
		    }
		 }
</script>
</head>
<body>
	<form id="procedurecodingform" action="${baseurl}procedurecoding/addprocedurecodingsubmit.action"
		method="post">
		<!-- 更新在制品的id -->
		<input   type="hidden" name="procedurecodingCustom.id" value="${procedurecodingCustom.id}"   />
		<table cellpadding="5">
					<tr>
						<td ><input  id="un" type="hidden"  value="${activeUser.username}"
								style="height: 35px;"></input></td>
					</tr>
		
				<tr>
					<td>请扫码:</td>
                    <td><input  type="text" id="focus"
                         value="${procedurecodingCustom.materielcoding}"
                        style="height: 28px;" oninput="checkcode()" onkeypress="BindEnter()"></input></td>
                        
					</td>
				</tr>
		</table>
		<table width="840"  id="cut"  border="0"  style="border:1px solid #000000;" cellpadding="0"cellspacing="0">
				<tr >
					<td width="120">条码号</td>
					<td width="120">名称</td>
					<td width="120">作业区域</td>
					<td width="120">数量</td>
					<td width="120">作业时间</td>
					<td width="120">作业人员</td>
					<td width="120">删除</td>
				</tr>
		 	</table>
		 	<table>
				<tr align="center">
					<td colspan=4 align=right class=category><a id="submitbtn"
						style="margin-left: 200px" class="easyui-linkbutton"
						iconCls="icon-ok" href="#" onclick="procedurecodingsave()">保存</a> <a
						id="closebtn" style="margin-left: 200px" class="easyui-linkbutton"
						iconCls="icon-cancel" href="#" onclick="parent.closemodalwindow()">取消</a>
					</td>
				</tr>
			</table>
	</form>
</body>
</html>