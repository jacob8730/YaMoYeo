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
			<a class="navbar-brand" href="index.jsp"><img src="assets/img/ya.png" height="35px"></a>
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
								onclick="location.href='memberLogout'">로그아웃</a></li>
						</c:when>

						<c:when test="${sessionScope.loginId != null}">
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='memberView?yId=${sessionScope.loginId}'">내
									정보</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='memberLogout'">로그아웃</a></li>
						</c:when>

						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='JoinForm.jsp'">회원가입</a></li>
							<li class="nav-item"><a class="nav-link"
								onclick="location.href='LoginForm.jsp'">로그인</a></li>
						</c:otherwise>

					</c:choose>
					<li class="nav-item"><a class="nav-link"
						onclick="location.href='BWrite.jsp'">글작성</a></li>
					<li class="nav-item"><a class="nav-link"
						onclick="location.href='boardList'">목록</a></li>

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

		<div class="div1">
			<table class="table" style="text-align: center">

				<thead>
					<tr class="noborder">
						<td class="noborder" colspan="5">
							<div style="text-align: right">
								<select name="limit" id="limit" onchange="funSel()">
									<option>게시글 갯수</option>
									<option value="3">3개씩</option>
									<option value="5">5개씩</option>
									<option value="10">10개씩</option>
								</select>
							</div>
						</td>
					</tr>
					<tr>
						<th>순서</th>
						<th>이름</th>
						<th>아이디</th>
						<th>생년월일</th>
						<th>회원탈퇴</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="member" items="${yList}" varStatus="num">
						<tr>
							<td>${num.count}</td>
							<td>${member.yName}</td>
							<td><a href="memberView?yId=${member.yId}">${member.yId}</a></td>
							<td>${member.yBirth}</td>
							<td><a href="memberDelete?yId=${member.yId}">탈퇴</a></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>

		</div>

		<!-- 페이징 처리 -->
		<div style="text-align: center">
			<!-- [이전] 에 대한 페이징 처리 -->
			<c:if test="${paging.page<=1}">[이전]&nbsp;</c:if>
			<c:if test="${paging.page>1}">
				<a href="memberList?page=${paging.page-1}&limit=${paging.limit}">[이전]</a>&nbsp;
		</c:if>
			<!-- 페이지 숫자에 대한 페이징 처리 -->
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
				var="i" step="1">
				<c:choose>
					<c:when test="${i eq paging.page}">
					${i}
				</c:when>
					<c:otherwise>
						<a href="memberList?page=${i}&limit=${paging.limit}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- [다음] 에 대한 페이징 처리 -->
			<c:if test="${paging.page>=paging.maxPage}">[다음]&nbsp;</c:if>
			<c:if test="${paging.page<paging.maxPage}">
				<a href="memberList?page=${paging.page+1}&limit=${paging.limit}">[다음]</a>&nbsp;
		</c:if>
		</div>
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

<script>
	function funSel() {
		var limit = document.getElementById("limit").value;
		location.href = "memberList?limit=" + limit;
	}
</script>

</html>