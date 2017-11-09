package com.study.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @author Mr.Hu
 *	用于获取session的单例模式
 */
public class HibernateUtil {
	 //线程锁，保证线程安全，在用的时候只有这一个session，别人无法处理
    private static final ThreadLocal<Session> threadLock = new ThreadLocal<Session>();
	//定义常量是为了实现单例，不允许更改赋值
    private static final SessionFactory factory=buildFactory();
	private static SessionFactory buildFactory() {
		//加载hibernate.cfg.xml配置，加载数据库与实体类
		Configuration configuration=new Configuration().configure();
		return configuration.buildSessionFactory();
	}
	
	//获取session
	public  static Session getSession() {
		//获取上面threadLock中的session;
		Session session = threadLock.get();
		if(session==null) {
			session=factory.openSession();
			threadLock.set(session);
		}
		return session;
	}
	
	public static void closeSession() {
		//先获取threadLock中的session
		Session session = threadLock.get();
		//如果不是空，就把session关闭，并且把threadLock清空
		if(session!=null) {
			session.close();
			threadLock.set(null);
		}
	}
}
