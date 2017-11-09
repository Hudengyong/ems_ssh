package com.study.service.impl;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.study.dao.UserDao;
import com.study.domain.User;
import com.study.service.UserService;

public class UserServiceImpl implements UserService {
	@Resource(name="userDao")
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public User loginUser(User user) {
		ActionContext context = ActionContext.getContext();
		String hite=null;
		if(!user.getName().isEmpty()&&!user.getPassword().isEmpty()) {
			User user2=userDao.queryByNameMethod(user.getName());
			if(user2!=null) {
					if (user.getPassword().equals(user2.getPassword())) {
						return user2;
					}
			context.put("hite","密码错误");
			return null;
			}
			
			context.put("hite","用户名错误");
			return null;
		}
		context.put("hite","用户名或密码不能为空");
		return null;
	}

}
