<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_회원 정보 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/adminCommon.css">
<link rel="stylesheet" href="/resources/common/adminHeader.css">
<link rel="stylesheet" href="/resources/css/admin/adminMember.css">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="/resources/js/admin.js"></script>
</head>

<body>

	<div id="wrap">
		<!-- adminHeader -->
		<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
		
		<div id="content">
			<div id="top">
				<div id="topLink">
					<span id="topTitle">회원 정보 관리</span>
					<span>Home &nbsp-&nbsp 회원 관리 &nbsp-&nbsp </span>
					<span id="topAction">회원 정보 관리</span>
				</div>
				<a href="">로그아웃</a>
			</div>
			
			<div id="container">
				<div id="searchAndBtn">
					<form action="" method="get">
						<div id="boxSelect">
							<select class="select-style" name="keyword">
								<option disabled selected>필터선택</option>
								<option value="userId">아이디</option>
								<option value="nick">닉네임</option>
							</select>
							<i class="fas fa-chevron-down"></i>
						</div>
						
						<div id="boxSearch">
							<input class="input-style" type="text" name="search">
							<i class="fas fa-search"></i>
						</div>
					</form>
					<div id="boxBtn">
						<button id="allWithDrawBtn" class="btn-style">탈퇴</button>
					</div>
				</div>
				
				<table>
					<tr>
						<th><input type="checkbox" id="Allcheck"></th>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>성별</th>
						<th>닉네임</th>
						<th>가입일</th>
						<th>권한</th>
						<th>탈퇴</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>황우남궁</td>
						<td>ididwwwwwwww@email.com</td>
						<td>비공개</td>
						<td>여니여니연신내핵주먹</td>
						<td>2022.01.24</td>
						<td>최고관리자</td>
						<td>
							<div class="btn-style-icon">
								<i class="fas fa-trash"></i>
							</div>
						</td>
					</tr>
				</table>
				<div id="page_wrap">
					<ul class="page_ul">
						<li><a href=''><i class='fas fa-chevron-left'></i></a></li>
						<li><a href='' class='page_active'>1</a></li>
						<li><a href=''>2</a></li>
						<li><a href=''>3</a></li>
						<li><a href=''>4</a></li>
						<li><a href=''>5</a></li>
						<li><a href=''><i class='fas fa-chevron-right'></i></a></li>
	 				</ul>
			    </div>
			</div>
			
			<div id="bottom">
				<p>© 2022. 투데이스타일 Inc. all rights reserved</p>
			</div>
		</div>
	</div>
	
</body>
</html>