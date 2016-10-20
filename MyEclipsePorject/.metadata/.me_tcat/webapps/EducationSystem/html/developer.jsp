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

<title>活动</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/entry.js"></script>
<style>
#divMain {
	width: 100%;
	height: 300px;
	/* background-color: #F00; */
}

#divCenter {
	position: relative;
	width: 1200px;
	height: 100%;
	margin: 0px auto;
}

#divCenterImg {
	height: 300px;
}

#divCenterButtonLeftDiv {
	position: absolute;
	left: 0px;
	top: 50%;
	margin-top: -15px;
}

#divCenterButtonRightDiv {
	position: absolute;
	right: 0px;
	top: 50%;
	margin-top: -15px;
}

#divCenterButtonLeft {
	width: 30px;
	height: 30px;
	border-radius: 30px;
	border: solid 2px #0099CC;
}

#divCenterButtonRight {
	width: 30px;
	height: 30px;
	border-radius: 30px;
	border: solid 2px #0099CC;
}

#divCenterNume {
	position: relative;
	bottom: 30px;
	left: 50%;
	margin-left: -60px;
	font-size: 12px;
	width: 150px;
	height: 20px;
}

#divCenterNume1,#divCenterNume2,#divCenterNume3,#divCenterNume4,#divCenterNume5
	{
	width: 15px;
	height: 15px;
	border-radius: 15px;
	float: left;
	margin-left: 10px;
	text-align: center;
}

ul {
	line-height: 28px;
	font-size: 15px;
}

.luntan_img {
	float: left;
	width: 110px;
	height: 110px;
	padding-right: 15px;
}

.luntan_box {
	width: 1200px;
	height: 350px;
	margin: 20px auto;
}

.luntan_title {
	width: 1200px;
	height: 30px;
	margin: 0px auto;
	border-bottom: 1px solid #B6B3B1;
	font-size: 20px;
}

.luntan_center1,.luntan_center2,.luntan_center3 {
	width: 350px;
	height: 120px;
	/*border: 1px solid red;*/
	float: left;
	padding-top: 20px;
	padding-left: 20px;
}

.luntan_center4 {
	width: 350px;
	height: 120px;
	float: left;
	padding-top: 20px;
	padding-left: 20px; /*border: 1px solid red;*/
}

.fontsize {
	font-size: 22px;
}

#div li {
	list-style: disc;
}
</style>
<script>
	var nume = 1;
	var color = [ "#271F37", "#000000", "#EDDCE6", "#BFDF96", "#D97EDD" ];
	function run() {
		if (nume > 5) {
			nume = 1;
		}
		imgRun(nume);
		nume++;
		stop1 = setTimeout("run()", 2000);
	}
	function imgRun(nume1) {

		if (nume1 > 2) {
			document.getElementById("divCenterImg").style.margin = "0px 25%";
		} else {
			document.getElementById("divCenterImg").style.margin = "0px auto";
		}
		document.getElementById("divCenterImg").src = "html/images/luntan"
				+ nume1 + ".jpg";
		for (var i = 1; i <= 5; i++) {

			document.getElementById("divCenterNume" + i).style.backgroundColor = "white";
		}
		document.getElementById("divCenterNume" + nume1).style.backgroundColor = "red";
		color1 = color[nume1 - 1];
		document.getElementById("divMain").style.backgroundColor = color1;
	}
	function stop3() {
		clearTimeout(stop1);
	}

	function stop2(shu) {

		nume = shu;
		imgRun(nume);
		stop3();
	}
	function buttonRight() {
		nume = nume + 1;
		if (nume > 5) {
			nume = 1;
		}
		imgRun(nume);

	}
	function buttonLeft() {
		nume = nume - 1;
		if (nume < 1) {
			nume = 5;
		}

		imgRun(nume);

	}
