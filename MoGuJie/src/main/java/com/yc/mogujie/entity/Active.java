package com.yc.mogujie.entity;

import java.util.Date;

public class Active {
    private int activeid;

    private Date actives;

    private Date activeo;

    private String activetype;

    private int obligateone;

    private int obligatetwo;

    public int getActiveid() {
        return activeid;
    }

    public void setActiveid(int activeid) {
        this.activeid = activeid;
    }

    public Date getActives() {
        return actives;
    }

    public void setActives(Date actives) {
        this.actives = actives;
    }

    public Date getActiveo() {
        return activeo;
    }

    public void setActiveo(Date activeo) {
        this.activeo = activeo;
    }

    public String getActivetype() {
        return activetype;
    }

    public void setActivetype(String activetype) {
        this.activetype = activetype == null ? null : activetype.trim();
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