package com.study.service.impl;

import java.util.List;

import com.study.dao.EmpDao;
import com.study.domain.Dept;
import com.study.domain.Emp;
import com.study.service.EmpService;
import com.study.util.PageBean;

public class EmpServiceImpl implements EmpService {
	private EmpDao empDao;
	
	public void setEmpDao(EmpDao empDao) {
		this.empDao = empDao;
	}
	/**
	 * 添加员工
	 */
	public void addEmp(Emp emp) {
		
			Dept dept=empDao.queryDeptById(emp.getDeptno());
			emp.setDept(dept);
			empDao.addMethod(emp);
			
		
	}
	public void listAllEmp(PageBean<Emp> pageBean) {
		empDao.queryPageBeanMethod(pageBean);
	}
	/**
	 * 删除员工
	 */
	public void delEmp(List<Long> empIds) {
			for (Long empId : empIds) {
				empDao.delMethod(empId);
			}
	}
	/**
	 * 
	 */
	public void editEmp(Emp emp) {
			Dept dept=empDao.queryDeptById(emp.getDeptno());
			emp.setDept(dept);
			empDao.editMethod(emp);
	}
}
