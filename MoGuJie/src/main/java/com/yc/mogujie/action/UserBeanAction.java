package com.yc.mogujie.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ModelDriven;
import com.yc.mogujie.entity.UserBean;
import com.yc.mogujie.entity.UserInfo;
import com.yc.mogujie.service.UserInfoService;

@Controller("userBeanAction")
public class UserBeanAction implements ModelDriven<UserBean>,SessionAware{
	private UserBean userBean;
	private UserBean userInfo;
	private Map<String, Object> session;
	private String yan;

	//处理文件上传的三个属性xxx,xxxFileName,xxxContentType
	private File upload;
	private String uploadFileName;
	private String uploadContentType;


	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setYan(String yan) {
		this.yan = yan;
	}

	public String getYan() {
		return yan;
	}

	public UserBean getUserInfo() {
		return userInfo;
	}

	@Autowired
	private UserInfoService userInfoService;

	//前台查询用户基本信息
	public String findBasicInfo(){
		LogManager.getLogger().debug(userBean);
		userInfo=userInfoService.findBasicInfo(userBean.getUname());
		//System.out.println("查询到数据为："+userInfo);
		return "findBasicsuccess";
	}

	//前台修改用户基本信息
	public String updateBasicInfo(){
		//System.out.println("取到的原昵称为："+userBean.getOldUanme());
		LogManager.getLogger().debug(userBean);
		int result=userInfoService.updateUserBasic(userBean);
		if(result==1){
			userInfo=userInfoService.findBasicInfo(userBean.getUname());
			return "updateSuccess";
		}
		return "fail";
	}

	//前台  修改用户密码
	public void updatePwd(){
		/*System.out.println("旧密码："+userBean.getOldPwd());
		System.out.println("新密码："+userBean.getNewPwd());
		System.out.println("用户id："+userBean.getUsid());
		System.out.println("用户昵称："+userBean.getUname());*/
		Map<String,Object> params=new HashMap<String, Object>();
		params.put("newPwd", userBean.getNewPwd());
		params.put("usid", userBean.getUsid());
		params.put("oldPwd", userBean.getOldPwd());
		String tuYan=(String) session.get("rand");
		if(yan.equals(tuYan)){
			int result=userInfoService.updateUserPwd(params);
			/*if(result==1){
				//userInfo=userInfoService.findBasicInfo(userBean.getUname());
				//((Map<String, Object>) userInfo).clear();
				System.out.println("123"+userInfo);
				return "updatePwdSuccess";
			}*/
		}
	}

	//前台  修改头像
	public String updateImage(){
		String path=ServletActionContext.getServletContext().getRealPath("../upload/");
		try {
			userBean.setUphoto("../upload/"+uploadFileName);
			//System.out.println(userBean.getUphoto());
			int result=userInfoService.updatePhoto(userBean);
			if(result==1){
				FileUtils.copyFile(upload, new File(path+"/"+uploadFileName));//开始上传
				//System.out.println("上传成功....");
				UserInfo user=(UserInfo) session.get("loginUser");
				user.setUphoto("../upload/"+uploadFileName);
				return "updatePhotoSuccess";

			} 
		}catch (IOException e) {
			System.out.println("上传失败....");
		}
		return "fail";
	}
	@Override
	public UserBean getModel() {
		userBean=new UserBean();
		return userBean;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
}
