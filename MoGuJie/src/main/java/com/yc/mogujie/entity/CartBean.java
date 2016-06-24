package com.yc.mogujie.entity;

public class CartBean {
	private String color;
	private String csize;
	private String pcolor;
	private int snumber;
	private String proname;
	private String proprice;
	private int cid;
	private int usid;
	 
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getCsize() {
		return csize;
	}
	public void setCsize(String csize) {
		this.csize = csize;
	}
	public String getPcolor() {
		return pcolor;
	}
	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	public int getSnumber() {
		return snumber;
	}
	public void setSnumber(int snumber) {
		this.snumber = snumber;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public String getProprice() {
		return proprice;
	}
	public void setProprice(String proprice) {
		this.proprice = proprice;
	}
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	@Override
	public String toString() {
		return "CartBean [color=" + color + ", csize=" + csize + ", pcolor="
				+ pcolor + ", snumber=" + snumber + ", proname=" + proname
				+ ", proprice=" + proprice + ", cid=" + cid + ", usid=" + usid
				+ "]";
	}
	

	
}
