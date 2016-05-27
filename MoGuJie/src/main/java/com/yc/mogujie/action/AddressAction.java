package com.yc.mogujie.action;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Address;
import com.yc.mogujie.service.AddrService;
import com.yc.mogujie.service.UserInfoService;

@Controller("addressAction")
public class AddressAction implements  SessionAware,ModelDriven<Address>{
	
	@Autowired
	private AddrService addrService;
	
	private Address address;
	private Map<String,Object> session;
	
	public String addr(){
		LogManager.getLogger().debug("取到的地址信息==》"+address);
		if(addrService.addr(address)>0){
			session.put("address", address);
			return "addrSuccess"; 
		}
		return "addFail";
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public Address getModel() {
		address=new Address();
		return address;
	}
}
