package com.yc.mogujie.entity;

public class Advertise {
    private int aid;

    private String asize;

    private String weizhi;

    private int obligateone;

    private int obligatetwo;

    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAsize() {
        return asize;
    }

    public void setAsize(String asize) {
        this.asize = asize == null ? null : asize.trim();
    }

    public String getWeizhi() {
        return weizhi;
    }

    public void setWeizhi(String weizhi) {
        this.weizhi = weizhi == null ? null : weizhi.trim();
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

	@Override
	public String toString() {
		return "Advertise [aid=" + aid + ", asize=" + asize + ", weizhi="
				+ weizhi + ", obligateone=" + obligateone + ", obligatetwo="
				+ obligatetwo + "]";
	}
    
}