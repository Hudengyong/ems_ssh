package com.study.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.study.domain.Emp;
import com.study.service.EmpService;
import com.study.util.PageBean;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

public class EmpAction extends ActionSupport implements ModelDriven<Emp>{
	private EmpService empService;
	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}

	private PageBean<Emp> pageBean=new PageBean<>();
	
	private String enames;
	private String deptnos;
	private int rows;
	private int page;
	private String empIdArr;
	
	
	public String getEmpIdArr() {
		return empIdArr;
	}
	public void setEmpIdArr(String empIdArr) {
		this.empIdArr = empIdArr;
	}

	private Emp emp=new Emp();
	/**
	 * 模型驱动，emp接收参数
	 */
	@Override
	public Emp getModel() {
		return emp;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public void setEnames(String enames) {
		this.enames = enames;
	}
	public void setDeptnos(String deptnos) {
		this.deptnos = deptnos;
	}
	
	/**
	 * 获取所有员工信息，并分页
	 * @return
	 * @throws Exception
	 */
	public String listAllEmp() throws Exception {
		DetachedCriteria dc=DetachedCriteria.forClass(Emp.class);
		pageBean.setPage(page);
		pageBean.setPagesize(rows);
		System.out.println(enames);
		if(StringUtils.isNotEmpty(enames)) {
			System.out.println("到了ename："+enames);
			dc.add(Restrictions.like("ename", "%"+enames+"%"));
		}
		if(StringUtils.isNotEmpty(deptnos)) {
			int deptno = Integer.parseInt(deptnos);
			dc.add(Restrictions.eq("dept.id", deptno));
		}
		pageBean.setDetachedCriteria(dc);
		empService.listAllEmp(pageBean);
		String[] noNeed= {"detachedCriteria","deptno"};
		JsonConfig jc=new JsonConfig();
		jc.setIgnoreDefaultExcludes(false);
		jc.setExcludes(noNeed);
		String str = JSONObject.fromObject(pageBean,jc).toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(str);
		return NONE;
	}
	/**
	 * 添加员工
	 * @return
	 * @throws Exception
	 */
	public String AddEmp() throws Exception {
		empService.addEmp(emp);
		String str="{\"isSuceess\":"+"true"+"}";
		ServletActionContext.getResponse().getWriter().write(str);
		return NONE;
	}
	/**
	 * 删除员工
	 * @return
	 * @throws Exception
	 */
	public String delEmp() throws Exception {
		String[] EmpIdStrs = empIdArr.split("-");
		List<Long> EmpIds=new ArrayList<>();
		for (String EmpIdStr : EmpIdStrs) {
			EmpIds.add(Long.parseLong(EmpIdStr));
		}
		empService.delEmp(EmpIds);
		String str="{\"delSuccess\":"+"true"+"}";
		ServletActionContext.getResponse().getWriter().write(str);
		return NONE;
	}
	/**
	 * 
	 * @return
	 * @throws Exception
	 */
	public String editEmp() throws Exception {
		empService.editEmp(emp);
		String str="{\"isEditSuccess\":"+"true"+"}";
		ServletActionContext.getResponse().getWriter().write(str);
		return NONE;
	}
	
	
}
