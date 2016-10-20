<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<title>帮助</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/entry.js"></script>
<style>
.bg_en {
	width: 1349px;
	height: 700px;
	background: url("html/images/05.jpg") no-repeat;
	background-size: 1350px 700px;
	margin: 0px auto;
}

.bg_color {
	width: 1349px;
	height: 700px;
	background: rgba(0, 0, 0, 0.8);
}
/*帮助中心_CSS开始*/
.helpbox {
	width: 1198px;
	height: 900px;
	margin: 0px auto;
	border: 1px #dcdcdc solid;
	overflow: hidden;
}
/*帮助中心左边*/
.helpboxL {
	width: 219px;
	border-right: 1px #dcdcdc solid;
	height: 900px;
	float: left;
	overflow: hidden;
}

.helpboxL ul {
	width: 219px;
	margin: 0px;
	padding: 0px;
	list-style: none;
}

.helpboxL ul li {
	float: left;
	width: 219px;
	border-bottom: 1px #CCC solid;
}

.helplli1 {
	height: 248px;
}

.helplli2 {
	height: 149px;
}

.helpboxL ul li.helplli3 {
	border-bottom: 0px;
}
/*大标题*/
.helpboxL ul h2 {
	padding: 0px;
	color: #666666;
	float: left;
	width: 197px;
	font-weight: normal;
	font-size: 22px;
	margin: 26px 0px 10px 24px;
}

#teacher,#company {
	margin: 11px 0px 10px 24px;
}
/*LEFT——A*/
.helpboxL ul a {
	display: block;
	float: left;
	width: 197px;
	height: 42px;
	padding-left: 18px;
	border-left: 4px #fff solid;
	font-size: 14px;
	text-decoration: none;
	line-height: 42px;
	color: #333;
}
/*a:hover*/
.helpboxL ul a:hover {
	display: block;
	float: left;
	width: 197px;
	height: 42px;
	padding-left: 18px;
	border-left: 4px #e5e5e5 solid;
	background-color: #f2f2f2;
	font-size: 14px;
	text-decoration: none;
	line-height: 42px;
	color: #333;
}
/*a。now*/
.helpboxL ul li a.now {
	display: block;
	float: left;
	width: 197px;
	height: 42px;
	padding-left: 18px;
	border-left: 4px #039ae3 solid;
	font-size: 14px;
	text-decoration: none;
	line-height: 42px;
	color: #039ae3;
}
/*帮助中心右边*/
.helpboxR {
	width: 978px;
	float: left;
	height: 900px;
	overflow: hidden;
}

.helpboxR2 {
	width: 900px;
	margin: 40px 0px 0px 30px;
	float: left;
}

.helpboxR2 h1 {
	border-bottom: 1px #CCC solid;
	font-weight: normal;
	font-size: 20px;
	padding-bottom: 17px;
	color: #333333;
}

.helpboxR2 h3 {
	padding: 0px;
	float: left;
	width: 100%;
	font-size: 14px;
	font-weight: normal;
	margin: 24px 0px 7px 0px;
}

.helpboxR2 p {
	margin: 0px;
	padding: 0px;
	width: 100%;
	float: left;
	line-height: 32px;
	color: #999;
	font-size: 14px;
	text-indent: 12px;
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
				<li><a href="html/time_axis.jsp" class="head_li">发展历程</a></li>
				<li><a href="html/developer.jsp" class="head_li">论坛.活动</a></li>
				<li><a href="html/bangzhu.jsp" class="head_li"
					style="color:#09C;font-weight:bold;">帮助</a></li>
				<%String name = (String)session.getAttribute("name");
            if(name == null)
            {	
            	%>
            	<li><a href="html/l_zhuce.jsp" class="DL_zc">注册</a></li>
				<li><a href="javascript:void(0)" onClick="entry()" class="DL_">登录</a></li>
				<%
            }
            else
            {
            	%>
				<li class="DL_name" onclick="javascript:alert('暂时不能提供查看个人信息')">欢迎您:<%=name %></li>
				<li><a href="javascript:void(0)" onClick="exit()" class="DL_E">退出</a></li>
				<%
            }
            
             %>
				<%--<li><a href="javascript:void(0)" onClick="entry()" class="DL_">登录</a></li> --%>

			</ul>
		</div>
	</div>
	<script type="text/javascript">
function exit()
{
	var form = document.myform;
		form.action="ExitServlet";
		form.method="post";
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
				class="entry_span_1">忘记密码&gt;&gt;</a></span>  --><span><a
				href="html/l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a></span>
			
		</div>
	</div>

	<div class="helpbox">
		<div class="helpboxL">
			<ul>
				<li class="helplli1">
					<h2>学生</h2> <a href="javascript:viod(0)" class="now">课程报名</a> <a href="javascript:viod(0)">课前准备须知</a>
					<a href="javascript:viod(0)">支付与退款</a> <a href="javascript:viod(0)">常见问题</a>
				</li>
				<li class="helplli2">
					<h2 id="teacher">老师</h2> <a href="javascript:viod(0)">课前准备须知</a> <a href="javascript:viod(0)">上课说明</a>
				</li>
				<li class="helplli3">
					<h2 id="company">机构</h2> <a href="javascript:viod(0)">机构入驻</a> <a href="javascript:viod(0)">协议签署流程</a>
					<a href="javascript:viod(0)">机构与群主签约</a> <a href="javascript:viod(0)">机构与老师签约</a>
				</li>
			</ul>
		</div>
		<div class="helpboxR">
			<div class="helpboxR2">
				<h1>课程报名</h1>
				<h3>1.怎么报名课程？</h3>
				<p>在课程详情页，若该课程可报名，则点击报名进入报名流程。</p>
				<h3>2.报名后课程怎么上课？</h3>
				<p>a）通过QQ tips/QQ主面板上的课程入口进入。</p>
				<p>b）通过群应用tab页机构正在上的课程点击"立即上课"进入。</p>
				<p>c）通过课程平台"我的课程"中正在直播课程点击"立即上课"进入。</p>
				<h3>3.报名课程可以退款吗？</h3>
				<p>a）理论上课程开课之前都可以无条件退款。但系统拒绝恶意的付款退款行为 。</p>
				<p>b）课程开始后课程便不允许退款了。可与机构协商退款事项。</p>
				<h3>4.课程报名后可以取消报名吗？</h3>
				<p>a）免费课程可在报名前取消报名。课程开始后不允许取消报名。</p>
				<p>b）在我的课程页面，找到想要取消的课程，点击取消报名。</p>
				<h3>5.什么是课时？</h3>
				<p>该课程一共上几次课，当前时间是第几节课的安排。例如： "第4节，共10节"，表示当前课程是整个课程的第4节。</p>
				<h3>6.什么是课表？ 课程表？</h3>
				<p>KLEE课堂将您需要关注的上课信息整理成表，称课程表。其中的课程内容均为您已成功报名，并尚未开始的课程。</p>
				<h3>7.什么是已报名课程？ 课程报名记录？</h3>
				<p>课程报名记录记录了您在KLEE课堂平台上，所有有过报名行为课程的列表。部分课程已经报名成功，部分课程由于种种原因尚未报名成功，需要您进行继续操作。
				</p>
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
