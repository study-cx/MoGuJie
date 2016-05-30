package com.yc.mogujie.entity;

public class Categoryone {
    private int categoryidone;

    private String categorytypeone;

    private String obligateone;

    private String obligatetwo;

	public int getCategoryidone() {
		return categoryidone;
	}

	public void setCategoryidone(int categoryidone) {
		this.categoryidone = categoryidone;
	}

	public String getCategorytypeone() {
		return categorytypeone;
	}

	public void setCategorytypeone(String categorytypeone) {
		this.categorytypeone = categorytypeone;
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
		return "Categoryone [categoryidone=" + categoryidone
				+ ", categorytypeone=" + categorytypeone + ", obligateone="
				+ obligateone + ", obligatetwo=" + obligatetwo + "]";
	}

   
}