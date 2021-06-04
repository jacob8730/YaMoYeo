<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

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

video {
	max-width: 100%;
	display: block;
	margin: 20px auto;
}

.main-text {
	position: absolute;
	top: 50%;
	width: 100%;
	margin-left: 10px;
}

.main-text p {
	margin-top: -24px; 
	
	font-size: 50px;
	color: #ffffff;
	text-align: left;
}
.main-text h5{
	
	margin-left: 10px;
	color: #ffffff;
	
}
.main-box {
	width: 100%;
	height: 500px;
	overflow: hidden;
	margin: 0px auto;
	position: relative;
}

#ta{
	margin : auto;   
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

		<!-- Jumbotron Header -->
		<header class="jumbotron my-4">

			<div class="main-box">

				<video muted autoplay loop>
					<source src="assets/video/active-123.mp4" type="video/mp4">
				</video>
				<div class="main-text">
					<p>함께하는 즐거움</p>
					<h5>로컬 그룹에 가입하고 사람들과 좋아하는 일을 함께 하며 새로운 경험을 즐겨 보세요.</h5>
					<br> <a onclick="location.href='LoginForm.jsp'"
						class="btn btn-primary btn-lg">모임 참여</a>
				</div>

			</div>

		</header>

		<div style="text-align: center">
			<h5>추천 키워드</h5>
			<a href="#" class="btn btn-primary">IT / 개발</a> &nbsp; <a href="#"
				class="btn btn-primary">언어 교환</a> &nbsp; <a href="#"
				class="btn btn-primary">아웃도어</a> &nbsp; <a href="#"
				class="btn btn-primary">요리배우기</a> &nbsp; <a href="#"
				class="btn btn-primary">K팝 댄스커버</a>
		</div>
		<hr>
		<!-- Page Features -->
		<div class="col-lg-9" id="ta">

			<div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					<div class="carousel-item active">
						<a href= "#">
						<img class="d-block img-fluid" src="assets/img/slide_1.jpg"
							alt="First slide" height= "350" width= "900"></a>
					</div>
					<div class="carousel-item">
						<a href= "#"><img class="d-block img-fluid" src="assets/img/slide_2.jpg"
							alt="Second slide" height= "350" width= "900"></a>
					</div>
					<div class="carousel-item">
						<a href= "#"><img class="d-block img-fluid" src="assets/img/slide_3.jpg"
							alt="Third slide" height= "350" width= "900"></a>
					</div>
					<div class="carousel-item">
						<a href= "#"><img class="d-block img-fluid" src="assets/img/slide_4.jpg"
							alt="Forth slide" height= "350" width= "900"></a>
					</div>
					<div class="carousel-item">
						<a href= "#"><img class="d-block img-fluid" src="assets/img/slide_5.jpg"
							alt="Fifth slide" height= "350" width= "900"></a>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<!-- Page Features -->
		<h3>카테고리</h3>
		<h5>관심 있는 주제별로 그룹을 찾아보세요.</h5>
		<br>
		<div class="row text-center">
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/campe.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">야외활동</h4>
					</div>
					<div class="card-footer">
						<a href="camplist" class="btn btn-primary">야외활동</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/engineer.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">기술</h4>
					</div>
					<div class="card-footer">
						<a href="engineerlist" class="btn btn-primary">기술</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/family.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">가족</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">가족</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/health.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">건강/웰빙</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">건강/웰빙</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/sports.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">스포츠/피트니스</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">스포츠/피트니스</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/learning.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">학습</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">학습</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/photo.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">사진촬영</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">사진촬영</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/food.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">음식</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">음식</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/writing.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">글쓰기</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">글쓰기</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/culture.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">언어/문화</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">언어/문화</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/music.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">음악</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">음악</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/movement.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">사회운동</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">사회운동</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/lgbtq.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">LGBTQ(성소수자)</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">LGBTQ(성소수자)</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/movie.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">영화</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">영화</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/science.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">공상과학/게임</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">공상과학/게임</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/belief.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">종교</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">종교</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/art.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">예술</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">예술</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/book.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">북클럽</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">북클럽</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/dance.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">춤</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">춤</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/pet.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">반려동물</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">반려동물</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/hobby.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">취미/공예</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">취미/공예</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/fashion.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">패션/스타일</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">패션/스타일</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/fellowship.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">친목</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">친목</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="assets/img/business.jpg" alt=""
						height="200px">
					<div class="card-body">
						<h4 class="card-title">비즈니스</h4>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">비즈니스</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

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
	/* 회원가입 페이지 이동 : Join()함수 */
	function Join() {
		location.href = "JoinForm.jsp";
	}

	/* 로그인 페이지 이동 : Login()함수 */
	function Login() {
		location.href = "LoginForm.jsp";
	}

	// 로그인 성공페이지로 이동 : LoginSuccess() 함수
	function LoginSuccess() {
		location.href = "LoginSuccess.jsp";
	}

	// 글쓰기 페이지로 이동 : Write()함수
	function Write() {
		location.href = "WriteForm.jsp";
	}

	// 글목록 페이지로 이동 : BList()함수
	function BList() {
		location.href = "BList.jsp";
	}
</script>

</html>