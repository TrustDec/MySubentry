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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<title>注册界面</title>
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico" />
<link href="css/head_nav.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/entry.js"></script>

<style>

#Zc_div {
	
	width: 1200px;
	height: 800px;
	
	margin:0px auto;
}

.Zc_table {
	
	width: 820px;
	height: 750px;
	margin:0px auto;
}

.Zc_table td em {
	color: #F00;
	font-size: 13px;
}

.Zc_td {
	text-align: right;
	width: 120px;
}

#Zc_td_yz {
	border: #999 solid 1px;
	text-align: center;
}

.Zc_td1 {
	text-align: right;
	width: 150px;
}

.Zc_td2 {
	width: 400px;
	font-size: 13px;
	color: #666;
}
</style>
<script type="text/javascript">
/*年月日*/
var Zc_y=1979;  
function Zc_year()
{for(var i=0;i<=40;i++){
	Zc_y+=1;
	Zc_sel=document.getElementById("Zc_div_year");
    var Zc_op=document.createElement("option");
	var Zc_txt=document.createTextNode(Zc_y);
	   Zc_op.appendChild(Zc_txt);
	   Zc_sel.appendChild(Zc_op);
      }
	  }
var Zc_m=0; 
function Zc_month()
{for(var i=0;i<12;i++){
	Zc_m+=1;
	Zc_sel1=document.getElementById("Zc_div_month");
    var Zc_op1=document.createElement("option");
	var Zc_txt1=document.createTextNode(Zc_m);
	   Zc_op1.appendChild(Zc_txt1);
	   Zc_sel1.appendChild(Zc_op1);
      }
		} 
var Zc_dayArr=[["--请选择日期--"],
               ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],   
               ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30"], 
		       ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"] 
		  
          ]; 
function mothchange(){
		    document.getElementById("Zc_div_day").length=0;
			var monthValue=document.getElementById("Zc_div_month").value;
			var Zc_day= document.getElementById("Zc_div_day");
			    Zc_day.style.width="110px";
			for(var i=0;i<Zc_dayArr[monthValue].length;i++){
				var Zc_op2= document.createElement("option");
				var Zc_txt2= document.createTextNode(Zc_dayArr[monthValue][i]);
				Zc_op2.appendChild(Zc_txt2);
				Zc_day.appendChild(Zc_op2);
				
				}
		  }

function checkymr(){
	var b=false;
	var Zc_select=document.getElementsByName("Zc_select")[0].value;
	var Zc_select1=document.getElementsByName("Zc_select")[1].value;
	var Zc_select2=document.getElementsByName("Zc_select")[2].value;
	if(Zc_select>=1980&&Zc_select2>=1&&Zc_select3>=1)
	{return b=true;}
	else{return b;}}
	
///*用户名验证*/
function checkuser(Zc_userNode){
	var b=false;
	var reg=/^[a-z_]\w{5,15}$/;
	var divNode=document.getElementById("Zc_td2_div1");
	if(reg.test(Zc_userNode.value)){
		divNode.innerHTML="用户名正确".fontcolor("green");
		return b=true;
		}
		else{
		divNode.innerHTML="用户名格式错误--用户名为必须以非数字开头的6-16位组成(可包含a-z、0-9和_下划线)".fontcolor("red");
		Zc_userNode.focus();
		Zc_userNode.value="";
		return b;
		}
	}
///*密码及确认密码验证*/
function checkpassw(Zc_passwNode){
	var b=false;
	var reg=/^[a-z0-9]{6,12}$/;
	var divNode=document.getElementById("Zc_td2_div2");
	if(reg.test(Zc_passwNode.value)){
		divNode.innerHTML="密码正确".fontcolor("green");
		return b=true;
		}
		else{
		divNode.innerHTML="密码格式错误--密码必须为6-12位组成(可包含a-z和0-9)".fontcolor("red");
		Zc_passwNode.focus();
		Zc_passwNode.value="";
		return b;
		}
	}

