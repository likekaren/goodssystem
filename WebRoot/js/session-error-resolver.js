//在前端 解决 session 过期的问题
$.ajaxSetup({
	complete : function(XMLHttpRequest, textStatus) {
		if (textStatus == "parsererror") {
			$.messager.alert('提示信息', "登陆超时！请重新登陆！", 'info', function() {

				// window.location='${baseurl}first.action';
				if (parent.parent.parent) {
					// 让最外层页面执行跳转
					parent.parent.parent.location = '${baseurl}login.action';
				} else if (parent.parent) {
					parent.parent.location = '${baseurl}login.action';
				} else if (parent) {
					parent.location = '${baseurl}login.action';
				} else {
					window.location = '${baseurl}login.action';
				}
			});
		} else if (textStatus == "error") {
			$.messager.alert('提示信息', "请求超时！请稍后再试！", 'info');
		}
	}
})
