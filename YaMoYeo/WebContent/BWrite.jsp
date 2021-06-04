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

<title>Ya! MoYeo | 모임만들기</title>

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
#th1 {
	text-align: center;
	padding: 10px;
	width: 300px;
	height: 50px;
}

video {
	width: 100%;
	display: block;
	margin: 10px auto;
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

.main-text h5 {
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

	<div class="container">

		<br> <br> <br> <br>

		<c:choose>
			<c:when test="${sessionScope.loginId != null}">
				<form action="boardWrite" method="post"
					enctype="multipart/form-data">
					<main class="content">
						<div class="container-fluid p-0">

							<h1 class="h3 mb-3">모임 만들기</h1>

							<div class="row">
								<div class="col-12 col-xl-6">
									<div class="card">
										<div class="card-header">
											<h5 class="card-title">원하는 관심사와 모집정원을 정해주세요</h5>
											<h6 class="card-subtitle text-muted">※불법적인 모임이나 비건전한 모임을
												만들면 법적제재 및 처벌을 받을 수 있습니다.</h6>
										</div>
										<div class="card-body">
											<form>

												<div class="mb-3">
													<label class="form-label">주최자 : </label>
													${sessionScope.loginId}<input type="hidden" name="zId"
														value="${sessionScope.loginId}" name="zId">
												</div>
												
												<div class="mb-3">
													<label class="form-label">제목</label> 
													<input type="text" name="zTitle" id="zTitle" class="form-control" placeholder="제목을 입력해주세요.">
												</div>

												<div class="mb-3">
													<label class="form-label">주최자 이메일</label> 
													<input type="email" name="zEmail" id="zEmail" class="form-control" placeholder="호스트이메일을 입력해주세요.">
												</div>
												
												<div class="mb-3">
													<label class="form-label">온라인 모임 호스트링크</label> 
													<input type="text" name="zLink" id="zLink"class="form-control" placeholder="접속가능한 호스트링크를 입력해주세요. ex) discode, skype, zoom, kakao 등">
												</div>
												
												<div class="mb-3">
													<label class="form-label">카테고리</label><br> <select
														name="zCategories" id="zCategories">
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
														<option value="IT/게임">IT/게임</option>
														<option value="종교">종교</option>
														<option value="예술">예술</option>
														<option value="북클럽">북클럽</option>
														<option value="춤">춤</option>
														<option value="반려동물">반려동물</option>
														<option value="취미/공예">취미/공예</option>
														<option value="패션/스타일">패션/스타일</option>
														<option value="친목">친목</option>
														<option value="비즈니스">비즈니스</option>
													</select>
												</div>

												<div class="mb-3">
													<label class="form-label">장소</label><br> <select
														name="zPlace" id="zPlace">
														<option value="강원도">강원도</option>
														<option value="경기도">경기도</option>
														<option value="경상남도">경상남도</option>
														<option value="경상북도">경상북도</option>
														<option value="광주광역시">광주광역시</option>
														<option value="대구광역시">대구광역시</option>
														<option value="대전광역시">대전광역시</option>
														<option value="부산광역시">부산광역시</option>
														<option value="서울특별시">서울특별시</option>
														<option value="세종특별자치시">세종특별자치시</option>
														<option value="울산광역시">울산광역시</option>
														<option value="인천광역시">인천광역시</option>
														<option value="전라남도">전라남도</option>
														<option value="전라북도">전라북도</option>
														<option value="제주특별자치도">제주특별자치도</option>
														<option value="충청남도">충청남도</option>
														<option value="충청북도">충청북도</option>
													</select>
												</div>

												<div class="mb-3">
													<label class="form-label">인원설정</label><br> 
													<input type="number" name="zPersonnel" min="1" max="1000" step="1">
												</div>

												<div class="mb-3">
													<label class="form-label">공개설정</label><br> 
													<select name="zPublic" id="zPublic">
														<option value="공개">공개</option>
														<option value="친구공개">친구공개</option>
														<option value="비공개">비공개</option>
													</select>
												</div>

												<div class="mb-3">
													<label class="form-label">내용</label>
													<textarea class="form-control"  placeholder="모임의 내용을 적어주세요." rows="50" name="zContents" id="zContents"></textarea>
												</div>
												<div class="mb-3">
													<label class="form-label w-100">대표사진 넣기</label> 
													<input type="file" name="zFile" > <small class="form-text text-muted"><br>※
														모임에 관련된 사진을 넣어주세요.<br>(ex. 주최장소,주최자 프로필 사진, 그외 관련활동 등
														).<br>그 외 선정적사진이나 법적제재를 받을 이미지를 업로드시 법적 조취를 받을 수있습니다.</small>
												</div>
												<button type="submit" class="btn btn-primary">모임 만들기</button>
											</form>
										</div>
									</div>
								</div>

							</div>

						</div>
					</main>
				</form>
			</c:when>
			<c:otherwise>
				<h1>로그인 이후 사용해주세요!</h1>
				<button onclick="location.href='LoginForm.jsp'">로그인 페이지로</button>
			</c:otherwise>
		</c:choose>
	</div>
	<br>
	<br>
	<br>
	<br>

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

	<script src="js/app.js"></script>

</body>

</html>