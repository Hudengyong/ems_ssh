package com.study.service;

import java.util.List;

import com.study.domain.Emp;
import com.study.util.PageBean;

public interface EmpService {
	//添加员工
	void addEmp(Emp emp);
	//分页查询所有员工
	void listAllEmp(PageBean<Emp> pageBean);
	//删除员工
	void delEmp(List<Long> empIds);
	//修改员工
	void editEmp(Emp emp);

}
