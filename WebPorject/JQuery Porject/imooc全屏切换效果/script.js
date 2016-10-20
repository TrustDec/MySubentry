
(function(){
	/** 闭包作用
		* --避免全局依赖
		* --避免第三方破坏
		* --兼容JQuery操作符$合JQuery
	*/ 
});
// 类组件的开发
// 即给JQuery命名空间下添加新的全局函数,也成为静态方法
jQuery.myPlugin=function(){}
// 例如:$Ajax(),$.extend();
// 对象级别组件开发
//记挂在JQuery原型下的方法,这样通过选择器的jQuery对象实例也能共享方法,也称为动态方法
$.fn.myPlugin=funciton(){}
//这里$.fn===$.prototype
//接下来主要采用动态方法实现效果
//链式调用
	//$("div").next().addClass()...
/*单例模式*/
$.fn.myPlugin=funciton(){
	var me=$(this),
	instance=me.data("myPlugin");
	if (!instance) {
		me.data("myPlugin",(instance=new myPlugin()));
	}
}
//代码说明
	//如果实例存在则不再重新创建实例
	//利用data()来存放插件对象的实例
/**
	*实例开发

*/
(funciton($){
	
})(jQuery);