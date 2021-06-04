<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Ya! MoYeo</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/heroic-features.css" rel="stylesheet">
<link href="css/shop-homepage.css" rel="stylesheet">
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- Favicons -->
<link href="vendor/img/favicon.png" rel="icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/landing-page.min.css" rel="stylesheet">

<style>
#th1{
	text-align: center;
	padding: 10px;
	width: 300px;
	height: 50px;
}
</style>

</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">

			<a href="index.jsp"><img src="assets/img/ya.png" href="index.jsp"
				alt="" width="95px" height="35px"></a>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${sessionScope.loginId eq 'admin'}">
							<h3>관리자 모드</h3>
							<li class="nav-item"><a class="nav-link" onclick="location.href='memberList'">회원목록</a></li>
							<li class="nav-item"><a class="nav-link" onclick="location.href='boardList'">게시물 관리</a></li>
							<li class="nav-item"><a class="nav-link" onclick="location.href='memberLogout'">로그아웃</a></li>							
						</c:when>

						<c:when test="${sessionScope.loginId != null}">
							<li class="nav-item"><a class="nav-link" onclick="location.href='memberView?yId=${sessionScope.loginId}'">내 정보</a></li>
							<li class="nav-item"><a class="nav-link" onclick="location.href='boardList?zId=${sessionScope.loginId}'">게시물 관리</a></li>
							<li class="nav-item"><a class="nav-link" onclick="location.href='memberLogout'"><strong>로그아웃</strong></a></li>
						</c:when>

						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='JoinForm.jsp'"><strong>회원가입</strong></a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='LoginForm.jsp'"><strong>로그인</strong></a></li>
						</c:otherwise>

					</c:choose>
					<li class="nav-item"><a class="nav-link"
						onclick="location.href='BWrite.jsp'"><strong>모임만들기</strong></a></li>
					
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<c:choose>
			<c:when test="${sessionScope.loginId eq modify.zId}">

				<form action="boardModify" method="POST"
					enctype="multipart/form-data">
					<table>
						<tr>
						<tr>
							<th>작성자</th>
							<td>${modify.zId}<input type="hidden" name="zNum"
								value="${modify.zNum}"></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" class="form-control" name="zTitle"
								placeholder="${modify.zTitle}"></td>
						</tr>

						<tr>
							<td>카테고리</td>
							<td><select name="zCategories" id="Categories">
									<option value="야외활동">야외활동</option>
									<option value="기술">기술</option>
									<option value="가족">가족</option>
									<option value="건강/웰빙">건강/웰빙</option>
									<option value="스포츠/피트니스">스포츠/피트니스</option>
									<option value="학습">학습</option>
									<option value="사진촬영">사진촬영</option>
									<option value="음식">음식</option>
									<option value="글쓰기">글쓰기</option>
									<option value="언어/문화">언어/문화</option>
									<option value="음악">음악</option>
									<option value="사회운동">사회운동</option>
									<option value="LGBTQ(성소수자)">LGBTQ(성소수자)</option>
									<option value="영화">영화</option>
									<option value="공상과학/게임">공상과학/게임</option>
									<option value="믿음">믿음</option>
									<option value="예술">예술</option>
									<option value="북클럽">북클럽</option>
									<option value="춤">춤</option>
									<option value="반려동물">반려동물</option>
									<option value="취미/공예">취미/공예</option>
									<option value="패션/스타일">패션/스타일</option>
									<option value="친목">친목</option>
									<option value="비즈니스">비즈니스</option>
							</select></td>
						</tr>

						<tr>
							<th>내용</th>
							<td><textarea cols="" rows="15" cols="20" name="zContents"></textarea></td>
						</tr>

						<tr>
							<th>파일</th>
							<td><input type="file" name="zFile"></td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit" value="등록"></td>
						</tr>
					</table>
				</form>

			</c:when>

			<c:otherwise>
				<h1>작성자의 글이 아닙니다!</h1>
				<button onclick="window.history.back()">뒤로 가기</button>

			</c:otherwise>
		</c:choose>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<h3 class="text-white">
				<a href="#">새 그룹 시작하기</a>
			</h3>
			<hr>
		</div>

		<div class="container">
			<table>
				<tr id="th1">
					<td id="th1"><a href="#" class="text-white">내 계정</a></td>
					<td id="th1"><a href="#" class="text-white">탐색</a></td>
					<td id="th1"><a href="#" class="text-white">Meetup</a></td>
					<td id="th1"><a href="#" class="text-white">팔로우하기</a></td>
				</tr>
				<tr id="th1">
					<td id="th1"><a onclick="location.href='JoinForm.jsp'"
						class="text-white">회원가입</a></td>
					<td id="th1"><a href="#" class="text-white">그룹</a></td>
					<td id="th1"><a href="#" class="text-white">정보</a></td>
					<td id="th1">
						<ul class="list-inline mb-0">
							<li class="list-inline-item mr-3"><a href="#"> <i
									class="fab fa-facebook fa-2x fa-fw"></i>
							</a></li>
							<li class="list-inline-item mr-3"><a href="#"> <i
									class="fab fa-twitter-square fa-2x fa-fw"></i>
							</a></li>
							<li class="list-inline-item"><a href="#"> <i
									class="fab fa-instagram fa-2x fa-fw"></i>
							</a></li>
						</ul>
					</td>
				</tr>
				<tr id="th1">
					<td id="th1"><a onclick="location.href='LoginForm.jsp'"
						class="text-white">로그인 </a></td>
					<td id="th1"><a href="#" class="text-white">캘린더</a></td>
					<td id="th1"><a href="#" class="text-white">Meetup Pro</a></td>
					<td id="th1"><p class="text-white"></p></td>
				</tr>
				<tr id="th1">
					<td id="th1"><a href="#" class="text-white">도움말 </a></td>
					<td id="th1"><a href="#" class="text-white">주제</a></td>
					<td id="th1"><a href="#" class="text-white">채용정보</a></td>
					<td id="th1"><p class="text-white"></p></td>
				</tr>
				<tr id="th1">
					<td id="th1"><p class="text-white"></p></td>
					<td id="th1"><a href="#" class="text-white">도시</a></td>
					<td id="th1"><a href="#" class="text-white">앱</a></td>
					<td id="th1"><p class="text-white"></p></td>
				</tr>
				<tr id="th1">
					<td id="th1"><p class="text-white"></p></td>
					<td id="th1"><a href="#" class="text-white">Online Events</a></td>
					<td id="th1"><a href="#" class="text-white">Blog</a></td>
					<td id="th1"><p class="text-white"></p></td>
				</tr>
				<tr id="th1">
					<td id="th1"><p class="text-white"></p></td>
					<td id="th1"><p class="text-white"></p></td>
					<td id="th1"><a href="#" class="text-white">접근성</a></td>
					<td id="th1"><p class="text-white"></p></td>
				</tr>
			</table>

		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>