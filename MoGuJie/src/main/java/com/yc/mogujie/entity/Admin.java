package com.yc.mogujie.entity;

public class Admin {
    private int aid;

    private String aname;

    private String apwd;

    private String aemail;

    private int agread;
    
    

    public Admin(int aid, String aname, String apwd, String aemail, int agread) {
		super();
		this.aid = aid;
		this.aname = aname;
		this.apwd = apwd;
		this.aemail = aemail;
		this.agread = agread;
	}

	public Admin() {
		super();
	}

	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", aname=" + aname + ", apwd=" + apwd
				+ ", aemail=" + aemail + ", agread=" + agread + "]";
	}

	public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname == null ? null : aname.trim();
    }

    public String getApwd() {
        return apwd;
    }

    public void setApwd(String apwd) {
        this.apwd = apwd == null ? null : apwd.trim();
    }

    public String getAemail() {
        return aemail;
    }

    public void setAemail(String aemail) {
        this.aemail = aemail == null ? null : aemail.trim();
    }

    public int getAgread() {
        return agread;
    }

    public void setAgread(int agread) {
        this.agread = agread;
    }
}