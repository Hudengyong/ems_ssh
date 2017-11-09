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
	<table id="empTab"></table>
	<div id="tb">
		<a href="javascript:" onclick="doAdd()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a href="javascript:doEdit()" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true">修改</a>
		<a href="javascript:doDel()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
		<span style="line-height: 30px;margin-left: 30px">
			员工姓名:
			<input class="easyui-textbox" name="ename" id="queryEname">
		</span>
		<span style="line-height: 30px;margin-left: 10px">
			员工所在部门:
			<input id="queryDept" name="deptno">
		</span>
		<a href="#" class="easyui-linkbutton" plain="true" data-options="iconCls:'icon-search'"
		 onclick="doSearch()">查询</a>
	</div>
	
	<!-- 添加员工窗口 -->
	<div id="addEmpWindow" class="easyui-window" icon="icon-save"
		style="width: 300px; height: 160px; padding: 5px; background: #fafafa;top: 100px;left: 400px">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<form id="addEmpTb">
				<table cellpadding=3>
					<input type="hidden" name="eid">
					<tr>
						<td>姓名：</td>
						<td><input name="ename" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<input type="radio" name="gender" value="male"/>男
							<input type="radio" name="gender" value="famale"/>女
						</td>
					</tr>
					<tr>
						<td>身份证号码：</td>
						<td><input name="idcode" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td>职位：</td>
						<td>
							<input class="easyui-combobox" name="jobid" 
							data-options="valueField:'jobid',textField:'jobname',url:'${pageContext.request.contextPath }/json/job.json'">
						</td>
					</tr>
					<tr>
						<td>工资：</td>
						<td>
							<input type="text" name="sal" class="easyui-numberbox" data-options="min:0,precision:2,prefix:'￥'"></input>  
						</td>
					</tr>
					<tr>
						<td>奖金：</td>
						<td>
							<input type="text" name="comm" class="easyui-numberbox" data-options="min:0,precision:2,prefix:'￥'"></input>  
						</td>
					</tr>
					<tr>
						<td>所属部门：</td>
						<td>
							<input class="easyui-combobox" name="deptno" 
							data-options="valueField:'id',textField:'dname',url:'${pageContext.request.contextPath }/dept_listAllDept'">
						</td>
					</tr>
				</table>
				</form>
			</div>
			<div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
				<a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:addEmp()">确定</a> 
				<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:">取消</a>
			</div>
		</div>
	</div>
	<!-- 修改员工信息 -->
	<div id="editEmpWindow" class="easyui-window" icon="icon-save"
		style="width: 300px; height: 160px; padding: 5px; background: #fafafa;top: 100px;left: 400px">
		<div class="easyui-layout" fit="true">
			<div region="center" border="false"
				style="padding: 10px; background: #fff; border: 1px solid #ccc;">
				<form id="editEmpTb">
				<table cellpadding=3>
				<input type="hidden" name="eid">
					<tr>
						<td>姓名：</td>
						<td><input name="ename" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>
							<input type="radio" name="gender" value="male"/>男
							<input type="radio" name="gender" value="famale"/>女
						</td>
					</tr>
					<tr>
						<td>身份证号码：</td>
						<td><input name="idcode" class="easyui-textbox" /></td>
					</tr>
					<tr>
						<td>职位：</td>
						<td>
							<input class="easyui-combobox" name="jobid" 
							data-options="valueField:'jobid',textField:'jobname',url:'${pageContext.request.contextPath }/json/job.json'">
						</td>
					</tr>
					<tr>
						<td>工资：</td>
						<td>
							<input type="text" name="sal" class="easyui-numberbox" data-options="min:0,precision:2,prefix:'￥'"></input>  
						</td>
					</tr>
					<tr>
						<td>奖金：</td>
						<td>
							<input type="text" name="comm" class="easyui-numberbox" data-options="min:0,precision:2,prefix:'￥'"></input>  
						</td>
					</tr>
					<tr>
						<td>所属部门：</td>
						<td>
							<input class="easyui-combobox" name="deptno" id="dept_edit"
							data-options="valueField:'id',textField:'dname',url:'${pageContext.request.contextPath }/dept_listAllDept'">
						</td>
					</tr>
				</table>
				</form>
			</div>
			<div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
				<a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:editEmp()">确定</a> 
				<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:">取消</a>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function(){
		
		$("#empTab").datagrid({
			url:'${pageContext.request.contextPath}/emp_listAllEmp',
			columns:[[
						{"field":'eid',hidden:true},
			          {"field":'empno',"title":'编号',checkbox:true},
			          {"field":'ename',"title":'员工姓名',"width":100,"align":"center"},
			          {"field":'gender',"title":'性别',"width":50,"align":"center",formatter:genderfmt},
			          {"field":'idcode',"title":'身份证号',"width":250,"align":"center"},
			          {"field":'jobid',"title":'职位',"width":100,"align":"center",formatter:jobfmt},
			          {"field":'sal',"title":'工资',"width":100,"align":"center"},
			          {"field":'comm',"title":'奖金',"width":100,"align":"center"},
			          {"field":'deptName',"title":'所属部门',"width":100,"align":"center"}
			        ]],
	        rownumbers:true,
	        toolbar:"#tb",
	        pagination:true
	        
		});
		function genderfmt(value,row,index){
			if(value=="male"){
				return "男";
			}else if(value=="famale"){
				return "女";
			}else{
				return "未知";
			}
	}
	 
	 function jobfmt(value,row,index){
		 switch (value) {
		case 1:
			return "程序员";
			break;
		case 2:
			return "教师";
			break;
		case 3:
			return "医生";
			break;
		case 4:
			return "保安";
			break;

		default:
			return "未知";
			break;
		}
	 }
		//员工所在部门的下拉选
		$("#queryDept").combobox({  
		    url:'${pageContext.request.contextPath }/dept_listAllDept',  
		    valueField:'id',
		    textField:'dname',
		    panelHeight:'auto'
		});  
		
		//添加员工的窗口
		$('#addEmpWindow').window({
	        title: '添加员工',
	        height:310,
	        collapsible:"false",
	        minimizable:"false",
	        modal: true,
	        shadow: true,
	        closed: true,
	        resizable:false,
	        maximizable:false,
	    });
		$('#editEmpWindow').window({
	        title: '编辑员工',
	        height:310,
	        collapsible:"false",
	        minimizable:"false",
	        modal: true,
	        shadow: true,
	        closed: true,
	        resizable:false,
	        maximizable:false,
	    });

	});
	
	//点击添加员工
	function doAdd(){
		$("#addEmpWindow").window('open');
	}
	
	function doEdit(){
		var a=$("#empTab").datagrid("getSelections");
		console.log(a.length);
		if(a.length==0){
			$.messager.alert("修改错误","请选择修改信息");
		}else if(a.length>1){
			$.messager.alert("修改错误","行数选择过多，请选择一行进行操作");
		}else{
			var row=$("#empTab").datagrid("getSelected");
			console.log(row);
			
			$("#editEmpWindow").window('open');
			$("#editEmpTb").form("load",row);
			$("#dept_edit").combobox("setValue",row.dept.id);
		}
	}
	function addEmp(){
		var a=$("#addEmpTb").serialize();
		$.post("${pageContext.request.contextPath}/emp_AddEmp",a,function(data){
			$("#addEmpWindow").window('close');
			if(data.isSuceess){
				alert("添加成功");								
			}else{
				alert("添加失败");
			}
			$("#empTab").datagrid('reload');
			
		},"json");
	}
	
	function editEmp(){
		var a=$("#editEmpTb").serialize();
		$.post("${pageContext.request.contextPath}/emp_editEmp",a,function(data){
			$("#editEmpWindow").window('close');
			if(data.isEditSuccess){
				$.messager.alert("编辑提示","修改成功");							
			}else{
				$.messager.alert("编辑提示","修改失败，请重试");
			}
			$("#empTab").datagrid('reload');
			
		},"json");
	}
	//分页搜索功能，利用easyui的load方法
	function doSearch(){
		var queryEname=$("#queryEname").val();
		var queryDept=$("#queryDept").combo("getValue");
		console.log(queryEname);
		console.log(queryDept);
		$("#empTab").datagrid('load',{
			enames:queryEname,
			deptnos:queryDept
		});
		
	}
	
	function doDel(){
		var EmpArr=$("#empTab").datagrid("getSelections");
		var EmpIdArr=[];
		if(EmpArr.length==0){
			$.messager.alert("修改错误","请选择修改信息");
		}else{
			for(var i=0;i<EmpArr.length;i++){
				EmpIdArr.push(EmpArr[i].eid);
			}
			console.log(EmpIdArr);
			var newEmpIdArr= EmpIdArr.join("-");
			$.post("${pageContext.request.contextPath}/emp_delEmp",{"empIdArr":newEmpIdArr},function(data){
				if(data.delSuccess){
					$.messager.alert("删除提示","删除成功");							
				}else{
					$.messager.alert("删除提示","删除失败，请重试");
				}
				$("#empTab").datagrid('reload');
			},"json")
		}
	}
</script>
</html>