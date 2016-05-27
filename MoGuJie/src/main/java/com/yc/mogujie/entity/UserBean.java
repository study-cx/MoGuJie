package com.yc.mogujie.entity;

import java.io.Serializable;
import java.util.Date;

public class UserBean implements Serializable{
	private static final long serialVersionUID = -3314337628944931124L;
	
	private String uname;//昵称
	private Date ubirthday;//生日
	private String ucode;//用户邮编
	private String usemail;//邮箱
	private String usphone;//用户联系方式
	private String uphoto;//头像
	private String province;//省份
	private String city;//市
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getUbirthday() {
		return ubirthday;
	}
	public void setUbirthday(Date ubirthday) {
		this.ubirthday = ubirthday;
	}
	public String getUcode() {
		return ucode;
	}
	public void setUcode(String ucode) {
		this.ucode = ucode;
	}
	public String getUsemail() {
		return usemail;
	}
	public void setUsemail(String usemail) {
		this.usemail = usemail;
	}
	public String getUsphone() {
		return usphone;
	}
	public void setUsphone(String usphone) {
		this.usphone = usphone;
	}
	public String getUphoto() {
		return uphoto;
	}
	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "UserBean [uname=" + uname + ", ubirthday=" + ubirthday
				+ ", ucode=" + ucode + ", usemail=" + usemail + ", usphone="
				+ usphone + ", uphoto=" + uphoto + ", province=" + province
				+ ", city=" + city + "]";
	}
}
