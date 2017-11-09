package com.study.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.study.dao.UserDao1;
import com.study.domain.User;
import com.study.util.HibernateUtil;

public class UserDaoImpl1 extends HibernateDaoSupport implements UserDao1 {
	/*public User queryPassword(String name) {
		Session session = HibernateUtil.getSession();
		String hql="from User where name=?";
		Query query = session.createQuery(hql);
		System.out.println(name);
		query.setParameter(0, name);
		User user=null;
		user=(User)query.uniqueResult();
		return user;
	}*/
	/**
	 * hql版本
	 
	public User queryPassword(String name) {
		String hql="from User where name=?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, name);
		if(list!=null && list.size()!=0) {
			return list.get(0);
		}
		return null;
	}*/
	/**
	 * critiria
	 * 
	 */
	public User queryPassword(String name) {
		DetachedCriteria dc=DetachedCriteria.forClass(User.class);
		dc.add(Restrictions.eq("name", name));
		System.out.println(this.getHibernateTemplate());
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(dc);
		if(list!=null && list.size()!=0) {
			return list.get(0);
		}
		return null;
	}
	/**
	 * 
	 * @param name
	 * @return
	 */
	public List<User> queryPassword2(String name) {
		Session session = HibernateUtil.getSession();
		String hql="from User where name=?";
		Query query = session.createQuery(hql);
		System.out.println(name);
		query.setParameter(0, name);
		//User user= (User) query.uniqueResult();
		List<User> list = query.list();
		return list;
	}

}
