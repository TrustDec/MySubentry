package com.insframework.common.utils.pager;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.insframework.common.utils.JsonUtil;


/**
 * 通用分页工具类
 * 
 * @author guom
 * 
 * @param <T>
 */
public class Pager<T> {

	private List<T> data = new ArrayList<T>(); // 对象记录结果集
	private int total = 0; // 总记录数
	private int pageSize = 20; // 每页显示记录数
	private int pageCount = 1; // 总页数
	private int currentPage = 1; // 当前页

	private boolean isFirstPage = false; // 是否为第一页
	private boolean isLastPage = false; // 是否为最后一页
	private boolean hasPreviousPage = false; // 是否有前一页
	private boolean hasNextPage = false; // 是否有下一页

	private int navigatePages = 10; // 导航页码数
	private int[] navigatePageNumbers; // 所有导航页号
	
	
	public Pager(int total, int currentPage) {		
		this.total = total;
		this.currentPage = currentPage;
		//this.init();
	}

	public Pager(int total, int currentPage, int pageSize) {
		this.total = total;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		//this.init();
	}

	public void init() {
		// 设置基本参数		
		pageCount = (total - 1) / pageSize + 1;

		// 根据输入可能错误的当前号码进行自动纠正
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageCount) {
			currentPage = pageCount;
		} 

		// 基本参数设定之后进行导航页面的计算
		calcNavigatePageNumbers();

		// 以及页面边界的判定
		judgePageBoudary();
	}

	/**
	 * 计算导航页
	 */
	private void calcNavigatePageNumbers() {
		// 当总页数小于或等于导航页码数时
		if (pageCount <= navigatePages) {
			navigatePageNumbers = new int[pageCount];
			for (int i = 0; i < pageCount; i++) {
				navigatePageNumbers[i] = i + 1;
			}
		} else { // 当总页数大于导航页码数时
			navigatePageNumbers = new int[navigatePages];
			int startNum = currentPage - navigatePages / 2;
			int endNum = currentPage + navigatePages / 2;

			if (startNum < 1) {
				startNum = 1;
				// (最前navPageCount页
				for (int i = 0; i < navigatePages; i++) {
					navigatePageNumbers[i] = startNum++;
				}
			} else if (endNum > pageCount) {
				endNum = pageCount;
				// 最后navPageCount页
				for (int i = navigatePages - 1; i >= 0; i--) {
					navigatePageNumbers[i] = endNum--;
				}
			} else {
				// 所有中间页
				for (int i = 0; i < navigatePages; i++) {
					navigatePageNumbers[i] = startNum++;
				}
			}
		}
	}

	/**
	 * 判定页面边界
	 */
	private void judgePageBoudary() {
		isFirstPage = currentPage == 1;
		isLastPage = currentPage == pageCount; //&& currentPage != 1;
		hasPreviousPage = currentPage != 1;
		hasNextPage = currentPage != pageCount;
	}
		
	/**
	 * 将单签Pager对象转为Map并返回
	 * @return
	 */
	public Map<String, Object> toMap(){
		Map<String, Object> map = new HashMap<String, Object>();		
		map.put("data", data);		
		map.put("total", total);
		map.put("pageSize", pageSize);
		map.put("pageCount", pageCount);
		map.put("currentPage", currentPage);		
		map.put("isFirstPage", isFirstPage);
		map.put("isLastPage", isLastPage);
		map.put("hasPreviousPage", hasPreviousPage);
		map.put("hasNextPage", hasNextPage);		
		map.put("navigatePages", navigatePages);
		map.put("navigatePageNumbers", navigatePageNumbers);
		return map;
	}	

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public boolean isFirstPage() {
		return isFirstPage;
	}

	public void setFirstPage(boolean isFirstPage) {
		this.isFirstPage = isFirstPage;
	}

	public boolean isLastPage() {
		return isLastPage;
	}

	public void setLastPage(boolean isLastPage) {
		this.isLastPage = isLastPage;
	}

	public boolean isHasPreviousPage() {
		return hasPreviousPage;
	}

	public void setHasPreviousPage(boolean hasPreviousPage) {
		this.hasPreviousPage = hasPreviousPage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public int getNavigatePages() {
		return navigatePages;
	}

	public void setNavigatePages(int navigatePages) {
		this.navigatePages = navigatePages;
	}

	public int[] getNavigatePageNumbers() {
		return navigatePageNumbers;
	}

	public void setNavigatePageNumbers(int[] navigatePageNumbers) {
		this.navigatePageNumbers = navigatePageNumbers;
	}
	
	
	@Override
	public String toString() {
		return JsonUtil.toJson(this);
	}
	
	public static void main(String[] args) {
		/*Pager<Map<String,Object>> p = new Pager<Map<String,Object>>(0,20);
		String pagerSql = buildPagerSql(sql, pager);
		List<Map<String,Object>> data = query(pagerSql, args, mapper);
		pager.setData(data);
		return pager;*/
	}

}
