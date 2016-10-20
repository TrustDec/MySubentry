/**
*date from:2016.4.13
*performer:sm
*/

var timer=null;	
var alpha=30;
var fast=20;	

//get css  inline style ;
function getStyle(obj,attribute){
	if(obj.currentStyle){
		// IE5+
		return obj.currentStyle[attribute];
	}else{
		// FF/Chrome/Open
		return getComputedStyle(obj,false)[attribute];
	}
}
// 浏览器左边边框显示与隐藏
function slideLeft(juli){
	var obj=document.getElementById("box");
	clearInterval(timer);
	timer=setInterval(function(){
		obj.offsetLeft==juli?clearInterval(timer):obj.style.left=obj.offsetLeft+(juli>=0?2:-2)+"px";
	},2);
}
// 匀速淡入淡出
function InOut(num){
	clearInterval(timer);
	timer=setInterval(function(){
		alpha==num?clearInterval(timer):alpha+=alpha<num?5:-5,box.style.filter="alpha(opacity:"+alpha+")",box.style.opacity=alpha/100;
	},fast);	
}
// 获取className,兼容所有浏览器;document.getElementByClassName()方法不兼容低版本浏览器
// oParent:父级元素;oClass:class name
function getClassName(oParent,oClass){
	var claName=[];
	var className=oParent.getElementsByTagName('*');
	for (var i = 0; i < className.length; i++) {
		if(className[i].className==oClass){
			claName.push(className[i]);
		}
	}
	return claName;
}
// Dom节点获取元素方法封装,及解决浏览器兼容问题
// 获取第一个子元素
function firstName(oParent){
	if (oParent.firstElementChild) {
		return oParent.firstElementChild;
	}else{
		return oParent.firstChild;
	}
}
