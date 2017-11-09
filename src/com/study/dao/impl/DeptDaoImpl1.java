package com.study.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.study.dao.DeptDao;
import com.study.dao.DeptDao1;
import com.study.domain.Dept;
import com.study.util.HibernateUtil;

public class DeptDaoImpl1 extends HibernateDaoSupport implements DeptDao1 {
	
	public void  addDepartment(Dept dept) throws Exception{
		this.getHibernateTemplate().save(dept);
	}
	/**
	 * 
	 */
	public List<Dept> listAllDept() throws Exception{
		String hql="from Dept";
		List<Dept> list = (List<Dept>) this.getHibernateTemplate().find(hql);
		return list;
		
	}
	/**
	 * 
	 */
	public List<Dept> listAllDept2(String page, String rows) {
		int p = Integer.parseInt(rows);
		int r = Integer.parseInt(page);
		Session session = HibernateUtil.getSession();
		String hql="from Dept";
		Query query = session.createQuery(hql);
		query.setFirstResult(p);
		query.setMaxResults(r);
		List<Dept> list = query.list();
		return list;
	}
	/**
	 * 
	 */
	public void editDept(Dept dept) {
		Dept dept2 = this.getHibernateTemplate().get(Dept.class, dept.getId());
		dept2.setDname(dept.getDname());
		dept2.setLocation(dept.getLocation());
	}
	/**
	 * 
	 */
	public void delDept(int deptId) {
		Dept dept = this.getHibernateTemplate().get(Dept.class, deptId);
		this.getHibernateTemplate().delete(dept);
	}
}
