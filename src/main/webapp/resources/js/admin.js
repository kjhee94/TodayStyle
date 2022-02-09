/**
 * 
 */

$(document).ready(function(){

	//탈퇴버튼 아이콘
//	var $test = $(".btn-style-icon");
//	
//	$.each($test,function(index,item){
//		if($(item).attr("endyn")=='N'){
//			$(item).children('i').addClass("fa-trash");
//			
//		}else if($(item).attr("endyn")=='Y'){
//			$(item).children('i').addClass("fa-trash-restore");
//		}
//	});
	
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
	
	//관리자 제외
	$("input[value=admin]").parent().siblings().last().empty();
	$("input[value=admin]").remove();
	$("input[value=admin]").click(function(){
		
		
	})
	
	//checkbox All check
	$("#Allcheck").click(function(){
		if($(this).is(":checked")) {
			$("input[type=checkbox]").not("input[disabled]").prop("checked", true);
		}
		else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
	//개별탈퇴처리 ajax
	$(".btn-one-withdraw").click(function() {
		
		var userId = $(this).attr("user");
		var endYN = $(this).attr("endyn");
		var $this = $(this);
		
		$.ajax({
			url:"/admin/memberOneEndYNChange.do",
			data:{"userId":userId,"endYN":endYN},
			type:"post",
			success: function(result){
				if(result!=false){
					$this.attr("endyn",result);
					if(endYN=='N') {
						$this.children("i").removeClass("fa-trash");
						$this.children("i").addClass("fa-trash-restore");
						$this.parent().siblings().css("color","#C8C8C8");
						$this.parent().siblings().first().children().attr("disabled", true);
						$this.parent().siblings().first().children().prop("checked", false);
					}else if(endYN=='Y') {
						$this.children("i").removeClass("fa-trash-restore");
						$this.children("i").addClass("fa-trash");
						$this.parent().siblings().css("color","#707070");
						$this.parent().siblings().first().children().attr("disabled", false);
						$this.parent().siblings().first().children().prop("checked", false);
					}
				}
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		})
	})

	//단체 탈퇴 처리 ajax
	$("#checkedWithDrawBtn").click(function() {
		var userId = "";
		
		$("input[name='userId']:checked").each(function() {
			userId = userId+$(this).val()+",";
		})
		
		//맨끝 콤마 지우기
		userId = userId.substring(0,userId.lastIndexOf(",")); 
		
		if(userId == ""){
			alert("탈퇴할 대상을 선택하세요.");
			return false;
		}
		
		if(confirm(userId+" 회원을\n탈퇴처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/memberCheckedEndYNChange.do",
				data:{"userId":userId},
				type:"post",
				success: function(result){
					if(result!=false){
						alert("탈퇴처리가 완료되었습니다.");
						location.reload();
					}
				},
				error: function(){
					console.log("ajax 통신 실패");
				}
			})
		}else {
			return false;
		}
	});
	
	//검색시 필터 선택 안함
	$(".fa-search").click(function() {
		if($("select option:first-child").is(":selected")){
			alert("검색 필터를 선택해주세요");
			return false;
		}
	});
	
	
});