package com.study.test;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.study.domain.Emp;
import com.study.service.EmpService;
import com.study.util.PageBean;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")

public class EmpTest {
	@Autowired
	private EmpService empService;
	@Test
	public void m01() {
		PageBean<Emp> pageBean=new PageBean<>();
		pageBean.setPagesize(10);
		pageBean.setPage(1);
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(Emp.class);
		detachedCriteria.add(Restrictions.like("ename", "%明天%"));
		pageBean.setDetachedCriteria(detachedCriteria);
		empService.listAllEmp(pageBean);
	}
}
