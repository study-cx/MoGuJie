package com.yc.mogujie.entity;

public class Categoryone {
    private int categoryidone;

    private String categorytypeone;

    private int obligateone;

    private int obligatetwo;

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
        this.categorytypeone = categorytypeone == null ? null : categorytypeone.trim();
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