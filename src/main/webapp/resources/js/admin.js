/**
 * 
 */

$(document).ready(function(){
	//adminHeader slide
	$("#gnbList>li").click(function() {
    	if($(this).next(".lnb-list").css("display")=="none"){
    		$(this).next(".lnb-list").slideDown(250);
    		$(this).find(".fa-chevron-right").css("transform","rotate(90deg)");
    		
    		$(".lnb-list").not($(this).next(".lnb-list")).slideUp(250);
			$(".fa-chevron-right").not($(this).find(".fa-chevron-right")).css("transform","rotate(0deg)");
    	}else {
    		$(this).next(".lnb-list").slideUp(250);
    		$(this).find(".fa-chevron-right").css("transform","rotate(0deg)");
    	}
    });
	
	//checkbox All check
	$("#Allcheck").click(function(){
		if($(this).is(":checked")) $("input[type=checkbox]").prop("checked", true);
		else $("input[type=checkbox]").prop("checked", false);
	});
});