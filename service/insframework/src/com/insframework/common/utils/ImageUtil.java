package com.insframework.common.utils;


import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

public class ImageUtil {

	/**
	 * 按照指定宽度等比例缩放图片
	 * 
	 * @param inPath
	 *            原图片路径
	 * @param widths
	 *            压缩后的图片宽度，设定多个值则压缩为多个图片
	 * @param outPath
	 *            压缩后的图片保存路径，可为null，若为null则默认和inPath为同一父路径
	 * @return 返回压缩后的图片保存路径
	 */
	public static String[] scalByWidth(String inPath, int[] widths,
			String[] outPath) {
		String[] outPaths = new String[widths.length];
		File file = new File(inPath);// 读入文件
		Image img = null;
		try {
			img = ImageIO.read(file);

			for (int i = 0; i < widths.length; i++) {
				String path = null;
				if (outPath == null) {
					path = inPath.substring(0, inPath.lastIndexOf(".")) + "_"
							+ widths[i] + "w"
							+ inPath.substring(inPath.lastIndexOf("."));
					outPaths[i] = path;
				} else {
					path = outPath[i];
				}
				resize(widths[i], null, img, path);
			}
		} catch (IOException e) {
			RuntimeException re = new RuntimeException("缩放图片异常");
			throw re;
		}
		return outPaths;
	}

	/**
	 * 按照指定高度等比例缩放图片
	 * 
	 * @param inPath
	 *            原图片路径
	 * @param heights
	 *            压缩后的图片高度，设定多个值则压缩为多个图片
	 * @param outPath
	 *            压缩后的图片保存路径，可为null，若为null则默认和inPath为同一父路径
	 * @return 返回压缩后的图片保存路径
	 * @return
	 */
	public static String[] scalByHeight(String inPath, int[] heights,
			String[] outPath) {
		String[] outPaths = new String[heights.length];
		File file = new File(inPath);// 读入文件
		Image img = null;
		try {
			img = ImageIO.read(file);
			for (int i = 0; i < heights.length; i++) {
				String path = null;
				if (outPath == null) {
					path = inPath.substring(0, inPath.lastIndexOf(".")) + "_"
							+ heights[i] + "h"
							+ inPath.substring(inPath.lastIndexOf("."));
					outPaths[i] = path;
				} else {
					path = outPath[i];
				}
				resize(null, heights[i], img, path);
			}
		} catch (IOException e) {
			RuntimeException re = new RuntimeException("缩放图片异常");
			throw re;
		}
		return outPaths;
	}

	/**
	 * 根据指定的宽度高度缩放图片（可能不是等比例缩放，若要等比例缩放，可将宽度或者高度设置为null）
	 * 
	 * @param inPath
	 *            源图片路径
	 * @param widths
	 *            缩放后的宽度
	 * @param heights
	 *            缩放后的高度
	 * @param outPath
	 *            图片缩放后保存的路径
	 * @return
	 */
	public static String[] scalByWidthAndHeight(String inPath, int[] widths,
			int[] heights, String[] outPath) {
		if ((widths == null && heights == null)
				|| (widths != null && heights != null && widths.length != heights.length)) {
			throw new RuntimeException("参数有误");
		}
		String[] outPaths = new String[heights != null ? heights.length
				: widths.length];
		File file = new File(inPath);// 读入文件
		Image img = null;
		try {
			img = ImageIO.read(file);
			for (int i = 0; i < (heights != null ? heights.length
					: widths.length); i++) {
				String path = null;
				if (widths == null && heights != null) {
					if (outPath == null) {
						path = inPath.substring(0, inPath.lastIndexOf("."))
								+ "_" + heights[i] + "h"
								+ inPath.substring(inPath.lastIndexOf("."));
						outPaths[i] = path;
					} else {
						path = outPath[i];
					}
					resize(null, heights[i], img, path);
				} else if (widths != null && heights == null) {
					if (outPath == null) {
						path = inPath.substring(0, inPath.lastIndexOf("."))
								+ "_" + widths[i] + "w"
								+ inPath.substring(inPath.lastIndexOf("."));
						outPaths[i] = path;
					} else {
						path = outPath[i];
					}
					resize(widths[i], null, img, path);
				} else if (widths != null && heights != null) {
					if (outPath == null) {
						path = inPath.substring(0, inPath.lastIndexOf("."))
								+ "_" + widths[i] + "w" + heights[i] + "h"
								+ inPath.substring(inPath.lastIndexOf("."));
						outPaths[i] = path;
					} else {
						path = outPath[i];
					}
					resize(widths[i], heights[i], img, path);
				}
			}
		} catch (IOException e) {
			RuntimeException re = new RuntimeException("缩放图片异常");
			throw re;
		}
		return outPaths;
	}

	/**
	 * 按照指定宽度等比例缩放图片
	 * 
	 * @param inPath
	 *            原图片流路径
	 * @param widths
	 *            压缩后的图片宽度，设定多个值则压缩为多个图片
	 * @param outPath 
	 *            压缩后的图片保存路径，可为null，若为null则默认和inPath为同一父路径
	 * @return 返回压缩后的图片保存路径
	 */
	public static String[] scalByWidth(InputStream ins, int[] widths,
			String[] outPath) {
		String[] outPaths = new String[widths.length];
		Image img = null;
		try {
			img = ImageIO.read(ins);
			for (int i = 0; i < widths.length; i++) {
				resize(widths[i], null, img, outPath[i]);
			}
		} catch (IOException e) {
			RuntimeException re = new RuntimeException("缩放图片异常");
			throw re;
		}
		return outPaths;
	}

