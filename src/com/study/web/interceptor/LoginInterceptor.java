package com.study.web.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

public class LoginInterceptor extends MethodFilterInterceptor{

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		Map<String, Object> map = ActionContext.getContext().getSession();
		Object object = map.get("hasLogin");
		
		if(object!=null) {
			invocation.invoke();
		}
		return "error";
	}

}
