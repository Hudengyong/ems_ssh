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
	<!-- 数据表格 -->
	<table id="deptTab" class="easyui-datagrid"></table>
	
	
	<!-- 数据表格的工具栏 -->
	<div id="tb">
		<a href="javascript:" onclick="doAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a href="javascript:doEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a href="javascript:doDel()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<span style="line-height: 30px;margin-left: 30px">
			部门名称:
			<input class="easyui-textbox" name="dname">
		</span>
		<span style="line-height: 30px;margin-left: 10px">
			部门所在地:
			<input class="easyui-textbox" name="location">
		</span>
		<a href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'"
		 onclick="doSearch()">查询</a>
	</div>
	
	<!-- 添加部门的窗口 -->
	<div id="addDeptWindow" class="easyui-window" icon="icon-save"
		style="width: 300px; height: 160px; padding: 5px; background: #fafafa;top: 100px;left: 400px">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<table cellpadding=3>
					 <input type="hidden" name="id" id="id">
					<tr>
						<td>部门名称：</td>
						<td><input id="dname" name="dname" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td>部门所在地：</td>
						<td><input id="location" name="location" class="easyui-textbox" /></td>
					</tr>
				</table>
			</div>
			<div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
				<a id="btnEp" class="easyui-linkbutton" icon="icon-ok"  href="javascript:addDept()">确定</a> 
				<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:">取消</a>
			</div>
		</div>
	</div>
	<!-- 编辑部门窗口 -->
	<div id="editDeptWindow" class="easyui-window" icon="icon-save"
		style="width: 300px; height: 160px; padding: 5px; background: #fafafa;top: 100px;left: 400px">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<form id="editDept">
					<table cellpadding=3>
						 <input type="hidden" name="id" id="id_edit">
						<tr>
							<td>部门名称：</td>
							<td><input id="dname_edit" name="dname" class="easyui-textbox" /></td>
						</tr>
						<tr>
							<td>部门所在地：</td>
							<td><input id="location_edit" name="location" class="easyui-textbox" /></td>
						</tr>
					</table>
				</form>
			</div>
			<div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
				<a id="btnEp" class="easyui-linkbutton" icon="icon-ok"  href="javascript:editDept()">确定</a> 
				<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:">取消</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		$("#deptTab").datagrid({
			url:'${pageContext.request.contextPath}/dept_listAllDept',
			columns:[[
						{"field":'id','hidden':true	},
			          {"field":'deptno',"title":'编号',checkbox:true},
			          {"field":'dname',"title":'部门名称',"width":150,"align":"center"},
			          {"field":'location',"title":'部门所在地',"width":500,"align":"center"}
			          
			          ]],
	        rownumbers:true,
	        toolbar:"#tb",
	      	 pagination:true,
	      	pageSize: 10,
	      	pageList: [5,10,15]
		});
		//添加部门的窗口
		$('#addDeptWindow').window({
	        title: '添加部门',
	        collapsible:"false",
	        minimizable:"false",
	        modal: true,
	        shadow: true,
	        closed: true,
	        resizable:false,
	        maximizable:false,
	    });
		$('#editDeptWindow').window({
	        title: '编辑部门',
	        collapsible:"false",
	        minimizable:"false",
	        modal: true,
	        shadow: true,
	        closed: true,
	        resizable:false,
	        maximizable:false,
	    });
		 
	});
	//添加部门
	function doAdd(){
		$("#addDeptWindow").window('open');
	}
	function addDept(){
		var dname=$('#dname').val();
		var location=$("#location").val();
		
		$.post("${pageContext.request.contextPath}/dept_AddDept",{"dname":dname,"location":location},function(data){
			$("#addDeptWindow").window('close');
			if(data.isSuccessAdd){
				alert("添加成功");								
			}else{
				alert("添加失败");
			}
			$("#deptTab").datagrid('reload');
		},"json");
	}
	function doEdit(){
		var rows=$("#deptTab").datagrid('getSelections');
		if(rows.length==0){
			$.messager.alert("修改部门","请选择修改行数");	
		}else if(rows.length>1){
			$.messager.alert("修改部门","选择行数过多，请选择重新选择");	
		}else{
			var row=$("#deptTab").datagrid('getSelected');
			$("#editDeptWindow").window('open');
			$("#editDept").form('load',row);
		}
	}
	function editDept(){
		
		var dname=$('#dname_edit').val();
		var location=$("#location_edit").val();
		var id=$("#id_edit").val();
		$.post("${pageContext.request.contextPath}/dept_editDept",{"dname":dname,"location":location,"id":id},function(data){
			$("#editDeptWindow").window('close');
			if(data.isSuccessEdit){
				$.messager.alert("修改部门","修改成功");								
			}else{
				$.messager.alert("修改部门","修改失败，请重试");	
			}
			$("#deptTab").datagrid('reload');
		},"json");
	}
	
	function doDel(){
		var rows=$("#deptTab").datagrid('getSelections');
		var deptIds=[];
		for(var i=0;i<rows.length;i++){
			deptIds.push(rows[i].id);
		}
		var deptIdsStr=deptIds.join("-");
		$.post("${pageContext.request.contextPath}/dept_delDept",{"deptIdsStr":deptIdsStr},function(data){
			if(data.isSuccessDel){
				$.messager.alert("删除部门","删除成功");	
			}else{
				$.messager.alert("删除部门","修改失败，请先将该部门下的员工数据删除，然后再删除部门");	
			}
			$("#deptTab").datagrid('reload');
		},"json")
	}
</script>
</html>