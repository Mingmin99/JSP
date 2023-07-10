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
	margin-left: 50px;
}

.navbar-nav .nav-link {
	color: #000000;
}

.navbar {
	padding-top: 10px; /* 헤더 상단 여백 조절 */
	padding-bottom: 10px; /* 헤더 하단 여백 조절 */
}

.navbar-brand {
	margin-left: 50px; /* 로고 이미지와 메뉴 간격 조절 */
}

.navbar-nav {
	margin-left: -50px; /* 메뉴 간격 조절 */
}

.logo-img {
	margin-left: 80px;
	max-width: 100px;
	max-height: 100px;
}

.navbar {
	padding-top: 3px; /* 헤더 상단 여백 조절 */
	padding-bottom: 3px; /* 헤더 하단 여백 조절 */
}

.navbar-divider {
	border-top: 2px solid #009591;
	margin-top: 0;
	margin-bottom: 0;
	width: 100%;
}

/* 제목  */
.section1 {
	background-color: #FFFFFF;
	height: 800px;
}

.title {
	position: absolute;
	text-align: center;
	color: black;
	font-size: 30px;
	font-family: Noto Sans KR;
	left: 400px;
	top: 200px;
	margin-bottom: 20px;
	transform: translate(-50%, -50%);
}

.container {
	width: 80%;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	margin-top: 120px;
}

.form-container {
	background-color: #f8f8f8;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 40px;
	border-radius: 10px;
	max-width: 800px;
	width: 100%;
}

.form-container h2 {
	text-align: center;
	font-size: 24px;
	margin-bottom: 20px;
	color: #333333;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	font-weight: bold;
	margin-bottom: 8px;
	color: #666666;
}

.form-group input[type="text"], .form-group input[type="password"],
	.form-group input[type="checkbox"] {
	width: 100%;
	padding: 12px;
	border: 1px solid #cccccc;
	border-radius: 5px;
	transition: border-color 0.3s ease;
	font-size: 16px;
}

.form-group input[type="text"]:focus, .form-group input[type="password"]:focus,
	.form-group input[type="checkbox"]:focus {
	outline: none;
	border-color: #009490;
}

.checkbox-group label {
	display: flex;
	align-items: center;
	font-size: 14px;
	color: #666666;
	cursor: pointer;
}

.checkbox-group input[type="checkbox"] {
	margin-right: 5px;
}

.button-container {
	text-align: center;
}

.button-container button {
	background-color: #009490;
	color: #ffffff;
	padding: 12px 24px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.button-container button:hover {
	background-color: #00756d;
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
						<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
						<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
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

		<div class="title">새로운 계좌를 개설해드리겠습니다.</div>

		<div class="container">

			<div class="form-container">
				<form>
					<h2>계좌개설</h2>
					<div class="form-group">
						<label for="product-name">상품명</label> <input type="text"
							id="product-name" name="product-name" required>
					</div>
					<div class="form-group">
						<label for="bank">은행</label> <input type="text" id="bank"
							name="bank" required>
					</div>
					<div class="form-group">
						<label for="account-nickname">계좌 별명</label> <input type="text"
							id="account-nickname" name="account-nickname" required>
					</div>
					<div class="form-group">
						<label for="account-password">계좌 비밀번호</label> <input
							type="password" id="account-password" name="account-password"
							required>
					</div>
					<div class="form-group">
						<label for="confirm-password">비밀번호 확인</label> <input
							type="password" id="confirm-password" name="confirm-password"
							required>
					</div>
					<div class="checkbox-group">
						<label> <input type="checkbox" name="terms" required>
							약관 동의
						</label>
					</div>
					<div class="button-container">
						<button type="submit">계좌 개설</button>
					</div>
				</form>
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

