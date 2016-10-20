package org.apache.jsp.html;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class link_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("<title>PS课堂</title>\r\n");
      out.write("<link href=\"css/head_nav.css\" type=\"text/css\" rel=\"stylesheet\" />\r\n");
      out.write("<link href=\"css/head.css\" type=\"text/css\" rel=\"stylesheet\" />\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/head.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"js/slide.js\"></script>\r\n");
      out.write("<style>\r\n");
      out.write("*{font-family:\"YaHei Consolas Hybrid\";}\r\n");
      out.write(".link_center{width:100%;height:280px;background:linear-gradient(to right,#007EBB,#9DDFFF);}\r\n");
      out.write(".link_center_box{width:1200px;height:100%;margin:0px auto;position:relative;}\r\n");
      out.write(".link_box_li_1{width:auto;height:40px;line-height:40px;font-size:17px;color:#fff;font-weight:bold;}\r\n");
      out.write(".link_box_li_1>a{color:#fff;font-weight:100;}\r\n");
      out.write(".link_box_li_2{width:auto;height:50px;line-height:50px;font-size:27px;font-weight:bold;font-family:\"等线\";margin-top:20px;color:#fff;}\r\n");
      out.write(".link_box_li_3{width:905px;height:120px;position:absolute;bottom:0px;left:0px;}\r\n");
      out.write(".link_li_3{width:240px;height:100%;border-left:1px solid #A8A8A8;float:left;padding-left:20px;line-height:50px;}\r\n");
      out.write(".box_font{color:#fff;font-size:23px;font-weight:10;}\r\n");
      out.write(".link_li_3 a{color:#fff;}\r\n");
      out.write(".link_a:hover{color:#188eee;}\r\n");
      out.write(".link_button{width:150px;height:50px;background:#7BFFBD;position:absolute;bottom:40px;right:40px;border-radius:50px;text-align:center;line-height:50px;cursor: pointer;font-size:17px;transition:all 200ms ease-in;}\r\n");
      out.write(".link_button:hover{background:#188eee;transition:all 2ms ease;}\r\n");
      out.write(".zhanjie{width:930px;float:left;}\r\n");
      out.write(".link_zhanjie{width:1200px;height:600px;margin:0px auto;}\r\n");
      out.write(".link_zhanjie_title{width:930;height:50px;border-bottom:1px solid #9A938F;color:#272523;font-size:20px;line-height:50px;font-weight:bold;float:left;}\r\n");
      out.write(".link_zhanjie_title1{width:260px;height:50px;border-bottom:1px solid #9A938F;color:#272523;font-size:20px;line-height:50px;font-weight:bold;float:left;margin-left:10px;}\r\n");
      out.write(".zhanjie_center{width:910px;height:100px;border-bottom:1px solid #9A938F;}\r\n");
      out.write(".zhanjie_center h4{width:100%;height:40px;line-height:40px;display:inline-block;}\r\n");
      out.write(".zhanjie_center a{width:100%;line-height:40px;display:inline-block;font-size:15px;color:#002C57;}\r\n");
      out.write(".zhanjie_center a:hover{color:#188eee;}\r\n");
      out.write(".zhanjie_center_right{width:260px;height:550px;float:left;margin-left:10px;}\r\n");
      out.write(".zhanjie_center_right li{width:auto;height:30px;font-size:16px;}\r\n");
      out.write(".zhanjie_center_right li a{color:#000;}\r\n");
      out.write(".zhanjie_center_right li a:hover{color:#0E9C0E;text-decoration:underline;}\r\n");
      out.write(".zhanjie_center_right li span{float:right;color:#BD1713;cursor: pointer;}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<!--头部导航栏-->\r\n");
      out.write("\t<div id=\"head_nav\">\r\n");
      out.write("\t\t<div id=\"head_menu\">\r\n");
      out.write("\t\t\t<ul class=\"head_ul\">\r\n");
      out.write("\t\t\t\t<li><img src=\"images/logo3.png\" class=\"head_logo\" /><img\r\n");
      out.write("\t\t\t\t\tsrc=\"images/logo_4.png\" class=\"head_logo_1\" /></li>\r\n");
      out.write("\t\t\t\t<li><img src=\"images/faith.png\" class=\"head_logo1\" /></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"index.jsp\" class=\"head_li\">首页</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"head_li\" id=\"head_li_from\"><a\r\n");
      out.write("\t\t\t\t\thref=\"html/business_system.jsp\" class=\"head_font_size\">课程体系</a>\r\n");
      out.write("\t\t\t\t\t<ul class=\"head_nav_nav_none\">\r\n");
      out.write("\t\t\t\t\t\t<li><a href=\"html/yewu.html\" class=\"head_font_size\"\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"head_nav_yw_tx\" class=\"head_li\">业务体系</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t<li><a href=\"html/step_in.jsp\" class=\"head_li\">走进KLEE</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"html/time_axis.jsp\" class=\"head_li\">发展历程</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"html/developer.jsp\" class=\"head_li\">论坛.活动</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"html/bangzhu.jsp\" class=\"head_li\">帮助</a></li>\r\n");
      out.write("\t\t\t\t");

					String name = (String) session.getAttribute("name");
					if (name == null) {
				
      out.write("\r\n");
      out.write("\t\t\t\t<li><a href=\"html/l_zhuce.jsp\" class=\"DL_zc\">注册</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"javascript:void(0)\" onClick=\"entry()\" class=\"DL_\">登录</a></li>\r\n");
      out.write("\t\t\t\t");

					} else {
				
      out.write("\r\n");
      out.write("\t\t\t\t<li class=\"DL_name\" onclick=\"javascript:alert('暂时不能提供查看个人信息')\">欢迎您:");
      out.print(name);
      out.write("</li>\r\n");
      out.write("\t\t\t\t<li><a href=\"javascript:void(0)\" onClick=\"exit()\" class=\"DL_E\">退出</a></li>\r\n");
      out.write("\t\t\t\t");

					}
				
      out.write("\r\n");
      out.write("\t\t\t\t");
      out.write("\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!--登录框-->\r\n");
      out.write("\t<div id=\"entry_box\">\r\n");
      out.write("\t\t<div class=\"dl_box\">\r\n");
      out.write("\t\t\t<div id=\"entry\">\r\n");
      out.write("\t\t\t\t<form name=\"myform\">\r\n");
      out.write("\t\t\t\t\t<span id=\"entry_span1\" onClick=\"entryOne()\">请输入用户名</span><span\r\n");
      out.write("\t\t\t\t\t\tid=\"entry_span3\"></span><span id=\"entry_span3_1\"></span> <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"text\" id=\"entry_one\" name=\"username\" class=\"entry_style\"\r\n");
      out.write("\t\t\t\t\t\tonFocus=\"entryOne()\" onBlur=\"text()\" /><br /> <br /> <br /> <span\r\n");
      out.write("\t\t\t\t\t\tid=\"entry_span2\" onClick=\"entry_one1()\">请输入登陆密码</span><span\r\n");
      out.write("\t\t\t\t\t\tid=\"entry_span4\"></span><span id=\"entry_span4_1\"></span> <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"password\" id=\"entry_two\" class=\"entry_style\"\r\n");
      out.write("\t\t\t\t\t\tonFocus=\"entry_one1()\" onBlur=\"text1()\" /><br /> <input\r\n");
      out.write("\t\t\t\t\t\ttype=\"button\" value=\"GO>>\" id=\"entry_submit\" onClick=\"decision()\" />\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t<!-- <span><a href=\"javascript:alert('正在全力建设')\"\r\n");
      out.write("\t\t\t\tclass=\"entry_span_1\">忘记密码&gt;&gt;</a></span> --> <span><a\r\n");
      out.write("\t\t\t\thref=\"html/l_zhuce.jsp\" class=\"entry_span_2\">注册&gt;&gt;</a> </span>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"link_center\">\r\n");
      out.write("\t\t<div class=\"link_center_box\">\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li class=\"link_box_li_1\"><a href=\"#\" class=\"link_a\">首页</a> &gt;&gt;<a href=\"javascript:viod(0)\" class=\"link_a\">精选课程</a> &gt;&gt;<a href=\"javascript:viod(0)\" class=\"link_a\">PhotoshopCS6 完美自学教程</a></li>\r\n");
      out.write("\t\t\t\t<li class=\"link_box_li_2\">PhotoShop CS6 完美自学教程</li>\r\n");
      out.write("\t\t\t\t<li class=\"link_box_li_3\">\r\n");
      out.write("\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"link_li_3\"><div class=\"box_font\">初级</div><a href=\"javascript:viod(0)\">难度</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"link_li_3\"><div class=\"box_font\">186</div><a href=\"javascript:viod(0)\">学习人数</a></li>\r\n");
      out.write("\t\t\t\t\t\t<li class=\"link_li_3\"><div class=\"box_font\">1小时40分钟</div><a href=\"javascript:viod(0)\">时长</a></li>\r\n");
      out.write("\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t\t<div class=\"link_button\">开始学习</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<div class=\"link_zhanjie\">\r\n");
      out.write("\t\t<div class=\"link_zhanjie_title\">章节</div>\r\n");
      out.write("\t\t<div class=\"link_zhanjie_title1\">前置课程</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<ul class=\"zhanjie\">\r\n");
      out.write("\t\t\t<li class=\"zhanjie_center\">\r\n");
      out.write("\t\t\t\t<h4>第一章 初识Photoshop</h4>\r\n");
      out.write("\t\t\t\t<a href=\"\">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"zhanjie_center\">\r\n");
      out.write("\t\t\t\t<h4>第一章 初识Photoshop</h4>\r\n");
      out.write("\t\t\t\t<a href=\"\">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"zhanjie_center\">\r\n");
      out.write("\t\t\t\t<h4>第一章 初识Photoshop</h4>\r\n");
      out.write("\t\t\t\t<a href=\"\">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"zhanjie_center\">\r\n");
      out.write("\t\t\t\t<h4>第一章 初识Photoshop</h4>\r\n");
      out.write("\t\t\t\t<a href=\"\">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t\t<li class=\"zhanjie_center\">\r\n");
      out.write("\t\t\t\t<h4>第一章 初识Photoshop</h4>\r\n");
      out.write("\t\t\t\t<a href=\"\">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t</li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t\t<div class=\"zhanjie_center_right\">\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li><a href=\"\">PhotoShop图像处理</a><span>未学习</span></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"\">PhotoShop图像处理</a><span>未学习</span></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"\">PhotoShop图像处理</a><span>未学习</span></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"\">PhotoShop图像处理</a><span>未学习</span></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"\">PhotoShop图像处理</a><span>未学习</span></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!--  \r\n");
      out.write("\t<div id=\"link_divbox2\">\r\n");
      out.write("\t\t<div id=\"link_divbox2_div1\">\r\n");
      out.write("\t\t\t章节\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<p>第一章 初识Photoshop</p>\r\n");
      out.write("\t\t<p class=\"link_divbox2_p1\">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</p>\r\n");
      out.write("\t\t<p>第二章 Photoshop的基本操作方法</p>\r\n");
      out.write("\t\t<p class=\"link_divbox2_p1\">了解Photoshop的操作界面、如何测量距离、角度和面积，学习图像的查看与导航、使用辅助工具及自定义快捷键等。</p>\r\n");
      out.write("\t\t<p>第三章 文件的操作方法</p>\r\n");
      out.write("\t\t<p class=\"link_divbox2_p1\">了解打开各种文件的方法、格式特征、Adobe\r\n");
      out.write("\t\t\tBridge的操作方法，学习置入EPS和AI格式的文件，掌握文件的保存方法。</p>\r\n");
      out.write("\t\t<p>第四章 基本编辑方法</p>\r\n");
      out.write("\t\t<p class=\"link_divbox2_p1\">掌握图像的恢复与还原操作方法、图像的变换与变形操作方法，了解裁剪图像的不同方法、像素与分辨率的关系，学习使用“渐隐”命令修改编辑效果。</p>\r\n");
      out.write("\t\t<p>第五章 选择</p>\r\n");
      out.write("\t\t<p class=\"link_divbox2_p1\">\r\n");
      out.write("\t\t\t学习各种选择工具、使用“色彩范围”命令选取对象、快速蒙版编辑选区及“抽出”滤镜选取对象，了解不同类型对象的选择方法，掌握选区的基本编</br>辑方法。\r\n");
      out.write("\t\t</p>\r\n");
      out.write("\t\t<p>第六章 绘图与图像修饰</p>\r\n");
      out.write("\t\t<p class=\"link_divbox2_p1\">学习前景色和背景色的设置方法、使用修复与润饰工具，掌握渐变的创建与编辑方法。</p>\r\n");
      out.write("\r\n");
      out.write("\t</div>\r\n");
      out.write(" -->\r\n");
      out.write("\t<!-- 版权部分修改版 -->\r\n");
      out.write("\t<div class=\"bottom_banquan\">\r\n");
      out.write("\t\t<div class=\"bottom_bg_color\">\r\n");
      out.write("\t\t\t<div class=\"bottom_box\">\r\n");
      out.write("\t\t\t\t<div class=\"bottom_lianxi_left\">\r\n");
      out.write("\t\t\t\t\t<div class=\"lianxi_dizhi\">\r\n");
      out.write("\t\t\t\t\t\t<ul class=\"bottom_dizhi\">\r\n");
      out.write("\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"bottom_img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<img src=\"images/icon1.png\" class=\"lianxi_img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div> <span class=\"bottom_font_lianxi\"><a\r\n");
      out.write("\t\t\t\t\t\t\t\t\thref=\"javascript:viod(0)\" title=\"中国陕西省西安市长安区下北良村西安科技大学高新学院\">中国陕西省西安市长安区下北良村西安科技大学高新学院</a></span>\r\n");
      out.write("\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"bottom_img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<img src=\"images/icon3.png\" class=\"lianxi_img\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tstyle=\"width:27px;margin-left:-14px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div> <span class=\"bottom_font_lianxi\"><a\r\n");
      out.write("\t\t\t\t\t\t\t\t\thref=\"tel:15596885995\" title=\"400-888-8888\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tstyle=\"text-align:left;\">400-888-8888</a></span>\r\n");
      out.write("\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"bottom_img\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<img src=\"images/icon2.png\" class=\"lianxi_img\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tstyle=\"width:27px;margin-left:-14px;margin-top:-8px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div> <span class=\"bottom_font_lianxi\"><a\r\n");
      out.write("\t\t\t\t\t\t\t\t\thref=\"mailto:603049583@qq.com\" title=\"klee@163.com\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tstyle=\"text-align:left;\">klee@163.com</a></span>\r\n");
      out.write("\t\t\t\t\t\t\t</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!--留言板  -->\r\n");
      out.write("\t\t\t\t<div class=\"bottom_lianxi_right\">\r\n");
      out.write("\t\t\t\t\t<form onsubmit=\"tijiao()\" name=\"from_bus\">\r\n");
      out.write("\t\t\t\t\t\t<table cellspacing=\"0\" cellpadding=\"10\" border=\"0\" width=\"100%\"\r\n");
      out.write("\t\t\t\t\t\t\tclass=\"bottom_lianxi\">\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"lianxi_right_font\">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td><input type=\"text\" class=\"lianxi_right_kuang\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tname=\"kong\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"lianxi_right_font\">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td style=\"position:relative;\"><input type=\"text\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tname=\"kong\" class=\"lianxi_right_kuang\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tonblur=\"youxiang(this.value)\" />\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"youxiang_box\" id=\"youxiang_\">邮箱格式有误</div></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"lianxi_right_font\">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"3\"><input type=\"text\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tclass=\"lianxi_right_kuang2\" name=\"kong\" /></td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td class=\"lianxi_right_font\" width=\"80px\" valign=\"top\">留言内容:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"3\"><textarea name=\"kong\" cols=\"30\" rows=\"5\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\tclass=\"lianxi_right_kuang3\" style=\"resize:none;\"></textarea><</td>\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t<td colspan=\"4\"><div class=\"lianxi_right_tijiao\" onclick=\"liuyan()\">Submit</div></td>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"bottom_banquan_bq\">\r\n");
      out.write("\t\t\t<div class=\"bottom_banquan_center\">\r\n");
      out.write("\t\t\t\t<div class=\"banquan_center\">\r\n");
      out.write("\t\t\t\t\t<div class=\"center_bq\">\r\n");
      out.write("\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"center_bq\">\r\n");
      out.write("\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"center_bq\">\r\n");
      out.write("\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"center_bq\">\r\n");
      out.write("\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"center_bq\">\r\n");
      out.write("\t\t\t\t\t\t<ul>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t\t<li>合作公司</li>\r\n");
      out.write("\t\t\t\t\t\t</ul>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"banquan_bufen\">\r\n");
      out.write("\t\t\t\t\t<div class=\"bufen\">Copyright © 2015 xike2-3zu. All\r\n");
      out.write("\t\t\t\t\t\tRightsReserved.</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"bufen\">西科软件开发二班第三组 版权所有 | 贾国瑞 | 罗文杰 | 叶博武 | 付秀鹏</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!--浮动猫链接-->\r\n");
      out.write("\t<div class=\"float_box\">\r\n");
      out.write("\t\t<div class=\"float\">\r\n");
      out.write("\t\t\t<a href=\"#top\" class=\"float_a\">返回顶部 <span class=\"float_bg\"></span>\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<div class=\"float1\">\r\n");
      out.write("\t\t\t<a href=\"javascript:void(0)\" class=\"float_a1\">关注微信 <span\r\n");
      out.write("\t\t\t\tclass=\"float_bg1\"></span> <img src=\"images/wx.JPG\" width=\"150\"\r\n");
      out.write("\t\t\t\theight=\"150\" class=\"weixin\" />\r\n");
      out.write("\t\t\t</a>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
