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
    
<title>联系我们</title>
<link type="image/x-icon" rel="shortcut icon"  href="favicon.ico"/> 
<link href="css/head_nav.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/head.js"></script>
<script type="text/javascript" src="js/entry.js"></script>

<style type="text/css">
.i{ width:100px; height:40px; display:inline-block; line-height:2px;}
.i a{color:#000;text-decoration:none;}
.t{width:300px; height:30px; border:1px solid #7F7F7F;}
.t1{width:300px; height:80px; border:1px solid #7F7F7F;}
.t2{ padding-top:5px;};

</style>
<script>
 function text(){
	   var yz=document.getElementById("ly").value;
	   sp=document.getElementById("denglu_ly");
	    if(yz==""){
		   sp.innerHTML="不能为空";
		   sp.style.color="red";
		   sp.style.fontSize="10px"
		   }
	   else if(yz!=""){
		   sp.innerHTML="可用";
		   sp.style.color="green";
		   }
	   }
	   function text1(){
	   var yz=document.getElementById("ly1").value;
	   sp=document.getElementById("denglu_ly1");
	    if(yz==""){
		   sp.innerHTML="不能为空";
		   sp.style.color="red";
		   sp.style.fontSize="10px"
		   }
	   else if(yz!=""){
		   sp.innerHTML="可用";
		   sp.style.color="green";
		   }
	   }
	   function text2(){
	   var yz=document.getElementById("ly2").value;
	   sp=document.getElementById("denglu_ly2");
	    if(yz==""){
		   sp.innerHTML="不能为空";
		   sp.style.color="red";
		   sp.style.fontSize="10px"
		   }
	   else if(yz!=""){
		   sp.innerHTML="可用";
		   sp.style.color="green";
		   }
	   }
	   function text3(){
	   var yz=document.getElementById("ly3").value;
	   sp=document.getElementById("denglu_ly3");
	    if(yz==""){
		   sp.innerHTML="不能为空";
		   sp.style.color="red";
		   sp.style.fontSize="10px"
		   }
	   else if(yz!=""){
		   sp.innerHTML="可用";
		   sp.style.color="green";
		   }
	   }
	function tijiao(){
		if(text()&&text1()&&text2()&&text3()){
			alert("提交成功");
			var from=document.from_bus;
			from.action="index.jsp";
			form.submit();
		}else{
			alert("请正确输入内容");
			
			
		}
		
	}  
</script>
</head>
<body style="background-color:rgba(26,29,32,0.5);">

<!--头部导航栏-->
<div id="head_nav">
    <div id="head_menu">
        <ul class="head_ul">
           <li><img src="images/logo3.png" class="head_logo" width="55"/><img src="images/logo_4.png" width="70" class="head_logo_1"/></li>
            <li><img src="images/faith.png" class="head_logo1"/></li>
            <li><a href="index.jsp" class="head_li">首页</a></li>
            <li><a href="html/business_system.jsp" class="head_li">业务体系</a></li>
            <li><a href="html/step_in.jsp" class="head_li">走进KLEE</a></li>
            <li><a href="html/time_axis.jsp" class="head_li">发展历程</a></li>
            <li><a href="html/developer.jsp" class="head_li">KLEE团队</a></li>
             <li><a href="html/bangzhu.jsp" class="head_li">帮助</a></li>
            <%String name = (String)session.getAttribute("name");
            if(name == null)
            {	
            	%>
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
        	<span id="entry_span1" onClick="entryOne()">请输入用户名</span><span id="entry_span3"></span><span id="entry_span3_1"></span>
            <input type="text" id="entry_one" name="username" class="entry_style" onFocus="entryOne()" onBlur="text()"/><br/><br/><br/>
        	<span id="entry_span2" onClick="entry_one1()">请输入登陆密码</span><span id="entry_span4"></span><span id="entry_span4_1"></span>
            <input type="password" id="entry_two" class="entry_style" onFocus="entry_one1()" onBlur="text1()"/><br/>
            <input type="button" value="GO>>" id="entry_submit" onClick="decision()"/>
        </div>
        <span ><a href="javascript:alert('正在全力建设')" class="entry_span_1">忘记密码&gt;&gt;</a></span>
        <span ><a href="html/l_zhuce.jsp" class="entry_span_2">注册&gt;&gt;</a></span>
        </form>
    </div>
</div>

<form onsubmit="tijiao()" name="from_bus">
<table align="center" width="500px" height="350px" cellspacing="0" cellpadding="10" border="0" style="margin-top:50px; "> 
 <tr>
   <td width="50px"  >你的姓名</td>
   <td width="300px" >
   <font color="#FF0000" size="-3">*</font>
   <input type="text" id="ly" onblur="text()" size="20px" class="t" />
   <span id="denglu_ly"></span></td>
 </tr>
 <tr>
   <td width="50px">你的电话?</td>
   <td width="300px">
   <font color="#FF0000" size="-3">*</font>
   <input type="text" size="20px" id="ly1" onblur="text1()" class="t"/>
   <span id="denglu_ly1"></span></td>
   </tr>
 <tr>
 <td width="50px">电子邮箱</td>
 <td width="300px">
 <font color="#FF0000" size="-3">*</font>
 <input type="text" id="ly2" onblur="text2()" class="t"/>
 <span id="denglu_ly2"></span></td>
   </tr>
  <tr>
   <td width="50px">留言标题?</td> 
    <td width="300px">
    <font color="#FF0000" size="-3">*</font>
    <input type="text" id="ly3" onblur="text3()" class="t"/>
    <span id="denglu_ly3"></span></td>
  </tr>
   <tr>
   <td>留言内容</td>
   <td>
   <font color="#FF0000" size="-3">*</font>
   <textarea cols="30" rows="5" class="t1"></textarea>
   </td>
 </tr>
<tr>
   <td colspan="2"> <font size="2">注意带*必须填写（请填写真实可用的联系电话，我们需要与您联系方便帮助您解决您的问题）</font></td>
</tr>
<tr>
   <td></td>
   <td><input type="submit" value="提交" class="i"/>
   	
  			<button class="i"><a href="index.jsp">返回首页 </a></button>
     
   </td>
   </tr>
 </table>
</form>

</body>
</html>