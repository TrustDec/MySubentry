//登录框
function entry(){
	var entry_box=document.getElementById("entry_box");
	entry_box.style.display="block";
	//entry_box.style.transition="background 3s ease 200ms";
	entry_box.style.background="rgba(11,11,11,0.9)";
	}
//用户名
function entryOne(){	
	var entry_span1=document.getElementById("entry_span1");
	entry_span1.style.transition="transform 2s ease-out 300ms,color 2s ease-out 300ms";
	entry_span1.style.transform="translateY(-35px)";
	entry_span1.style.color="#3A97F3";
	}
function entry_one1(){
	var entry_span2=document.getElementById("entry_span2");
	entry_span2.style.transition="transform 2s ease-out 300ms,color 2s ease-out 300ms";
	entry_span2.style.transform="translateY(-35px)";
	entry_span2.style.color="#3A97F3";
	}

//用户判断
function text(){
		   //denglu_a=true;
		   var yz=document.getElementById("entry_one").value;
	      var sp=document.getElementById("entry_span3");
		  var sp1=document.getElementById("entry_span3_1");
	    if(yz.length===0){
			if(sp.style.display==="block"){
				sp1.style.display="block";
				sp.style.display="none";
				}else{
				sp1.style.display="block";
				}
			return false;
		   }
	   else if(yz.length!==0){
		   	if(sp1.style.display==="block"){
				sp1.style.display="none";
				sp.style.display="block";
				}else{
				sp.style.display="block";
				}
		   	return true;
		   }
	   }
	   
//密码判断
function text1(){
	var mima=document.getElementById("entry_two").value;
	var suru=document.getElementById("entry_span4");
	var suru1=document.getElementById("entry_span4_1");
	if(mima.length===0){
		if(suru.style.display==="block"){
				suru1.style.display="block";
				suru.style.display="none";
				}else{
				suru1.style.display="block";
				}
		return false;
		}else if(mima.length!==0){
		   	if(suru1.style.display==="block"){
				suru1.style.display="none";
				suru.style.display="block";
				}else{
				suru.style.display="block";
				}
		  return true;
			}
}

/*登录判断*/
function decision(){
	
	if(text()&&text1()){
		alert("登陆成功");
		var form = document.myform;
		form.action="LoginServlet";
		form.method="post";
		form.submit();
		}else{
			
		alert("请输入正确的用户名及密码");	
		return true;
			}
	
	var yw_Img = new Array("yw_img/1.gif", "yw_img/2.gif", "yw_img/3.gif",
			"yw_img/4.gif", "yw_img/5.gif", "yw_img/6.gif");
	var Num = 0;
	function yw_start() {
		Num = (Num > 5) ? (Num = 0) : Num;
		yw_going(Num);
		Num++;
		yw_time = window.setTimeout("yw_start()", 1500);
	}
	function yw_going(x) {
		yw_div_img.src = yw_Img[x];

	}
	function yw_stop1() {
		window.clearTimeout(yw_time);
	}
	function yw_stop2(num1) {
		Num = num1;
		yw_going(Num);
		yw_stop1();
		document.getElementById("yw_div1_" + parseFloat(num1 + 1)).style.cursor = "wait";
	}

	function yw_delay(numy) {
		document.getElementById("yw_div" + numy).style.display = "block";
	}
	function yw_delay1(numy) {
		document.getElementById("yw_div" + numy).style.display = "none";
	}

	}