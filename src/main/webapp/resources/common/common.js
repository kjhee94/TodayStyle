/**
 * 
 */

$(document).ready(function(){
	$(".profile").click(function() {
		$(this).next(".box-mypage-link").fadeIn(150);
	})
	$(document).mouseup(function (e) {
		// 팝업 아이디
		var container = $(".box-mypage-link");

		if (container.has(e.target).length === 0){
		container.fadeOut(150);
		}
	});
	
	$(".btn-style-mint").click(function() {
		$(this).next(".box-write-link").fadeIn(150);
	})
	$(document).mouseup(function (e) {
		// 팝업 아이디
		var container = $(".box-write-link");

		if (container.has(e.target).length === 0){
		container.fadeOut(150);
		}
	});
});