package com.yc.mogujie.entity;

public class Categorythree {
    private int categoryidthree;

    private int categoryidtwo;

    private String categorytypethree;

    private int obligateone;

    private int obligatetwo;

    public int getCategoryidthree() {
        return categoryidthree;
    }

    public void setCategoryidthree(int categoryidthree) {
        this.categoryidthree = categoryidthree;
    }

    public int getCategoryidtwo() {
        return categoryidtwo;
    }

    public void setCategoryidtwo(int categoryidtwo) {
        this.categoryidtwo = categoryidtwo;
    }

    public String getCategorytypethree() {
        return categorytypethree;
    }

    public void setCategorytypethree(String categorytypethree) {
        this.categorytypethree = categorytypethree == null ? null : categorytypethree.trim();
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