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
<title>走进KLEE</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/entry.js"></script>
<style type="text/css">
.step_center {
	width: auto;
	height: 300px;
	background: url(html/images/bgheader.jpg);
	background-size: 100% 100%;
	position: relative;
}

.step_xy,.step_xy_one,.step_xy_two {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 450px;
	height: 50px;
	text-align: center;
	line-height: 50px;
}

.step_xy {
	font-size: 32px;
	color: #FFF;
	font-family: "楷体";
	margin: -80px 0px 0px -225px;
}

.step_xy_one {
	font-size: 19px;
	color: #CCCCCC;
	margin: -10px 0px 0px -225px;
}

.step_xy_two {
	font-size: 29px;
	color: #0080C0;
	margin: 50px 0px 0px -225px;
}

.step_bg_gd {
	width: 100%;
	height: 40px;
	margin: 0px auto;
	background: linear-gradient(to right, rgba(13, 94, 80, 1),
		rgba(13, 94, 80, 0.1));
	clear: both;
	position: relative;
	top: -40px;
}

#step_font1,#step_font2,#step_font3,#step_font4 {
	width: 1200px;
	height: 40px;
	margin: 0px auto;
	line-height: 40px;
	text-align: center;
	font-size: 25px;
	letter-spacing: 30px;
}
/*企业精神  */
.step_center_C {
	width: 1200px;
	height: 302px;
	margin: 30px auto;
}

.step_qyjs {
	width: 807px;
	height: 302px;
	margin: 0px auto;
}

.qyjs_one {
	width: 301px;
	height: 208px;
	background: url(html/images/3.png);
	background-size: 100%;
	float: left;
	margin-top: 50px;
}

.qyjs_two {
	width: 249px;
	height: 309px;
	float: left;
	background: url(html/images/1.png);
	background-size: 100%;
}

.qyjs_three {
	width: 257px;
	height: 208px;
	margin-top: 50px;
	float: right;
	background: url(html/images/2.png);
	background-size: 100%;
}

.step_hzqy_bg {
	width: 100%;
	height: 280px;
	background: #FFF;
	padding-top: 20px;
}

.step_hzqy {
	width: 1200px;
	height: 250px;
	margin: 0px auto;
}

.hzqy_img {
	width: 330px;
	height: 260px;
	background: url(html/images/dl12.jpg);
	background-size: 300px;
	float: left;
}

.hzqy_jieshao,.mb_font {
	height: 100%;
	float: right;
	font-family: "YaHei Consolas Hybrid";
	
	text-indent: 3em;
	line-height: 35px;
	letter-spacing: 7px;
	font-size: 15px;
	text-align: left;
	color: #30332F;
}

.hzqy_jieshao {
	width: 860px;
	padding-top: 30px;
}
/*教育目标  */
.step_mb {
	width: 1200px;
	height: 350px;
	margin: 20px auto;
}

.step_mb img {
	float: right;
}

.mb_font {
	width: 790px;
	padding-left: 10px;
	float: left;
}
/*底层介绍  */
.step_kjzf {
	width: 1200px;
	height: 150px;
	margin: 0px auto;
}

.kjzf_one,.kjzf_two,.kjzf_three {
	width: 400px;
	height: 120px;
	float: left;
}

.kjzf_img {
	float: left;
	margin-right: 80px;
}

.kjzf_nav {
	font-size: 15px;
	padding-top: 20px;
}

.kjzf_lan {
	margin-left: -20px;
	display: inline-block;
}

.li_img1 {
	width: 20px;
	height: 20px;
	background: url(html/images/thumb.png);
	background-size: 20px 20px;
	display: inline-block;
	position: relative;
	top: 4px;
}

.li_img {
	width: 16px;
	height: 15px;
	background: url(html/images/li.png);
	display: inline-block;
	position: relative;
	top: 2px;
}

.kjzf_nav_lan li {
	line-height: 30px;
}
</style>
<script>
	function color() {
		var fontColor = parseInt(Math.random() * 10000);
		var a = document.getElementById("step_font1");
		var b = document.getElementById("step_font2");
		var c = document.getElementById("step_font3");
		var d = document.getElementById("step_font4");
		a.style.color = "#bc" + fontColor;
		a.style.letterSpacing = "0px";
		a.style.transition = "all 2s ease";
		b.style.letterSpacing = "0px";
		b.style.transition = "all 1s ease";
		b.style.color = "#b" + fontColor + "c";
		c.style.color = "#e" + fontColor + "a";
		c.style.letterSpacing = "0px";
		c.style.transition = "all 1s ease";
		d.style.color = "#e" + fontColor + "a";
		d.style.letterSpacing = "0px";
		d.style.transition = "all 1s ease";
		setTimeout(color, 600);
	}
