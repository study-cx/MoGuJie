package com.yc.mogujie.entity;

public class Product {
    private int proid;

    private String proname;

    private String procontent;

    private int proprice;

    private int categoryidthree;

    private String prophoto;

    private int pstatue;

    private int obligateone;

    private int obligatetwo;

    public int getProid() {
        return proid;
    }

    public void setProid(int proid) {
        this.proid = proid;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname == null ? null : proname.trim();
    }

    public String getProcontent() {
        return procontent;
    }

    public void setProcontent(String procontent) {
        this.procontent = procontent == null ? null : procontent.trim();
    }

    public int getProprice() {
        return proprice;
    }

    public void setProprice(int proprice) {
        this.proprice = proprice;
    }

    public int getCategoryidthree() {
        return categoryidthree;
    }

    public void setCategoryidthree(int categoryidthree) {
        this.categoryidthree = categoryidthree;
    }

    public String getProphoto() {
        return prophoto;
    }

    public void setProphoto(String prophoto) {
        this.prophoto = prophoto == null ? null : prophoto.trim();
    }

    public int getPstatue() {
        return pstatue;
    }

    public void setPstatue(int pstatue) {
        this.pstatue = pstatue;
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