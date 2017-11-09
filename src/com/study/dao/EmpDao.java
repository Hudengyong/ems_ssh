package com.study.dao;

import com.study.domain.Dept;
import com.study.domain.Emp;

public interface EmpDao extends BaseDao<Emp> {
	Dept queryDeptById(int id);
}
