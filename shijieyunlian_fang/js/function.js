var i=1;
function log()
{
	var img=document.getElementById('Slide_img');
	img.src="images/slide"+i+".gif";
	i==3?i=1:i++;
	setTimeout("log()",2000);
}