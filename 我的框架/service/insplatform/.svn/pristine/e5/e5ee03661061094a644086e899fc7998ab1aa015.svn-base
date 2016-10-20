package com.insplatform.mobile.utils;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.insframework.common.utils.ImageUtil;
import com.insframework.system.context.App;
import com.insplatform.system.user.service.UserService;


@Controller
@RequestMapping("/mobile/rest/system/user")
public class MobileWritePhoto {
	
	@Autowired
	private UserService userService;
	/**
	 * 向浏览器输出照片
	 * @param request
	 * @param response
	 */
	@RequestMapping("/writePhotox")
	public void writePhotox(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		byte[] photo = null;
		try {
			photo = userService.getPhotoById(id);
		} catch (Exception e) {
		}
		InputStream is = null;
		HttpURLConnection conn = null;
		try {
			if (photo==null||photo.length==0) {	
				//此处有些问题
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+App.STATIC_PATH +"/";
				URL url = new URL(basePath + "/image/header/photo.png");
				conn = (HttpURLConnection) url.openConnection();
				conn.setDoInput(true);
				conn.connect(); 
				is = conn.getInputStream();
			}else {
				is = new ByteArrayInputStream(photo);
			}
			Image img = ImageIO.read(is);
			BufferedImage image = resize(50,null,img);
			ImageUtil.outImageResponse(response, image);
//			FileUtil.writeImage(response, is);
		} catch (Exception e) {			
			e.printStackTrace();
		}finally{
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}	
	
	
	/**
	 * 缩放图片，若只设置高度或者宽度则按照设置的高度或者宽度等比例缩放图片，否则按照指定的高度和宽度缩放图片（这种方式可能不是等比例缩放）
	 * 
	 * @param w
	 *            缩放后的宽度
	 * @param h
	 *            缩放后的高度
	 * @param img
	 *            原图片img对象
	 * @return 
	 */
	private BufferedImage resize(Integer w, Integer h, Image img) {
		int width = img.getWidth(null);
		int height = img.getHeight(null);
		if (h == null && w != null) {// 按照宽度等比例缩放图片
			h = height * w / width;
		} else if (w == null && h != null) {// 按照高度等比例缩放图片
			w = width * h / height;
		} else if (h == null && w == null) {
			throw new RuntimeException("需要指定缩放后的图片大小");
		}
		BufferedImage image = new BufferedImage(w, h,
				BufferedImage.TYPE_INT_RGB);
		image.getGraphics().drawImage(img, 0, 0, w, h, null); // 绘制缩小后的图
		return image;
	}
}
