<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>业务体系</title>
<link type="image/x-icon" rel="shortcut icon" href="../favicon.ico" />
<link href="../css/head_nav.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../js/head.js"></script>
<script type="text/javascript" src="../js/entry.js"></script>
<style>
body{font-size:100%;}
.kc_center_onr {
	width: 1200px;
	height: 185px;
	
	margin: 20px auto;
}

.kc_kc {
	width: 1200px;
	height: 40px;
	
	line-height: 40px;
	color: #099FB0;
	font-weight: bold;
	font-size: 18px;
	border-bottom:1px solid #6F7574;
}
.kc_lb{color:#0E5049;font-weight:bold;}
#kc_jx li{float:left;margin:5px 40px 5px 0px;padding:2px 10px;font-size:15px;}
#kc_jx li a{color:#000;font-size:15px;font-family:"等线";}
.kc_jingxuan_1,.kc_jingxuan_2,.kc_jingxuan_3{clear:both;}
.kc_rm{width:1200px;height:40px;background:linear-gradient(110deg,#106994,rgba(240,249,253,0.2));clear:both;}
#kc_zx,#kc_zr{width:60px;height:40px;line-height:40px;display:inline-block;text-align:center;}
#kc_zx{background:#3EBB1A;}
#kc_zx a,#kc_zr a{color:#FFF;}
#kc_zx a:hover{color:#EA2D2D;}
#kc_zr a:hover{color:#EA2D2D;}
/* 课程内容 */
.kc_nr{width:1200px;height:525px;margin:20px auto;}
#zx_sum{width:276px;height:255px;float:left;margin:0px 10px 0px 11px;overflow:hidden;}
.kc_box{width:276px;height:180px;float:left;overflow:hidden;}
.zx_img{width:276px;height:180px;margin:0px;}
.hr{width:1200px;background:#A6A9A5;height:1px;clear:both;margin:10px 0px;float:left;}
.zx_zhuti,.zx_beizhu{float:left;width:276px;height:25px;display:inline-block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;
}
.zx_zhuti a{color:#000;font-size:15px;}
.zx_zhuti a:hover{color:#186970;}
.zx_beizhu{color:#969995;font-size:14px;}
.zx_xxcd,.zx_xxrs{display:inline-block;font-size:14px;float:left;width:auto;height:20px;line-height:20px;}
.zx_xxrs{float:right;color:#696C68;}
.zx_xxcd{color:green;line-height:30px;}
.zx_rentou{width:20px;height:20px;}
/*课程切换  */
.kc_qiehuan{width:1200px; height:80px;margin:0px auto;position:relative;}
.kc_shuzi{width:150px;height:30px;position:absolute;top:50%;left:50%;margin-left:-75px;margin-top:-15px;}
.kc_shuzi_ul li{width:auto;height:30px;color:#696C68;cursor:pointer;float:left;margin-right:15px;text-align:center;line-height:30px;}
.kc_shuzi_ul li:hover{color:#47B123;}
</style>
<script>
/*全部课程li背景  */
function backgd(obj){
	
	obj.style.backgroundColor="#00CACA";
	obj.style.borderRadius="10px";
}
function backgdC(obj){
	
	obj.style.backgroundColor="rgba(255,255,255,0)";
}
/*课程内容图片放大  */
  function imgFD(obj){
	  obj.style.width="310px";
	obj.style.height="220px";
	obj.style.margin="-20px ";
	 obj.style.transition="all 300ms ease";
	}
  function imgSX(obj){
	  obj.style.width="276px";
	obj.style.height="180px";
	obj.style.margin="0px";
	 obj.style.transition="all 300ms ease";
	}
 /*课程切换  */
 function kcQH_one(){
	document.getElementById("kc_zx").style.backgroundColor="#3EBB1A";
	document.getElementById("kc_zr").style.backgroundColor="rgba(0,0,0,0)";
	
	 document.getElementById("kcQH2").style.display="none";
	 document.getElementById("kcQH1").style.display="block";
 }
 function kcQH_two(){
	 document.getElementById("kc_zr").style.backgroundColor="#3EBB1A";
	 document.getElementById("kc_zx").style.backgroundColor="rgba(0,0,0,0)";
	 document.getElementById("kcQH2").style.display="block";
	 document.getElementById("kcQH1").style.display="none";
 }
 /*分页切换  */
 var tmp = 0;
 function kc_QhDiv1(){
	if(document.getElementById("kcQH1").style.display=="block"){
		 alert("这已经是首页哦");
	 }
	 document.getElementById("kcQH2").style.display="none";
	 document.getElementById("kcQH1").style.display="block";
	/* else{
		document.getElementById("kcQH2").style.display="none";
		document.getElementById("kcQH1").style.display="block";
	 } */
 }
 function kc_QhDiv2(){

		document.getElementById("kcQH1").style.display="none";
		if(document.getElementById("kcQH2").style.display=="block"){
			 alert("这已经是尾页哦");
		 }else{
			document.getElementById("kcQH2").style.display="block";
			document.getElementById("kcQH1").style.display="none";
		 }
	 }
</script>
</head>
<body>
	<!--头部导航栏-->
	<div id="head_nav">
		<div id="head_menu">
			<ul class="head_ul">
				<li><img src="images/logo3.png" class="head_logo" width="55" /><img
					src="images/logo_4.png" width="70" class="head_logo_1" /></li>
				<li><img src="../images/faith.png" class="head_logo1" /></li>
				<li><a href="../index.jsp" class="head_li">首页</a></li>
				<li class="head_li" id="head_li_from"><a
					href="business_system.jsp" class="head_font_size" style="color:#188eee;font-weight:bold;">课程体系</a>
					<ul class="head_nav_nav_none">
						<li><a href="yewu.html" class="head_font_size"
							class="head_nav_yw_tx" class="head_li">业务体系</a></li>
					</ul>
				</li>
				<li><a href="step_in.jsp" class="head_li">走进KLEE</a></li>
				<li><a href="time_axis.jsp" class="head_li">发展历程</a></li>
				<li><a href="html/developer.jsp" class="head_li">论坛.活动</a></li>
				<li><a href="bangzhu.jsp" class="head_li">帮助</a></li>
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
				href="l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a></span>

		</div>
	</div>
	<!--课程体系  -->

	<div class="kc_center_onr">
		<div class="kc_kc">全部课程</div>
		<ul class="kc_jingxuan_1" id="kc_jx">
			<li class="kc_lb">方向:</li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">全部</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">前端开发(1)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">后端开发(3)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">ExMobi开发(5)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">原生移动开发(2)</a></li>
		</ul>
		<ul class="kc_jingxuan_2" id="kc_jx">
			<li class="kc_lb">分类:</li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">全部</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">html5(1)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">jsp(3)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">css(5)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">ExMobi(2)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">ExMobi实战(6)</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">ExMobi扩展(6)</a></li>
		</ul>
		<ul class="kc_jingxuan_3" id="kc_jx">
			<li class="kc_lb">难度:</li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">全部</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">初级</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">中级</a></li>
			<li onmouseover="backgd(this)" onmouseout="backgdC(this)"><a href="javascript:alert('正在建设')">高级</a></li>
			
		</ul>
		<div class="kc_rm">
			<span id="kc_zx" onClick="kcQH_one()"><a href="javascript:void(0)">最新</a></span>
			<span id="kc_zr" onClick="kcQH_two()"><a href="javascript:void(0)">热门</a></span>
		</div>
	</div>
	<!--课程内容1  -->
	<div class="kc_nr" id="kcQH1" style="display:block;">
		<ul>
			<!-- 一区 -->
			<li class="zx_yi" id="zx_sum">
				<div class="kc_box"><img src="images/a1.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<!-- 二区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/a2.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<!-- 三区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/a3.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<!-- 四区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/a4.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<li class="hr"></li>
			<!-- 五区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/a5.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<!-- 六区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/a6.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<!-- 七区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/a7.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<!-- 八区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/a8.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="MongoDB集群之分片技术应用及其项目实战">MongoDB集群之分片技术应用及其项目实战</a></div>
				<div class="zx_beizhu">深入接触MongoDB集群分片技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">100人学习</span>
			</li>
			<li class="hr"></li>
		</ul>
	</div>
	<!--课程内容2  -->
	<div class="kc_nr" id="kcQH2" style="display:none;">
		<ul>
			<!-- 一区 -->
			<li class="zx_yi" id="zx_sum">
				<div class="kc_box"><img src="images/g10.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<!-- 二区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/g9.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<!-- 三区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/g8.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<!-- 四区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/g7.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<li class="hr"></li>
			<!-- 五区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/g6.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<!-- 六区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/g5.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<!-- 七区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/g4.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<!-- 八区 -->
			<li id="zx_sum">
				<div class="kc_box"><img src="images/g3.jpg" class="zx_img" onmouseover="imgFD(this)" onmouseout="imgSX(this)"></div>
				<div class="zx_zhuti"><a href="javascript:alert('等会')" title="【精品课】实战、PS入门到精通技术">【精品课】实战、PS入门到精通技术,真正的零基础课程</a></div>
				<div class="zx_beizhu" >PS入门到精通技术</div>
				<span class="zx_xxcd">未学习</span>
				<span class="zx_xxrs"><img src="images/ren.png" class="zx_rentou">200人学习</span>
			</li>
			<li class="hr"></li>
		</ul>
	</div>
	<div class="kc_qiehuan">
		<div class="kc_shuzi">
			<ul class=kc_shuzi_ul>
				<li onclick="kc_QhDiv1()">上一页</li>
				<li onclick="kc_QhDiv2()">下一页</li>
				<!--<li><a href="javascript:alert('等会')" >首页</a></li>
				 <li><a href="javascript:alert('等会')" >&nbsp;1&nbsp;</a></li>
				<li><a href="javascript:alert('等会')" >&nbsp;2&nbsp;</a></li>
				<li><a href="javascript:alert('等会')" >&nbsp;3&nbsp;</a></li> 
				<li><a href="javascript:alert('等会')" >尾页</a></li>-->
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
						<table cellspacing="0" cellpadding="10" border="0"  Width="100%" class="bottom_lianxi">
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
