/*引入jquery*/
document.write('<script type="text/javascript" src="../../lib/jquery-1.11.3.min.js" ></script>');
/*引入bootstrap css 及js文件*/
//document.write('<link rel="stylesheet" href="../../lib/bootstrap/css/bootstrap.min.css" />');
document.write('<script type="text/javascript" src="../../lib/bootstrap/js/bootstrap.min.js" ></script>');
/*引入syntaxhighlighter代码高亮，css及js文件*/
document.write('<link rel="stylesheet" href="../../lib/syntaxhighlighter/styles/shCoreEclipse.css" />');
document.write('<script type="text/javascript" src="../../lib/syntaxhighlighter/scripts/shCore.js"></script>');
document.write('<script type="text/javascript" src="../../lib/syntaxhighlighter/scripts/shBrushJava.js"></script>');
document.write('<script type="text/javascript" src="../../lib/syntaxhighlighter/scripts/shBrushJScript.js"></script>');
document.write('<script type="text/javascript" src="../../lib/syntaxhighlighter/scripts/shBrushSql.js"></script>');
document.write('<script type="text/javascript" src="../../lib/syntaxhighlighter/scripts/shBrushXml.js"></script>');
document.write('<script type="text/javascript" src="../../lib/syntaxhighlighter/scripts/shBrushCss.js"></script>');
/*渲染代码区域*/
document.write('<script type="text/javascript">SyntaxHighlighter.all();</script>');
/*设置页面左边距*/
document.getElementById("bodyId").style.marginLeft="15px";
document.getElementById("bodyId").style.marginRight="30px";
document.getElementById("bodyId").style.marginBottom="100px";
