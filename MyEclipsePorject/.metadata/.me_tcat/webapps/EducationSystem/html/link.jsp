<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>PS课堂</title>
<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<link href="css/head.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/slide.js"></script>
<style>
*{font-family:"YaHei Consolas Hybrid";}
.link_center{width:100%;height:280px;background:linear-gradient(to right,#007EBB,#9DDFFF);}
.link_center_box{width:1200px;height:100%;margin:0px auto;position:relative;}
.link_box_li_1{width:auto;height:40px;line-height:40px;font-size:17px;color:#fff;font-weight:bold;}
.link_box_li_1>a{color:#fff;font-weight:100;}
.link_box_li_2{width:auto;height:50px;line-height:50px;font-size:27px;font-weight:bold;font-family:"等线";margin-top:20px;color:#fff;}
.link_box_li_3{width:905px;height:120px;position:absolute;bottom:0px;left:0px;}
.link_li_3{width:240px;height:100%;border-left:1px solid #A8A8A8;float:left;padding-left:20px;line-height:50px;}
.box_font{color:#fff;font-size:23px;font-weight:10;}
.link_li_3 a{color:#fff;}
.link_a:hover{color:#188eee;}
.link_button{width:150px;height:50px;background:#7BFFBD;position:absolute;bottom:40px;right:40px;border-radius:50px;text-align:center;line-height:50px;cursor: pointer;font-size:17px;transition:all 200ms ease-in;}
.link_button:hover{background:#188eee;transition:all 2ms ease;}
.zhanjie{width:930px;float:left;}
.link_zhanjie{width:1200px;height:600px;margin:0px auto;}
.link_zhanjie_title{width:930;height:50px;border-bottom:1px solid #9A938F;color:#272523;font-size:20px;line-height:50px;font-weight:bold;float:left;}
.link_zhanjie_title1{width:260px;height:50px;border-bottom:1px solid #9A938F;color:#272523;font-size:20px;line-height:50px;font-weight:bold;float:left;margin-left:10px;}
.zhanjie_center{width:910px;height:100px;border-bottom:1px solid #9A938F;}
.zhanjie_center h4{width:100%;height:40px;line-height:40px;display:inline-block;}
.zhanjie_center a{width:100%;line-height:40px;display:inline-block;font-size:15px;color:#002C57;}
.zhanjie_center a:hover{color:#188eee;}
.zhanjie_center_right{width:260px;height:550px;float:left;margin-left:10px;}
.zhanjie_center_right li{width:auto;height:30px;font-size:16px;}
.zhanjie_center_right li a{color:#000;}
.zhanjie_center_right li a:hover{color:#0E9C0E;text-decoration:underline;}
.zhanjie_center_right li span{float:right;color:#BD1713;cursor: pointer;}
</style>
</head>
<body>
	<!--头部导航栏-->
	<div id="head_nav">
		<div id="head_menu">
			<ul class="head_ul">
				<li><img src="images/logo3.png" class="head_logo" /><img
					src="images/logo_4.png" class="head_logo_1" /></li>
				<li><img src="images/faith.png" class="head_logo1" /></li>
				<li><a href="index.jsp" class="head_li">首页</a></li>
				<li class="head_li" id="head_li_from"><a
					href="html/business_system.jsp" class="head_font_size">课程体系</a>
					<ul class="head_nav_nav_none">
						<li><a href="html/yewu.html" class="head_font_size"
							class="head_nav_yw_tx" class="head_li">业务体系</a></li>
					</ul>
				</li>
				<li><a href="html/step_in.jsp" class="head_li">走进KLEE</a></li>
				<li><a href="html/time_axis.jsp" class="head_li">发展历程</a></li>
				<li><a href="html/developer.jsp" class="head_li">论坛.活动</a></li>
				<li><a href="html/bangzhu.jsp" class="head_li">帮助</a></li>
				<%
					String name = (String) session.getAttribute("name");
					if (name == null) {
				%>
				<li><a href="html/l_zhuce.jsp" class="DL_zc">注册</a></li>
				<li><a href="javascript:void(0)" onClick="entry()" class="DL_">登录</a></li>
				<%
					} else {
				%>
				<li class="DL_name" onclick="javascript:alert('暂时不能提供查看个人信息')">欢迎您:<%=name%></li>
				<li><a href="javascript:void(0)" onClick="exit()" class="DL_E">退出</a></li>
				<%
					}
				%>
				<%--<li><a href="javascript:void(0)" onClick="entry()" class="DL_">登录</a></li> --%>
			</ul>
		</div>
	</div>
	<!--登录框-->
	<div id="entry_box">
		<div class="dl_box">
			<div id="entry">
				<form name="myform">
					<span id="entry_span1" onClick="entryOne()">请输入用户名</span><span
						id="entry_span3"></span><span id="entry_span3_1"></span> <input
						type="text" id="entry_one" name="username" class="entry_style"
						onFocus="entryOne()" onBlur="text()" /><br /> <br /> <br /> <span
						id="entry_span2" onClick="entry_one1()">请输入登陆密码</span><span
						id="entry_span4"></span><span id="entry_span4_1"></span> <input
						type="password" id="entry_two" class="entry_style"
						onFocus="entry_one1()" onBlur="text1()" /><br /> <input
						type="button" value="GO>>" id="entry_submit" onClick="decision()" />
				</form>
			</div>
			<!-- <span><a href="javascript:alert('正在全力建设')"
				class="entry_span_1">忘记密码&gt;&gt;</a></span> --> <span><a
				href="html/l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a> </span>
		</div>
	</div>
	<div class="link_center">
		<div class="link_center_box">
			<ul>
				<li class="link_box_li_1"><a href="#" class="link_a">首页</a> &gt;&gt;<a href="javascript:viod(0)" class="link_a">精选课程</a> &gt;&gt;<a href="javascript:viod(0)" class="link_a">PhotoshopCS6 完美自学教程</a></li>
				<li class="link_box_li_2">PhotoShop CS6 完美自学教程</li>
				<li class="link_box_li_3">
					<ul>
						<li class="link_li_3"><div class="box_font">初级</div><a href="javascript:viod(0)">难度</a></li>
						<li class="link_li_3"><div class="box_font">186</div><a href="javascript:viod(0)">学习人数</a></li>
						<li class="link_li_3"><div class="box_font">1小时40分钟</div><a href="javascript:viod(0)">时长</a></li>
					</ul>
				</li>
			</ul>
			<div class="link_button">开始学习</div>
		</div>
	</div>
	<div class="link_zhanjie">
		<div class="link_zhanjie_title">章节</div>
		<div class="link_zhanjie_title1">前置课程</div>
		
		<ul class="zhanjie">
			<li class="zhanjie_center">
				<h4>第一章 初识Photoshop</h4>
				<a href="">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>
				
				</li>
			<li class="zhanjie_center">
				<h4>第一章 初识Photoshop</h4>
				<a href="">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>
				
				</li>
			<li class="zhanjie_center">
				<h4>第一章 初识Photoshop</h4>
				<a href="">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>
				
				</li>
			<li class="zhanjie_center">
				<h4>第一章 初识Photoshop</h4>
				<a href="">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>
				
				</li>
			<li class="zhanjie_center">
				<h4>第一章 初识Photoshop</h4>
				<a href="">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</a>
				
				</li>
		</ul>
		<div class="zhanjie_center_right">
			<ul>
				<li><a href="">PhotoShop图像处理</a><span>未学习</span></li>
				<li><a href="">PhotoShop图像处理</a><span>未学习</span></li>
				<li><a href="">PhotoShop图像处理</a><span>未学习</span></li>
				<li><a href="">PhotoShop图像处理</a><span>未学习</span></li>
				<li><a href="">PhotoShop图像处理</a><span>未学习</span></li>
			</ul>
		</div>
	</div>
	<!--  
	<div id="link_divbox2">
		<div id="link_divbox2_div1">
			章节
			
		</div>
		<p>第一章 初识Photoshop</p>
		<p class="link_divbox2_p1">了解Photoshop的诞生与发展历程、应用领域、改进功能与新增功能、安装Photoshop的系统需求及Photoshop的安装与卸载方法。</p>
		<p>第二章 Photoshop的基本操作方法</p>
		<p class="link_divbox2_p1">了解Photoshop的操作界面、如何测量距离、角度和面积，学习图像的查看与导航、使用辅助工具及自定义快捷键等。</p>
		<p>第三章 文件的操作方法</p>
		<p class="link_divbox2_p1">了解打开各种文件的方法、格式特征、Adobe
			Bridge的操作方法，学习置入EPS和AI格式的文件，掌握文件的保存方法。</p>
		<p>第四章 基本编辑方法</p>
		<p class="link_divbox2_p1">掌握图像的恢复与还原操作方法、图像的变换与变形操作方法，了解裁剪图像的不同方法、像素与分辨率的关系，学习使用“渐隐”命令修改编辑效果。</p>
		<p>第五章 选择</p>
		<p class="link_divbox2_p1">
			学习各种选择工具、使用“色彩范围”命令选取对象、快速蒙版编辑选区及“抽出”滤镜选取对象，了解不同类型对象的选择方法，掌握选区的基本编</br>辑方法。
		</p>
		<p>第六章 绘图与图像修饰</p>
		<p class="link_divbox2_p1">学习前景色和背景色的设置方法、使用修复与润饰工具，掌握渐变的创建与编辑方法。</p>

	</div>
 -->
	<!-- 版权部分修改版 -->
	<div class="bottom_banquan">
		<div class="bottom_bg_color">
			<div class="bottom_box">
				<div class="bottom_lianxi_left">
					<div class="lianxi_dizhi">
						<ul class="bottom_dizhi">
							<li>
								<div class="bottom_img">
									<img src="images/icon1.png" class="lianxi_img">
								</div> <span class="bottom_font_lianxi"><a
									href="javascript:viod(0)" title="中国陕西省西安市长安区下北良村西安科技大学高新学院">中国陕西省西安市长安区下北良村西安科技大学高新学院</a></span>
							</li>
							<li>
								<div class="bottom_img">
									<img src="images/icon3.png" class="lianxi_img"
										style="width:27px;margin-left:-14px;">
								</div> <span class="bottom_font_lianxi"><a
									href="tel:15596885995" title="400-888-8888"
									style="text-align:left;">400-888-8888</a></span>
							</li>
							<li>
								<div class="bottom_img">
									<img src="images/icon2.png" class="lianxi_img"
										style="width:27px;margin-left:-14px;margin-top:-8px;">
								</div> <span class="bottom_font_lianxi"><a
									href="mailto:603049583@qq.com" title="klee@163.com"
									style="text-align:left;">klee@163.com</a></span>
							</li>
						</ul>
					</div>
				</div>
				<!--留言板  -->
				<div class="bottom_lianxi_right">
					<form onsubmit="tijiao()" name="from_bus">
						<table cellspacing="0" cellpadding="10" border="0" width="100%"
							class="bottom_lianxi">
							<tr>
								<td class="lianxi_right_font">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
								<td><input type="text" class="lianxi_right_kuang"
									name="kong" /></td>
								<td class="lianxi_right_font">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
								<td style="position:relative;"><input type="text"
									name="kong" class="lianxi_right_kuang"
									onblur="youxiang(this.value)" />
									<div class="youxiang_box" id="youxiang_">邮箱格式有误</div></td>
							</tr>
							<tr>
								<td class="lianxi_right_font">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题:</td>
								<td colspan="3"><input type="text"
									class="lianxi_right_kuang2" name="kong" /></td>
							</tr>
							<tr>
								<td class="lianxi_right_font" width="80px" valign="top">留言内容:</td>
								<td colspan="3"><textarea name="kong" cols="30" rows="5"
										class="lianxi_right_kuang3" style="resize:none;"></textarea><</td>
							</tr>
							<tr>
								<td colspan="4"><div class="lianxi_right_tijiao" onclick="liuyan()">Submit</div></td>

							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="bottom_banquan_bq">
			<div class="bottom_banquan_center">
				<div class="banquan_center">
					<div class="center_bq">
						<ul>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
						</ul>
					</div>
					<div class="center_bq">
						<ul>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
						</ul>
					</div>
					<div class="center_bq">
						<ul>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
						</ul>
					</div>
					<div class="center_bq">
						<ul>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
						</ul>
					</div>
					<div class="center_bq">
						<ul>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
							<li>合作公司</li>
						</ul>
					</div>
				</div>
				<div class="banquan_bufen">
					<div class="bufen">Copyright © 2015 xike2-3zu. All
						RightsReserved.</div>
					<div class="bufen">西科软件开发二班第三组 版权所有 | 贾国瑞 | 罗文杰 | 叶博武 | 付秀鹏</div>
				</div>
			</div>
		</div>
	</div>
	<!--浮动猫链接-->
	<div class="float_box">
		<div class="float">
			<a href="#top" class="float_a">返回顶部 <span class="float_bg"></span>
			</a>
		</div>
		<div class="float1">
			<a href="javascript:void(0)" class="float_a1">关注微信 <span
				class="float_bg1"></span> <img src="images/wx.JPG" width="150"
				height="150" class="weixin" />
			</a>
		</div>
	</div>

</body>
</html>
