<!doctype html>
<html>
<head>
<meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<title>业务体</title>

<style>
#yw_divr{position:relative; width:1200px; height:1200px; border:#F00 0px solid; margin:3% 5%;position:relative;}
#yw_div1{width:550px; height:600px; border:#F00 0px solid; margin-left:320px; margin-top:100px;}
#yw_div1_1 img{width:160px; margin-top:-545px; margin-left:515px;}
#yw_div1_2 img{width:200px; margin-top:-450px; margin-left:330px;}
#yw_div1_3 img{width:160px; margin-top:-450px; margin-left:685px;}
#yw_div1_4 img{width:160px; margin-top:-250px; margin-left:352px;}
#yw_div1_5 img{width:160px; margin-top:-260px; margin-left:690px;}
#yw_div1_6 img{width:160px; margin-top:-160px; margin-left:520px;}
#yw_div1_7 img{width:190px; margin-top:-365px; margin-left:495px;}
#yw_div2 img{width:300px; margin-top:10px;}
#yw_div3 img{width:300px; margin-top:80px}
#yw_div4 img{width:300px; margin-top:150px;}
#yw_div5 img{width:300px; margin-top:150px}
#yw_div6 img{width:300px; margin-top:250px;}
#yw_div7 img{width:300px; margin-top:50px}
#yw_div2{width:300px; margin-top:-700px; margin-left:660px; display:none;}
#yw_div3{width:300px; margin-top:-680px; margin-left:830px;display:none;}
#yw_div4{width:300px; margin-top:-555px; margin-left:830px;display:none;}
#yw_div5{width:300px; margin-top:-580px; margin-left:70px; display:none;}
#yw_div6{width:300px; margin-top:-500px; margin-left:70px; display:none;}
#yw_div7{width:300px; margin-top:-200px; margin-left:250px; display:none;}
</style>
<script>
   var yw_Img=new Array("yw_img/1.gif","yw_img/2.gif","yw_img/3.gif","yw_img/4.gif","yw_img/5.gif","yw_img/6.gif");
   var Num=0;
function yw_start()
    {
	    Num=(Num>5)?(Num=0):Num;
		yw_going(Num);
	    Num++;
		yw_time=window.setTimeout("yw_start()",1500);
	}
function yw_going(x){
		 yw_div_img.src=yw_Img[x];
		
		 }
function yw_stop1(){
	window.clearTimeout(yw_time);
	}
function yw_stop2(num1){
	Num=num1;
	yw_going(Num);
	yw_stop1();
	document.getElementById("yw_div1_"+parseFloat(num1+1)).style.cursor="wait";
	} 
	
function yw_delay(numy){
  document.getElementById("yw_div"+numy).style.display="block";
			}
function yw_delay1(numy){
  document.getElementById("yw_div"+numy).style.display="none";
			}
</script>
</head>
<body style="background-color:rgba(26,29,32,0.5);">
<div id="yw_divr">
        <img src="yw_img/yw_h.jpg" />
        <div id="yw_div1">
            <img src="yw_img/1.gif" width="550px" id="yw_div_img"/>
        </div>
        <div id="yw_div1_1" onmouseover="yw_stop2(0),yw_delay(2)" onmouseout="yw_start(),yw_delay1(2)"><img src="yw_img/mingshi.gif" /></div>
        <div id="yw_div1_2" onmouseover="yw_stop2(1),yw_delay(5)" onmouseout="yw_start(),yw_delay1(5)"><img src="yw_img/kecheng.gif" /></div>
        <div id="yw_div1_3" onmouseover="yw_stop2(2),yw_delay(3)" onmouseout="yw_start(),yw_delay1(3)"><img src="yw_img/jingpin.gif" /></div>
        <div id="yw_div1_4" onmouseover="yw_stop2(3),yw_delay(6)" onmouseout="yw_start(),yw_delay1(6)"><img src="yw_img/huodong.gif" /></div>
        <div id="yw_div1_5" onmouseover="yw_stop2(4),yw_delay(4)" onmouseout="yw_start(),yw_delay1(4)"><img src="yw_img/wenda.gif" /></div>
        <div id="yw_div1_6" onmouseover="yw_stop2(5),yw_delay(7)" onmouseout="yw_start(),yw_delay1(7)"><img src="yw_img/bangzhu.gif" /></div>
        <div id="yw_div1_7" ><img src="yw_img/yewu.gif"/></div>
        <div id="yw_div2"><marquee loop="1" direction="right" behavior="slide" scrolldelay="0.2"><img src="yw_img/yw_r1.png"/></marquee></div>
        <div id="yw_div3"><marquee loop="1" direction="right" behavior="slide" scrolldelay="0.2"><img src="yw_img/yw_r2.png"/></marquee></div>
        <div id="yw_div4"><marquee loop="1" direction="right" behavior="slide" scrolldelay="0.2"><img src="yw_img/yw_r3.png"/></marquee></div>
        <div id="yw_div5"><marquee loop="1" direction="left" behavior="slide" scrolldelay="0.2"><img src="yw_img/yw_l1.png"/></marquee></div>
        <div id="yw_div6"><marquee loop="1" direction="left" behavior="slide" scrolldelay="0.2"><img src="yw_img/yw_l2.png"/></marquee></div>
        <div id="yw_div7"><marquee loop="1" direction="left" behavior="slide" scrolldelay="0.2"><img src="yw_img/yw_l3.png"/></marquee></div>
    </div>
</body>
</html>
