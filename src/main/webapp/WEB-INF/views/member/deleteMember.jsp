<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담소 - 담아요 소소한 이야기</title>

<!-- Favicon -->
<link href="${pageContext.request.contextPath }/resources/img/favi2.png"
			rel="icon">

<jsp:include page="../layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
</head>

<style>
	input #nowPw{
		border: 1px solid black;
	}
</style>


<body>

<div class="fade" id="profileModifyModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="width: 700px;"
			role="document">
			<form class="modal-content p-3" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
				<div class="col-10 m-auto d-flex flex-row flex-wrap" name="clubcreate-form" id="clubcreate-form">
					<div class="col-12 h-25 my-4 d-flex flex-column align-items-start">
						<label class="memberModify" for="deleteCheck">회원탈퇴 확인</label>
						<p class="col-12 h-0 border-0 border-bottom" type="text" id="memberModify" name="memberModify"></p>
					</div>
					<div class="col-6 d-flex flex-column p-3 pt-0 align-items-start">
						<input type="hidden" name="email" value=${member.email}>
						
						
						<label class="py-2 col-12 nameModify" for="pw">현재 비밀번호 확인<i class="fas fa-seedling"></i></label>
						<input type="password" class="border col-12" type="text" id="pw" name="pw"/>
						<span id="pwCheckMsg"></span>
					</div>
					<div class="col-12 d-flex justify-content-end pe-3 py-1 mb-2">
						<button class="p-1 px-3 btn border-0 delete_member">탈퇴하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<script>

$("#deleteMember").click(function(e){
	  
	
	
})


	
$('.delete_member').click(function(e){
	const checkPassword = $('#pw').val();
    if(!checkPassword || checkPassword.trim() === ""){
        alert("비밀번호를 입력하세요.");
        return false;
    } else if(confirm("작성한 게시물 및 모든 데이터가 지워집니다 회원탈퇴를 진행하시겠습니까?")){
    	$.ajax({
    		url : 'deleteMember',
    		method : 'delete'
    	})
    	alert('회원 탈퇴가 완료되었습니다');
		window.location.href = '/member/login'
	}
})




</script>

</body>
</html>