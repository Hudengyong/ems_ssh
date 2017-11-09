<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工管理系统</title>
<!-- 导入jquery核心类库 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.3.js"></script>
<!-- 导入easyui类库 -->
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/css/default.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<!-- 导入ztree类库 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/js/ztree/zTreeStyle.css"
	type="text/css" />
<script
	src="${pageContext.request.contextPath }/js/ztree/jquery.ztree.all-3.5.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		//页面加载完成后，执行这段代码----动态创建ztree
		var setting = {
			data : {
				simpleData : {
					enable : true
				//使用简单json数据构造ztree节点
				}
			},
			callback : {
				//为ztree节点绑定单击事件
				onClick : function(event, treeId, treeNode) {
					if (treeNode.page != undefined) {
						//判断选项卡是否已经存在
						var e = $("#tabs").tabs("exists", treeNode.name);
						if (e) {
							//已经存在，选中
							$("#tabs").tabs("select", treeNode.name);
						} else {
							//如果点击的是子节点,动态添加一个选项卡
							if (treeNode.page!='') {
								$("#tabs").tabs("add",{
									title : treeNode.name,
									closable : true,
									content : '<iframe frameborder="0" height="100%" width="100%" src="'+ treeNode.page + '"></iframe>'
								});
							}
						}
					}
				}
			}
		};

		//发送ajax请求，获取json数据
		var url = "${pageContext.request.contextPath}/json/menu.json";
		$.post(url, {}, function(data) {
			//调用API初始化ztree
			$.fn.zTree.init($("#treeMenu"), setting, data);
		}, 'json');
		
		//*******************修改密码****************
		// 点击取消
		$("#btnCancel").click(function(){
			$('#editPwdWindow').window('close');
		});
		// 点击确定
		$("#btnEp").click(function(){
			alert("修改密码");
		});
		
	});
	
	// 退出登录
	function logoutFun() {
		$.messager
		.confirm('系统提示','您确定要退出本次登录吗?',function(isConfirm) {
			if (isConfirm) {
				location.href = '${pageContext.request.contextPath }/login.jsp';
			}
		});
	}
	// 修改密码
	function editPassword() {
		$('#editPwdWindow').window('open');
	}
	
	//联系管理员
	function showAbout(){
		$.messager.alert("澳门皇冠员工管理系统","管理员邮箱: xiecheng310@yeah.net");
	}
	
</script>

</head>

<body class="easyui-layout">
	<!-- 北部 -->
	<div data-options="region:'north',border:false"
		style="height: 80px; padding: 10px; background: url('${pageContext.request.contextPath}/images/header_bg.png') no-repeat right;">
		<div id="sessionInfoDiv"
			style="position: absolute; right: 5px; top: 10px;">
			[<strong>${loginUser.username }</strong>]，欢迎你！
		</div>
		<div style="position: absolute; right: 5px; bottom: 10px;">
			<a href="javascript:void(0);" class="easyui-menubutton"
				data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
		</div>
		<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
			<div onclick="editPassword();">修改密码</div>
			<div onclick="showAbout();">联系管理员</div>
			<div class="menu-sep"></div>
			<div onclick="logoutFun();">退出系统</div>
		</div>
	</div>
	<!-- 西部 -->
	<div data-options="region:'west',split:true,title:'菜单导航'"
		style="width: 200px">
		<div class="easyui-accordion" fit="true" border="false">
			<div title="基本功能" data-options="iconCls:'icon-mini-add'"
				style="overflow: auto">
				<ul id="treeMenu" class="ztree"></ul>
			</div>
			<div title="系统管理" data-options="iconCls:'icon-mini-add'"
				style="overflow: auto">
				<ul id="adminMenu" class="ztree"></ul>
			</div>
		</div>
	</div>
	<!-- 中心区域 -->
	<div data-options="region:'center'">
		<div id="tabs" fit="true" class="easyui-tabs" border="false">
			<div title="个人中心" id="subWarp" style="width: 100%; height: 100%; overflow: hidden">
				
			</div>
		</div>
	</div>
	<!-- 南部区域 -->
	<div data-options="region:'south',border:false"
		style="height: 50px; padding: 10px; background: url('${pageContext.request.contextPath}/images/header_bg.png') no-repeat right;">
		<table style="width: 100%;">
			<tbody>
				<tr>
					<td style="width: 300px;">
						<div style="color: #999; font-size: 8pt;">百杰139部 | Powered
							by jQuery EasyUI</div>
					</td>
					<td class="co1"><span id="online"
						style="background: url('${pageContext.request.contextPath}/images/online.png') no-repeat left; padding-left: 18px; margin-left: 3px; font-size: 8pt; color: #005590;">在线人数:1</span></td>
				</tr>
			</tbody>
		</table>
	</div>

	<!--修改密码窗口-->
	<div id="editPwdWindow" class="easyui-window" title="修改密码"
		collapsible="false" minimizable="false" modal="true" closed="true"
		resizable="false" maximizable="false" icon="icon-save"
		style="width: 300px; height: 160px; padding: 5px; background: #fafafa">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<table cellpadding=3>
					<tr>
						<td>新密码：</td>
						<td><input id="txtNewPass" type="Password" class="txt01" /></td>
					</tr>
					<tr>
						<td>确认密码：</td>
						<td><input id="txtRePass" type="Password" class="txt01" /></td>
					</tr>
				</table>
			</div>
			<div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
				<a id="btnEp" class="easyui-linkbutton" icon="icon-ok"
					href="javascript:void(0)">确定</a> <a id="btnCancel"
					class="easyui-linkbutton" icon="icon-cancel"
					href="javascript:void(0)">取消</a>
			</div>
		</div>
	</div>
</body>

</html>