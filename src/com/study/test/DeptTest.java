package com.study.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.study.dao.DeptDao;
import com.study.domain.Dept;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class DeptTest {
	@Resource(name="deptDao")
	private DeptDao deptDao;

	/*@Test
	public void m01() throws Exception {
		List<Dept> list = deptDao.listAllDept();
		for (Dept dept : list) {
			System.out.println(dept);
		}
	}*/
}
