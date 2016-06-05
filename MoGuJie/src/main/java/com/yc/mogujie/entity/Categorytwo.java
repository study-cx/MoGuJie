package com.yc.mogujie.entity;

import java.io.Serializable;

public class Categorytwo implements Serializable{
	private static final long serialVersionUID = 6927594840317319118L;

	private int categoryidtwo;

    private int categoryidone;

    private String categorytypetwo;

    private String obligateone;

    private String obligatetwo;

	public int getCategoryidtwo() {
		return categoryidtwo;
	}

	public void setCategoryidtwo(int categoryidtwo) {
		this.categoryidtwo = categoryidtwo;
	}

	public int getCategoryidone() {
		return categoryidone;
	}

	public void setCategoryidone(int categoryidone) {
		this.categoryidone = categoryidone;
	}

	public String getCategorytypetwo() {
		return categorytypetwo;
	}

	public void setCategorytypetwo(String categorytypetwo) {
		this.categorytypetwo = categorytypetwo;
	}

	public String getObligateone() {
		return obligateone;
	}

	public void setObligateone(String obligateone) {
		this.obligateone = obligateone;
	}

	public String getObligatetwo() {
		return obligatetwo;
	}

	public void setObligatetwo(String obligatetwo) {
		this.obligatetwo = obligatetwo;
	}

	@Override
	public String toString() {
		return "Categorytwo [categoryidtwo=" + categoryidtwo
				+ ", categoryidone=" + categoryidone + ", categorytypetwo="
				+ categorytypetwo + ", obligateone=" + obligateone
				+ ", obligatetwo=" + obligatetwo + "]";
	}

   
}