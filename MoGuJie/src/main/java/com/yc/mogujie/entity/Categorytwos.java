package com.yc.mogujie.entity;

public class Categorytwos {
    private int categoryidtwo;

    private int categoryidone;

    private String categoryTypetwo;
    
    private String categoryTypeone;

    private String obligateone;

    private String obligatetwo;

	public int getCategoryidtwo() {
		return categoryidtwo;
	}

	public String getCategoryTypeone() {
		return categoryTypeone;
	}

	public void setCategoryTypeone(String categoryTypeone) {
		this.categoryTypeone = categoryTypeone;
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

	

	public String getCategoryTypetwo() {
		return categoryTypetwo;
	}

	public void setCategoryTypetwo(String categoryTypetwo) {
		this.categoryTypetwo = categoryTypetwo;
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
		return "Categorytwos [categoryidtwo=" + categoryidtwo
				+ ", categoryidone=" + categoryidone + ", categoryTypetwo="
				+ categoryTypetwo + ", categoryTypeone=" + categoryTypeone
				+ ", obligateone=" + obligateone + ", obligatetwo="
				+ obligatetwo + "]";
	}

	
	

   
}