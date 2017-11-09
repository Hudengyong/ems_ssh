package com.study.dao;

import java.io.Serializable;
import java.util.List;

import com.study.util.PageBean;

public interface BaseDao<T> {
	//添加
	void addMethod(T t);
	//查询所有
	List<T> queryAllMethod();
	//根据id查询
	T queryByIdMethod(Serializable id);
	//根据用户名查询
	T queryByNameMethod(Serializable name);
	//删除
	void delMethod(Serializable id);
	//更新
	void editMethod(T t);
	//分页查询
	void queryPageBeanMethod(PageBean<T> pageBean);
	
}