</script>
</head>
<body onLoad="color()">
	<!--头部导航栏-->
	<div id="head_nav">
		<div id="head_menu">
			<ul class="head_ul">
				<li><img src="images/logo3.png" class="head_logo" width="55" /><img
					src="images/logo_4.png" width="70" class="head_logo_1" /></li>
				<li><img src="images/faith.png" class="head_logo1" /></li>
				<li><a href="index.jsp" class="head_li">首页</a></li>
				<li class="head_li" id="head_li_from"><a
					href="html/business_system.jsp" class="head_font_size">课程体系</a>
					<ul class="head_nav_nav_none">
						<li><a href="html/yewu.html" class="head_font_size"
							class="head_nav_yw_tx" class="head_li">业务体系</a></li>
					</ul>
				</li>
				<li><a href="html/step_in.jsp" class="head_li"
					style="color:#09C;font-weight:bold;">走进KLEE</a></li>
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
				class="entry_span_1">忘记密码&gt;&gt;</a></span> --><span><a
				href="html/l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a></span>
		</div>
	</div>
	<!--背景区  -->
	<div class="step_center">
		<div class="step_xy">互联网最热门的在线教育学院</div>
		<div class="step_xy_one">2015.KLEE学院点亮你的梦想</div>
		<div class="step_xy_two">Welcome to our education</div>
	</div>
	<div class="step_bg_gd">
		<div id="step_font1">Spirit of enterprise</div>
	</div>
	<!-- 学院介绍 -->
	<div class="step_center_C">
		<div class="step_qyjs">
			<ul>
				<li class="qyjs_one"></li>
				<li class="qyjs_two"></li>
				<li class="qyjs_three"></li>
			</ul>
		</div>
	</div>
	<div class="step_bg_gd"
		style="top:0px;background: linear-gradient(to right, #1D2F30,
		#659FA3);">
		<div id="step_font2">Co-Operative Enterprise</div>
	</div>
	<!-- 合作企业 -->
	<div class="step_hzqy_bg">
		<div class="step_hzqy">
			<div class="hzqy_img"></div>
			<div class="hzqy_jieshao">KLEE人以服务社会、振兴中国软件产业为己任，励精图治，改革创新，开拓进取，经过二十余年拼搏，取得了令人瞩目的业绩。展望未来，公司将抓住机遇，加大自主产品创新，加快国际化进程，实现规模经济和跨越式发展，成为具有国际竞争力、国际知名度的中国软件旗舰企业，跻身世界软件企业百强，实现“中国软件第一品牌，世界一流知名企业”。</div>
		</div>
	</div>
	<div class="step_bg_gd"
		style="top:0px;background: linear-gradient(to right, #052341,
		#2B8CEE);">
		<div id="step_font3">Educational objective</div>
	</div>
	<div class="step_mb">
		<div class="mb_font">KLEE教育一直秉承“用良心做教育”的理念，是中国移动互联网研发人才一体化服务的领导品牌，
			全力打造移动互联网高端研发人才服务平台。公司总部位于北京，目前已在深圳、上海、郑州、广州、大连、武汉、成都、西安、青岛、杭州成立了分公司。拥有全国最多、最权威的移动互联网教学就业保障团队，
			做到了毕业学员业内最高薪水，成为学员最信赖的IT培训机构。千锋教育是中关村移动互联网产业联盟副理事长单位，
			中国软件协会教育培训委员会认证首家一级培训机构，中关村国际孵化软件协会唯一授权中关村移动互联网学院，年培养学员数量20000人，
			合作院校超500所，合作企业超4000家，APP上线项目超1000个，每年有数十万名学员受益于KLEE教育组织的技术研讨会、技术培训课、
			网络公开课及免费教学视频</div>
		<img src="html/images/mb.png" height="350">
	</div>
	<div class="step_bg_gd"
		style="top:0px;background: linear-gradient(to right, #11410A,
		#2B8CEE);">
		<div id="step_font4">Shortcut</div>
	</div>
	<!--快捷  -->
	<div class="step_kjzf">
		<ul>
			<li class="kjzf_one"><img src="html/images/dl_08.jpg"
				width="120" class="kjzf_img">
				<div class="kjzf_nav">
					<span class="kjzf_lan"><span class="li_img1"></span>&nbsp;&nbsp;支持在线支付</span>
					<ul class="kjzf_nav_lan">
						<li><span class="li_img"></span>&nbsp;&nbsp;支付宝</li>
						<li><span class="li_img"></span>&nbsp;&nbsp;财付通</li>
						<li><span class="li_img"></span>&nbsp;&nbsp;银行卡</li>
					</ul>
				</div></li>
			<li class="kjzf_two"><img src="html/images/dl_06.jpg"
				width="120" class="kjzf_img">
				<div class="kjzf_nav">
					<span class="kjzf_lan"><span class="li_img1"></span>&nbsp;&nbsp;支持在线支付</span>
					<ul class="kjzf_nav_lan">
						<li><span class="li_img"></span>&nbsp;&nbsp;支付宝</li>
						<li><span class="li_img"></span>&nbsp;&nbsp;财付通</li>
						<li><span class="li_img"></span>&nbsp;&nbsp;银行卡</li>
					</ul>
				</div></li>
			<li class="kjzf_three"><img src="html/images/dl_07.jpg"
				width="120" class="kjzf_img">
				<div class="kjzf_nav">
					<span class="kjzf_lan"><span class="li_img1"></span>&nbsp;&nbsp;支持在线支付</span>
					<ul class="kjzf_nav_lan">
						<li><span class="li_img"></span>&nbsp;&nbsp;支付宝</li>
						<li><span class="li_img"></span>&nbsp;&nbsp;财付通</li>
						<li><span class="li_img"></span>&nbsp;&nbsp;银行卡</li>
					</ul>
				</div></li>

		</ul>
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
					<div class="bufen">Copyright © 2015 xike2-3zu. All RightsReserved.</div>
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
