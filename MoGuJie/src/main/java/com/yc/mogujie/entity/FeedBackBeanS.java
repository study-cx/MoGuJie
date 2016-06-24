package com.yc.mogujie.entity;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class FeedBackBeanS {
	 private String uname;
	    public String fdate;
	    private String content;
	    private  SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy",Locale.US);
		public String getUname() {
			return uname;
		}
		public void setUname(String uname) {
			this.uname = uname;
		}
		
		
		public String getContent() {
			return content;
		}

		public String getFdate() {
			return fdate;
		}
		public void setFdate(String fdate) {
			
			this.fdate = fdate;
		}
		public void setContent(String content) {
			this.content = content;
		}
		@Override
		public String toString() {
			return "FeedbackBean [uname=" + uname + ", fdate=" + fdate
					+ ", content=" + content + "]";
		}

		
}
