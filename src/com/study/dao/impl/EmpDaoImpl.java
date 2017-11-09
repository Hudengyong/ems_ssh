package com.study.dao.impl;


import com.study.dao.EmpDao;
import com.study.domain.Dept;
import com.study.domain.Emp;

public class EmpDaoImpl extends BaseDaoImpl<Emp> implements EmpDao {

	public Dept queryDeptById(int id) {
		return this.getHibernateTemplate().get(Dept.class, id);
	}
}