	/**
	 * 按照指定高度等比例缩放图片
	 * 
	 * @param inPath
	 *            原图片流路径
	 * @param heights
	 *            压缩后的图片高度，设定多个值则压缩为多个图片
	 * @param outPath
	 *            压缩后的图片保存路径，可为null，若为null则默认和inPath为同一父路径
	 * @return 返回压缩后的图片保存路径
	 * @return
	 */
	public static String[] scalByHeight(InputStream ins, int[] heights,
			String[] outPath) {
		String[] outPaths = new String[heights.length];
		Image img = null;
		try {
			img = ImageIO.read(ins);
			for (int i = 0; i < heights.length; i++) {
				resize(null, heights[i], img, outPath[i]);
			}
		} catch (IOException e) {
			RuntimeException re = new RuntimeException("缩放图片异常");
			throw re;
		}
		return outPaths;
	}

	/**
	 * 根据指定的宽度高度缩放图片（可能不是等比例缩放，若要等比例缩放，可将宽度或者高度设置为null）
	 * 
	 * @param inPath
	 *            源图片流路径
	 * @param widths
	 *            缩放后的宽度
	 * @param heights
	 *            缩放后的高度
	 * @param outPath
	 *            图片缩放后保存的路径
	 * @return
	 */
	public static String[] scalByWidthAndHeight(InputStream ins, int[] widths,
			int[] heights, String[] outPath) {
		if ((widths == null && heights == null)
				|| (widths != null && heights != null && widths.length != heights.length)) {
			throw new RuntimeException("参数有误");
		}
		String[] outPaths = new String[heights != null ? heights.length
				: widths.length];
		Image img = null;
		try {
			img = ImageIO.read(ins);
			for (int i = 0; i < (heights != null ? heights.length
					: widths.length); i++) {
				String path = null;
				if (widths == null && heights != null) {
						path = outPath[i];
					resize(null, heights[i], img, path);
				} else if (widths != null && heights == null) {
						path = outPath[i];
					resize(widths[i], null, img, path);
				} else if (widths != null && heights != null) {
						path = outPath[i];
					resize(widths[i], heights[i], img, path);
				}
			}
		} catch (IOException e) {
			RuntimeException re = new RuntimeException("缩放图片异常");
			throw re;
		}
		return outPaths;
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
	 * @param outImgPath
	 *            缩放后的图片保存路径
	 */
	private static void resize(Integer w, Integer h, Image img,
			String outImgPath) {
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
		outImage(outImgPath, image);
	}
	
	
	/**
	 * 裁剪圖片
	 * @param sourcePath 原图片路径
	 * @param targetPath 保存后的图片路径
	 * @param x          裁剪的左上x坐标
	 * @param y          裁剪的左上y坐标
	 * @param width      裁剪的图片宽度
	 * @param height     裁剪的图片高度
	 * @return
	 * @throws IOException
	 */
	public static String cut(String sourcePath, String targetPath, int x,
			int y, int width, int height) throws IOException {
		File file = new File(sourcePath);
		if (!file.exists()) {
			throw new IOException("not found the image：" + sourcePath);
		}
		//如果保存后的图片路径为null则覆盖原始图片
		if (null == targetPath || targetPath.isEmpty()){
			targetPath = sourcePath;
		}
		BufferedImage image = ImageIO.read(file);
		image = image.getSubimage(x, y, width, height);		
		outImage(targetPath, image);
		return targetPath;
	}
	
	/**
	 * @param sourceIs   原图片流
	 * @param targetPath 保存后的图片路径
	 * @param x          裁剪的左上x坐标
	 * @param y          裁剪的左上y坐标
	 * @param width      裁剪的图片宽度
	 * @param height     裁剪的图片高度
	 * @return
	 */
	public static String cut(InputStream sourceIs, String targetPath,
			int x, int y, int width, int height) {
		try {			
			BufferedImage image = ImageIO.read(sourceIs);
			image = image.getSubimage(x, y, width, height);
			outImage(targetPath, image);
		} catch (IOException e) {
			throw new RuntimeException("裁剪图片异常");
		}

		return targetPath;
	}
	
	
	/**
	 * 输出图片
	 * @param outImgPath
	 * @param newImg
	 */
	public static void outImage(String outImgPath, BufferedImage newImg) {
		// 判断输出的文件夹路径是否存在，不存在则创建
		File file = new File(outImgPath);
		if (!file.getParentFile().exists()) {
			file.getParentFile().mkdirs();
		}// 输出到文件流
		try {
			ImageIO.write(newImg,
					outImgPath.substring(outImgPath.lastIndexOf(".") + 1),
					new File(outImgPath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
     * 使用response流输出图片
     * @param response
     * @param is
     */
    public static void outImageResponse(HttpServletResponse response, BufferedImage is) throws Exception{
    	response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");
		ServletOutputStream responseOutputStream = response.getOutputStream();
		ImageIO.write(is, "jpg", responseOutputStream);		
		responseOutputStream.flush();
		responseOutputStream.close();		
    }
	
}
