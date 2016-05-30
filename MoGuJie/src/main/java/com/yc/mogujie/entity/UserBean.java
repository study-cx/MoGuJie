package com.yc.mogujie.entity;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

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
	private String usex;//性别
	private String oldUanme;
	private String newPwd;
	private String oldPwd;
	private String usid;
	
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getOldPwd() {
		return oldPwd;
	}
	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}
	public String getUsid() {
		return usid;
	}
	public void setUsid(String usid) {
		this.usid = usid;
	}
	public String getOldUanme() {
		UserInfo users=(UserInfo)ActionContext.getContext().getSession().get("loginUser");
		oldUanme=users.getUname();
		//oldUanme="liqiu123";
		return oldUanme;
	}
	public void setOldUanme(String oldUanme) {
		this.oldUanme = oldUanme;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Date getUbirthday() {
		return ubirthday;
	}
	public Date getUbirthdays() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//ubirthday=sdf.format(ubirthday);
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
				+ ", city=" + city + ", usex=" + usex + "]";
	}
}
