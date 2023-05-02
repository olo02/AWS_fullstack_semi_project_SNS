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
<link href="${pageContext.request.contextPath}/resources/css/membersingup.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<style>
	.final_pw_ck{
		display: none;
	}
	.final_pwck_ck{
		display: none;
	}
	
	.pwck_input_re_1{
		color : green;
		display : none;
	}
	.pwck_input_re_2{
		color : red;
		display : none;
	}
	
	.idCheck3{
	color: #abbcae;
	display: none;
	}

	.idCheck4{
		color: red;
		display: none;
	}
	.form-group i{
		color : #abbcae;
	}
	
</style>

<body>

<div class="container">
      <div class="row">
       <div class="col-md-4 block text-center mt-4 login_logo">
        </div>
        <div class="col-md-4 login-form login-container">
          <form class="login-detail" id="loginform" method="post">
            <h3><img src="${pageContext.request.contextPath}/resources/img/logo_text.png" alt=""></h3>
            <div class="form-group">
            	 <i class="far fa-envelope"></i>
             	 <input type="text" class="form-control mail_input" id="email" name="email" placeholder="이메일 주소">
	             <span class="idCheck1">사용 가능한 이메일입니다.</span>
	             <span class="idCheck2">가입한 이메일이 이미 존재합니다 </span>
	             <span class="mail_warn"></span>
            </div>
            
            <div class="mail_check_wrap">
              <div class="mail_check_input_box" id="mail_check_input_box_false">
             	 <input class="form-control mail_check_input" id="mail_check" name="mail_check" placeholder="인증번호" disabled="disabled">
              </div>
              <div class="mail_check_button">
              	<button type="button" class="email_inset_box">이메일 인증번호 전송</button>
              </div>
              <div class="clearfix"></div>
              <span id="mail_check_input_box_warn"></span>
            </div> 
            
            <div class="form-group name_wrap">
              <i class="far fa-smile-wink"></i>
              <input type="text" class="form-control name_input" id="name" name="name" placeholder="사용자 이름">
			</div>
            <div class="form-group id_wrap">
              <i class="far fa-smile"></i>
              <input type="text" class="form-control id_input" id="id" name="id" placeholder="사용자 닉네임">
              <span class="idCheck3">사용 가능한 닉네임입니다.</span>
	          <span class="idCheck4">가입한 닉네임이 이미 존재합니다 </span>
			</div>
            <div class="form-group pw_wrap">
              <i class="far fa-kiss-beam"></i>
              <input type="password" class="form-control pw_input" id="pw" name="pw" placeholder="비밀번호">
              <span class="final_pw_ck">비밀번호를 입력해주세요</span>
			</div>
            <div class="form-group pw_wrap">
              <i class="fas fa-laugh-wink"></i>
              <input type="password" class="form-control pwck_input" id="pwchk" name="pwchk" placeholder="비밀번호 확인">
              <span class="final_pwck_ck">비밀번호 확인란을 입력해주세요</span>
              <span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
              <span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="form-group forget-password text-center">
				<a href="#">고객님의 소중한 정보를 담소에 담아주세요 !</a>
			</div>
            <div class="form-group">
              <button  id="loginBtn" class="btn btn-lg btn-block bt-sign">가입하기</button>
            </div>
            </form>
            <div class="form-group bt-signup">
              <p>계정이 있으신가요?</p>
              <button type="button" onclick="location.href=('${pageContext.request.contextPath}/member/login');" class="btn btn-sm btn-block bt-login" id="register">로그인</button>
            </div>
        </div>
      </div>
   </div>
