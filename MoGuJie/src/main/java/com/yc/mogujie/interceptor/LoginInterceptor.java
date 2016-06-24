package com.yc.mogujie.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 用户登录校验拦截器
 * @author lq
 *
 */

//MethodFilterInterceptor  可以对请求方法进行过滤
public class LoginInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = -7236236055969111808L;

	//1.创建拦截器类
	@Override
	public String doIntercept(ActionInvocation invocation) throws Exception {
		Map<String,Object> session=ActionContext.getContext().getSession(); //取到session的封装对象
		Object obj=session.get("loginUser");
		//System.out.println("当前对象状态："+obj);
		if(obj==null){
			session.put("errorMsg", "请登录后，再进行操作!!!");
			return "Nologin";
		}
		return invocation.invoke();
	}
	
	/*@Override
	public String doIntercept(ActionInvocation invocation) throws Exception {
		Map<String,Object> session=ActionContext.getContext().getSession();
		//取到session的封装对象
		Object obj=session.get("loginUser");
		if(obj==null){
			//打印对象
			//System.out.println("对象"+obj);
			//获取request域中信息  
	        HttpServletRequest req = ServletActionContext.getRequest();  
	       //获得当前请求地址
	        String url = req.getServletPath();  
	        //获得请求类型  
	        String type = req.getHeader("X-Requested-With");
	        System.out.println("获得请求类型  "+type);
	        //判断是否是同步请求或者是异步请求
	        if(type.equalsIgnoreCase("XMLHttpRequest")){
	        	return "Object";
	        }else{
	        	session.put("errorMsg", "请登入后,再进行操作!!!!");
	        	return "Nologin";
	        }
		}
		return invocation.invoke();//invocation.invoke() 就是通知struts2接着干下面的事情;返回验证通过
	}*/

}
