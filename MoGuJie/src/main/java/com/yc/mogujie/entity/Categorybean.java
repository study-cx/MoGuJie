package com.yc.mogujie.entity;

import java.io.Serializable;

public class Categorybean implements Serializable{
	private String categoryidone;//一级目录id
	private String categoryTypeone;//一级目录的类型名称
	private String categoryTypetwo;//二级目录的名称
	private String proid;//商品id
	private String prophoto;//图片地址
	private String procontent;//商品简介
	private String proprice;//商品价格
	private String counts;//销售量
	
	public String getProid() {
		return proid;
	}
	public void setProid(String proid) {
		this.proid = proid;
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
	public String getProprice() {
		return proprice;
	}
	public void setProprice(String proprice) {
		this.proprice = proprice;
	}
	public String getCounts() {
		return counts;
	}
	public void setCounts(String counts) {
		this.counts = counts;
	}
	public String getCategoryidone() {
		return categoryidone;
	}
	public void setCategoryidone(String categoryidone) {
		this.categoryidone = categoryidone;
	}
	public String getCategoryTypeone() {
		return categoryTypeone;
	}
	public void setCategoryTypeone(String categoryTypeone) {
		this.categoryTypeone = categoryTypeone;
	}
	public String getCategoryTypetwo() {
		return categoryTypetwo;
	}
	public void setCategoryTypetwo(String categoryTypetwo) {
		this.categoryTypetwo = categoryTypetwo;
	}
	@Override
	public String toString() {
		return "Categorybean [categoryidone=" + categoryidone
				+ ", categoryTypeone=" + categoryTypeone + ", categoryTypetwo="
				+ categoryTypetwo + ", proid=" + proid + ", prophoto="
				+ prophoto + ", procontent=" + procontent + ", proprice="
				+ proprice + ", counts=" + counts + "]";
	}
}