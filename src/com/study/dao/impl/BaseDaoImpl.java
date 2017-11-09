package com.study.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.study.dao.BaseDao;
import com.study.util.PageBean;

/**
 * @author Mr.Hu
 *	抽取dao的所有实现方法
 * @param <T>
 */
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	
	/**
	 * 需要获取泛型的类型；
	 * 
	 */
	private Class<T> clazz;
	public BaseDaoImpl() {
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		clazz=(Class<T>) type.getActualTypeArguments()[0];
	}
	/**
	 * 添加方法
	 */
	public void addMethod(T t) {
		this.getHibernateTemplate().save(t);
		
	}
	/**
	 * 查询所有
	 */
	public List<T> queryAllMethod() {
		String hql="from "+clazz.getSimpleName();
		return (List<T>) this.getHibernateTemplate().find(hql);
	}
	/**
	 * 根据id查询对象
	 */
	public T queryByIdMethod(Serializable id) {
		return this.getHibernateTemplate().get(clazz, id);
		
	}
	/**
	 * 根据名字查询
	 */
	public T queryByNameMethod(Serializable name) {
		String hql="from "+clazz.getSimpleName()+" where name=?";
		List<T> list = (List<T>) this.getHibernateTemplate().find(hql, name);
		if(list!=null&&list.size()!=0) {
			return list.get(0);
		}
		return null;
	}
	
	
	/**
	 * 删除
	 */
	public void delMethod(Serializable id) {
		T t = this.queryByIdMethod(id);
		this.getHibernateTemplate().delete(t);
		
	}
	/**
	 * 更新
	 */
	public void editMethod(T t) {
		this.getHibernateTemplate().merge(t);
		
	}
	/**
	 * 分页查询
	 */
	public void queryPageBeanMethod(PageBean<T> pageBean) {
		int size = this.getHibernateTemplate().findByCriteria(pageBean.getDetachedCriteria()).size();
		List<T> list = (List<T>) this.getHibernateTemplate().findByCriteria(pageBean.getDetachedCriteria(),(pageBean.getPage()-1)*pageBean.getPagesize(),pageBean.getPagesize());
		pageBean.setRows(list);
		pageBean.setTotal(size);
	}

	

}
