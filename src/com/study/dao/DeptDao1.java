package com.study.dao;

import java.util.List;

import com.study.domain.Dept;

public interface DeptDao1 {

	void addDepartment(Dept dept) throws Exception;

	List<Dept> listAllDept() throws Exception;

	List<Dept> listAllDept2(String page, String rows);

	void editDept(Dept dept);

	void delDept(int deptId);

}