</script>
</head>
<!-- onLoad="Load_one()" -->
<body style="background:#fff;" onload="run()">
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
				<li><a href="html/step_in.jsp" class="head_li">走进KLEE</a></li>
				<li><a href="html/time_axis.jsp" class="head_li">发展历程</a></li>
				<li><a href="html/developer.jsp" class="head_li"
					style="color:#09C;font-weight:bold;">论坛.活动</a></li>
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
				href="html/l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a></span>
		</div>
	</div>
	<!--幻灯片区  -->
	<div id="divMain">
		<div id="divLeft"></div>
		<div id="divCenter">
			<div id="divCenterButtonLeftDiv" onmouseover="stop3()"
				onmouseout="run()">
				<input type="button" onclick="buttonLeft()" id="divCenterButtonLeft" />
			</div>
			<div id="divCenterButtonRightDiv" onmouseover="stop3()"
				onmouseout="run()">
				<input type="button" onclick="buttonRight()"
					id="divCenterButtonRight" />
			</div>
			<img src="html/images/luntan1.jpg" id="divCenterImg" />
			<div id="divCenterNume">
				<div id="divCenterNume1" onmouseover="stop2(1)" onmouseout="run()">1</div>
				<div id="divCenterNume2" onmouseover="stop2(2)" onmouseout="run()">2</div>
				<div id="divCenterNume3" onmouseover="stop2(3)" onmouseout="run()">3</div>
				<div id="divCenterNume4" onmouseover="stop2(4)" onmouseout="run()">4</div>
				<div id="divCenterNume5" onmouseover="stop2(5)" onmouseout="run()">5</div>
			</div>
		</div>
		<div id="divRight"></div>
	</div>
	<!--  -->
	<div class="luntan_box">
		<div class="luntan_title">IT培训团</div>
		<div class="luntan_center1">
			<img src="html/images/z0.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">安卓开发团</li>
				<li>最活跃的安卓开发交流区</li>
				<li>团友数4121</li>
			</ul>
		</div>
		<div class="luntan_center2">
			<img src="html/images/z4.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">PS大神养成团</li>
				<li>所有喜爱绘画、设计、广告等等</li>
				<li>团友数68274</li>
			</ul>
		</div>
		<div class="luntan_center3">
			<img src="html/images/z3.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">网页平面设计团</li>
				<li>欢迎平面设计控一起交流</li>
				<li>团友数10495</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<ul id="div">
				<li>第十八天跟着大磨马学IT编程（安卓java）</li>
				<li>十七天跟着大磨马学IT编程（安卓java程序员）</li>
				<li>你们好，朋友们谁有反编译工具跟打包签名软件，分享下</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<img src="html/images/z2.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">室内建筑设计团</li>
				<li>跟团友一起，一步步成为设计专家！</li>
				<li>团友数13018</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<img src="html/images/z1.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">编程设计团</li>
				<li>编程爱好集中地</li>
				<li>团友数21551</li>
			</ul>
		</div>
	</div>
	<!--内容区（总分四区） -->
	<div class="luntan_box">
		<div class="luntan_title">语言培训团</div>
		<div class="luntan_center1">
			<img src="html/images/z5.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">考研团</li>
				<li>提供考研相关的资讯和公共课资料</li>
				<li>团友数1243</li>
			</ul>
		</div>
		<div class="luntan_center2">
			<img src="html/images/z6.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">英语团</li>
				<li>每天坚持说英语，成为英语达人</li>
				<li>团友数30683</li>
			</ul>
		</div>
		<div class="luntan_center3">
			<img src="html/images/z7.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">日语团</li>
				<li>日语综合学团，分享你的学习经验</li>
				<li>团友数11474</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<ul id="div">
				<li>有机会实现梦想让人生变得有趣</li>
				<li>2016考研时间及科目安排</li>
				<li>2016考研冲刺：靠谱复习计划三大要素</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<img src="html/images/z8.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">韩语团</li>
				<li>热爱韩语的小伙伴们，快来思密达！</li>
				<li>团友数27238</li>
			</ul>
		</div>
		
	</div>
	<!--内容区（总分四区） -->
	<div class="luntan_box">
		<div class="luntan_title">职业技能团</div>
		<div class="luntan_center1">
			<img src="html/images/z9.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">医师考试交流团</li>
				<li>国家医师资格考试学习.交流.分享</li>
				<li>团友数2258</li>
			</ul>
		</div>
		<div class="luntan_center2">
			<img src="html/images/z10.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">公务员考试交流团</li>
				<li>分享公务员考试.培训经验</li>
				<li>团友数6031</li>
			</ul>
		</div>
		<div class="luntan_center3">
			<img src="html/images/z11.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">会计学习团</li>
				<li>欢迎学习会计有兴趣的同学加入</li>
				<li>团友数11336</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<ul id="div">
				<li>百通老师提示：2016年护士资格考试大纲变化</li>
				<li>2016年护士资格考试大纲变化及新旧对比图</li>
				<li>2016年执业医师考试复习规划-“6段式备考策略”</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<img src="html/images/z12.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">求职创业团</li>
				<li>面试经验.求职技巧.这里应有尽有！</li>
				<li>团友数13219</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<img src="html/images/z13.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">应届求职团</li>
				<li>应届生过来看.高薪就业</li>
				<li>团友数4286</li>
			</ul>
		</div>
	</div>
	<!--内容区（总分四区） -->
	<div class="luntan_box">
		<div class="luntan_title">兴趣爱好团</div>
		<div class="luntan_center1">
			<img src="html/images/z14.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">摄影团</li>
				<li>一起分享生活中捕捉的美图</li>
				<li>团友数13810</li>
			</ul>
		</div>
		<div class="luntan_center2">
			<img src="html/images/z15.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">恋爱宝典分享团</li>
				<li>如何追到心仪的妹子？</li>
				<li>团友数15994</li>
			</ul>
		</div>
		<div class="luntan_center3">
			<img src="html/images/z16.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">投资理财团</li>
				<li>学习理财知识，分享理财心得</li>
				<li>团友数12288</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<ul id="div">
				<li>雪域高原</li>
				<li>你约吗？</li>
				<li>人间喜剧</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<img src="html/images/z17.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">一起唱歌团</li>
				<li>show出你的歌唱技巧</li>
				<li>团友数8321</li>
			</ul>
		</div>
		<div class="luntan_center4">
			<img src="html/images/z18.jpg" class="luntan_img" />
			<ul>
				<li class="fontsize">1758一起舞吧团</li>
				<li>每一次翩翩起舞的背后</li>
				<li>团友数12630</li>
			</ul>
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
