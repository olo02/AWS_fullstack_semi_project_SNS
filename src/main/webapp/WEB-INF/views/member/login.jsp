<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담소 - 담아요 소소한 이야기</title>

<!-- Favicon -->
<link href="${pageContext.request.contextPath }/resources/img/favi2.png"
	rel="icon">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href="${pageContext.request.contextPath }/resources/css/login.css"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${not empty member }">
	<c:redirect url="/board/feed"></c:redirect>
</c:if>

<style>
html, body {
	height: 100%;
}

#auto_login {
	margin-left: 6px;
	margin-bottom: 14px;
}

.auto {
	margin-left: 6px;
	font-size: 15px;
	color: #abbcae;
}

.login_form {
	width: 350px;
}

@media ( max-width : 767px) { /* 		.login_logo {
			display : none;
		} */
}

.login-detail-logo {
	height: 150px;
}

.login-form {
	width: 350px;
}

.login_logo img {
	width: 200px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#loginBtn").click(function() {
			if ($("#email").val() == "") {
				alert("아이디를 입력해주세요");
				$("#email").focus();
				return false;
			} else if ($("#pw").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#pw").focus();
				return false;
			}
		});

		/* 로그인 버튼 클릭 */
		/*  $("#loginBtn").click(function(){
			 	 $("#loginBtn").attr("action", "/login"); 
				$("#loginBtn").submit(); 
		});   */
	});
</script>

</head>
<body>
	<!-- 

수정사항 
04.04 김민수 : 로그인화면수정 ( 메인로고, 너비, 텍스트 ) 
04.05 김민수 : 전체적 크기 조절 

 -->


	<div class="container h-100 d-flex flex-column">
		<div class="h-100 row">
			<div class="login-form login-container my-auto">
				<form class="login-detail" id="loginform" method="post">
					<div
						class="login-detail-logo d-flex justify-content-center align-items-center">
						<img
							src="${pageContext.request.contextPath}/resources/img/logo_text.png">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="email" name="email"
							placeholder="아이디를 입력해주세요">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="pw" name="pw"
							placeholder="비밀번호를 입력해주세요">
					</div>
					<input type="checkbox" name="auto_login" id="auto_login" /> <span
						class="auto">자동 로그인</span>
					<c:if test="${result == 0 }">
						<div class="login_warn">이메일 또는 비밀번호를 잘못 입력하셨습니다</div>
					</c:if>
					<div class="form-group">
						<button id="loginBtn" class="btn btn-lg btn-block bt-login">로그인</button>
					</div>
					<div class="form-group forget-password text-center">
						<a href="${pageContext.request.contextPath}/member/findId">아이디를
							잊어버리셨나요?</a><br> <a
							href="${pageContext.request.contextPath}/member/findPw">비밀번호를
							잊어버리셨나요?</a>
					</div>
				</form>
				<div class="form-group bt-signup">
					<p>아직 계정이 없으신가요?</p>
					<button type="button"
						onclick="location.href=('${pageContext.request.contextPath}/member/signup');"
						class="btn btn-sm btn-block bt-sign" id="register">가입하기</button>
					</span>
				</div>
			</div>
		</div>
		<div class="footer mt-auto">
			<div class="rounded-top p-4">
				<div class="row">
					<div class="col-12 col-sm-6 text-center text-sm-start">
						&copy; DamSo. 담소, All Right Reserved.
					</div>
					<div class="col-12 col-sm-6 text-center text-sm-end">
						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed By <a href="https://htmlcodex.com">HTML Codex</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>