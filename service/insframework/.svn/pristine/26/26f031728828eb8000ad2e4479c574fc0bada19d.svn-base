package com.insframework.component.controller.export;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.insframework.common.utils.FileUtil;
import com.insframework.system.base.controller.BaseController;
import com.insframework.system.context.App;
import com.insframework.system.curruser.CurrentUser;

@Controller
public class ExportController extends BaseController{
	
	private final int SHEET_ROW_NUM = 60000;
	
	private RequestMappingHandlerMapping requestMappingHandlerMapping;
	
	@RequestMapping("insexport/excel")
	public @ResponseBody Map<String, Object> excel(HttpServletRequest request, HttpServletResponse response){
		try {
			//获取RequestMappingHandlerMapping集合
			ServletContext servletContext = request.getSession().getServletContext();
			ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
			this.initHandlerMappings(context);
			
			//收集参数
			CurrentUser user = this.getCurrentUser(request);
			//获取表头名称。columns
			String columnsJson = request.getParameter("columnsJson");
			List<Map<String, Object>> columns = jsonToListMap(columnsJson);
			//获取gridColumns
			String gridColumns = request.getParameter("gridColumns");
			List<Map<String, Object>> gridColumnsList = jsonToListMap(gridColumns);
			
			
			HSSFWorkbook wb = new HSSFWorkbook();
			//设置全局style
			HSSFCellStyle style = wb.createCellStyle();  
			style.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
			style.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
			style.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
			style.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
			//设置全局字体
			HSSFFont font = wb.createFont();
			font.setFontHeightInPoints((short) 11);
			font.setFontName("宋体"); 
			
			//获取前台参数
			String url = request.getParameter("gridUrl").replace(request.getContextPath(), "");
			int total = Integer.parseInt(request.getParameter("total")+"");
			int sheetSize = total%this.SHEET_ROW_NUM==0?total/this.SHEET_ROW_NUM:total/this.SHEET_ROW_NUM+1;
			
			//设置style 内容样式
			HSSFCellStyle contentStyle = wb.createCellStyle();
			contentStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
			contentStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
			contentStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
			contentStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
			//设置内容字体
			contentStyle.setFont(font);
			
			//向request中添加导出查询分页参数
			//设置每页查询数据
			request.setAttribute("INSEXPORT_LIMIT", this.SHEET_ROW_NUM);
			//循环创建sheet
			for (int i = 0; i < sheetSize; i++) {
				//创建sheet页
				int sheetNum = i+1;
				HSSFSheet sheet = wb.createSheet("sheet"+sheetNum);
				request.setAttribute("INSEXPORT_PAGE", sheetNum);
				request.setAttribute("INSEXPORT_START", i*this.SHEET_ROW_NUM);
	
				//获取本sheet页数据
				Map<String, Object> mapData = getExportData(url,request,response,context);
				@SuppressWarnings("unchecked")
				List<Map<String,Object>> dataList = (List<Map<String, Object>>) mapData.get("data");
				//设置表头
				setColumnsHead(sheet,style,font,columns,gridColumnsList);
				//循环创建行
				HSSFRow row = null;
				HSSFCell cell = null;
				for (int j = 0; j < this.SHEET_ROW_NUM+1 && j < dataList.size(); j++) {
					row = sheet.createRow((int) j+1);
					//循环创建列并填充数据
					for (int k = 0; k < columns.size(); k++) {
						cell = row.createCell(k);
						cell.setCellStyle(contentStyle);
						cell.setCellValue(dataList.get(j).get(columns.get(k).get("dataIndex"))==null?"":dataList.get(j).get(columns.get(k).get("dataIndex"))+"");
					}
				}
			}
			return this.getMessager().success().put("fileInfo", saveHSSFWorkbook(wb,user));    
		} catch (Exception e) {
			System.out.println("-----------导出excel异常start--------------");
			e.printStackTrace();
			System.out.println("-----------导出excel异常end--------------");
			return this.getMessager().error();
		}

	}
	
	/**
	 * 设置表头
	 * @param sheet
	 * @param style 
	 * @param font 
	 * @param columns
	 * @param gridColumnsList 
	 */
	private void setColumnsHead(HSSFSheet sheet,
			HSSFCellStyle style, HSSFFont font, List<Map<String, Object>> columns, List<Map<String, Object>> gridColumnsList) {
		int width = 0;
//		createMoreHead(sheet,style, font,  columns, gridColumnsList);
		Map<String, Object> map = null;
		HSSFRow row = sheet.createRow((int) 0);
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);;
		HSSFFont titleFont = font;
		style.setFont(titleFont);

		for (int i = 0; i < columns.size(); i++) {
			map = columns.get(i);
			width = Integer.parseInt(map.get("width")+"");
			sheet.setColumnWidth(i, (int)35.7*width);
			HSSFCell cell = row.createCell((int) i);
			cell.setCellValue(map.get("text")+"");
			cell.setCellStyle(style);
			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
		}
	}

