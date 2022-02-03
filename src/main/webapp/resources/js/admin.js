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
	
	//insert model
	$("#writeBtn").click(function(){
		$("#insertModel").fadeIn();
		//$("body").css("overflow", "hidden");
	});
	$("#insertModel .model-close").click(function(){
		$("#insertModel").fadeOut();
		//$("body").css("overflow", "auto");
	});
	$(document).mouseup(function (e) {
		// 팝업 아이디
		var insertModel = $("#insertModel");
		var container = $(".model-area");

		if (container.has(e.target).length === 0){
			insertModel.fadeOut();
		}
	});
	
	//modify model
	$(".btn-modify").click(function(){
		$("#modifyModel").fadeIn();
		//$("body").css("overflow", "hidden");
	});
	$("#modifyModel .model-close").click(function(){
		$("#modifyModel").fadeOut();
		//$("body").css("overflow", "auto");
	});
	$(document).mouseup(function (e) {
		// 팝업 아이디
		var modifyModel = $("#modifyModel");
		var container = $(".model-area");

		if (container.has(e.target).length === 0){
			modifyModel.fadeOut();
		}
	});
	
	$(".ellipsis").mouseover(function(){
		$(this).next(".box-hovor").fadeIn(150);
	});
	$(".ellipsis").mouseleave(function(){
		$(this).next(".box-hovor").fadeOut(150);
	});
	
	//btn 속성 보여지기
	$(".btn-style-icon").mouseover(function(){
		$(this).next(".detail").fadeIn(150);
	});
	$(".btn-style-icon").mouseleave(function(){
		$(this).next(".detail").fadeOut(150);
	});
});