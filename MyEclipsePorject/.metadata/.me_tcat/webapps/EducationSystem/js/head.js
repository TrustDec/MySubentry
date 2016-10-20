//导航栏账号退出
function exit() {
	var form = document.myform;
	form.action = "ExitServlet";
	form.method = "post";
	form.submit();
}
// 导航栏文字初始
window.onload = function() {
	var head_menu = document.getElementById("head_menu");
	head_menu.style.transform = "translateY(0px)";
	head_menu.style.transition = "transform 1s ease-out 100ms";
	var search1 = document.getElementById("search");
	search1.style.transform = "translateX(0px)";
	search1.style.transition = "transform 1s ease-out 100ms";
	var nav_nav = document.getElementById("nav_nav");
	nav_nav.style.transform = "translateX(0px)";
	nav_nav.style.transition = "transform 1s ease-out 100ms";
	var outer = document.getElementById("outer");
	outer.style.transform = "translateX(0px)";
	outer.style.transition = "transform 1s ease-out 100ms";
	var nav_kuaiJ = document.getElementById("nav_kuaiJ");
	nav_kuaiJ.style.transform = "translateX(0px)";
	nav_kuaiJ.style.transition = "transform 1s ease-out 100ms";
	var kl = document.getElementById("font_cy");
	kl.style.transform = "translateY(0px)";
	kl.style.transition = "transform 3s ease-out";
	// 导航栏尾部渐变
	var nav_bottom = document.getElementById("nav_bottom");
	nav_bottom.style.background = "rgba(138,92,83,0.8)";
	nav_bottom.style.transition = "background 6s ease-out 300ms";
};
// 登陆界面
// 登录框
function entry() {
	var entry_box = document.getElementById("entry_box");
	entry_box.style.display = "block";
	// entry_box.style.transition="background 3s ease 200ms";
	entry_box.style.background = "rgba(11,11,11,0.9)";
}
// 用户名
function entryOne() {
	var entry_span1 = document.getElementById("entry_span1");
	entry_span1.style.transition = "transform 2s ease-out 300ms,color 2s ease-out 300ms";
	entry_span1.style.transform = "translateY(-35px)";
	entry_span1.style.color = "#3A97F3";
}
function entry_one1() {
	var entry_span2 = document.getElementById("entry_span2");
	entry_span2.style.transition = "transform 2s ease-out 300ms,color 2s ease-out 300ms";
	entry_span2.style.transform = "translateY(-35px)";
	entry_span2.style.color = "#3A97F3";
}

// 用户判断
function text() {
	// denglu_a=true;
	var yz = document.getElementById("entry_one").value;
	var sp = document.getElementById("entry_span3");
	var sp1 = document.getElementById("entry_span3_1");
	if (yz.length === 0) {
		if (sp.style.display === "block") {
			sp1.style.display = "block";
			sp.style.display = "none";
		} else {
			sp1.style.display = "block";
		}
		return false;
	} else if (yz.length !== 0) {
		if (sp1.style.display === "block") {
			sp1.style.display = "none";
			sp.style.display = "block";
		} else {
			sp.style.display = "block";
		}
		return true;
	}
}

// 密码判断
function text1() {
	var mima = document.getElementById("entry_two").value;
	var suru = document.getElementById("entry_span4");
	var suru1 = document.getElementById("entry_span4_1");
	if (mima.length === 0) {
		if (suru.style.display === "block") {
			suru1.style.display = "block";
			suru.style.display = "none";
		} else {
			suru1.style.display = "block";
		}
		return false;
	} else if (mima.length !== 0) {
		if (suru1.style.display === "block") {
			suru1.style.display = "none";
			suru.style.display = "block";
		} else {
			suru.style.display = "block";
		}
		return true;
	}
}

/* 登录判断 */
function decision() {

	if (text() && text1()) {
		alert("登陆成功");
		var form = document.myform;
		form.action = "LoginServlet";
		form.method = "post";
		form.submit();
	} else {

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

// 师资力量
function chosen(a) {
	var chosen_nav = document.getElementById("chosen_nav");
	var chosen_nav1 = document.getElementById("chosen_nav1");
	var chosen_nav2 = document.getElementById("chosen_nav2");
	var chosen_nav3 = document.getElementById("chosen_nav3");
	if (a === 1) {
		chosen_nav.style.backgroundColor = "#6EB88C";
		chosen_nav.style.color = "#F3F3F3";
		chosen_nav1.style.backgroundColor = "";
		chosen_nav1.style.color = "#999";
	}
	if (a === 2) {
		chosen_nav1.style.backgroundColor = "#6EB88C";
		chosen_nav1.style.color = "#F3F3F3";
		chosen_nav.style.backgroundColor = "";
		chosen_nav.style.color = "#999";
	}
	if (a === 3) {
		chosen_nav2.style.backgroundColor = "#6EB88C";
		chosen_nav2.style.color = "#F3F3F3";
		chosen_nav3.style.backgroundColor = "";
		chosen_nav3.style.color = "#999";
	}
	if (a === 4) {
		chosen_nav3.style.backgroundColor = "#6EB88C";
		chosen_nav3.style.color = "#F3F3F3";
		chosen_nav2.style.backgroundColor = "";
		chosen_nav2.style.color = "#999";
	}
	alert("紧急建设中");
}
// 邮箱验证
function youxiang(obj) {
	var a = document.getElementById("youxiang_");
	var reg = /^\w+@[0-9a-zA-Z]+.com$/;
	if (reg.test(obj) == true && obj != "") {
		a.style.display = "none";
	} else {

		a.style.display = "inline-block";
		a.style.transform = "translateX(0px)";
		a.style.transition = "transform 500ms ease-out";

	}
}
function liuyan() {
	var f = document.getElementsByName("kong");
	var tru = true;
	for (var i = 0; i < f.length; i++) {

		if (f[i].value == "") {
			tru = false;
		} else {

			tru = true;
		}

	}
	var a = document.getElementById("youxiang_");
	if (tru) {
		a.style.display = "none";
		alert("感谢你建议,我们稍后会回复你哒");
	} else {
		a.innerHTML="";
		a.innerHTML="请正确填写内容";
		a.style.display = "inline-block";
		a.style.transform = "translateX(0px)";
		a.style.transition = "transform 500ms ease-out";
	}

}