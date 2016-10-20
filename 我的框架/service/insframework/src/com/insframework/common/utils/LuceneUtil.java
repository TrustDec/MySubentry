package com.insframework.common.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.index.IndexableField;
import org.apache.lucene.index.LogByteSizeMergePolicy;
import org.apache.lucene.index.LogMergePolicy;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.insframework.common.utils.pager.Pager;

/**
 * LuceneUtil
 * version lucene4.10.4 
 * @author guom
 *
 */
public class LuceneUtil {
	
	//最大检查锁的次数
	private static final int MAX_CHECK_LOCK = 3;
	
	/**
	 * 获取分词器
	 * @return
	 */
	private static Analyzer getAnalyzer(){
		//默认使用开源的中文分词器
		Analyzer analyzer = new IKAnalyzer(true);
		return analyzer;
	}
	
	/**
	 * 获取写入索引配置项
	 * @return
	 */
	private static IndexWriterConfig getIndexWriteConfig(){
		IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_4_10_4, getAnalyzer());
		iwc.setOpenMode(OpenMode.CREATE_OR_APPEND);
		iwc.setMergePolicy(optimizeIndex());
		return iwc;
	}
	
	/** 
     * 优化索引，返回优化策略 
     *  
     * @return 
     */  
    private static LogMergePolicy optimizeIndex() {  
        LogMergePolicy mergePolicy = new LogByteSizeMergePolicy();     
        // 设置segment添加文档(Document)时的合并频率  
        // 值较小,建立索引的速度就较慢  
        // 值较大,建立索引的速度就较快,>10适合批量建立索引  
        mergePolicy.setMergeFactor(50); 
        // 设置segment最大合并文档(Document)数  
        // 值较小有利于追加索引的速度  
        // 值较大,适合批量建立索引和更快的搜索  
        mergePolicy.setMaxMergeDocs(5000);         
        return mergePolicy;  
    }  
	
	/**
	 * 检查索引文件是否锁定
	 * @param directory
	 * @return
	 */
	private static boolean iskLock(Directory directory) throws Exception{	
		int count = MAX_CHECK_LOCK;
		boolean lock = false;
		while(count > 0){
			lock = IndexWriter.isLocked(directory);
			if(lock){
				System.out.println("索引文件被锁定，请等待...");
				Thread.sleep(100);
			}else{
				break;
			}			
			count--;
		}
		return lock;
	}
	
	
	/**
	 * 操作索引文件
	 * @param indexPath		索引文件位置
	 * @param isdelete		是否为删除操作
	 * @param docs			文档对象数组
	 */
	private static void executeIndex(String indexPath, boolean isdelete, Document... docs){
		if(indexPath == null || docs == null){
			throw new RuntimeException();
		}		
		Directory directory = null;
		IndexWriter write = null;		
		try{
			directory = FSDirectory.open(new File(indexPath));
			//检查索引文件是否被锁定
			if(!iskLock(directory)){
				write = new IndexWriter(directory, getIndexWriteConfig());
				for(Document doc : docs){					
					//先删除
					Term term = new Term("id", doc.get("id"));  
					write.deleteDocuments(term);  
					//如果不是删除操作
					if(!isdelete){
						write.addDocument(doc);			
					}					
				}
				write.commit();
			}else{
				throw new Exception("索引文件被锁定，添加失败！");
			}			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try{
				if(write != null){
					write.close();
				}
				if(directory != null){
					directory.close();
				}
			}catch(Exception ex){
				ex.printStackTrace();
			}
			
		}
	}
	
	/**
	 * 添加或更新索引
	 * @param indexPath		索引文件位置
	 * @param docs			文档对象数组
	 */
	public synchronized static void saveOrUpdateIndex(String indexPath, Document... docs){
		if(docs.length == 0){
			return ;
		}
		executeIndex(indexPath, false, docs);
	}
	
	/**
	 * 删除索引
	 * @param indexPath		索引文件位置
	 * @param docs			文档对象数组
	 */
	public synchronized static void deleteIndex(String indexPath, String... ids){
		if(ids.length == 0){
			return;
		}
		Document [] docs = new Document[ids.length];
		for(int i=0; i<ids.length; i++){
			Document doc = new Document();
			doc.add(new StringField("id", ids[i], Field.Store.YES));
			docs[i] = doc;
		}
		executeIndex(indexPath, true, docs);
	}
	
	
	/**
	 * 查询
	 * @param indexPath		索引位置
	 * @param keyword		查询关键字
	 * @param params		查询字段名数组
	 * @param sortField		排序字段
	 * @param desc			是否倒序
	 * @param currentPage	当前页
	 * @param pageSize		每页记录数
	 */
	public static Pager<Map<String, Object>> query(String indexPath, String keyword, String[] params, 
			String sortField, boolean desc, int currentPage, int pageSize){
		return query(indexPath, keyword, params, sortField, desc, currentPage, pageSize, true);
	}
	/**
	 * 查询
	 * @param indexPath		索引位置
	 * @param keyword		查询关键字
	 * @param params		查询字段名数组
	 * @param sortField		排序字段
	 * @param desc			是否倒序
	 * @param currentPage	当前页
	 * @param pageSize		每页记录数
	 */
	public static Pager<Map<String, Object>> query(String indexPath, String keyword, String[] params, 
			String sortField, boolean desc, int currentPage, int pageSize, boolean whetherOrNotHighLight){		
		if(indexPath == null || keyword == null){
			throw new RuntimeException();
		}		
		try{			
			Analyzer analyzer = getAnalyzer();
			Directory directory = FSDirectory.open(new File(indexPath));
			IndexReader reader = DirectoryReader.open(directory);
			IndexSearcher searcher = new IndexSearcher(reader);  
			
			//多字段匹配，结果合并
			MultiFieldQueryParser parser = new MultiFieldQueryParser(params, analyzer);
			Query query = parser.parse(keyword);
			
			//排序字段 第三个boolean属性：是否倒序
			Sort sort = new Sort(new SortField(sortField, SortField.Type.STRING, desc));	        
		    
			//查询
			TopDocs topDocs = searcher.search(query, currentPage * pageSize, sort);			
			ScoreDoc[] scoreDocs = topDocs.scoreDocs;
			
			//初始化分页对象
			Pager<Map<String, Object>> pager = new Pager<Map<String, Object>>(topDocs.totalHits, currentPage, pageSize);
			pager.init();
			
			//分页属性
	        int begin = pageSize * (currentPage - 1);	       
	        int end = Math.min(begin + pageSize, scoreDocs.length);	  
	        
	        
	        //设置高亮属性
	        QueryScorer scorer = new QueryScorer(query);  
	        Formatter formatter = new SimpleHTMLFormatter("<font color='red'>", "</font>");
	        Highlighter highlight = new Highlighter(formatter, scorer);
	        
	        
	        List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	        //分页过滤数据并高亮显示
	        for(int i=begin; i<end; i++) {
	            int docID = scoreDocs[i].doc;
	            Document document = searcher.doc(docID);	 
	            List<IndexableField> fields = document.getFields();
	            Map<String, Object> map = new HashMap<String, Object>();
	            for(IndexableField field: fields){
	            	String name = field.name();
	            	//String value = field.stringValue();	
	            	if (whetherOrNotHighLight) {
	            		map.put(name, highlight.getBestFragment(analyzer, name, document.get(name)) == null ? document.get(name) : highlight.getBestFragment(analyzer, name, document.get(name)));	            	
					}else {
						map.put(name, document.get(name));
					}
	            }	
	            list.add(map);
	                        
	        }
	        
	        pager.setData(list);
	        
	        return pager;
	        
		}catch(Exception ex){
			ex.printStackTrace();  
		}
		
		return null;
		
	}
	
	
	/**
	 * 测试
	 * @param args
	 */
	public static void main(String[] args) throws Exception{		
		
		/*添加索引
		Document doc1 = new Document();
		doc1.add(new StringField("id", "111", Field.Store.YES));
		doc1.add(new org.apache.lucene.document.TextField("content", "撒旦撒娇的 ahahah 过儿姑姑,测试", Field.Store.YES));
		doc1.add(new IntField("age", 18, Field.Store.YES));
		
		Document doc2 = new Document();
		doc2.add(new StringField("id", "222", Field.Store.YES));
		doc2.add(new org.apache.lucene.document.TextField("content", "22222 test 测试哈哈", Field.Store.YES));
		doc2.add(new IntField("age", 20, Field.Store.YES));
		
		LuceneUtil.saveOrUpdateIndex("C://haha/index2", doc1, doc2);
		*/	
		
		/*更新索引
		Document doc3 = new Document();
		doc3.add(new StringField("id", "111", Field.Store.YES));
		doc3.add(new org.apache.lucene.document.TextField("content", "撒旦撒娇的 ahahah 过儿姑姑,测试", Field.Store.YES));
		doc3.add(new IntField("age", 30, Field.Store.YES));
		LuceneUtil.saveOrUpdateIndex("C://haha/index2", doc3);
		*/
		
		/*删除索引*/
		
		//LuceneUtil.deleteIndex("C://haha/index2", new String[]{"222"});
		
		/*检索		 		
		Pager<Map<String, Object>> pager = LuceneUtil.query("C://haha/index2", "test 111", new String[]{"content","id"}, "age", false, 1, 20);
		System.out.println(pager.toString());
		*/
		
		
		
		
		
		
		/*Document doc1 = new Document();
		doc1.add(new StringField("id", "asdasjkdsakjhdkjashdbk", Store.YES));
		doc1.add(new TextField("title", "测试标题111test", Store.YES));
		doc1.add(new TextField("content", "java测试哈哈哈内容过儿姑姑。。", Store.YES));
		doc1.add(new StringField("createTime", "2015-10-10 12:20:30", Store.YES));
		
		Document doc2 = new Document();
		doc2.add(new StringField("id", "asdasdasdasdasdasdds", Store.YES));
		doc2.add(new TextField("title", "测试标题222test", Store.YES));
		doc2.add(new TextField("content", "spring测试哈哈哈内容过儿郭明。。", Store.YES));
		doc2.add(new StringField("createTime", "2015-10-15 13:40:30", Store.YES));
		
		LuceneUtil.saveOrUpdateIndex("C://haha/index1", doc1);
		LuceneUtil.saveOrUpdateIndex("C://haha/index1", doc2);*/
		
		
		
		/*Pager<Map<String, Object>> pager = 
				LuceneUtil.query("C://haha/index1", "java 测试", new String[]{"title", "content"}, "createTime", false, 1, 20);
		
		System.out.println(pager.toString());
		
		
		
		
		
		
		*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
}
