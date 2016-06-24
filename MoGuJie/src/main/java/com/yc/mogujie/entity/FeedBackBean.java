package com.yc.mogujie.entity;

import java.util.Date;

public class FeedBackBean {
		private int fid;

	    private int usid;

	    private int orderid;

	    private int proid;

	    private Date fdate;

	    private String obligateone;

	    private String obligatetwo;

	    private String content;
	    
	    private int ostatus;
	    
	    private int orid;
	    
		public int getOrid() {
			return orid;
		}
		public void setOrid(int orid) {
			this.orid = orid;
		}
		public int getFid() {
			return fid;
		}
		public void setFid(int fid) {
			this.fid = fid;
		}
		public int getUsid() {
			return usid;
		}
		public void setUsid(int usid) {
			this.usid = usid;
		}
		public int getOrderid() {
			return orderid;
		}
		public void setOrderid(int orderid) {
			this.orderid = orderid;
		}
		public int getProid() {
			return proid;
		}
		public void setProid(int proid) {
			this.proid = proid;
		}
		public Date getFdate() {
			return fdate;
		}
		public void setFdate(Date fdate) {
			this.fdate = fdate;
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
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getOstatus() {
			return ostatus;
		}
		public void setOstatus(int ostatus) {
			this.ostatus = ostatus;
		}
		@Override
		public String toString() {
			return "FeedBackBean [\nfid=" + fid + ", usid=" + usid + ", orderid="
					+ orderid + ", proid=" + proid + ", fdate=" + fdate
					+ ", obligateone=" + obligateone + ", obligatetwo="
					+ obligatetwo + ", content=" + content + ", ostatus="
					+ ostatus + ", orid=" + orid + "]";
		}
		
}