function checkrepassw(Zc_repasswNode){
	var b=false;
	var value1=Zc_repasswNode.value;
	var value2=document.getElementsByName("Zc_passw")[0].value;
	var divNode=document.getElementById("Zc_td2_div3");
	if(value1==value2&&value2!=""){
		divNode.innerHTML="密码正确".fontcolor("green");
	return b=true;
	      }
	else{
		divNode.innerHTML="两次密码不一致--密码必须为6-12位组成(可包含a-z和0-9)".fontcolor("red");
		Zc_repasswNode.focus();
		Zc_repasswNode.value="";
	return b;
		}
	}
///*邮箱验证*/
function checkmail(Zc_mailNode){
	var reg=/^\w+@\w+(\.\w+)+$/;
    	var divNode=document.getElementById("Zc_td2_div4");
	if(reg.test(Zc_mailNode.value)){
		divNode.innerHTML="邮箱正确".fontcolor("green");
		return b=true;
		}
		else{
		divNode.innerHTML="邮箱格式错误".fontcolor("red");
		Zc_mailNode.focus();
		Zc_mailNode.value="";
		return b;
		}
	}
	
/*动态验证码*/
function Zc_yanzhen(){
      Zc_str="";
 var Zc_img="";
var Zc_arrs=['天','明','日','科','技','新','更','好','创','会'];
for(var i=0;i<4;i++){
	var n=Math.floor(Math.random()*Zc_arrs.length);
    Zc_str=Zc_str+Zc_arrs[n];
	Zc_img=Zc_img+"<img src='html/yw_img/checkcode/"+n+".gif' width='20' height='30'> ";
	document.getElementById("Zc_td_yz").innerHTML=Zc_img;
}
}

function checkyz(Zc_yzNode){
    var b=false;
	var reg=/^\W{4}$/;
	var Zc_yzvalue=Zc_yzNode.value;
	var divNode=document.getElementById("Zc_td2_div5");
	if(reg.test(Zc_yzvalue)==true&&Zc_yzvalue==Zc_str){
		divNode.innerHTML="验证码正确".fontcolor("green");
		return b=true;
		}
		else{
		divNode.innerHTML="验证码错误".fontcolor("red");
		Zc_yzNode.focus();
		Zc_yzNode.value="";
		return b;
		}
	}
