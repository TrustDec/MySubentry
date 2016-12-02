package com.insframework.component.service.ext.grid;

import javax.servlet.http.HttpServletRequest;

import com.insframework.common.utils.TextUtil;

public class GridTransModel {

	private int limit;
	
	private String sortColumn;
	
	private int pageIndex;
	
	private int startIndex;
	
	private String direction;

	public GridTransModel(HttpServletRequest request) {
		String limit = null;
		String pageIndex = null;
		String startIndex = null;
		String sort = null;
		String Direction = null;
		
		//获取
		String INSEXPORT_LIMIT = request.getAttribute("INSEXPORT_LIMIT")+"";
		String INSEXPORT_PAGE = request.getAttribute("INSEXPORT_PAGE")+"";
		String INSEXPORT_START = request.getAttribute("INSEXPORT_START")+"";
		
		
		if (TextUtil.isNotEmpty(INSEXPORT_LIMIT)&&TextUtil.isNotEmpty(INSEXPORT_PAGE)&&TextUtil.isNotEmpty(INSEXPORT_START)) {
			limit = INSEXPORT_LIMIT;
			pageIndex = INSEXPORT_PAGE;
			startIndex = INSEXPORT_START;
		}else {
			limit = request.getParameter("limit");
			pageIndex = request.getParameter("page");
			startIndex = request.getParameter("start");
			sort = request.getParameter("sort");
			Direction = request.getParameter("dir");
		}
		
		if(TextUtil.isNotEmpty(limit)){
			this.limit = Integer.parseInt(limit);
		}
		if (TextUtil.isNotEmpty(pageIndex)) {
			this.pageIndex = Integer.parseInt(pageIndex);
		}else {
			this.pageIndex = 1;
		}
		if (TextUtil.isNotEmpty(startIndex)) {
			this.startIndex = Integer.parseInt(startIndex);
		}else {
			this.startIndex = 0;
		}
		this.sortColumn = sort;
		this.direction = Direction;			
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public String getSortColumn() {
		return sortColumn;
	}

	public void setSortColumn(String sortColumn) {
		this.sortColumn = sortColumn;
	}

	public int getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	@Override
	public String toString() {
		return "GridTransModel [limit=" + limit + ", sortColumn=" + sortColumn
				+ ", pageIndex=" + pageIndex + ", startIndex=" + startIndex
				+ ", direction=" + direction + "]";
	}
}
