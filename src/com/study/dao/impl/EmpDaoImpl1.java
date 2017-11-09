package com.study.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.study.dao.EmpDao;
import com.study.dao.EmpDao1;
import com.study.domain.Dept;
import com.study.domain.Emp;
import com.study.util.PageBean;

public class EmpDaoImpl1 extends HibernateDaoSupport implements EmpDao1 {

	public void addEmp(Emp emp) {
		this.getHibernateTemplate().save(emp);
	}

	public Dept queryDeptById(int id) {
		return this.getHibernateTemplate().get(Dept.class, id);
	}
	/**
	 * 分页查询emp
	 */
	public void listAllEmp(PageBean<Emp> pageBean) {
		int size = this.getHibernateTemplate().findByCriteria(pageBean.getDetachedCriteria()).size();
		List<Emp> list = (List<Emp>) this.getHibernateTemplate().findByCriteria(pageBean.getDetachedCriteria(),(pageBean.getPage()-1)*pageBean.getPagesize(),pageBean.getPagesize());
		pageBean.setRows(list);
		pageBean.setTotal(size);
	}

	public void delEmp(List<Integer> empIds) {
		for (Integer empId : empIds) {
			Emp emp=this.getHibernateTemplate().get(Emp.class,empId.longValue());
			this.getHibernateTemplate().delete(emp);
		}
	}
	/**
	 * 编辑员工信息
	 */
	public void editEmp(Emp emp) {
		this.getHibernateTemplate().merge(emp);
	}

}
