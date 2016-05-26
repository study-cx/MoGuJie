package com.yc.mogujie.entity;

import java.util.Date;

public class UserInfo {
    private int usid;//编号

    private String uspwd;//密码

    private String uname;//昵称

    private String uphoto;//头像

    private Date ubirthday;//生日

    private String usemail;//邮箱

    private String ucode;//用户邮编

    private String usphone;//用户联系方式

    private int usaccount;//用户余额

    private int statue;//删除时的状态标志

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
        this.uspwd = uspwd == null ? null : uspwd.trim();
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUphoto() {
        return uphoto;
    }

    public void setUphoto(String uphoto) {
        this.uphoto = uphoto == null ? null : uphoto.trim();
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
        this.usemail = usemail == null ? null : usemail.trim();
    }

    public String getUcode() {
        return ucode;
    }

    public void setUcode(String ucode) {
        this.ucode = ucode == null ? null : ucode.trim();
    }

    public String getUsphone() {
        return usphone;
    }

    public void setUsphone(String usphone) {
        this.usphone = usphone == null ? null : usphone.trim();
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

}