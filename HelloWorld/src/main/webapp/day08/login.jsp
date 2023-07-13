<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
/* CSS 스타일 지정 */
body {
	margin: 0;
	padding: 0;
}

.header {
	background-color: #FFFFFF;
	padding: 5px;
}

.section {
	padding: 50px;
}

.footer {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
}

/* 메뉴바 */
.navbar-nav .nav-item {
	margin-left: 40px;
}

.navbar-nav .nav-link {
	color: #000000;
}

.navbar {
	padding-top: 10px;
	padding-bottom: 10px;
}

.navbar-brand {
	margin-bottom: 10px;
}

.navbar-nav {
	margin-left: -30px;
}

.logo-img {
	margin-left: 40px;
	max-width: 100px;
	max-height: 100px;
}

.navbar {
	padding-top: 3px;
	padding-bottom: 3px;
}

.navbar-divider {
	border-top: 2px solid #009591;
	margin-top: 0;
	margin-bottom: 0;
	width: 100%;
}

.navbar-nav .nav-item:nth-child(6) {
	margin-left: 30px;
}

.section1 {
	background-color: #ffffff;
	height: 1000px;
}

.login {
	margin-top: 3%;
	margin-left: 5%;
	width: 40%;
	height: 100px;
	position: relative;
	background-color: #8BBCB9;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 2px solid #ffffff; /* 보더 스타일 및 색상 설정 */
	border-radius: 50px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.title {
	position: relative;
	font-size: 20px;
	color: #4D4D4D;
	font-family: 'Arial', sans-serif;
	text-transform: uppercase;
	letter-spacing: 1.5px;
}

.container-login {
	background-color: #f8f8f8;
	width: 70%;
	margin-bottom: 30px;
	position: absolute;
	top: 70%;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	left: 50%;
	transform: translate(-50%, -50%);
	padding: 30px;
	border-radius: 10px;
}

h2 {
	display: flex;
	justify-content: center;
	align-items: center;
}

form {
	max-width: 400px;
	margin: 0 auto;
}

.logo-container {
  margin-top: 10px;
}
.logo-img2 {
	margin-left: 15px;
	margin-top: 10px;
	transform: scale(1.1);
	margin: 0 auto;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"], input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
}

input[type="button"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	background-color: #8BBCB9;
	color: black;
	font-size: 14px;
	border: none;
	cursor: pointer;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #45a049;
}

/* 주민등록번호 입력란 스타일 */
.personal-id-input {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.personal-id-input input[type="text"] {
	flex: 1;
	padding: 10px;
	margin-right: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
	text-align: center;
}

.personal-id-input span {
	font-size: 18px;
	margin-right: 5px;
}

/* 푸터 */
.BankFooter {
	background-color: #f7f7f7;
	padding: 20px;
	text-align: center;
}

.BankFooterContent {
	max-width: 800px;
	margin: 0 auto;
	margin-top: 30px;
	margin-left: -50px;
}

.FooterLinks {
	list-style: none;
	padding: 0;
	margin-bottom: 10px;
}

.FooterLinks li {
	display: inline-block;
	margin-right: 10px;
}

.FooterLinks li:last-child {
	margin-right: 0;
}

.FooterLinks a {
	color: #333;
	text-decoration: none;
	font-size: 14px;
}

.FooterDescription {
	color: #666;
	font-size: 12px;
}

.ContactItem {
	width: 250px;
	height: 40px;
	position: absolute;
	margin-right: 150px;
	right: 0;
}

.ContactTitle {
	width: 50px;
	height: 20px;
	text-align: right;
	color: #009591;
	font-size: 14px;
	font-family: Noto Sans KR;
	font-weight: 350;
	line-height: 10px; /* Increase line-height to add spacing */
	word-wrap: break-word;
	position: absolute;
	top: 2px;
	right: 30px;
}

.ContactNumber {
	width: 122.17px;
	height: 36px;
	text-align: right;
	color: #333333;
	font-size: 24px;
	font-family: Noto Sans KR;
	font-weight: 350;
	line-height: 24px;
	word-wrap: break-word;
	position: absolute;
	top: 19px;
}

.ContactNumber.Strong15881111 {
	left: 0;
	right: 30px;
}

.ContactSeparator {
	width: 9.12px;
	height: 36px;
	text-align: right;
	color: #DDDDDD;
	font-size: 24px;
	font-family: Noto Sans KR;
	font-weight: 350;
	line-height: 24px;
	word-wrap: break-word;
	position: absolute;
	top: 19px;
	left: 124.68px;
}

.ContactNumber.Strong15991111 {
	left: 105px;
}
</style>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="header">
		<!-- 메뉴바 내용 -->
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<c:url var="logoUrl" value="/hanabank.jpg" />
				<a class="navbar-brand" href="mainHana.jsp"> <img
					src="${logoUrl}" alt="로고" class="logo-img">
				</a>

				<div class="collapse navbar-collapse justify-content-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="innerAccount.jsp">계좌조회</a></li>
						<li class="nav-item"><a class="nav-link"
							href="accountTransferInner.jsp">계좌이체</a></li>
						<li class="nav-item"><a class="nav-link"
							href="makeAccountSelect.jsp">계좌개설</a></li>
						<li class="nav-item"><a class="nav-link"
							href="transferInfo.jsp">거래내역조회</a></li>
						<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
						<li class="nav-item"><a class="nav-link" href="mypage.jsp">마이페이지</a></li>
						<li class="nav-item" style="margin-right: -30px;"><a
							class="nav-link" href="login.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="signin.jsp">회원가입</a></li>
					</ul>
				</div>

				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</nav>

	</div>
	<hr class="navbar-divider">


	<div class="section1">

		<div class="login">

			<div class="title">
				다시 돌아온 것을 환영합니다. <br>로그인을 시작하고 더 많은 서비스를 사용하세요!
			</div>
		</div>
	<div class="container-login">
  <h2>로그인</h2>
  <div class="row justify-content-center">
    <div class="login-form">
      <form action="login" method="post">
        <div class="form-group">
          <label for="username">사용자 이름:</label>
          <input type="text" name="username" id="username" placeholder="사용자 이름을 입력하세요." required>
        </div>
        <div class="form-group">
          <label for="password">비밀번호:</label>
          <input type="password" name="password" id="password" placeholder="비밀번호를 입력하세요." required>
        </div>
        <div class="button-container">
          <input type="submit" value="로그인" class="btn btn-primary">
        </div>
      </form>
      <div class="logo-container text-center">
        <c:url var="logoUrl" value="/kakao_login_medium_narrow.png" />
        <a class="navbar-brand" href="mainHana.jsp">
          <img src="${logoUrl}" alt="로고" class="logo-img2">
        </a>
      </div>
      <p class="mt-3">
        <a href="#" class="signup-link">회원가입 하러가기</a>
        <a href="mainHana.jsp" class="btn btn-link">메인화면으로 돌아가기</a>
      </p>
    </div>
  </div>
</div>




	</div>


	<footer class="BankFooter">
		<div class="BankFooterContent">
			<ul class="FooterLinks">
				<li><a href="#">이용약관</a></li>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">보안정책</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
			<div class="ContactItem">
				<div class="ContactTitle">고객센터</div>
				<div class="ContactNumber Strong15881111">1588-1111</div>
				<div class="ContactSeparator">/</div>
				<div class="ContactNumber Strong15991111">1599-1111</div>
			</div>

			<p class="FooterDescription">하나은행오픈뱅킹입니다.</p>
		</div>

	</footer>

	<!-- 부트스트랩 JavaScript 연결 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>

