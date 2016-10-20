Ext.onReady(function() {
var store = Ext.create('Ext.data.TreeStore', {
root: {text:"平台使用文档",expanded: true,url:"/main/homepage.htm",
children: [
{ text: "新开发模块示例",url:"example.html", leaf: true },
{ text: "app", 
	children: [
		{ text: "App",url:"app/Application.html", leaf: true },
		{ text: "message消息组件",url:"app/Message.html", leaf: true },
		{ text: "post请求（Messager）",url:"app/Messager.html", leaf: true },
		{ text: "TopMessage消息组件",url:"app/TopMessage.html", leaf: true },
		{ text: "Utils",url:"app/Utils.html", leaf: true }
] },{ text: "Layout(布局)", 
	children: [
		{ text: "BorderLayout 布局",url:"layout/BorderLayout.html", leaf: true },
		{ text: "AccrodionLayout布局",url:"layout/AccrodionLayout.html", leaf: true },
		{ text: "BoxLayout布局",url:"layout/BoxLayout.html", leaf: true },
		{ text: "CenterLayout布局",url:"layout/CenterLayout.html", leaf: true },
		{ text: "TabLayoutt布局",url:"layout/TabLayout.html", leaf: true }
] },{ text: "Form(表单)", 
	children: [
		{ text: "Form 表单",url:"form/Form.html", leaf: true },
		{ text: "OprFormWindow",url:"form/OprFormWindow.html", leaf: true },
		{ text: "field", children:[
			{ text: "TextField",url:"form/field/TextField.html", leaf: true },
			{ text: "NumberField",url:"form/field/NumberField.html", leaf: true },
			{ text: "DateField",url:"form/field/DateField.html", leaf: true },
			{ text: "DateTimeField",url:"form/field/DateTimeField.html", leaf: true },
			{ text: "TextAreaField",url:"form/field/TextAreaField.html", leaf: true },
			{ text: "PasswordField",url:"form/field/PasswordField.html", leaf: true },
			{ text: "Select下拉框",url:"form/field/List.html", leaf: true },
			{ text: "HiddenField",url:"form/field/HiddenField.html", leaf: true },
			{ text: "DisplayField",url:"form/field/DisplayField.html", leaf: true },
			{ text: "DynamicList",url:"form/field/DynamicList.html", leaf: true },
			{ text: "RadioField",url:"form/field/RadioField.html", leaf: true },
			{ text: "SliderField",url:"form/field/SliderField.html", leaf: true },
			{ text: "TagList",url:"form/field/TagList.html", leaf: true },
			{ text: "CheckboxField",url:"form/field/CheckboxField.html", leaf: true },
			{ text: "FileField",url:"form/field/FileField.html", leaf: true },
			{ text: "HtmlEditor",url:"form/field/HtmlEditor.html", leaf: true },
		]},
] },{ text: "grid(表格)", 
	children: [
		{ text: "CrudGrid 表格",url:"grid/CrudGrid.html", leaf: true },
		{ text: "普通表格",url:"grid/Grid.html", leaf: true }
] },
{ text: "window窗口", 
	children: [
		{ text: "window",url:"window/Window.html", leaf: true }
] },
{ text: "panel面板", 
	children: [
		{ text: "panel",url:"panel/Panel.html", leaf: true }
] },
{ text: "player", 
	children: [
		{ text: "player",url:"player/Player.html", leaf: true }
] },
{ text: "tree", 
	children: [
		{ text: "Tree",url:"tree/Tree.html", leaf: true },
		{ text: "CrudTree",url:"tree/CrudTree.html", leaf: true },
		{ text: "GridTree",url:"tree/GridTree.html", leaf: true }
] },
{ text: "chooser", 
	children: [
		{ text: "chooser",url:"chooser/ChooserGridWindow.html", leaf: true }
] }
]}
});

	var treePanel = Ext.create('Ext.tree.Panel', {
	    title: '导航菜单 20160418',
	    region: 'west',
	    split: true,
	    store: store,
	    collapsible: true,
//	    rootVisible: false,
		width : 230,
		listeners: { 
			itemclick: function (view, record, item, index, e, eOpts) {
				var codehtml = record.data.url;
				if (codehtml!=undefined && codehtml!=null && codehtml!='') {
					Ext.getCmp('mainCenter').update('<iframe width="100%" height="100%" src="html/'+codehtml+'"/>');
				}
			}
		}
	});
	Ext.create('Ext.container.Viewport', {
	    layout: 'border',
	    items: [treePanel, {
	        region: 'center',
	        id : 'mainCenter',
	        xtype: 'panel',
	        html:'<iframe width="100%" height="100%" src="html/main/homepage.htm"/>'
	    }]
	});
});