//	private void createMoreHead(HSSFSheet sheet, HSSFCellStyle style,
//			HSSFFont font, List<Map<String, Object>> columns,
//			List<Map<String, Object>> gridColumnsList) {
//		// 处理表头，第三行开始
//        String[] mergedRegions = (String[]) columns.toArray();
//        //创建一个虚拟表头，并使用false标识这个单元格没有被占用
//        List<Map<Integer, Boolean>> headerLists = new ArrayList<Map<Integer, Boolean>>();
//        for (int i = 0; i <= mergedRegions.length + 1; i++) {
//            Map<Integer, Boolean> headerMap = new HashMap<Integer, Boolean>();
//            for (int j = 0; j < columns.size(); j++) {
//                headerMap.put(j, false);
//                if (i == 0) {
//                    sheet.setColumnWidth(j, (short) (16 * 256));
//                }
//            }
//            headerLists.add(headerMap);
//        }
//        for (int i = 0; i < mergedRegions.length; i++) {
//            String mergedRegionss = mergedRegions[i];
//            int x = 2 + i;
//            int y = 2 + i;
//            int m = 0;
//            int n = 0;
//            HSSFRow row = sheet.createRow(2 + i);
//            row.setHeight((short) (2 * 256));
//            String[] _mergedRegionss = mergedRegionss.split(":");
//            for (int j = 0; j < _mergedRegionss.length; j++) {
//                String mergedRegionsss = _mergedRegionss[j];
//                String[] _mergedRegionsss = mergedRegionsss.split(",");
//                //获取最小行中未被占用的单元格
//                List<Integer> cellNum = new ArrayList<Integer>();
//                for (int mm = 0; mm < headerLists.size(); mm++) {
//                    Map<Integer, Boolean> headerMap = headerLists.get(mm);
//                    for (Integer key : headerLists.get(mm).keySet()) {
//                        if (!headerMap.get(key)) {
//                            cellNum.add(key);
//                        }
//                    }
//                    if (cellNum.size() > 0) {
//                        break;
//                    }
//                }
//                Collections.sort(cellNum);
//                m = cellNum.get(0);
//
//                int _y = y + (Integer.parseInt(_mergedRegionsss[1])) - 1;
//                if (Integer.parseInt(_mergedRegionsss[1]) == 0) {
//                    _y = y;
//                }
//
//                n = n + (Integer.parseInt(_mergedRegionsss[2]));
//                if (Integer.parseInt(_mergedRegionsss[2]) == 0) {
//                    n = m;
//                }
//
//                // String cra = x + ", " + _y + ", " + m + ", " + n;
//                for (int t = x - 2; t <= _y - 2; t++) {
//                    for (int k = m; k <= n; k++) {
//                        headerLists.get(t).put(k, true);
//                    }
//                }
//                CellRangeAddress cellRangeAddress = null;
//                sheet.addMergedRegion(cellRangeAddress);
//                cellRangeAddress = new CellRangeAddress(x, _y, m, n);
//                sheet.addMergedRegion(cellRangeAddress);
//                HSSFCell cell = row.createCell(m);
//                cell.setCellValue(_mergedRegionsss[0]);
//                m = n + 1;
//            }
//        }
//	}

	
	
	/**
	 * 保存excel表格到物理路径
	 * @param wb
	 * @param user
	 * @return
	 * @throws IOException 
	 */
	private Map<String, Object> saveHSSFWorkbook(HSSFWorkbook wb, CurrentUser user) throws IOException {		
		String fileName = FileUtil.getName("export.xls");
		String basePath = App.FILE_SYS + File.separatorChar + "temp" ;
		FileUtil.mkDirs(basePath);
		String baseUrl = App.FILE_SYS_URL + "/temp/"+fileName;		
		FileOutputStream fileOut;
		fileOut = new FileOutputStream(basePath + File.separatorChar + fileName);
		wb.write(fileOut);		
		fileOut.close();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("baseUrl", baseUrl);
		return map;
	}

	/**
	 * 将json字符串转成list<map<String,Object>>
	 * @param columnsJson
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonParseException 
	 */
	private List<Map<String, Object>> jsonToListMap(String columnsJson) throws JsonParseException, JsonMappingException, IOException {
		ObjectMapper mapper = new ObjectMapper(); 
		return mapper.readValue(columnsJson, new TypeReference<List<Map<String, Object>>>() {});
	}

	/**
	 * 获取RequestMappingHandlerMapping
	 * @param context
	 * @throws LinkageError 
	 * @throws ClassNotFoundException 
	 */
	private void initHandlerMappings(ApplicationContext context) throws ClassNotFoundException, LinkageError {
		if (this.requestMappingHandlerMapping == null) {
			Class<?> clazz = ClassUtils.forName("org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping", ExportController.class.getClassLoader());
			Object strategy = context.getAutowireCapableBeanFactory().createBean(clazz);
			this.requestMappingHandlerMapping=(RequestMappingHandlerMapping) strategy;
		}
	}

	/**
	 * 根据extgird url地址获取数据。
	 * @param url
	 * @param request
	 * @param response
	 * @param context
	 * @return
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws IllegalAccessException 
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getExportData(String url, HttpServletRequest request, HttpServletResponse response, ApplicationContext context) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {  
		Map<RequestMappingInfo, HandlerMethod> map = requestMappingHandlerMapping.getHandlerMethods();  
		HandlerMethod hm = null;
		for (Map.Entry<RequestMappingInfo, HandlerMethod> m : map.entrySet()) {  
			RequestMappingInfo info = m.getKey();
			String key = info.toString().replaceAll("\\{\\[|\\]\\}", "");
			if (url.equals(key)) {
				hm = m.getValue();
				break ;
			}
		}
		String beanName = hm.getBean()+"";
		Object bean = context.getBean(beanName);
		Object obj = hm.getMethod().invoke(bean, request,response);
		return (Map<String, Object>) obj;
	}

}
