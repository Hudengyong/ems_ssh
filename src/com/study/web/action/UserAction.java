package com.study.web.action;

import java.util.Map;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.study.domain.User;
import com.study.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	@Resource(name="userService")
	private UserService userService;
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private User user=new User();
	@Override
	public User getModel() {
		return user;
	}
	
	public String loginUser() throws Exception {
		User isLoginSuccess=userService.loginUser(user);
		if(isLoginSuccess!=null) {
			Map<String, Object> map = ActionContext.getContext().getSession();
			map.put("hasLogin", isLoginSuccess);
			return SUCCESS;
		}
		return ERROR;
	}
	
	public String loginIndex() throws Exception {
		return SUCCESS;
	}
	

}
