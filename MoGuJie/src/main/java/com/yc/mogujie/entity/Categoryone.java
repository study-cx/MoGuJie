package com.yc.mogujie.entity;

import java.io.Serializable;

public class Categoryone implements Serializable {
	private static final long serialVersionUID = 1L;

	private int categoryidone;

	private String categorytypeone;

	private String obligateone;

	private String obligatetwo;

	@Override
	public String toString() {
		return "Categoryone [categoryidone=" + categoryidone
				+ ", categorytypeone=" + categorytypeone + ", obligateone="
				+ obligateone + ", obligatetwo=" + obligatetwo + "]";
	}

	public Categoryone() {
		super();
	}

	public Categoryone(int categoryidone, String categorytypeone,
			String obligateone, String obligatetwo) {
		super();
		this.categoryidone = categoryidone;
		this.categorytypeone = categorytypeone;
		this.obligateone = obligateone;
		this.obligatetwo = obligatetwo;
	}

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

}