$(function(){
	$('#slides').slides({
		preload: true,
		//preloadImage: 'images/loading.gif',
		play: 2000,
		pause: 1000,
		hoverPause: true,
		animationStart: function(){
			$('.caption').animate({
				bottom:-90
			},100);
		},
		animationComplete: function(current){
		$('.caption').animate({
			bottom:0
		},200);
		}
	});
});
$('.z1').bind({
	mouseover:function(){
		clearInterval(lydia_time);
	},
	mouseout:function(){
		lydia_time=window.setInterval('function()',lydia_change_time);
	}
});

$(function(){
	$('.fl3').mouseover(function(){
		$(this).next().children('ul').show();
		$(this).next().children('ul').mouseover(function(){
				$(this).show();
			});
		$(this).next().children('ul').mouseout(function(){
				$(this).hide();
			});
		
		
	});
	$('.fl3').mouseout(function(){
		$(this).next().children('ul').hide();
	});
});