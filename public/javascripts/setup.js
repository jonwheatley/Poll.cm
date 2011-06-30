$(document).ready(function() {
	
	var resizes = 0;
	$('textarea').autoResize({
	    onResize : function() {
	        $(this).css({opacity:0.8});
/*			resizes++;
			if (resizes !== 1)
			{
				oldPad = $("#mark").css("padding-top").replace("px", "");
				newQLength = $(".questionbox").val().length;
				if (newQLength > lastQLength)
				{
					newPad = parseInt(oldPad) + 62;
				} else {
					if (newQLength < 5)
					{
						newPad = 0;
						$("#mark").css("marginTop","0px");
						$(".questionbox").css("height","70px");
					} else
					{
						newPad = parseInt(oldPad) - 62;		
					}
				}
				$("#mark").css("padding-top",newPad+"px");
				lastQLength = $(".questionbox").val().length;
			} else
			{
				lastQLength = $(".questionbox").val().length;
			}
*/
	    },
	    animateCallback : function() {
	        $(this).css({opacity:1});
	    },
	    animateDuration : 200,
	    extraSpace : 0,
	});
	
	$(".optionbox").focus(function(){
		$(this).css("background-image","url(images/pixel.gif)");
	});
	
	$(".optionbox").blur(function(){
		if ($(this).val().length < 1)
		{
			$(this).css("background-image","url(images/type.gif)");	
		}
	});
	
	$("input:checkbox, input:radio, input:submit").uniform();

});