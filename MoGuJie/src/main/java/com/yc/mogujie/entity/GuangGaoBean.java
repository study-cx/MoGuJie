package com.yc.mogujie.entity;

import java.util.Date;

public class GuangGaoBean {
	//select gid,weizhi,gPhoto,gdates,gdateo,proid
	private int gid;//广告编号
	private String weizhi;//位置
	private String gPhoto;//广告地址
	private Date gdates;//开始时间
	private Date gdateo;//结束时间
	private int proid;//商品id
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getWeizhi() {
		return weizhi;
	}
	public void setWeizhi(String weizhi) {
		this.weizhi = weizhi;
	}
	public String getgPhoto() {
		return gPhoto;
	}
	public void setgPhoto(String gPhoto) {
		this.gPhoto = gPhoto;
	}
	public Date getGdates() {
		return gdates;
	}
	public void setGdates(Date gdates) {
		this.gdates = gdates;
	}
	public Date getGdateo() {
		return gdateo;
	}
	public void setGdateo(Date gdateo) {
		this.gdateo = gdateo;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	@Override
	public String toString() {
		return "GuangGaoBean [gid=" + gid + ", weizhi=" + weizhi + ", gPhoto="
				+ gPhoto + ", gdates=" + gdates + ", gdateo=" + gdateo
				+ ", proid=" + proid + "]";
	}
	
	
	
}
