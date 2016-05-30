package com.yc.mogujie.entity;

import java.io.Serializable;
import java.util.Date;

public class UserOrderBean implements Serializable{
	private static final long serialVersionUID = -134963147563434635L;
	
	private int usid;//用户id
	private int orderid;//订单号
	private Date datetime;//订单日期
	private int ostatus;//订单状态  0不可用，1未付款，2已付款
	private String prophoto;//图片地址
	private String procontent;//商品简介
	private double proprice;//商品价格
	private String color;//颜色
	private String psize;//商品尺寸
	private double buyprice;//购买价
	private int onumber;//数量
	public int getUsid() {
		return usid;
	}
	public void setUsid(int usid) {
		this.usid = usid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public Date getDatetime() {
		return datetime;
	}
	public void setDatetime(Date datetime) {
		this.datetime = datetime;
	}
	public int getOstatus() {
		return ostatus;
	}
	public void setOstatus(int ostatus) {
		this.ostatus = ostatus;
	}
	public String getProphoto() {
		return prophoto;
	}
	public void setProphoto(String prophoto) {
		this.prophoto = prophoto;
	}
	public String getProcontent() {
		return procontent;
	}
	public void setProcontent(String procontent) {
		this.procontent = procontent;
	}
	public double getProprice() {
		return proprice;
	}
	public void setProprice(double proprice) {
		this.proprice = proprice;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public double getBuyprice() {
		return buyprice;
	}
	public void setBuyprice(double buyprice) {
		this.buyprice = buyprice;
	}
	public int getOnumber() {
		return onumber;
	}
	public void setOnumber(int onumber) {
		this.onumber = onumber;
	}
	@Override
	public String toString() {
		return "UserOrderBean [usid=" + usid + ", orderid=" + orderid
				+ ", datetime=" + datetime + ", ostatus=" + ostatus
				+ ", prophoto=" + prophoto + ", procontent=" + procontent
				+ ", proprice=" + proprice + ", color=" + color + ", psize="
				+ psize + ", buyprice=" + buyprice + ", onumber=" + onumber
				+ "]";
	}
}
