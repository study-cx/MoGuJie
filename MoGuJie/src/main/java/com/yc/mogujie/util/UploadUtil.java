package com.yc.mogujie.util;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

@Service("uploadUtil")
public class UploadUtil {
	public String image(File[] upload,String[] uploadFileName) {
		
		String path = null;
		for (int i = 0; i < upload.length; i++) {
			String path1=ServletActionContext.getServletContext().getRealPath("../upload/"+uploadFileName[i] );
			  path="../upload/"+uploadFileName[i]; //相对路径会有问题

			// 要使用绝对地址
			// path = ServletActionContext.getServletContext().getRealPath("../upload/"+uploadFileName[0] );
			 
			System.out.println("上传的地址" + path);

			try {
				FileUtils.copyFile(upload[i], new File(path1)); // 开始上传
				System.out.println("上传成功...");
			} catch (IOException e) {
				System.out.println("上传失败...");
				e.printStackTrace();
			}

		}
		System.out.println(path);
		return path;
		
	}

}
