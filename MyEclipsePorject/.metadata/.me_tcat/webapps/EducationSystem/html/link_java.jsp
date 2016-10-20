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
<title>JAVA课堂</title>
<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<link href="css/head.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/slide.js"></script>
</head>
<style>
.link_center_box {
	width: 1200px;
	height: 800px;
	
	margin: 0px auto;
}


#link1_divbox {
width:150px;
	height: 800px;
	
	float:left;
}

#link1_divbox_left {
	
	height: 100%;
	width: 150px;

	float: left;
}

.link_nav {
	width: 900px;
	height: 100%;
	float: left;
	margin-top:33px;
	margin-left:20px;
}
.link_nav_center{width:100%;height:50px;border-bottom:1px solid green;}
#link1_div1 {
	
	width: 251px;
	height: 30px;
	font-size: 20px;
	padding-top: 10px;
	padding-left: 20px;
	background-color: rgba(0, 128, 0, 0.3);
	border-radius: 0.2em 8em/0.2em 8em;
	
}

.link1_div2,.link1_div3 {
	width: 900px;
	height: 500px;
	
	float: left;
}
.link1_div2 h3,.link1_div3 h3{line-height:40px;}
#link1_divId2 {
	display: block;
	
}

#link1_divId3 {
	display: none;
	
}

#link1_divbox_left dl {
	
	border: 1px gray solid;
	height: 240px;
	
}

#link1_divbox_left dl dt {
	
	background-color: rgba(0, 128, 0, 0.5);
	height: 60px;
	font-size: 30px;
	text-align: center;
	padding-top: 20px;
	color: #fff;
	font-weight: bold;
	box-shadow: 4px 5px 5px #69C;
	
}

#link1_divbox_left dl dd {
	
	height: 40px;
	text-align: center;
	line-height: 50px;
	border-bottom: #999 1px solid;

}

#link1_divbox_left dl dd a,#link1_div1 a {
	text-decoration: none;
	color: #000;
	
}

#link1_div1 a:hover {
	color: #f00;
}

.link1_div2 p,.link1_div3 p {
	text-indent: 2em;
	font-size: 17px;
	line-height:40px;

}





.link1_div2 ul li {
	color: #000;
	line-height: 30px;
	text-indent: 0.5em;
	list-style:disc;
	margin-top:10px;
	margin-left:100px;
}

.link1_div2 ul li:hover {
	color: #F0F;
}
</style>
<script type="text/javascript">
	function link1_show() {
		link1_divId2 = document.getElementById("link1_divId2").style;
		link1_divId3 = document.getElementById("link1_divId3").style;
		link1_a1 = document.getElementById("link1_a1").style;
		link1_a2 = document.getElementById("link1_a2").style;
		link1_dd1 = document.getElementById("link1_dd1").style;
		link1_dd2 = document.getElementById("link1_dd2").style;
		link1_divId2.display = "none";
		link1_divId3.display = "block";
		link1_a2.color = "blue";
		link1_a1.color = "black";
		link1_dd1.borderBottom = "#999 1px solid";
		link1_dd2.borderBottom = "blue 2px solid";
	}
	function link1_show1() {
		link1_divId3.display = "none";
		link1_divId2.display = "block";
		link1_a2.color = "black";
		link1_a1.color = "blue";
		link1_dd1.borderBottom = "blue 2px solid";
		link1_dd2.borderBottom = "#999 1px solid";
	}
</script>
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
	<!--内容  -->
	<div class="link_center_box">
		<div id="link1_divbox">
			<div id="link1_divbox_left">
				<dl>
					<dt>JAVA</dt>
					<dd id="link1_dd1" style="border-bottom:blue 2px solid;">
						<a href="javascript:link1_show1()" id="link1_a1"
							style="color:blue;">Java初级教程</a>
					</dd>
					<dd id="link1_dd2">
						<a href="javascript:link1_show()" id="link1_a2">Java中级教程</a>
					</dd>
					<dd id="link1_dd3">
						<a href="javascript:alert('待定')">Java高级教程</a>
					</dd>
				</dl>
			</div>

		</div>
		<div class="link_nav">
			<div class="link_nav_center">
			<div id="link1_div1">
				<a href="index.jsp">首页</a> >> <a href="javascript:viod(0)"">IT培训</a> >> <a href="html/link_java.jsp">JAVA</a>
				
			</div>
			
			</div>


			<div class="link1_div2" id="link1_divId2">
				<h3>Java初级教程</h3>
				<p>主要适合零基础的用户，全面的介绍Java以及Java的基本功能，实例分析等。</p>
				<ul>
					<li>Java发展历史和现状</li>
					<li>什么是JAVA语言</li>
					<li>JAVA语言特点</li>
					<li>JAVA运行机制</li>
					<li>Java的编辑和运行环境</li>
					<li>JDK安装及配置</li>
					<li>Java中常用的包</li>
				</ul>
			</div>
			<div class="link1_div3" id="link1_divId3">
				<h3>Java中级教程</h3>
				<p>在Java初级教程的基础上，更进一步详细介绍Java语言高级功能以及实例分析，适合有一定基础的用户。</p>
				<!-- <p>参考资料：</p> -->
				<span><img src="html/images/hibernate3.jpg"
					style=" width:200px; position:relative; left:150px;" /></span> <span><img
					src="html/images/9222044_b.jpg"
					style=" width:200px; position:relative; left:180px;" /></span>
			</div>
		</div>
	</div>
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
								<td colspan="4"><div class="lianxi_right_tijiao"
										onclick="liuyan()">Submit</div></td>

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
