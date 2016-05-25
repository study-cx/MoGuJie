package com.yc.mogujie.entity;

public class Detail {
    private int deid;

    private int proid;

    private int counts;

    private String psize;

    private String pcolor;

    private String color;

    private int pronumber;

    private int obligateone;

    private int obligatetwo;

    public int getDeid() {
        return deid;
    }

    public void setDeid(int deid) {
        this.deid = deid;
    }

    public int getProid() {
        return proid;
    }

    public void setProid(int proid) {
        this.proid = proid;
    }

    public int getCounts() {
        return counts;
    }

    public void setCounts(int counts) {
        this.counts = counts;
    }

    public String getPsize() {
        return psize;
    }

    public void setPsize(String psize) {
        this.psize = psize == null ? null : psize.trim();
    }

    public String getPcolor() {
        return pcolor;
    }

    public void setPcolor(String pcolor) {
        this.pcolor = pcolor == null ? null : pcolor.trim();
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color == null ? null : color.trim();
    }

    public int getPronumber() {
        return pronumber;
    }

    public void setPronumber(int pronumber) {
        this.pronumber = pronumber;
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