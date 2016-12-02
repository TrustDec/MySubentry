package com.insframework.component.service.file.doc;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;

public class OfficeTool {
	
	private static final int wdFormatPDF = 17;
	private static final int xlTypePDF = 0;
	private static final int ppSaveAsPDF = 32;

	public static boolean word2PDF(String inputFile, String pdfFile) {
		
		boolean flag = false;
		
		ActiveXComponent app = null;
		
		Dispatch doc = null;
		
		try {			
			// 打开word应用程序
			app = new ActiveXComponent("Word.Application");
			// 设置word不可见
			app.setProperty("Visible", false);
			// 获得word中所有打开的文档,返回Documents对象
			Dispatch docs = app.getProperty("Documents").toDispatch();
			// 调用Documents对象中Open方法打开文档，并返回打开的文档对象Document
			doc = Dispatch.call(docs, "Open", inputFile, false, true)
					.toDispatch();
			// 调用Document对象的SaveAs方法，将文档保存为pdf格式
			/*
			 * Dispatch.call(doc, "SaveAs", pdfFile, wdFormatPDF
			 * //word保存为pdf格式宏，值为17 );
			 */
			Dispatch.call(doc, "ExportAsFixedFormat", pdfFile, wdFormatPDF // word保存为pdf格式宏，值为17
			);
			
			
			flag = true;
		} catch (Exception e) {
			flag = false;
		}finally{
			
			// 关闭文档
			Dispatch.call(doc, "Close", false);
			// 关闭word应用程序
			app.invoke("Quit", 0);
			
		}
		
		return flag;
	}

	public static boolean excel2PDF(String inputFile, String pdfFile) {
		
		boolean flag = false;
		
		ActiveXComponent app = null;
		
		Dispatch excel = null;
		
		try {
			
			app = new ActiveXComponent("Excel.Application");
			app.setProperty("Visible", false);
			Dispatch excels = app.getProperty("Workbooks").toDispatch();
			excel = Dispatch.call(excels, "Open", inputFile, false,
					true).toDispatch();
			Dispatch.call(excel, "ExportAsFixedFormat", xlTypePDF, pdfFile);			
			
			flag = true;
		} catch (Exception e) {
			flag = false;
		}finally{
			
			Dispatch.call(excel, "Close", false);
			app.invoke("Quit");
			
		}
		
		return flag;
		
	}

	public static boolean ppt2PDF(String inputFile, String pdfFile) {
		
		boolean flag = false;
		
		ActiveXComponent app = null;
		
		Dispatch ppt = null;
		
		try {
			
			app = new ActiveXComponent(
					"PowerPoint.Application");
			// app.setProperty("Visible", msofalse);
			Dispatch ppts = app.getProperty("Presentations").toDispatch();

			ppt = Dispatch.call(ppts, "Open", inputFile, true,// ReadOnly
					true,// Untitled指定文件是否有标题
					false// WithWindow指定文件是否可见
					).toDispatch();

			Dispatch.call(ppt, "SaveAs", pdfFile, ppSaveAsPDF);
			
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
		}finally{
			
			Dispatch.call(ppt, "Close");

			app.invoke("Quit");
				
		}
		
		return flag;
	}
	
	
}
