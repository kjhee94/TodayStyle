/**
 * 
 */

$(document).ready(function(){

	//탈퇴버튼 아이콘
	var $test = $(".btn-style-icon");
	
	$.each($test,function(index,item){
		if($(item).attr("endyn")=='N'){
			$(item).children('i').addClass("fa-trash");
			
		}else if($(item).attr("endyn")=='Y'){
			$(item).children('i').addClass("fa-trash-restore");
		}
	});
	
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

		if (insertModel.has(e.target).length === 0){
			insertModel.fadeOut();
		}
	});
	
	
	//modify model
	$(".btn-modify").click(function(){
		$(this).next(".modify-model").fadeIn();
		//$("body").css("overflow", "hidden");
	});
	$(".modify-model .model-close").click(function(){
		$(".modify-model").fadeOut();
		//$("body").css("overflow", "auto");
	});
	$(document).mouseup(function (e) {
		// 팝업 아이디
		var modifyModel = $(".modify-model");

		if (modifyModel.has(e.target).length === 0){
			modifyModel.fadeOut();
		}
	});
	
	//제목 내용 미리보기
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
	
	//checkbox All check
	$("#Allcheck").click(function(){
		if($(this).is(":checked")) {
			$("input[type=checkbox]").not("input[disabled]").prop("checked", true);
		}
		else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
	
	//submit 방지
	 $('.input-style').keydown(function() {
         if (event.keyCode == 13) {
             event.preventDefault();
         };
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
						$this.children("i").attr("class", "fas fa-trash-restore");
						$this.parent().parent().addClass("deactivate");
						$this.parent().siblings().find("input").attr("disabled", true);
						$this.parent().siblings().find("input").prop("checked", false);
					}else if(endYN=='Y') {
						$this.children("i").attr("class", "fas fa-trash");
						$this.parent().parent().removeClass("deactivate");
						$this.parent().siblings().find("input").attr("disabled", false);
						$this.parent().siblings().find("input").prop("checked", false);
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
			alert("탈퇴시킬 대상을 선택하세요.");
			return false;
		}
		
		if(confirm(userId+" 회원을\n탈퇴처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/memberCheckedEndYNChange.do",
				data:{"userId":userId},
				type:"post",
				success: function(result){
					if(result!=false){
						$("input:checked").parent().siblings().find(".fa-trash").attr("class", "fas fa-trash-restore");
						$("input:checked").parent().siblings().find(".btn-one-withdraw").attr("endYN", "Y");
						$("input:checked").parent().parent().addClass("deactivate");
						$("input:checked").attr("disabled", true);
						$("input:checked").prop("checked", false);
						
						alert("탈퇴처리가 완료되었습니다.");
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
		if($("#boxSelect select option:first-child").is(":selected")){
			alert("검색 필터를 선택해주세요");
			return false;
		}
	});
	
	$("#insertModel input[type=submit]").click(function() {
		if($("#insertModel select option:first-child").is(":selected")){
			alert("검색 필터를 선택해주세요");
			return false;
		}
	});
	
	//content 줄개행 인코딩
	var $unenter = $(".unenter");
	
	$.each($unenter,function(index,item){
		var data = $(item).text();
		data = data.replace(/<br>/gm,"\r\n");
		$(item).html(data);
	});
	
	
	//개별삭제처리 ajax(공지)
	$(".btn-one-notice-delete").click(function() {
		
		var noticeNo = $(this).attr("noticeNo");
		var endYN = $(this).attr("endyn");
		var $this = $(this);
		
		$.ajax({
			url:"/admin/noticeOneEndYNChange.do",
			data:{"noticeNo":noticeNo,"endYN":endYN},
			type:"post",
			success: function(result){
				if(result!=false){
					$this.attr("endyn",result);
					if(endYN=='N') {
						$this.children("i").attr("class", "fas fa-trash-restore");
						$this.parent().parent().addClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$this.parent().siblings().find("input").attr("disabled", true);
						$this.parent().siblings().find("input").prop("checked", false);
						$this.parent().siblings().find(".fa-pencil-alt").parent().off("click");
					}else if(endYN=='Y') {
						$this.children("i").attr("class", "fas fa-trash");
						$this.parent().parent().removeClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().addClass("box-hovor");
						$this.parent().siblings().find("input").attr("disabled", false);
						$this.parent().siblings().find("input").prop("checked", false);
						$this.parent().siblings().find(".fa-pencil-alt").parent().click(function(){
							$(this).next(".modify-model").fadeIn();
						});
					}
				}
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		})
	})
	
	//단체 삭제 처리 ajax(공지)
	$("#checkedDeleteNoticeBtn").click(function() {
		var noticeNo = "";
		
		$("input[name='noticeNo']:checked").each(function() {
			noticeNo = noticeNo+$(this).val()+",";
		})
		
		//맨끝 콤마 지우기
		noticeNo = noticeNo.substring(0,noticeNo.lastIndexOf(",")); 
		
		if(noticeNo == ""){
			alert("삭제할 대상을 선택하세요.");
			return false;
		}
		
		if(confirm("글번호 "+noticeNo+" 을(를)\n삭제처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/noticeCheckedEndYNChange.do",
				data:{"noticeNo":noticeNo},
				type:"post",
				success: function(result){
					if(result!=false){
						$("input:checked").parent().siblings().find(".fa-trash").attr("class", "fas fa-trash-restore");
						$("input:checked").parent().siblings().find(".btn-one-notice-delete").attr("endYN", "Y");
						$("input:checked").parent().parent().addClass("deactivate");
						$("input:checked").parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$("input:checked").parent().siblings().find(".ellipsis").next().css("display", "none");
						$("input:checked").parent().siblings().find(".fa-pencil-alt").parent().off("click");
						$("input:checked").attr("disabled", true);
						$("input:checked").prop("checked", false);
						
						alert("삭제가 완료되었습니다.");
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
	
	//개별 삭제 처리(faq)
	$(".btn-one-faq-delete").click(function() {
		
		var faqNo = $(this).attr("faqNo");
		var endYN = $(this).attr("endyn");
		var $this = $(this);
		
		$.ajax({
			url:"/admin/faqOneEndYNChange.do",
			data:{"faqNo":faqNo,"endYN":endYN},
			type:"post",
			success: function(result){
				if(result!=false){
					$this.attr("endyn",result);
					if(endYN=='N') {
						$this.children("i").attr("class", "fas fa-trash-restore");
						$this.parent().parent().addClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$this.parent().siblings().find("input").attr("disabled", true);
						$this.parent().siblings().find("input").prop("checked", false);
						$this.parent().siblings().find(".fa-pencil-alt").parent().off("click");
					}else if(endYN=='Y') {
						$this.children("i").attr("class", "fas fa-trash");
						$this.parent().parent().removeClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().addClass("box-hovor");
						$this.parent().siblings().find("input").attr("disabled", false);
						$this.parent().siblings().find("input").prop("checked", false);
						$this.parent().siblings().find(".fa-pencil-alt").parent().click(function(){
							$(this).next(".modify-model").fadeIn();
						});
						
					}
				}
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		})
	})
	
	//단체 삭제 처리 ajax(faq)
	$("#checkedDeleteFAQBtn").click(function() {
		var faqNo = "";
		
		$("input[name='faqNo']:checked").each(function() {
			faqNo = faqNo+$(this).val()+",";
		})
		
		//맨끝 콤마 지우기
		faqNo = faqNo.substring(0,faqNo.lastIndexOf(",")); 
		
		if(faqNo == ""){
			alert("삭제할 대상을 선택하세요.");
			return false;
		}
		
		if(confirm("글번호 "+faqNo+" 을(를)\n삭제처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/faqCheckedEndYNChange.do",
				data:{"faqNo":faqNo},
				type:"post",
				success: function(result){
					if(result!=false){
						$("input:checked").parent().siblings().find(".fa-trash").attr("class", "fas fa-trash-restore");
						$("input:checked").parent().siblings().find(".btn-one-faq-delete").attr("endYN", "Y");
						$("input:checked").parent().parent().addClass("deactivate");
						$("input:checked").parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$("input:checked").parent().siblings().find(".fa-pencil-alt").parent().off("click");
						$("input:checked").attr("disabled", true);
						$("input:checked").prop("checked", false);
						
						alert("삭제가 완료되었습니다.");
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
	
	
	//자주 묻는 질문 수정시 카테고리 설정
	var $modifySelect = $(".modify-model select");
	
	$.each($modifySelect,function(index,item){
		
		if($(item).attr("categoty")=="회원/정보"){
			$(item).children().first().prop("selected", true);
		}else if ($(item).attr("categoty")=="게시글"){
			$(item).children().first().next().prop("selected", true);
		}else if($(item).attr("categoty")=="기타"){
			$(item).children().last().prop("selected", true);
		}	
	});
	
	
	//개별 이미지 삭제(코디)
	$(".btn-one-coordi-delete").click(function(){
		
		var coordiNo = $(this).attr("coordiNo");
		var delYN = $(this).attr("delyn");
		var $this = $(this);
		
		$.ajax({
			url:"/admin/coordiOneDelYNChange.do",
			data:{"coordiNo":coordiNo,"delYN":delYN},
			type:"post",
			success: function(result){
				if(result!=false){
					$this.attr("delyn",result);
					if(delYN=='N') {
						$this.children("i").attr("class", "fas fa-trash-restore");
						$this.parent().parent().addClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$this.parent().siblings().find(".fas").parent().next().removeClass("detail");
						$this.parent().siblings().find(".far").parent().parent().removeAttr("href");
						$this.parent().siblings().find("input").attr("disabled", true);
						$this.parent().siblings().find("input").prop("checked", false);
					}else if(delYN=='Y') {
						$this.children("i").attr("class", "fas fa-trash");
						$this.parent().parent().removeClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().addClass("box-hovor");
						$this.parent().siblings().find(".fas").parent().next().addClass("detail");
						$this.parent().siblings().find(".far").parent().parent().attr("href","/admin/adminCoordiComment.do?coordiNo="+coordiNo);
						$this.parent().siblings().find("input").attr("disabled", false);
						$this.parent().siblings().find("input").prop("checked", false);
					}
				}
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		})
	})
	
	//단체 삭제 처리 ajax(코디)
	$("#checkedDeleteCoordiBtn").click(function() {
		var coordiNo = "";
		
		$("input[name='coordiNo']:checked").each(function() {
			coordiNo = coordiNo+$(this).val()+",";
		})
		
		//맨끝 콤마 지우기
		coordiNo = coordiNo.substring(0,coordiNo.lastIndexOf(",")); 
		
		if(coordiNo == ""){
			alert("삭제할 대상을 선택하세요.");
			return false;
		}
		
		if(confirm("코디 번호 "+coordiNo+" 을(를)\n삭제처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/coordiCheckedDelYNChange.do",
				data:{"coordiNo":coordiNo},
				type:"post",
				success: function(result){
					if(result!=false){
						$("input:checked").parent().siblings().find(".fa-trash").attr("class", "fas fa-trash-restore");
						$("input:checked").parent().siblings().find(".btn-one-coordi-delete").attr("DelYN", "Y");
						$("input:checked").parent().parent().addClass("deactivate");
						$("input:checked").parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$("input:checked").parent().siblings().find(".fas").parent().next().removeClass("detail");
						$("input:checked").parent().siblings().find(".far").parent().parent().removeAttr("href");
						$("input:checked").attr("disabled", true);
						$("input:checked").prop("checked", false);
						
						alert("삭제가 완료되었습니다.");
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

	//코디 아이템 정보 불러오기
	$(".btn-item-info").one('mouseover',function(){
		
		var $boxStyle = $(this).next();
		
		$.each($boxStyle,function(index,item){
			
			var coordiNo = $(item).attr("coordiNo");
			
			$.ajax({
				url:"/admin/coordiOneItemInfo.do",
				data:{"coordiNo":coordiNo},
				type:"post",
				dataType : "json",
				success: function(data){
					
					$.each(data, function(index,item){
						
//						console.log(index);
//						console.log(item.categoryCode);
//						console.log(item.categoryName);
//						console.log(item.brand);
						
						var imgTag;
						var	categoryCode; 
						
						if(item.categoryCode.substr(0,1)==('T')){
							imgTag = "<img alt='상의' src='/resources/images/default/top.png'>";
							categoryCode = "Top";
						}
						if(item.categoryCode.substr(0,1)=='B'){
							imgTag = "<img alt='하의' src='/resources/images/default/bottom.png'>";
							categoryCode = "Bottom";
						}
						if(item.categoryCode.substr(0,1)=='O'){
							imgTag = "<img alt='아우터' src='/resources/images/default/outer.png'>";
							categoryCode = "Outer";
						}
						if(item.categoryCode.substr(0,1)=='S'){
							imgTag = "<img alt='신발' src='/resources/images/default/shoes.png'>";
							categoryCode = "Shoes";
						}
						if(item.categoryCode.substr(0,1)=='A'){
							imgTag = "<img alt='악세사리' src='/resources/images/default/acc.png'>";
							categoryCode = "Acc";
						}
						
						var categoryName = item.categoryName;
						var brand = item.brand;
						
						var str = "<div class='style'>" +
										"<div class='img-style'>" +
											imgTag+
										"</div>"+
										"<div class='txt-style'>" +
											"<p>"+categoryCode+" &nbsp·&nbsp "+categoryName+"</p>"+
											"<span>"+brand+"</span>"+
										"</div>"+
									"</div>";
						
						$boxStyle.append(str);
					});
				},
				error: function(){
					console.log("ajax 통신 실패");
				}
			});
		});
	});
	
	
	//개별 삭제 처리 ajax(코디 댓글)
	$(".btn-one-coordi-comment-delete").click(function() {
		
		var cmtNo = $(this).attr("cmtNo");
		var cmtDelYN = $(this).attr("delyn");
		var $this = $(this);
		
		$.ajax({
			url:"/admin/coordiCommentOneDelYNChange.do",
			data:{"cmtNo":cmtNo,"cmtDelYN":cmtDelYN},
			type:"post",
			success: function(result){
				if(result!=false){
					$this.attr("delyn",result);
					if(cmtDelYN=="N") {
						$this.children("i").attr("class", "fas fa-trash-restore");
						$this.parent().parent().addClass("deactivate");
						$this.parent().siblings().find("input").attr("disabled", true);
						$this.parent().siblings().find("input").prop("checked", false);
					}else if(cmtDelYN=="Y") {
						$this.children("i").attr("class", "fas fa-trash");
						$this.parent().parent().removeClass("deactivate");
						$this.parent().siblings().find("input").attr("disabled", false);
						$this.parent().siblings().find("input").prop("checked", false);
					}
				}
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		})
	})

	//단체 삭제 처리 ajax(코디 댓글)
	$("#checkedDeleteCCommentBtn").click(function() {
		var cmtNo = "";
		
		$("input[name='cmtNo']:checked").each(function() {
			cmtNo = cmtNo+$(this).val()+",";
		})
		
		//맨끝 콤마 지우기
		cmtNo = cmtNo.substring(0,cmtNo.lastIndexOf(",")); 
		
		if(cmtNo == ""){
			alert("삭제할 댓글을 선택하세요.");
			return false;
		}
		
		if(confirm("댓글 번호 "+cmtNo+" 을(를)\n삭제처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/coordiCommentCheckedDelYNChange.do",
				data:{"cmtNo":cmtNo},
				type:"post",
				success: function(result){
					if(result!=false){
						$("input:checked").parent().siblings().find(".fa-trash").attr("class", "fas fa-trash-restore");
						$("input:checked").parent().siblings().find(".btn-one-coordi-comment-delete").attr("delYN", "Y");
						$("input:checked").parent().parent().addClass("deactivate");
						$("input:checked").attr("disabled", true);
						$("input:checked").prop("checked", false);
						
						alert("삭제가 완료되었습니다.");
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
	
	
	//개별 이미지 삭제(잇템)
	$(".btn-one-ittem-delete").click(function(){
		
		var itItemNo = $(this).attr("itItemNo");
		var delYN = $(this).attr("delyn");
		var $this = $(this);
		
		$.ajax({
			url:"/admin/ittemOneDelYNChange.do",
			data:{"itItemNo":itItemNo,"delYN":delYN},
			type:"post",
			success: function(result){
				if(result!=false){
					$this.attr("delyn",result);
					if(delYN=='N') {
						$this.children("i").attr("class", "fas fa-trash-restore");
						$this.parent().parent().addClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$this.parent().siblings().find(".fas").parent().next().removeClass("detail");
						$this.parent().siblings().find(".far").parent().parent().removeAttr("href");
						$this.parent().siblings().find("input").attr("disabled", true);
						$this.parent().siblings().find("input").prop("checked", false);
					}else if(delYN=='Y') {
						$this.children("i").attr("class", "fas fa-trash");
						$this.parent().parent().removeClass("deactivate");
						$this.parent().siblings().find(".ellipsis").next().addClass("box-hovor");
						$this.parent().siblings().find(".fas").parent().next().addClass("detail");
						$this.parent().siblings().find(".far").parent().parent().attr("href","/admin/adminIttemComment.do?itItemNo="+itItemNo);
						$this.parent().siblings().find("input").attr("disabled", false);
						$this.parent().siblings().find("input").prop("checked", false);
					}
				}
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		})
	})
	
	//단체 삭제 처리 ajax(잇템)
	$("#checkedDeleteIttemBtn").click(function() {
		var itItemNo = "";
		
		$("input[name='itItemNo']:checked").each(function() {
			itItemNo = itItemNo+$(this).val()+",";
		})
		
		//맨끝 콤마 지우기
		itItemNo = itItemNo.substring(0,itItemNo.lastIndexOf(",")); 
		
		if(itItemNo == ""){
			alert("삭제할 대상을 선택하세요.");
			return false;
		}
		
		if(confirm("잇템 번호 "+itItemNo+" 을(를)\n삭제처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/ittemCheckedDelYNChange.do",
				data:{"itItemNo":itItemNo},
				type:"post",
				success: function(result){
					if(result!=false){
						$("input:checked").parent().siblings().find(".fa-trash").attr("class", "fas fa-trash-restore");
						$("input:checked").parent().siblings().find(".btn-one-coordi-delete").attr("DelYN", "Y");
						$("input:checked").parent().parent().addClass("deactivate");
						$("input:checked").parent().siblings().find(".ellipsis").next().removeClass("box-hovor");
						$("input:checked").parent().siblings().find(".fas").parent().next().removeClass("detail");
						$("input:checked").parent().siblings().find(".far").parent().parent().removeAttr("href");
						$("input:checked").attr("disabled", true);
						$("input:checked").prop("checked", false);
						
						alert("삭제가 완료되었습니다.");
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
	
	
	//개별 삭제 처리 ajax(잇템 댓글)
	$(".btn-one-ittem-comment-delete").click(function() {
		
		var cmtNo = $(this).attr("cmtNo");
		var cmtDelYN = $(this).attr("delyn");
		var $this = $(this);
		
		$.ajax({
			url:"/admin/ittemCommentOneDelYNChange.do",
			data:{"cmtNo":cmtNo,"cmtDelYN":cmtDelYN},
			type:"post",
			success: function(result){
				if(result!=false){
					$this.attr("delyn",result);
					if(cmtDelYN=="N") {
						$this.children("i").attr("class", "fas fa-trash-restore");
						$this.parent().parent().addClass("deactivate");
						$this.parent().siblings().find("input").attr("disabled", true);
						$this.parent().siblings().find("input").prop("checked", false);
					}else if(cmtDelYN=="Y") {
						$this.children("i").attr("class", "fas fa-trash");
						$this.parent().parent().removeClass("deactivate");
						$this.parent().siblings().find("input").attr("disabled", false);
						$this.parent().siblings().find("input").prop("checked", false);
					}
				}
			},
			error: function(){
				console.log("ajax 통신 실패");
			}
		})
	})

	//단체 삭제 처리 ajax(잇템 댓글)
	$("#checkedDeleteICommentBtn").click(function() {
		var cmtNo = "";
		
		$("input[name='cmtNo']:checked").each(function() {
			cmtNo = cmtNo+$(this).val()+",";
		})
		
		//맨끝 콤마 지우기
		cmtNo = cmtNo.substring(0,cmtNo.lastIndexOf(",")); 
		
		if(cmtNo == ""){
			alert("삭제할 댓글을 선택하세요.");
			return false;
		}
		
		if(confirm("댓글 번호 "+cmtNo+" 을(를)\n삭제처리 하시겠습니까?")){
			$.ajax({
				url:"/admin/ittemCommentCheckedDelYNChange.do",
				data:{"cmtNo":cmtNo},
				type:"post",
				success: function(result){
					if(result!=false){
						$("input:checked").parent().siblings().find(".fa-trash").attr("class", "fas fa-trash-restore");
						$("input:checked").parent().siblings().find(".btn-one-ittem-comment-delete").attr("delYN", "Y");
						$("input:checked").parent().parent().addClass("deactivate");
						$("input:checked").attr("disabled", true);
						$("input:checked").prop("checked", false);
						
						alert("삭제가 완료되었습니다.");
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
});