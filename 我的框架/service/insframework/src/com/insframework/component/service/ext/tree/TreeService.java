package com.insframework.component.service.ext.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Component;

import com.insframework.component.service.ext.ExtBaseService;

@Component
public class TreeService extends ExtBaseService{
	
	
	public Map<String, Object> loadData(String sql) {
		return loadData(sql, new Object[]{}, null, true, false);
	}
		
	/**
	 * 查询数据并且转换为树形结构 必须包含id、pid、text字段
	 * @param sql
	 * @param pid
	*/
	public Map<String, Object> loadData(String sql, Object pid){
		return loadData(sql, new Object[]{}, pid, true, false);
	}
	
	
	/**
	 * 查询数据并且转换为树形结构 必须包含id、pid、text字段
	 * @param sql
	 * @param args
	 * @param pid
	 * @param expandedRoot
	 * @param chekced
	 * @return
	 */
	public Map<String, Object> loadData(String sql, Object[] args, Object pid, boolean expandedRoot, boolean chekced){
		List<Map<String,Object>> list = jdbcAssistant.query(sql, args);		
		List<Map<String,Object>> treeList = parse(list, pid, expandedRoot, chekced);		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("children", treeList);
		return map;
	}
	

		
	/**
	 * 将list转为树形结构，map中必须包含id、pid、text字段
	 * @param list	要转换的集合
	 * @param pid	父id	 
	 * @param expandedRoot	最外层是否展开
	 * @param checked 是否显示复选框
	 * @return
	 */
	public List<Map<String,Object>> parse(List<Map<String,Object>> list, Object pid, boolean expandedRoot, boolean checked){
		List<Map<String,Object>> nodeList = parse(list, pid, checked);
		//展开最外层节点
		if(expandedRoot){
			for(Map<String,Object> node : nodeList){
				Object nodePid = node.get("pid");
				if(pid == nodePid || pid.equals(nodePid)){
					node.put("expanded", true);
				}
			}
		}
		return nodeList;
	}		
	
	/**
	 * 将list转为树形结构，map中必须包含id、pid、text字段
	 * @param list	要转换的集合
	 * @param pid	父id	 
	 * @return
	 */
	public List<Map<String,Object>> parse(List<Map<String,Object>> list, Object pid, boolean checked){
		List<Map<String,Object>> nodeList = new ArrayList<Map<String,Object>>();
		for(Map<String,Object> node : list){
			String nodeId = node.get("id")+"";
			Object nodePid = node.get("pid");
			
			/**
			 * 判断pid和当前节点的pid是否相等
			 *
			 */
			boolean flag = true;
			if(pid == null){	
				//确保从根节点开始
				if(nodePid != null){
					flag = false;					
				}
			}else{				
				if(nodePid == null){
					flag = false;	
					node.remove("pid");					
				}else{
					if(!nodePid.toString().equals(pid)){
						flag = false;
					}
				}
			}
			//如果相等
			if(flag){
				//先要检查nodeList中是否存在此node
				boolean hasThisNode = false;
				for(Map<String, Object> nodeListItem : nodeList){
					if(nodeListItem.get("id").toString().equals(node.get("id").toString())){
						hasThisNode = true;
						break;
					}
				}
				if(!hasThisNode){
					List<Map<String,Object>> childs = parse(list, nodeId, checked);
					if(childs.size() > 0){
						node.put("children", childs);					
					}else{
						//没有子节点
						node.put("leaf", true);									
					}		
					if(checked && node.get("checked") == null){
						node.put("checked", false);
					}	
					nodeList.add(node);
				}				
			}
		}
		return nodeList;
	}


}
