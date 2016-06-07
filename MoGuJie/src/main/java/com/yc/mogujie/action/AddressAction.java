package com.yc.mogujie.action;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.Address;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.AddrService;
import com.yc.mogujie.service.UserInfoService;
import com.yc.mogujie.util.MogujieData;

@Controller("addressAction")
public class AddressAction implements  SessionAware,ModelDriven<Address>{
	
	@Autowired
	private AddrService addrService;
	
	private Address address;
	
	private Map<String,Object> session;
	
	private List<Address> addrList;
	public List<Address> getAddrList() {
		return addrList;
	}
	private int addressids;
	public void setAddressids(int addressids) {
		this.addressids = addressids;
	}

	private Address edit;
	public Address getEdit() {
		return edit;
	}

	private int deleteAddr;
	public int getDeleteAddr() {
		return deleteAddr;
	}

	private int morenAddr;
	public int getMorenAddr() {
		return morenAddr;
	}

	//添加地址
	public String addr(){
		LogManager.getLogger().debug("取到的地址信息==》"+address);
		UserInfo us=(UserInfo) session.get(MogujieData.LOGIN_USER);
		int usid=us.getUsid();
		address.setUsid(usid);
		if(addrService.addr(address)>0){
			session.put("address", address);
			return "addrSuccess";
		}
		return "addFail";
	}

	//查询地址信息
	public String list(){
		addrList=addrService.findAddr();
		return "addrList";
	}
	
	//编辑，根据地址id查地址信息
	public String edit(){
		edit=addrService.findAddressById(addressids);
		session.put("id", addressids);
		return "edit";
	}
	
	//修改地址
	public String update(){
		int add=(int) ActionContext.getContext().getSession().get("id");
		address.setAddressid(add);
		int result=addrService.update(address);
		LogManager.getLogger().debug("取到的地址信息==》"+address);
		if(result>0){
			addrService.findAddr();
			return "addrSuccess";
		}
		return "addFail";
		
	}
	//删除
	public String deleteAddr(){
		deleteAddr=addrService.delete(address.getAddressid());
		return "deleteAddr";
	}
	
	//设为默认地址
	public String moren(){
		List<Address> ids=addrService.selectAllAddressid();

		for(int i=0; i<ids.size();i++){ 

			int iddddd=ids.get(i).getAddressid();
			
			if(iddddd==(address.getAddressid())){
				morenAddr=addrService.moren(address.getAddressid());
			}else{  
				morenAddr=addrService.updatemoren(iddddd);
			}
		}
		LogManager.getLogger().debug("取到的地址信息哈哈哈==》"+morenAddr);
		return "morenAddr";
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
