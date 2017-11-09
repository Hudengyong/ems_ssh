package com.study.test;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.study.dao.UserDao1;
import com.study.dao.impl.UserDaoImpl1;
import com.study.domain.User;
import com.study.service.impl.UserServiceImpl;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class UserTest {
	@Test
	public void m01() {
		UserServiceImpl us =new UserServiceImpl();
		User user=new User();
		user.setName("123");
		user.setPassword("1234");
		//boolean b = us.loginUser(user);
		//System.out.println(b);
	}
	//@Test
	/*public void m02() {
		UserServiceImpl us =new UserServiceImpl();
		User user=new User();
		user.setName("123");
		user.setPassword("123");
		boolean b = us.loginUser(user);
		System.out.println(b);
		for (User user2 : list) {
			System.out.println(user2);
		}
	}*/
	
	@Test
	public void m03() {
		UserDao1 userDao =new UserDaoImpl1();
		User user = userDao.queryPassword("123");
		System.out.println(user);
	}
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;
	@Test
	/**
	 * 测试spring与hibernate整合是否成功
	 */
	public void m04()  {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		String hql="from User where id=?";
		Query query = session.createQuery(hql);
		query.setInteger(0, 1);
		User user = (User) query.uniqueResult();
		
		System.out.println(user);
		transaction.commit();
		session.close();
	}
	
	@Resource(name="userDao")
	private UserDao1 userDao;
	@Test
	/**
	 * 测试dao类继承hibernateDaoSupport之后进行测试
	 */
	public void m05() {
		User user = userDao.queryPassword("123");
		System.out.println(user);
	}
}
