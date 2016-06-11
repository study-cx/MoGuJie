package com.yc.mogujie.entity;

import java.util.Date;

public class GuangGaoBean {
	// select gid,weizhi,gPhoto,gdates,gdateo,proid
	private int gid;// 广告编号

	private String weizhi;// 位置

	private int aid;

	private int ggrade;

	private String gPhoto;

	private Date gdates;

	private Date gdateo;

	private int weight;

	private int click;

	private String linkaddress;

	private int obligateone;

	private int obligatetwo;
	private int proid;// 商品id
	private String proname;

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

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public int getGgrade() {
		return ggrade;
	}

	public void setGgrade(int ggrade) {
		this.ggrade = ggrade;
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

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}

	public String getLinkaddress() {
		return linkaddress;
	}

	public void setLinkaddress(String linkaddress) {
		this.linkaddress = linkaddress;
	}

	public int getObligateone() {
		return obligateone;
	}

	public void setObligateone(int obligateone) {
		this.obligateone = obligateone;
	}

	public int getObligatetwo() {
		return obligatetwo;
	}

	public void setObligatetwo(int obligatetwo) {
		this.obligatetwo = obligatetwo;
	}

	public int getProid() {
		return proid;
	}

	public void setProid(int proid) {
		this.proid = proid;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	@Override
	public String toString() {
		return "GuangGaoBean [gid=" + gid + ", weizhi=" + weizhi + ", aid="
				+ aid + ", ggrade=" + ggrade + ", gPhoto=" + gPhoto
				+ ", gdates=" + gdates + ", gdateo=" + gdateo + ", weight="
				+ weight + ", click=" + click + ", linkaddress=" + linkaddress
				+ ", obligateone=" + obligateone + ", obligatetwo="
				+ obligatetwo + ", proid=" + proid + ", proname=" + proname
				+ "]";
	}

}
