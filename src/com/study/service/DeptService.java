package com.study.service;

import java.util.List;

import com.study.domain.Dept;

public interface DeptService {
	//添加部门
	void addDepartment(Dept dept);

	List<Dept> listAllDept();

	List<Dept> listAllDept2(String page, String rows);
	//修改部门信息
	void editDept(Dept dept);
	//删除部门
	void delDept(String deptIdsStr);

}
