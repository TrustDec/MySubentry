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
<title>KLEE教育</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<link href="css/head.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/slide.js"></script>
</head>

<body>
	<!--头部导航栏-->
	<div id="head_nav">
		<div id="head_menu">
			<ul class="head_ul">
				<li><img src="images/logo3.png" class="head_logo" /><img
					src="images/logo_4.png" class="head_logo_1" /></li>
				<li><img src="images/faith.png" class="head_logo1" /></li>
				<li><a href="index.jsp" class="head_li"
					style="color:#09C;font-weight:bold;">首页</a></li>
				<li class="head_li" id="head_li_from">
					<a href="html/business_system.jsp" class="head_font_size" >课程体系</a>
					<!-- <ul class="head_nav_nav_none">
						<li><a href="html/yewu.html"  class="head_font_size" class="head_nav_yw_tx" class="head_li">业务体系</a></li>
					</ul> -->
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
			<!-- <span><a href="html/link.jsp"
				class="entry_span_1">忘记密码&gt;&gt;</a></span> -->
			<span><a href="html/l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a>
			</span>
		</div>
	</div>
	<!--搜索栏-->
	<div class="search_box">
		<div class="search" id="search">
			<div class="search_xuexi"></div>
			<div class="S_earch">
				<div class="search_kc">
					<!-- onClick="search_2()" -->
					搜索
					<!-- <span class="search_kc_1"></span>
					<div id="search_kc_2">讲师&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
				</div>
				<input type="text" class="search_textK" />
				<div class="search_ss">
					<div class="search_logo"></div>
				</div>
			</div>
			<!--VIP快捷菜单-->

			<div class="search_VIP">
				<div class="search_VIP_box">
					<span class="search_VIP_1" id="search_span"></span><span
						id="search_span"><a href="html/link.jsp"
						class="search_VIP_txt">VIP课程</a></span>
					<!-- VIP课程 -->
				</div>
				<div class="search_VIP_box1">
					<span class="search_VIP_2" id="search_span"></span><span
						id="search_span"><a href="html/link.jsp"
						class="search_VIP_txt1">免费体验课</a></span>
				</div>
			</div>
			<div class="search_kJie">
				<ul>
					<li><a href="html/link.jsp" class="search_a">雅思精准预测</a></li>
					<li><a href="html/link.jsp" class="search_a" id="search_a1">Web前端精品课</a></li>
					<li><a href="html/link.jsp" class="search_a">趣味英</a></li>
					<li><a href="html/link.jsp" class="search_a" id="search_a1">上海市公务员考试</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--导航区-->
	<div class="nav">
		<!--导航背景区-->
		<div class="nav_bg" id="outer">
			<ul id="inner">
				<li><img src="images/66.jpg" width="880" height="290" alt=" "></li>
				<li><img src="images/22.jpg" width="880" height="290" alt=" "></li>
				<li><img src="images/33.jpg" width="880" height="290" alt=" "></li>
				<li><img src="images/44.jpg" width="880" height="290" alt=" "></li>
				<li><img src="images/55.jpg" width="880" height="290" alt=" "></li>
				<li><img src="images/11.jpg" width="880" height="290" alt=" "></li>
			</ul>
			<div id="left">L</div>
			<div id="right">R</div>
		</div>
		<script type="text/javascript" src="js/slide.js"></script>
		<!--导航栏区-->
		<div class="nav_nav" id="nav_nav">
			<ul>
				<li class="nav_type"><img src="images/menu.png" />&nbsp;&nbsp;全部课程</li>
				<li class="nav_title" style="border-left:4px solid #F30;"><span
					class="nav_icon1" id="nav_icon1"></span>
					<h2 class="nav_h2">IT培训</h2>
					<div class="nav_jt"></div> <span class="nav_title_txt1" id="nav_T">
						<a href="html/link_java.jsp">JAVA</a>
				</span> <span style="color:#CCC;">|</span> <span class="nav_title_txt2"
					id="nav_T"> <a href="html/link.jsp">&nbsp;&nbsp;PHP</a>
				</span> <span style="color:#CCC;">|</span> <span class="nav_title_txt3"
					id="nav_T"> <a href="html/link.jsp">&nbsp;&nbsp;安卓</a>
				</span> <span style="color:#CCC;">|</span>
					<div class="nav_2nav" id="nav_2nav1">
						<ul>
							<li style="margin-top:27px;"><span class="nav_2nav_title"></span>
								<h2 class="nav_h2">&nbsp;&nbsp;IT培训</h2></li>
							<li style="width:310px;height:1px;background:#CACACA;"></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link_java.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
						</ul>
					</div></li>
				<li class="nav_title" style="border-left:4px solid #09C;"><span
					class="nav_icon1" id="nav_icon2"></span>
					<h2 class="nav_h2">职业技能</h2>
					<div class="nav_jt"></div> <span class="nav_title_txt1" id="nav_T">
						<a href="html/link.jsp">淘宝电商</a>
				</span> <span style="color:#CCC;">|</span> <span class="nav_title_txt2"
					id="nav_T"> <a href="html/link.jsp">&nbsp;&nbsp;UG产品设计</a>
				</span> <span style="color:#CCC;">|</span>
					<div class="nav_2nav" id="nav_2nav2">
						<ul>
							<li style="margin-top:27px;"><span class="nav_2nav_title"></span>
								<h2 class="nav_h2">&nbsp;&nbsp;IT培训</h2></li>
							<li style="width:310px;height:1px;background:#CACACA;"></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
						</ul>
					</div></li>
				<li class="nav_title" style="border-left:4px solid #0C0;"><span
					class="nav_icon1" id="nav_icon3"></span>
					<h2 class="nav_h2">语言培训</h2>
					<div class="nav_jt"></div> <span class="nav_title_txt1" id="nav_T">
						<a href="html/link.jsp">日语</a>
				</span> <span style="color:#CCC;">|</span> <span class="nav_title_txt2"
					id="nav_T"> <a href="html/link.jsp">&nbsp;&nbsp;韩语</a>
				</span> <span style="color:#CCC;">|</span> <span class="nav_title_txt3"
					id="nav_T"> <a href="html/link.jsp">&nbsp;&nbsp;泰语</a>
				</span> <span style="color:#CCC;">|</span>
					<div class="nav_2nav" id="nav_2nav3">
						<ul>
							<li style="margin-top:27px;"><span class="nav_2nav_title"></span>
								<h2 class="nav_h2">&nbsp;&nbsp;IT培训</h2></li>
							<li style="width:310px;height:1px;background:#CACACA;"></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
						</ul>
					</div></li>
				<li class="nav_title" style="border-left:4px solid #630;"><span
					class="nav_icon1" id="nav_icon4"></span>
					<h2 class="nav_h2">兴趣爱好</h2>
					<div class="nav_jt"></div> <span class="nav_title_txt1" id="nav_T">
						<a href="html/link.jsp">农业</a>
				</span> <span style="color:#CCC;">|</span> <span class="nav_title_txt2"
					id="nav_T"> <a href="html/link.jsp">&nbsp;&nbsp;手工DIY</a>
				</span> <span style="color:#CCC;">|</span> <span class="nav_title_txt3"
					id="nav_T"> <a href="html/link.jsp">&nbsp;&nbsp;吉他</a>
				</span> <span style="color:#CCC;">|</span>
					<div class="nav_2nav" id="nav_2nav4">
						<ul>
							<li style="margin-top:27px;"><span class="nav_2nav_title"></span>
								<h2 class="nav_h2">&nbsp;&nbsp;IT培训</h2></li>
							<li style="width:310px;height:1px;background:#CACACA;"></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
							<li><span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span> <span class="nav_title_txt1" id="nav_T1"> <a
									href="html/link.jsp">JAVA</a>
							</span> <span class="nav_title_txt2" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;PHP</a>
							</span> <span class="nav_title_txt3" id="nav_T1"> <a
									href="html/link.jsp">&nbsp;&nbsp;安卓</a>
							</span></li>
						</ul>
					</div></li>
				<li id="nav_bottom"></li>
			</ul>
		</div>
		<div class="nav_kuaiJ" id="nav_kuaiJ">
			<img src="images/qunjv1.jpg" width="293" height="115" /> <img
				src="images/guokao1.jpg" width="293" height="115" /> <img
				src="images/job1.jpg" width="293" height="115" />
		</div>
	</div>
	<!--精选课程-->
	<div class="chosen">
		<!-- <h1></h1>
		<span onClick="chosen(1)" id="chosen_nav" class="chosen_nav2">师资力量</span>
		<span onClick="chosen(2)" id="chosen_nav1" class="chosen_nav2">学员风采</span> -->
		<div class="chosen_border">精选课程</div>
		<ul>
			<li class="chosen_nav1"><a href="html/link.jsp"><img
					src="images/221.png" width="260" height="160" /><img
					src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">全民营销----营销高手的成长秘诀</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;叶博武</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥6500</s></li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新1课时</a></li>
					<li style="color:#0C6;float:right;">￥4500</li>
				</ul></li>
			<li class="chosen_nav1"><a href="html/link.jsp"><img
					src="images/222.png" width="260" height="160" /><img
					src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">游戏动作全能学习班</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;贾国瑞</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥8600</s></li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新40课时</a></li>
					<li style="color:#0C6;float:right;">￥5500</li>
				</ul></li>
			<li class="chosen_nav1"><a href="html/link.jsp"><img
					src="images/220.png" width="260" height="160" /><img
					src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">社会人际学习班</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;罗文杰</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥6500</s></li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新20课时</a></li>
					<li style="color:#0C6;float:right;">￥4000</li>
				</ul></li>
			<li class="chosen_nav1" style="margin-right:0px;"><a
				href="html/link.jsp"><img src="images/228.jpg" width="260"
					height="160" /><img src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">韩语高级班--零基础入门学习班</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;付秀鹏</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥8000</s></li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新20课时</a></li>
					<li style="color:#0C6;float:right;">￥6000</li>
				</ul></li>
		</ul>
	</div>
	<!--职业技能-->
	<div class="chosen">

		<div class="chosen_border">职业技能</div>
		<ul>
			<li class="chosen_nav1"><a href="html/link.jsp"><img
					src="images/IT2.PNG" width="260" height="160" /><img
					src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">PS数码后期实战班.调色.精修.磨皮.设计套版</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;付秀鹏</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥5998</s></li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新41课时</a></li>
					<li style="color:#0C6;float:right;">￥4500</li>
				</ul></li>
			<li class="chosen_nav1"><a href="html/link.jsp"><img
					src="images/IT3.PNG" width="260" height="160" /><img
					src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">影视动画全面入门</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;罗文杰</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥5500</s></li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新21课时</a></li>
					<li style="color:#0C6;float:right;">￥4500</li>
				</ul></li>
			<li class="chosen_nav1"><a href="html/link.jsp"><img
					src="images/IT4.PNG" width="260" height="160" /><img
					src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">HTML高级开发,零基础10天入门</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;小瑞</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥7980</s></li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新10课时</a></li>
					<li style="color:#0C6;float:right;">￥2500</li>
				</ul></li>
			<li class="chosen_nav1" style="margin-right:0px;"><a
				href="html/link.jsp"><img src="images/IT5.PNG" width="260"
					height="160" /><img src="images/sp.png" class="chosen_nav_sp" /></a>
				<ul>
					<li class="collective_font" id="collective_font"><a
						href="html/link.jsp">3D&nbsp;&nbsp;Max零基础最佳选择,做室内设计高手</a></li>
					<li class="collective_font" style="float:left;color:#F30;">&nbsp;&nbsp;主讲老师:</li>
					<li style="color:#09F;float:left" class="collective_font">&nbsp;&nbsp;叶博武</li>
					<li><s
						style="color:#666;float:right;margin-left:30px;line-height:30px;">￥6500</s>
					</li>
					<li><a href="html/link.jsp" style="float:left;color:#606;"
						class="collective_font">&nbsp;&nbsp;已更新101课时</a></li>
					<li style="color:#0C6;float:right;">￥9500</li>
				</ul></li>
		</ul>
	</div>
	<!--内容-->
	<div id="bg">
		<div class="middle_box">
			<div class="middle_box_lanl">
				<h1 class="middle_nav">
					<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="middle_a">语言学习</a>
				</h1>
				<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" style="float:left;"><img
					src="images/t1.png"></a>
			</div>
			<div class="lanr">
				<div class="lanr1" style="float:left;">
					<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">推荐</a> <a
						href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">英语考试</a> <a
						href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">韩语</a> <a
						href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">日语</a> <a
						href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">最新发布</a>
				</div>
				<!--内容-->
				<div class="lanr2">
					<ul class="lanul">
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/y1.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="想知道美语怎么说吗">想知道美语怎么说吗</a>
							<div class="hot3">
								<span class="middle_money">￥3500</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">高级讲师：付秀鹏<img
									src="images/new.png" class="middle_img"></a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/y2.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="90后英语：iTop-[英语求职]">90后英语：iTop-[英语求职]</a>
							<div class="hot3">
								<span class="middle_money">￥3800</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">高级讲师：罗文杰<img
									src="images/hot.png" class="middle_img"></a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/h4.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="和韩国外教SmallRui老师【外教班】">和韩国外教SmallRui老师【外教班】</a>
							<div class="hot3">
								<span class="middle_money">￥4800</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">高级讲师：小瑞<img
									src="images/new.png" class="middle_img"></a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/h1.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="疯狂韩语【初级班】">疯狂韩语【初级班】</a>
							<div class="hot3">
								<span class="middle_money">￥2600</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">知名讲师：叶博武<img
									src="images/hot.png" class="middle_img"></a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/r1.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="【精品课】实战、趣味学日语,日语入门到精通">【精品课】实战、趣味学日语,日语入门到精通</a>
							<div class="hot3">
								<span class="middle_money" style="color:#099;">免费</span><b></b>
								<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">高级讲师：XXX</a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/r3.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="看动漫，玩转简单日语">看动漫，玩转简单日语</a>
							<div class="hot3">
								<span class="middle_money" style="color:#099;">免费</span><b></b>
								<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">高级讲师：XXX</a>
							</div></li>
					</ul>
				</div>
				<div class="lanr3">
					<div class="order">
						<h2>免费排行</h2>
						<h2>付费排行</h2>
					</div>
					<ul class="orderul">
						<li id="order1"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">【精品课】实战、趣味学日语 </a>
							<div class="order11">
								<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"><img
									src="images/9.jpg" width="90" height="50"></a> <span>6002人</span>
								<i>小瑞学院</i>
							</div></li>
						<li class="order2"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">五个定理学好语法</a></li>
						<li class="order3"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">雅思35天极限挑战【环球】 </a></li>
						<li class="order4"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">11.23-11.29-雅思哥学习班正式开课
						</a></li>
						<li class="order5"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">【精品课程】韩语零基础</a></li>
						<li class="order6"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">小瑞【韩语】在线课堂</a></li>
						<li class="order7"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">和EXO欧巴们一起学韩语</a></li>
						<li class="order8"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">大家的日语1收费VIP班</a></li>
						<li class="order9"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">明王道VIP直播活动课 </a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div id="bg">
		<div class="middle_box">
			<div class="middle_box_lanl">
				<h1 class="middle_nav">
					<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="middle_a">IT培训</a>
				</h1>
				<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" style="float:left;"><img
					src="images/yunyan1.jpg" width="240" height="420"></a>
			</div>
			<div class="lanr">
				<div class="lanr1" style="float:left;">
					<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">设计制作</a> <a
						href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">编程开发</a> <a
						href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">最新发布</a>
				</div>
				<!--内容-->
				<div class="lanr2">
					<ul class="lanul">
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/s1.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="CAD绘图设计班">CAD绘图设计班</a>
							<div class="hot3">
								<span class="middle_money">￥8888</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">主讲老师：罗文杰<img
									src="images/new.png" class="middle_img"></a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/s2.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="solidworks案例教程">solidworks案例教程</a>
							<div class="hot3">
								<span class="middle_money">￥5980</span><b></b><a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">主讲老师：小瑞<img
									src="images/hot.png" class="middle_img"></a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/s3.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="平面设计从零基础开始--大师带你走向辉煌">平面设计从零基础开始--大师带你走向辉煌</a>
							<div class="hot3">
								<span class="middle_money">￥6800</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">主讲老师：付秀鹏</a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/s4.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="PS/AI/CDR高端平面广告设计班">PS/AI/CDR高端平面广告设计班</a>
							<div class="hot3">
								<span class="middle_money">￥3800</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">主讲老师：付秀鹏<img
									src="images/hot.png" class="middle_img"></a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/s5.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="CAD快速入门教程">CAD快速入门教程</a>
							<div class="hot3">
								<span class="middle_money" style="color:#099;">免费</span><b></b>
								<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">主讲老师：叶博武</a>
							</div></li>
						<li><a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"
							class="hotula1"><img src="images/s6.jpg"></a> <a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula2"
							title="PHP网站开发高级工程师班级，士兵课程">3Dmax建模(快速入门)</a>
							<div class="hot3">
								<span class="middle_money">￥4500</span><b></b> <a
									href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')" class="hotula3">主讲老师：叶博武</a>
							</div></li>
					</ul>
				</div>
				<div class="lanr3">
					<div class="order">
						<h2>免费排行</h2>
						<h2>付费排行</h2>
					</div>
					<ul class="orderul">
						<li id="order1"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">PS真正零基础到精通教程 </a>
							<div class="order11">
								<a href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')"><img
									src="images/ps.png" width="60" height="50"></a> <span>6002人</span>
								<i>XX学院</i>
							</div></li>
						<li class="order2"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">CAD/UG模具设计高级结构班
						</a></li>
						<li class="order3"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">VIP课堂PS软件零基础</a></li>
						<li class="order4"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">蓝铅笔sai插画漫画基础</a></li>
						<li class="order5"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">Java基础进阶高级工程师，一切由你决定</a></li>
						<li class="order6"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">CTO学院Linux运维架构师
						</a></li>
						<li class="order7"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">【C#零基础】两周制作</a></li>
						<li class="order8"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">零基础编程,原价2000元</a></li>
						<li class="order9"><b></b><a
							href="javascript:alert('正在紧急开发中，给您带来的不便请谅解')">DIV+CSS零基础到实战</a></li>
					</ul>
				</div>
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
										class="lianxi_right_kuang3" style="resize:none;"></textarea></td>
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
