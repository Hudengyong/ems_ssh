package com.study.dao;

import java.util.List;

import com.study.domain.Dept;
import com.study.domain.Emp;
import com.study.util.PageBean;

public interface EmpDao1 {
	//添加员工
	void addEmp(Emp emp);
	//根据id查询部门
	Dept queryDeptById(int id);
	//分页显示所有员工信息
	void listAllEmp(PageBean<Emp> pageBean);
	//删除员工信息
	void delEmp(List<Integer> empIds);
	//编辑员工信息
	void editEmp(Emp emp);

}
