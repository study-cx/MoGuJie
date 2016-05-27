package com.yc.mogujie.entity;

public class Address {
    private int addressid;

    private String province;

    private String city;

    private String street;

    private String usaddress;

    private int usid;

    private String adname;

    private int adcode;

    private String adtel;

    private int statue;

    private String obligateone;

    private String obligatetwo;

    public int getAddressid() {
        return addressid;
    }

    public void setAddressid(int addressid) {
        this.addressid = addressid;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street == null ? null : street.trim();
    }

    public String getUsaddress() {
        return usaddress;
    }

    public void setUsaddress(String usaddress) {
        this.usaddress = usaddress == null ? null : usaddress.trim();
    }

    public int getUsid() {
        return usid;
    }

    public void setUsid(int usid) {
        this.usid = usid;
    }

    public String getAdname() {
        return adname;
    }

    public void setAdname(String adname) {
        this.adname = adname == null ? null : adname.trim();
    }

    public int getAdcode() {
        return adcode;
    }

    public void setAdcode(int adcode) {
        this.adcode = adcode;
    }

    public String getAdtel() {
        return adtel;
    }

    public void setAdtel(String adtel) {
        this.adtel = adtel == null ? null : adtel.trim();
    }

    public int getStatue() {
        return statue;
    }

    public void setStatue(int statue) {
        this.statue = statue;
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
		return "Address [addressid=" + addressid + ", province=" + province
				+ ", city=" + city + ", street=" + street + ", usaddress="
				+ usaddress + ", usid=" + usid + ", adname=" + adname
				+ ", adcode=" + adcode + ", adtel=" + adtel + ", statue="
				+ statue + ", obligateone=" + obligateone + ", obligatetwo="
				+ obligatetwo + "]";
	}

}