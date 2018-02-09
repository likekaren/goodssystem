<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
  <%--   <%@ include file="/WEB-INF/jsp/base/common_js.jsp"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7"/>
 	<link rel="stylesheet" type="text/css" href="${baseurl}css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${baseurl}css/skin_/login.css"/>
   <script type="text/javascript" src="${baseurl}js/jquery.js"></script>
    <script type="text/javascript" src="${baseurl}js/jquery.select.js"></script>
<title>新疆昌吉职业技术学院柜体智能制造生产线MES系统</title>
</head>
<div id="container">
    <div id="bd">
        <div id="main">
            <div class="login-box">
                <FORM id="loginform" name="loginform" method="post"
                     >
                <div id="logo"></div>
                <h1></h1>
                <div class="input username" id="usercode">
                    <label for="userName">用户名</label>
                    <span></span>
                   <input type="text" id="username" name="username" style="font-size: 18px" />
                </div>
                <div class="input psw" id="psw">
                    <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                    <span></span>
                   <input type="password" id="password" name="password" style="font-size: 18px"/>
                </div>
                
                <div class="input validate" id="validate"  >
                    <label for="valiDate">验证码</label>
                    <input type="text" id="valiDate" name = "randomcode" style="font-size: 18px"/>
                    <div class="value" id="valiDateValue" onclick="randomcode_refresh()"></div>
                </div>
                
                <div class="styleArea" id="userNameError">${userNameError}</div>
                <div class="styleArea2" id="passwordError">${pswError}</div>
                <div class="styleArea2" id="valiDateError">${codeError}</div>
                <div id="btn" class="loginButton">
                    <input type="button" class="button" value="登录" />
                </div>
                </FORM>
            </div>
        </div>
        <div id="ft">湖北工业大学  武汉天之逸科技有限公司 研制   Copyright © 2017</div>
    </div>

</div>
</body>
<script type="text/javascript">
randomcode_refresh();
function  randomcode_refresh() {
	$.ajax({
	    type: "GET",
	    url:${baseurl}+'ValiDate.action',
	    success: function (date) {
	    	 var valiDateValue = $("#valiDateValue");
	    	 valiDateValue.text(date).css({"font-size": "20px"});
	    }
	});
}



    var height = $(window).height() > 445 ? $(window).height() : 445;
    $("#container").height(height);
    var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
    $('#bd').css('padding-top', bdheight);
    $(window).resize(function (e) {
        var height = $(window).height() > 445 ? $(window).height() : 445;
        $("#container").height(height);
        var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
        $('#bd').css('padding-top', bdheight);
    });
    $('select').select();

    $(function () {
        // 登录验证
        $('.loginButton').click(function(e) {

            // 做表单输入校验
            var username = $("#username");
            var password = $("#password");
            var name = $.trim(username.val());
            var pwd = $.trim(password.val());
            var userNameError = $("#userNameError");
            var passwordError = $("#passwordError");
            var valiDateError = $("#valiDateError");

            var valiDate = $("#valiDate");
            var validate = $.trim(valiDate.val());

            var msg = "";
            if (name == "") {
                msg = "用户名不能为空!";
                userNameError.text(msg).css({color: "red", "font-size": "15px"});
                return false;
            } else if (pwd == "") {
                userNameError.text('');
                msg = "密码不能为空！";
                passwordError.text(msg).css({color: "red", "font-size": "15px"});
                return false;
            }
            else if (validate == "") {
                userNameError.text('');
                passwordError.text('');
                msg = "验证码不能为空！";
                valiDateError.text(msg).css({color: "red", "font-size": "15px"});
                return false;
            }
            $("#loginform").submit();
        });
        // 为document绑定onkeydown事件监听是否按了回车键
        $(document).keydown(function (event) {
            if (event.keyCode === 13) { // 按了回车键
                $(".loginButton").trigger("click");
            }
        });
    });
</script>

</html>
