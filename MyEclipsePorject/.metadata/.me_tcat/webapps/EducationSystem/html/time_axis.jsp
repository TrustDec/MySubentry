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
<title>发展历程</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/entry.js"></script>
<style type="text/css">
body {
	font-family: "微软雅黑";
	background: #EFEFEF;
	/* background:#081130 url(html/images/bg.jpg) repeat;background-size:100% 900px; */
}

.divyuan {
	position: absolute;
	left: 142px;
	top: 10px;
	width: 130px;
	height: 130px;
	border-radius: 100px;
	background: url(html/images/time.png);
	background-size: 130px;
	color: #686868;
	text-align: center;
	line-height: 130px;
	font-size: 25px;
	border: 5px #0C47B6 solid;
}

.divshugang {
	position: absolute;
	left: 210px;
	top: 150px;
	width: 5px;
	height: 590px;
	background-color: rgba(6, 106, 255, 0.7);
}

.divdian1,.divdian2,.divdian3,.divdian4,.divdian5,.divdian6 {
	position: absolute;
	left: 203px;
	width: 20px;
	height: 20px;
	border-radius: 15px;
	background-color: rgba(6, 106, 255, 1);
	text-align: center;
}

.divdian1 {
	top: 220px;
}

.divdian2 {
	top: 320px;
}

.divdian3 {
	top: 420px;
}

.divdian4 {
	top: 520px;
}

.divdian5 {
	top: 620px;
}

.divdian6 {
	top: 720px;
	background-color: rgba(213, 69, 0, 1);
}

.divkuang1,.divkuang2,.divkuang3,.divkuang4,.divkuang5,.divkuang6 {
	position: absolute;
	left: 270px;
	width: 600px;
	height: 60px;
	color: #000;
	border-radius: 5px;
	background-color: rgba(102, 120, 242, 0.6);;
	transition: width 100ms sease-in, height 100ms ease-in, font-size 100ms
		ease-in;
	font-size: 15px;
}

.divkuang1 {
	top: 220px;
}

.divkuang1:hover {
	width: 620px;
	height: 62px;
	font-size: 16px;
	transition: width 100ms ease-in, height 100ms ease-in, font-size 100ms
		ease-in;
}

.divkuang2 {
	top: 320px;
}

.divkuang2:hover {
	width: 620px;
	height: 62px;
	font-size: 16px;
	transition: width 100ms ease-in, height 100ms ease-in, font-size 100ms
		ease-in;
}

.divkuang3 {
	top: 420px;
}

.divkuang3:hover {
	width: 620px;
	height: 62px;
	font-size: 16px;
	transition: width 100ms ease-in, height 100ms ease-in, font-size 100ms
		ease-in;
}

.divkuang4 {
	top: 520px;
}

.divkuang4:hover {
	width: 620px;
	height: 62px;
	font-size: 16px;
	transition: width 100ms ease-in, height 100ms ease-in, font-size 100ms
		ease-in;
}

.divkuang5 {
	top: 620px;
}

.divkuang5:hover {
	wwidth: 620px;
	height: 62px;
	font-size: 16px;
	transition: width 100ms ease-in, height 100ms ease-in, font-size 100ms
		ease-in;
}

.divkuang6 {
	top: 720px;
}

.divkuang6:hover {
	wwidth: 620px;
	height: 62px;
	font-size: 16px;
	transition: width 100ms ease-in, height 100ms ease-in, font-size 100ms
		ease-in;
}

.divbiao {
	font-size: 30px;
	color: #9D6A37;
	position: absolute;
	left: 400px;
	font-family: "楷体";
	top: 80px;
	text-align: center;
}

.divzi1,.divzi2,.divzi3,.divzi4,.divzi5,.divzi6 {
	position: absolute;
	left: 100px;
	font-size: 16px;
	color: #8D6C34;
	font-weight: bold;
}

.divzi1 {
	top: 215px;
}

.divzi2 {
	top: 315px;
}

.divzi3 {
	top: 415px;
}

.divzi4 {
	top: 515px;
}

.divzi5 {
	top: 615px;
}

.divzi6 {
	top: 715px;
}
</style>

</head>
<body onLoad="headNav()">
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
				<li><a href="html/time_axis.jsp" class="head_li"
					style="color:#09C;font-weight:bold;">发展历程</a></li>
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
	<script type="text/javascript">
		function exit() {
			var form = document.myform;
			form.action = "ExitServlet";
			form.method = "post";
			form.submit();
		}
	</script>
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
				class="entry_span_1">忘记密码&gt;&gt;</a></span> -->
			<span><a href="html/l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a>
			</span>
		</div>
	</div>
	<div
		style="width:1200px;min-height:800px;margin-top:0px;border:0px solid ;position:relative;margin:0px auto;">
		<div class="divbiao">梦想的导航者，未来的创造者</div>

		<div class="divyuan">
			<!--圆形-->
			<span>2015年</span>
		</div>
		<div class="divshugang"></div>
		<!--竖杠-->
		<div class="divdian1"></div>
		<div class="divdian2"></div>
		<div class="divdian3"></div>
		<div class="divdian4"></div>
		<div class="divdian5"></div>
		<div class="divdian6"></div>

		<div class="divzi1">11月24日</div>
		<div class="divzi2">11月25日</div>
		<div class="divzi3">11月26日</div>
		<div class="divzi4">12月5日</div>
		<div class="divzi5">12月9日</div>
		<div class="divzi6">至今...</div>
		<div class="divkuang1">四人组建团队，共同商策发展方向</div>
		<div class="divkuang2">由于对IT行业兴趣浓厚，想起求学的各种艰辛，准备创办网络教学机构，给求学者提供最大的捷径，为在线教育注入更加年轻的血液
		</div>
		<div class="divkuang3">正式开始启用“乐启学院”品牌，同时开设多学院，新增网络营销、网页制作、淘宝等课程，开始了多科目的全行业的在线教育发展之路。</div>
		<div class="divkuang4">
			学院正式更名为乐启教育，启用新的品牌LOGO。
			<!--  团队成员：CEO：贾国瑞  &nbsp;&nbsp; 项目负责人：罗文杰  &nbsp;&nbsp;  保镖：叶博武&nbsp;&nbsp;  软件开发员：付秀鹏 -->
		</div>
		<div class="divkuang5">启用全新“四叶草”LOGO，正式更名为KLEE(俄语意为：四叶草)，官网同时更改诸多版块...</div>
		<div class="divkuang6">不断完善中...</div>
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
