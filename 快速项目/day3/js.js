function quan(){
	var inp=document.getElementsByTagName("input");
	for (var i = 0; i < inp.length; i++) {
		inp[i].checked=true;
	}
}
function test2(){
	var inp=document.getElementsByTagName("input");
	for (var i = 0; i < inp.length; i++) {
		if (inp[i].checked) {
			inp[i].checked=false;				
		}else{
			inp[i].checked=true;
		}
	}
}
// 选项卡
 window.onload=function(){
	var box=document.getElementsByTagName('div');
	var p=document.getElementsByTagName('p');
	
	for (var i = 0; i < box.length; i++) {
		box[i].className="box";			
		box[i].num=i;		
			box[i].onclick=function(){
				for (var j = 0; j < box.length; j++) {
					box[j].className="box";
					p[j].style.display="none";
				}
				this.className="box1";
				p[this.num].style.display="block";
			}
	}
			
}