<script>
	var code=""; // 이메일전송 인증번호 저장 코드
	var cp = '${pageContext.request.contextPath}';
	// 유효성 검사 
	var mailCheck = false;
	var mailnumCheck = false; 
	
  // 회원가입
  $('.bt-sign').click(function(e){
  	var email = $('#email').val();
  	var id = $('#id').val();
  	var name = $('#name').val();
  	var pw = $('#pw').val();
  	var pwck = $('#pwchk').val();
  	var mail_check = $('#mail_check').val();

	  e.preventDefault();
	  if(email == ""){
		  alert("이메일을 입력해주세요");
		  $("#email").focus();
		return;
	  }else if(id == ""){
		  alert("아이디를 입력해주세요");
		  $("#id").focus();
			return;
	  }else if(pw == ""){
		  alert("비밀번호를 입력해주세요")
		  $("#pw").focus();
		  return
	  }else if(name == ""){
		  alert("이름을 입력해주세요")
		  $("#name").focus();
		  return
	  }
	  else if (pw.length < 8) {
		  alert("비밀번호는 8자 이상이어야 합니다.");
		  return 
	  }else if(pwck == ""){
		  alert("비밀번호 확인을 입력해주세요")
		  $("#name").focus();
		  return
	  }else if(mail_check == ""){
		  alert("인증번호를 입력해주세요");
		  return 
	  }/* else if (emailchk !== emailInput.value) {
		  alert("인증번호를 보낸 이메일 주소와 입력한 이메일 주소가 일치하지 않습니다.");
		  return false;
	  } */
	  else {
		  alert("회원가입을 축하합니다!")
		  $('#loginform').submit();
	  }
  })	
  // 이메일 중복검사 
  $('#email').on("propertychange change keyup paste input", function(){
	  var email = $('#email').val();
	  var data = {email : email};
	  	
		$.ajax({
			type : "post",
			url : cp + "/member/memberIdChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.idCheck1').css("display", "inline-block");
					$('.idCheck2').css("display", "none");
					$('#loginBtn').prop("disabled", false);
					$('.email_inset_box').prop("disabled", false);
					$('.email_inset_box').css("background-color", "white");
				}else {
					$('.idCheck2').css("display", "inline-block");
					$('.idCheck1').css("display", "none");
					$('#loginBtn').prop("disabled", true);
					$('.email_inset_box').prop("disabled", true);
					$('.email_inset_box').css("background-color", "gray");
				}
			}
		}); 
  }); // email check end
  
  // 닉네임 중복검사 
  $('.id_input').on("propertychange change keyup paste input", function(){
	  var id = $('#id').val();
	  var data = {id : id};
		
		$.ajax({
			type : "post",
			url : cp + "/member/memberNickdChk",
			data : data,
			success : function(result){
				if(result != 'fail'){
					$('.idCheck3').css("display", "inline-block");
					$('.idCheck4').css("display", "none");
					$('#loginBtn').prop("disabled", false); 
				}else {
					$('.idCheck4').css("display", "inline-block");
					$('.idCheck3').css("display", "none");
					$('#loginBtn').prop("disabled", true);
				}
			}
		}); 
  }); // email check end
  
  // 비밀번호 확인란 중복검사
  $('.pwck_input').on("propertychange change keyup paste input", function(){
	 	var pw = $('.pw_input').val();
	 	var pwck = $('.pwck_input').val();
	 	$('.final_pwck_ck').css('display', 'none');
	 	
	 	if(pw == pwck){
			$('.pwck_input_re_1').css("display", "block");
			$('.pwck_input_re_2').css("display", "none");
			$('#loginBtn').prop("disabled", false); 
		}else {
			$('.pwck_input_re_1').css("display", "none");
			$('.pwck_input_re_2').css("display", "block");
			$('#loginBtn').prop("disabled", true);
		}
  }) // pw check end 
  
  
  // 이메일 인증번호 전송
  $(".mail_check_button").click(function(){
	  var email = $(".mail_input").val(); // 작성한 이메일
	  var checkBox = $(".mail_check_input"); // 인증번호 입력란
	  var boxWrap = $(".mail_check_input_box"); // 인증번호 입력박스 
	  var warnMsg = $(".mail_warn"); // 이메일 유효성검사 경고
	  
	  if($('.email_inset_box').prop("disabled") == true){
		  alert("가입한 이메일이 존재합니다")
		  return false;
	  }
	  
	  /* 이메일 형식 유효성 검사 */
	    if(mailFormCheck(email)){
	        warnMsg.html("이메일이 전송 되었습니다. 이메일을 확인해주세요.");
	        warnMsg.css("display", "inline-block");
	        $('#email_inset_box').prop("disabled", false); 
	    } else {
	        warnMsg.html("올바르지 못한 이메일 형식입니다.");
	        warnMsg.css("display", "inline-block");
	        $('#email_inset_box').prop("disabled", true);
	        return false;
	    }  
	  
	  $.ajax({
		  type:"GET",
		  url: "mailCheck?email=" + email,
		  success:function(data){
			  checkBox.attr("disabled", false);
			  boxWrap.attr("id", "mail_check_input_true");
			  code = data;
		  }
	  })
	  alert("인증번호를 이메일로 전송하였습니다")
  }) 
  
  // 인증번호 일치여부 
  $(".mail_check_input").blur(function(){
	  var inputCode = $(".mail_check_input").val(); //입력한 코드 
	  var checkResult = $("#mail_check_input_box_warn"); // 일치여부
	  
	  if(inputCode == code){ // 성공했을때
		  checkResult.html("인증번호가 확인되었습니다");
		  checkResult.attr("class", "correct");
		  $('#loginBtn').prop("disabled", false); 
		  mailnumCheck = true;
	  } else if(inputCode !== code || inputCode == "") { // 실패시
		  checkResult.html("인증번호가 일치하지 않습니다 다시 확인해주세요"); 
		  checkResult.attr("class", "incorrect");
		  $('#loginBtn').prop("disabled", true);
		  mailnumCheck = false;
	  }
  })
  
  // 이메일 형식 유효성 검사 
  function mailFormCheck(email){
	  var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	  return form.test(email);
  }
  
</script>
</body>
</html>