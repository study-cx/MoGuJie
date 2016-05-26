package com.yc.mogujie.entity;

import java.util.Date;

public class UserInfo {
    private int usid;

    private String uspwd;

    private String uname;

    private String uphoto;

    private Date ubirthday;

    private String usemail;

    private String ucode;

    private String usphone;

    private int usaccount;

    private int statue;

    private String obligateone;

    private String obligatetwo;

	public int getUsid() {
		return usid;
	}

	public void setUsid(int usid) {
		this.usid = usid;
	}

	public String getUspwd() {
		return uspwd;
	}

	public void setUspwd(String uspwd) {
		this.uspwd = uspwd;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUphoto() {
		return uphoto;
	}

	public void setUphoto(String uphoto) {
		this.uphoto = uphoto;
	}

	public Date getUbirthday() {
		return ubirthday;
	}

	public void setUbirthday(Date ubirthday) {
		this.ubirthday = ubirthday;
	}

	public String getUsemail() {
		return usemail;
	}

	public void setUsemail(String usemail) {
		this.usemail = usemail;
	}

	public String getUcode() {
		return ucode;
	}

	public void setUcode(String ucode) {
		this.ucode = ucode;
	}

	public String getUsphone() {
		return usphone;
	}

	public void setUsphone(String usphone) {
		this.usphone = usphone;
	}

	public int getUsaccount() {
		return usaccount;
	}

	public void setUsaccount(int usaccount) {
		this.usaccount = usaccount;
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
		return "UserInfo [usid=" + usid + ", uspwd=" + uspwd + ", uname="
				+ uname + ", uphoto=" + uphoto + ", ubirthday=" + ubirthday
				+ ", usemail=" + usemail + ", ucode=" + ucode + ", usphone="
				+ usphone + ", usaccount=" + usaccount + ", statue=" + statue
				+ ", obligateone=" + obligateone + ", obligatetwo="
				+ obligatetwo + "]";
	}

    
    
}