package com.yc.mogujie.entity;

import java.util.Date;

public class Guanggao {
    private int gid;

    private int aid;

    private int ggrade;

    private String gphoto;

    private Date gdates;

    private Date gdateo;

    private int weight;

    private int click;

    private String linkaddress;

    private int obligateone;

    private int obligatetwo;

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getGgrade() {
        return ggrade;
    }

    public void setGgrade(int ggrade) {
        this.ggrade = ggrade;
    }

    public String getGphoto() {
        return gphoto;
    }

    public void setGphoto(String gphoto) {
        this.gphoto = gphoto == null ? null : gphoto.trim();
    }

    public Date getGdates() {
        return gdates;
    }

    public void setGdates(Date gdates) {
        this.gdates = gdates;
    }

    public Date getGdateo() {
        return gdateo;
    }

    public void setGdateo(Date gdateo) {
        this.gdateo = gdateo;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    public String getLinkaddress() {
        return linkaddress;
    }

    public void setLinkaddress(String linkaddress) {
        this.linkaddress = linkaddress == null ? null : linkaddress.trim();
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