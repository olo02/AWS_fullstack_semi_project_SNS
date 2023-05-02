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
			<form method="post" class="modal-content p-3" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
				<div class="col-10 m-auto d-flex flex-row flex-wrap" name="clubcreate-form" id="clubcreate-form">
					<div class="col-12 h-25 my-4 d-flex flex-column align-items-start">
						<label class="memberModify" for="memberModify">비밀번호 변경</label>
						<p class="col-12 h-0 border-0 border-bottom" type="text" id="memberModify" name="memberModify"></p>
					</div>
					<div class="col-6 d-flex flex-column p-3 pt-0 align-items-start">
						<input type="hidden" name="email" value=${member.email}>
						
						<label class="py-2 col-12 idModify" for="newPw">새 비밀번호<i class="fas fa-seedling"></i></label>
						<input type="password" class="border col-12 " type="text" id="pw" name="pw" />
						<span id="newPwMsg"></span>
						
						<label class="py-2 col-12 nameModify" for="pwCheck">새 비밀번호 확인<i class="fas fa-seedling"></i></label>
						<input type="password" class="border col-12" type="text" id="pwCheck" name="pwCheck"/>
						<span id="pwCheckMsg"></span>
					</div>
					<div class="col-12 d-flex justify-content-end pe-3 py-1 mb-2">
						<button class="p-1 px-3 btn border-0 modifyComplete">변경완료</button>
					</div>
				</div>
			</form>
		</div>
	</div>

<script>

// newPW
$("#pw").on('keyup', function(){
	// 공백확인 
	if($("#pw").val() === ""){
		$('#newPwMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
	}
})

// newPw 비밀번호 확인 
$("#pwCheck").on('keyup', function(){
	if($("#pwCheck").val() === ""){
		$('#pwCheckMsg').html('<b>비밀번호 확인은 필수 정보입니다</b>')
	}else if ( $("#pw").val() != $("#pwCheck").val()){
		$('#pwCheckMsg').html('<b>비밀번호가 일치하지 않습니다</b>')
	}else{
		$('#pwCheckMsg').html('<b>비밀번호가 확인 되었습니다 <b>')
	}
})

	
$('.modifyComplete').click(function(e){
	 var pwCheck = $('#pwCheck').val();
	 var user = {pw : pw}
	
	 const newPassword = document.getElementById("pw").value;
	 const confirmPassword = document.getElementById("pwCheck").value;
	 
	// 새 비밀번호 확인
	  if (newPassword.length < 8) {
	    alert("비밀번호는 8자 이상이어야 합니다.");
	    return false;
	  }
	// 비밀번호와 일치여부 확인
	  if (newPassword !== confirmPassword) {
	    alert("새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
	    return false;
	  }
		alert('비밀번호가 변경되었습니다 변경된 이메일로 다시 로그인 해주세요');
	 
	console.log(user);
	$.ajax({
		type:"POST",
		url: "/member/modifyPw",
		data : user
	}) 
})




</script>

</body>
</html>