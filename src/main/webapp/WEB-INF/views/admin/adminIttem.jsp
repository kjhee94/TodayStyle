<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지_오늘의 잇템 관리</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/common/adminCommon.css">
<link rel="stylesheet" href="/resources/common/adminHeader.css">
<link rel="stylesheet" href="/resources/css/admin/adminIttem.css">
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
					<span id="topTitle">오늘의 잇템 관리</span>
					<span>Home &nbsp-&nbsp 게시판 관리 &nbsp-&nbsp </span>
					<span id="topAction">오늘의 잇템 관리</span>
				</div>
				<a href="">로그아웃</a>
			</div>
			
			<div id="container">
				<div id="searchAndBtn">
					<form action="" method="get">
						<div id="boxSelect">
							<select class="select-style" name="keyword">
								<option disabled selected>필터선택</option>
								<option value="userId">작성자</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
							</select>
							<i class="fas fa-chevron-down"></i>
						</div>
						
						<div id="boxSearch">
							<input class="input-style" type="text" name="search">
							<i class="fas fa-search"></i>
						</div>
					</form>
					<div id="boxBtn">
						<button id="allWithDrawBtn" class="btn-style">삭제</button>
					</div>
				</div>
				
				<table>
					<tr>
						<th><input type="checkbox" id="Allcheck"></th>
						<th>잇템 번호</th>
						<th>작성자</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
						<th>잇템정보</th>
						<th>해시태그</th>
						<th>댓글관리</th>
						<th>삭제</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>12345</td>
						<td>ididwwwwwwww</td>
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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
						<td>
							<div class="relative">
								<div class="ellipsis">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">제목입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="ellipsis">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
								<div class="box-hovor detail">내용입니다. 길면 줄임표가 나타납니다. 전체 내용은 클릭시 노출됩니다.</div>
							</div>
						</td>
						<td>2022.01.24</td>
						<td>
							<div id="box-icon-btn">
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-tshirt"></i>
									</div>
									<div class="box-style detail">
										<div class="style">
											<div class="img-style">
												<img alt="상의" src="/resources/images/default/shoes.png">
											</div>
											<div class="txt-style">
												<p>Shoes &nbsp·&nbsp 운동화</p>
												<span>NIKE</span>
											</div>
										</div>
										<div class="txt-item">
											<div class="txt-item-list">
												<span class="tit-item">상품명</span>
												<span>나이키 에어포스1</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">색상</span>
												<span>화이트</span>
											</div>
											<div class="txt-item-list">
												<span class="tit-item">구매 사이즈</span>
												<span>245mm</span>
											</div>
										</div>
									</div>
								</div>
								
								<div class="relative">
									<div class="btn-style-icon">
										<i class="fas fa-user"></i>
									</div>
									<div class="box-user detail">
										<div class="txt-item-list">
											<span class="tit-item">구매자 키</span>
											<span>163cm</span>
										</div>
										<div class="txt-item-list">
											<span class="tit-item">정사이즈</span>
											<span>240mm</span>
										</div>
									</div>
								</div>
							</div>
						</td>
						<td>
							<div class="relative">
								<div class="btn-style-icon">
									<i class="fas fa-hashtag"></i>
								</div>
								<div class="box-hashtag detail">
									<div class="h-wrap">#데일리운동화</div>
									<div class="h-wrap">#나이키</div>
									<div class="h-wrap">#스니커즈</div>
									<div class="h-wrap">#운동화추천</div>
								</div>
							</div>
						</td>
						<td>
							<a href="/admin/adminIttemComment.do">
								<div class="btn-style-icon">
									<i class="far fa-comment-dots"></i>
								</div>
							</a>
						</td>
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