package com.yc.mogujie.entity;

public class Categorytwo {
    private int categoryidtwo;

    private int categoryidone;

    private String categorytypetwo;

    private int obligateone;

    private int obligatetwo;

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
        this.categorytypetwo = categorytypetwo == null ? null : categorytypetwo.trim();
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
}