<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.js"></script>
<!-- 导入easyui类库 -->
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js" type="text/javascript"></script>
</head>
<body>
	<div style="margin: 10px auto;width: 360px">
		<h1 style="margin: 10px auto">极其漂亮的EMS登录页面</h1>
	</div>
	
	<div id="loginWin" class="easyui-window" title="登录" top="10"
		style="width: 350px; height: 188px; padding: 5px; margin: 0 auto" minimizable="false"
		maximizable="false" resizable="false" collapsible="false">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 5px; background: #fff; border: 1px solid #ccc;">
				<form id="loginForm" method="post" action="${pageContext.request.contextPath }/user_loginUser">
					<div style="padding: 5px 0;">
						<label for="login">帐号&nbsp;&nbsp;</label> 
						<input class="easyui-textbox" type="text" name="name" style="width: 260px;"></input>
					</div>
					<div style="padding: 5px 0;">
						<label for="password">密码&nbsp;&nbsp;</label> 
						<input class="easyui-textbox" type="password" name="password" style="width: 260px;"></input>
					</div>
					<div style="padding: 5px 0; text-align: center; color: red;" id="showMsg">${hite }</div>
				</form>
			</div>
			<div region="south" border="false"
				style="text-align: right; padding: 5px 0;">
				<a class="easyui-linkbutton" iconCls="icon-ok" href="javascript:void(0)" onclick="login()">登录</a> 
				<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:void(0)" onclick="cleardata()">重置</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("input[name='username']").focus();
	});
	function cleardata() {
		$('#loginForm').form('clear');
	}
	function login(){
		$('#loginForm').submit();
	}
</script>
</html>