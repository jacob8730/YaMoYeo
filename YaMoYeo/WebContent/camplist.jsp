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

<title>Ya! MoYeo | Camp</title>

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
tr, td {
	text-align: center;
	padding: 10px;
	width: 300px;
	height: 50px;
}

#di1 {
	margin: 0 auto;
}

#di2 {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

img {
	max-width: 100%;
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
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='memberList'">회원목록</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='boardList'">게시물 관리</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='memberLogout'">로그아웃</a></li>
						</c:when>

						<c:when test="${sessionScope.loginId != null}">
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='memberView?yId=${sessionScope.loginId}'">내
									정보</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='boardList?zId=${sessionScope.loginId}'">게시물
									관리</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='memberLogout'"><strong>로그아웃</strong></a></li>
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

		<!-- Jumbotron Header -->
		<header style="text-align: center">
			<div style="background-image: url('assets/img/campe.jpg')">
				<br><br><br><br><br>
				<h3 class="text-white">야외활동 살펴보기</h3>
				<h5 class="text-white">전 세계 야외활동 Meetup 그룹들은 현재 어떤 활동을 하고 있을까요?
					내가 참여할 수 있는 Meetup이 주변에 있는지 찾아보세요.</h5>
				<br> <a onclick="location.href='LoginForm.jsp'"
					class="btn btn-primary btn-lg">회원가입</a><br>
				<br><br><br><br>
			</div>
		</header>
		<br>

		<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
			<form>
				<div class="form-row">
					<div class="col-12 col-md-9 mb-2 mb-md-0">
						<input type="text" class="form-control form-control-lg"
							placeholder="야외활동">
					</div>
					<div class="col-12 col-md-3">
						<button type="submit" class="btn btn-block btn-lg btn-primary">검색</button>
					</div>
				</div>
			</form>
		</div>
		<br> <br> <br> <br> <br> <br> <br>

		<div id="di1">
			<div id="di2">
				<c:forEach var="board" items="${bList}">

					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="fileUpload/${board.zFile}" alt=""
								height="200px">
							<div class="card-body">
								${board.zNum}.
								${board.zTitle}
							</div>
							<div class="card-footer" id="di">													
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="campView?zNum=${board.zNum}&page=${paging.page}" class="btn btn-primary">보기</a>
							</div>
						</div>
					</div>

					<input type="hidden" id="zId" value="${board.zId}">
					<input type="hidden" id="zNum" value="${board.zNum}">
					<input type="hidden" id="loginId" value="${sessionScope.loginId}">
				</c:forEach>
			</div>
		</div>

		<br>
		<div>
			<select name="limit" id="limit" onchange="funSel()">
				<option>게시글 갯수</option>
				<option value="3">3개씩</option>
				<option value="5">5개씩</option>
				<option value="10">10개씩</option>
			</select>

		</div>

		<!-- 페이징 처리 -->

		<!-- [이전] 에 대한 페이징 처리 -->
		<ul class="pagination justify-content-center mb-4">
			<c:if test="${paging.page<=1}">&larr; Older&nbsp;</c:if>
			<c:if test="${paging.page>1}">
				<a href="boardList?page=${paging.page-1}&limit=${paging.limit}">&larr;
					Older</a>&nbsp;
								</c:if>

			<!-- 페이지 숫자에 대한 페이징 처리 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="i" step="1">
				<c:choose>

					<c:when test="${i eq paging.page}">
											${i}
										</c:when>

					<c:otherwise>
						<a href="boardList?page=${i}&limit=${paging.limit}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>

			<!-- [다음] 에 대한 페이징 처리 -->
			<c:if test="${paging.page>=paging.maxPage}">Newer &rarr;&nbsp;</c:if>
			<c:if test="${paging.page<paging.maxPage}">
				<a href="boardList?page=${paging.page+1}&limit=${paging.limit}">Newer
					&rarr;</a>&nbsp;
								</c:if>
		</ul>
	</div>
	<!-- 페이징처리 끝 -->
	<br><br><br><br><br><br>

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
				<tr>
					<td><a href="#" class="text-white">내 계정</a></td>
					<td><a href="#" class="text-white">탐색</a></td>
					<td><a href="#" class="text-white">Meetup</a></td>
					<td><a href="#" class="text-white">팔로우하기</a></td>
				</tr>
				<tr>
					<td><a onclick="location.href='JoinForm.jsp'"
						class="text-white">회원가입</a></td>
					<td><a href="#" class="text-white">그룹</a></td>
					<td><a href="#" class="text-white">정보</a></td>
					<td>
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
				<tr>
					<td><a onclick="location.href='LoginForm.jsp'"
						class="text-white">로그인 </a></td>
					<td><a href="#" class="text-white">캘린더</a></td>
					<td><a href="#" class="text-white">Meetup Pro</a></td>
					<td><p class="text-white"></p></td>
				</tr>
				<tr>
					<td><a href="#" class="text-white">도움말 </a></td>
					<td><a href="#" class="text-white">주제</a></td>
					<td><a href="#" class="text-white">채용정보</a></td>
					<td><p class="text-white"></p></td>
				</tr>
				<tr>
					<td><p class="text-white"></p></td>
					<td><a href="#" class="text-white">도시</a></td>
					<td><a href="#" class="text-white">앱</a></td>
					<td><p class="text-white"></p></td>
				</tr>
				<tr>
					<td><p class="text-white"></p></td>
					<td><a href="#" class="text-white">Online Events</a></td>
					<td><a href="#" class="text-white">Blog</a></td>
					<td><p class="text-white"></p></td>
				</tr>
				<tr>
					<td><p class="text-white"></p></td>
					<td><p class="text-white"></p></td>
					<td><a href="#" class="text-white">접근성</a></td>
					<td><p class="text-white"></p></td>
				</tr>
			</table>

		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

<script>
	function boardDelete() {
		var loginId = document.getElementById("loginId").value;
		var zId = document.getElementById("zId").value;
		var zNum = document.getElementById("zNum").value;

		console.log("loginId : " + loginId);
		console.log("zId : " + zId);

		if (loginId != zId && loginId != 'admin') {
			alert('본인이 작성한 글이 아닙니다!');
		} else {
			location.href = "boardDelete?zNum=" + zNum;
		}
	}
	function funSel() {
		var limit = document.getElementById("limit").value;
		location.href = "boardList?limit=" + limit;
	}
</script>

</html>