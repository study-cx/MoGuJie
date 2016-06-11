package com.yc.mogujie.entity;

public class Cart {
    private int cid;

    private int proid;

    private int usid;

    private String color;

    private String csize;

    private String pcolor;

    private int snumber;
    private String obligateone; 

    private String obligatetwo;

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getProid() {
		return proid;
	}

	public void setProid(int proid) {
		this.proid = proid;
	}

	public int getUsid() {
		return usid;
	}

	public void setUsid(int usid) {
		this.usid = usid;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getCsize() {
		return csize;
	}

	public void setCsize(String csize) {
		this.csize = csize;
	}

	public String getPcolor() {
		return pcolor;
	}

	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}

	public int getSnumber() {
		return snumber;
	}

	public void setSnumber(int snumber) {
		this.snumber = snumber;
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
		return "Cart [cid=" + cid + ", proid=" + proid + ", usid=" + usid
				+ ", color=" + color + ", csize=" + csize + ", pcolor="
				+ pcolor + ", snumber=" + snumber + ", obligateone="
				+ obligateone + ", obligatetwo=" + obligatetwo + "]";
	}

   
}
