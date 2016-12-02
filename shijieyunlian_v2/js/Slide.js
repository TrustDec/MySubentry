/*导航部分*/
$(".Nav-bug-xl").hover(
	function(){		
		$(".Nav-bug-two").slideDown(500);
	},
	function()
	{
		$(".Nav-bug-two").slideUp(500);
	}
);
/*幻灯片部分*/
$(function(){
	var numpic = $('#slides li').size()-1;
	var nownow = 0;
	var inout = 0;
	var TT = 0;
	var SPEED = 3000;


	$('#slides li').eq(0).siblings('li').css({'display':'none'});


	var ulstart = '<ul id="pagination">',
		ulcontent = '',
		ulend = '</ul>';
	ADDLI();
	var pagination = $('#pagination li');
	var paginationwidth = $('#pagination').width();
	$('#pagination').css('margin-left',(0-paginationwidth))
	
	pagination.eq(0).addClass('current')
		
	function ADDLI(){
		for(var i = 0; i <= numpic; i++){
			ulcontent += '<li>' + '<a href="#">' + (i+1) + '</a>' + '</li>';
		}
		$('#slides').after(ulstart + ulcontent + ulend);	
	}

	pagination.on('click',DOTCHANGE)
	
	function DOTCHANGE(){
		
		var changenow = $(this).index();
		
		$('#slides li').eq(nownow).css('z-index','900');
		$('#slides li').eq(changenow).css({'z-index':'800'}).show();
		pagination.eq(changenow).addClass('current').siblings('li').removeClass('current');
		$('#slides li').eq(nownow).fadeOut(400,function(){$('#slides li').eq(changenow).fadeIn(500);});
		nownow = changenow;
	}
	
	pagination.mouseenter(function(){
		inout = 1;
	})
	
	pagination.mouseleave(function(){
		inout = 0;
	})
	
	function GOGO(){
		
		var NN = nownow+1;
		
		if( inout == 1 ){
			} else {
			if(nownow < numpic){
			$('#slides li').eq(nownow).css('z-index','900');
			$('#slides li').eq(NN).css({'z-index':'800'}).show();
			pagination.eq(NN).addClass('current').siblings('li').removeClass('current');
			$('#slides li').eq(nownow).fadeOut(400,function(){$('#slides li').eq(NN).fadeIn(500);});
			nownow += 1;

		}else{
			NN = 0;
			$('#slides li').eq(nownow).css('z-index','900');
			$('#slides li').eq(NN).stop(true,true).css({'z-index':'800'}).show();
			$('#slides li').eq(nownow).fadeOut(400,function(){$('#slides li').eq(0).fadeIn(500);});
			pagination.eq(NN).addClass('current').siblings('li').removeClass('current');

			nownow=0;

			}
		}
		TT = setTimeout(GOGO, SPEED);
	}
	
	TT = setTimeout(GOGO, SPEED); 

})
/* 热门投标 */

/* 内容 公司保障 */
function imgChange(obj,num)
{
	obj.src="images/img2_"+num+".png";
}
function imgChange1(obj,num)
{
	obj.src="images/img1_"+num+".png";
}
/* 合作伙伴 */
	/*var speed = 1;
                  var tab = document.getElementById("cooperation-box");
                  var tab1 = document.getElementById("cooperation-hidden");
                  var tab2 = document.getElementById("cooperation-hidden-box");
                  tab2.innerHTML = tab1.innerHTML;
                  function Marquee() {
                    if (tab2.offsetWidth - tab.scrollLeft <= 0)
                      tab.scrollLeft =0;
                    else {
                      tab.scrollLeft++;
                    }
                  }
                  //设置定时执行
                  var myTime = setInterval(Marquee, speed);
                  tab.onmouseover = function () { clearInterval(myTime); }
                  tab.onmouseout = function () { myTime = setInterval(Marquee, speed); };*/


/* 获取浏览器滚动条位置 */

/*锚链接*/

// $(".outboard_a1").mouseenter(function(){
// 	$(".outboards_box").css("display","block");
// });
// $(".outboard_a1").mouseleave(function(){
// 	$(".outboards_box").css("display","none");
// });

	
	



$(function(){
    $(".outboard_a2").click(function(){
    	
        var hr = $(this).attr("href");
        var anh = $(hr).offset().top;
        $("html,body").stop().animate({scrollTop:anh},500);
    })
})

$(".GreenHands-left").hover(function(){
	$("GreenHands-four")
},function(){
	alert(2);
});