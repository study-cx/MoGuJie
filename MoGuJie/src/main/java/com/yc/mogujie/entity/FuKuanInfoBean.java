package com.yc.mogujie.entity;

import java.io.Serializable;

public class FuKuanInfoBean implements Serializable{
	private static final long serialVersionUID = 3973178013979031699L;
	private String proname;
	private int price;
	private String color;
	private String size;
	private int number;
	private int proid;
	private String prophoto;
	private int usid;
	private int addressid;
	private int orderid;
	private int deid;
	private int totalnumber;
	private int totalprice;

	public int getDeid() {
		return deid;
	}
	public void setDeid(int deid) {
		this.deid = deid;
	}
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public int getAddressid() {
		return addressid;
	}
	public void setAddressid(int addressid) {
		this.addressid = addressid;
	}
	public String getProphoto() {
		return prophoto;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public void setProphoto(String prophoto) {
		this.prophoto = prophoto;
	}
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public int getTotalnumber() {
		return totalnumber;
	}
	public void setTotalnumber(int totalnumber) {
		this.totalnumber = totalnumber;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	@Override
	public String toString() {
		return "FuKuanInfoBean [proname=" + proname + ", price=" + price
				+ ", color=" + color + ", size=" + size + ", number=" + number
				+ ", proid=" + proid + ", prophoto=" + prophoto + ", usid="
				+ usid + ", addressid=" + addressid + ", orderid=" + orderid
				+ ", deid=" + deid + ", totalnumber=" + totalnumber
				+ ", totalprice=" + totalprice + "]";
	}
}
