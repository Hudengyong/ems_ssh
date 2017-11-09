package com.study.web.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.study.domain.Dept;
import com.study.service.DeptService;
import com.study.service.impl.DeptServiceImpl;

import net.sf.json.JSONArray;

public class DeptAction extends ActionSupport implements ModelDriven<Dept>{
	private Dept dept=new Dept();
	private DeptService deptService;
	
	public void setDeptService(DeptService deptService) {
		this.deptService = deptService;
	}

	private String deptIdsStr;
	
	public void setDeptIdsStr(String deptIdsStr) {
		this.deptIdsStr = deptIdsStr;
	}
	/**
	 * 查询所有部门
	 * @return
	 * @throws Exception
	 */
	public String listAllDept() throws Exception {
		List<Dept> list = deptService.listAllDept();
		String json = JSONArray.fromObject(list).toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(json);
		return NONE;
	}
	/**
	 * 添加部门
	 * @return
	 * @throws Exception
	 */
	public String AddDept() throws Exception {
		deptService.addDepartment(dept);
		String str="{\"isSuccessAdd\":"+"true"+"}";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.getWriter().write(str);
		return NONE;
	}
	/**
	 * 修改部门
	 * @return
	 * @throws Exception
	 */
	public String editDept() throws Exception {
		deptService.editDept(dept);
		String str="{\"isSuccessEdit\":"+"true"+"}";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.getWriter().write(str);
		
		return NONE;
	}
	
	public String delDept() throws Exception {
		System.out.println(deptIdsStr);
		deptService.delDept(deptIdsStr);
		String str="{\"isSuccessDel\":"+"true"+"}";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.getWriter().write(str);
		return NONE;
	}
	@Override
	public Dept getModel() {
		return dept;
	}
	
	public String test() throws Exception {
		return SUCCESS;
	}
}
