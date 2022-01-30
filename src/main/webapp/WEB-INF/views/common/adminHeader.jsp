<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<header>
		<div id="logo">
			<a href="/admin/adminMain.do"><img alt="오늘 뭐 입지 로고" src="/resources/images/logo_admin.png"></a>
		</div>
		<nav>
			<ul id="gnbList">
				<span class="title">MEMBER</span>
				<li>회원 관리<i class="fas fa-chevron-right"></i></li>
				<ul class="lnb-list">
					<li><a href="/admin/adminMember.do">회원 정보 관리</a></li>
				</ul>
				
				<span class="title">BOARD</span>
				<li>게시판 관리<i class="fas fa-chevron-right"></i></li>
				<ul class="lnb-list">
					<li><a href="/admin/adminCoordi.do">오늘의 코디 관리</a></li>
					<li><a href="/admin/adminIttem.do">오늘의 잇템 관리</a></li>
				</ul>
				
				<span class="title">NOTICE</span>
				<li>공지 관리<i class="fas fa-chevron-right"></i></li>
				<ul class="lnb-list">
					<li><a href="/admin/adminNotice.do">공지사항 관리</a></li>
					<li><a href="/admin/adminFAQ.do">자주 묻는 질문 관리</a></li>
				</ul>
			</ul>
		</nav>
	</header>