/*验证协议*/
function checkxy(){
	var b=false;
	var Zc_xy=document.getElementsByName("Zc_xy")[0].checked;
	if(Zc_xy){
		return b=true;}
		else{return b;}
}
///*表单验证*/
function checkform(formNode){
	with(formNode)
	{if(checkuser(Zc_user)&&checkpassw(Zc_passw)&&checkrepassw(Zc_repassw)
	&&checkmail(Zc_mail)&&checkyz(Zc_yz)&&checkxy()&&checkymr())
		{event.returnValue=true;
		}
		else{event.returnValue=false;}
}
}
</script>
</head>
<body onload="Zc_yanzhen(),Zc_year(),Zc_month(),Zc_day()" style="background:#fff;">
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
				<li><a href="html/bangzhu.jsp" class="head_li">帮助</a></li>
				<%
					String name = (String) session.getAttribute("name");
					if (name == null) {
				%>
				<li><a href="html/l_zhuce.jsp" class="DL_zc" style="color:#09C;font-weight:bold;">注册</a></li>
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
	
	<div id="Zc_div">
		<form name="Zc_form" onsubmit="checkform(this)" action="yewu.html"
			method="post">
			<table class="Zc_table" cellpadding="5" cellspacing="0" border="0">
     			<tr>
       				<td class="Zc_td">用户名:</td>
       				<td class="Zc_td1">
               			<input type="text" name="Zc_user" size="25"
						onblur="checkuser(this)">
					</td>
                    <td colspan="4" class="Zc_td2"><div
							id="Zc_td2_div1">
							<em>(*必填项)</em>用户名为必须以非数字开头的6-16位组成(可包含a-z、0-9和_下划线)</div></td>
     			</tr>
     			<tr>
       				<td class="Zc_td">密码:</td>
       				<td><input type="password" name="Zc_passw" size="25"
						maxlength="16" onblur="checkpassw(this)"></td>
       				<td colspan="4" class="Zc_td2"><div id="Zc_td2_div2">
							<em>(*必填项)</em>密码必须为6-12位组成(可包含a-z和0-9)</div></td>
     			</tr>
      			<tr>
       				<td class="Zc_td">再次输入密码:</td>
       				<td><input type="password" name="Zc_repassw" size="25"
						maxlength="16" onblur="checkrepassw(this)"></td>
       				<td colspan="4" class="Zc_td2"><div id="Zc_td2_div3">
							<em>(*必填项)</em>密码必须为6-12位组成(可包含a-z和0-9)</div></td>
     			</tr>
      			<tr>
                    <td class="Zc_td">性别:</td>
                    <td colspan="5">
                       <input type="radio" name="Zc_xb" value="男"
						checked="checked">&nbsp;男
                       <input type="radio" name="Zc_xb" value="女">&nbsp;女    
      			 	</td>
      			</tr>
          		<tr> 
      				<td class="Zc_td">出生日期:</td>
      				<td colspan="4" id="Zc_div_td1">
          				<select id="Zc_div_year" name="Zc_select"
						onchange="checkymr()">
          					<option value="0">--请选择年份--</option>
          				</select>年
      					<select id="Zc_div_month" name="Zc_select"
						onchange="checkymr(),mothchange()">
            				<option value="0">--请选择月份--</option>
         				</select>月
         				<select id="Zc_div_day" name="Zc_select"
						onchange="checkymr()">
            					<option value="0">--请选择日期--</option>
         				</select>日
         			</td>
                    <td><em>(*必填项)</em></td>
       			</tr>
                <tr>
                     <td class="Zc_td">邮箱:</td>
                     <td><input type="mail" name="Zc_mail"
						onblur="checkmail(this)" /></td>
                     <td colspan="4" class="Zc_td2"><div
							id="Zc_td2_div4">
							<em>(*必填项)</em>例如:123@163.com</div></td>
      			</tr>
      			<tr>
      				<td class="Zc_td">验证码:</td>
      				<td><input type="text" name="Zc_yz"
						onblur="checkyz(this)" /></td>
      				<td colspan="2"><div id="Zc_td_yz"></div></td>
      				<td width="70px"><input type="button" value="看不清"
						onclick="Zc_yanzhen()" /></td>
      			    <td width="230px;"><div id="Zc_td2_div5">
							<em>(*必填项)</em>
						</div></td>
                </tr>
      			<tr>
      				<td class="Zc_td">上传头像:</td>
      				<td colspan="5"><input type="file" /></td>
      			</tr>
       			<tr>
      				<td class="Zc_td">爱好:</td>
                    <td colspan="5">
                       <input type="checkbox" name="Zc_ah" value="运动"
						checked="checked">运动
                       <input type="checkbox" name="Zc_ah" value="聊天">聊天
                       <input type="checkbox" name="Zc_ah" value="玩游戏">玩游戏
                       <input type="checkbox" name="Zc_ah" value="看电影">看电影
      				</td>
     			</tr>
      			<tr>
       				<td class="Zc_td">服务协议:</td>
       				<td colspan="5">
           				<textarea name="fwxy" value="3" cols="70" rows="5"
							readonly="readonly">
本服务协议双方为本机构内部及其外部用户，本服务协议具有合同效力。
本机构的权利和义务
1.本教育机构有义务在现有技术上维护整个网上互动平台的正常运行，并努力提升和改进技术，使用户网上访问活动的顺利。
2.对用户在注册使用本机构教育平台中所遇到的与访问或注册有关的问题及反映的情况，本教育机构应及时作出回复。
                        </textarea>
       				</td>
     			</tr>
      			<tr>
                    <td></td>
                    <td colspan="5">
                        <input type="radio" name="Zc_xy"
						checked="checked" onblur="checkxy(this)" value="同意" />同意<input
						type="radio" name="Zc_xy" />不同意  
                    </td>
      			</tr>
      			<tr>
           			<td></td>
           			<td align="center" colspan="4">
						<input type="submit"
						style="width:200px; height:50px; font-size:24px;"
						value="提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交">
          			</td>
           		</tr> 
  			</table>
  		</form> 

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

	</div>
</body>


</html>
