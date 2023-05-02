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

<link href="${pageContext.request.contextPath}/resources/css/signUp.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<style>
body {
  font-family: 'Montserrat', sans-serif;
  transition: 3s;
}

.container{
}

.login-container {
  height:400px;
  margin-top: 10%;

  border-radius: 5px;
  /* box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); */
  max-width: 50%;
}

.ads {
  background-color: #A569BD;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  color: #fff;
  padding: 15px;
  text-align: center;
}

.ads h1 {
  margin-top: 20%;
}

#fl {
  font-weight: 600;
}

#sl {
  font-weight: 100 !important;
}

.profile-img {
  text-align: center;
}

.profile-img img {
  border-radius: 50%;
  /* animation: mymove 2s infinite; */
}

@keyframes mymove {
  from {border: 1px solid #F2F3F4;}
  to {border: 8px solid #F2F3F4;}
}

.find-detail {

  padding: 15px;
  border: 1px solid #CCD1D1;
  border-radius: 5px;

}

.login-form h3 {
  text-align: center;
  padding-top: 15px;
  padding-bottom: 15px;
}

.login-form .find_id {
	background-color : #ffeded;
	color : #abbcae;
	font-size : 15px;
  border-radius: 10px;
}
.login-form .forget-password a{
	color : #abbcae;
}

.find-detail{
  padding-top: 60px;
}

.form-control {
  font-size: 14px;
}

.forget-password a {
  font-weight: 500;
  text-decoration: none;
  font-size: 14px;
}

.form-group input::placeholder{
	color: #abbcae;
}

.bt-signup{
  text-align: center;
  margin-top: 10px;
  border: 1px solid #CCD1D1;
  padding: 5px;
  border-radius: 5px;
}

.bt-signup p{
  font-size: 13px;
  color: #abbcae;
  display: inline-block;
  margin-top: 15px;
  margin-bottom: 15px;
}

.bt-signup button{

  margin-left: 10px;
  width: 80px;
  border: 1px solid #abbcae;
  background-color: white;
  color: #abbcae;
  display: inline-block;
}


.row{
	justify-content: center;
}
.login_logo{
	align-self:center;
}

.login_warn{
	margin-top:30px;
	text-align:center;
	color: red;
}

.idCheck1{
	color: #abbcae;
	display: none;
}

.idCheck2{
	color: red;
	display: none;
}

#mail_check_input_box_false{
    background-color:#ebebe4;
}
 
#mail_check_input_box_true{
    background-color:white;
}

.correct{
    color : green;
}
.incorrect{
    color : red;
}

.mail_check_button {
  margin-top: 10px;
  margin-bottom: 10px;
}

.mail_check_button .go_findPw{
  padding: 5px 10px;
  font-size: 13px;
  background-color: white;
  color: #abbcae;;
  border: 1px solid #abbcae;
}

.findPw{
  text-align: center;
}

.findPw p{
  font-size: 12px;
  color:#767c779b;
}

.findPw i{
	font-size:25px;
	color : #abbcae;
}
#findIdBtn{
	margin-top:20px;
}
</style>

<body>

<div class="container">
      <div class="row">
       <div class="col-md-4 block text-center mt-4 login_logo">
        </div>
        <div class="col-md-4 login-form login-container">
          <form class="find-detail" id="findIdForm" method="post" action="/member/findId_result">
            <h3><img src="${pageContext.request.contextPath}/resources/img/logo_text.png" alt=""></h3>
            <div class="findPw">
              <i class="fas fa-unlock-alt"></i>
              <h4>로그인에 문제가 있나요?</h4>
              <p>가입했을때의 사용자 아이디, 사용자 이름을 입력하시면 <br> 가입한 이메일의 일부를 보여드립니다</p>
            </div>
            <div class="form-group">
             	 <input type="text" class="form-control id_input" id="id" name="id" placeholder="가입한 아이디를 입력해주세요">
            </div>
            <div class="form-group">
             	 <input type="text" class="form-control id_name" id="name" name="name" placeholder="가입한 이름을 입력해주세요">
            </div>

              <div class="mail_check_button">
              	<button type="button" onclick="location.href=('${pageContext.request.contextPath}/member/findPw');"  class="go_findPw">비밀번호 찾으러가기</button>
              </div>

        
            <div class="form-group">
              <button id="findIdBtn" class="btn btn-lg btn-block find_id">아이디 찾기</button>
            </div>
            </form>
            <div class="form-group bt-signup">
              <p>계정이 없으신가요?</p>
              <a href="${pageContext.request.contextPath}/member/signup" class="btn btn-sm btn-block bt-login" id="register">회원가입</a>
            </div>
        </div>
      </div>
   </div>
   
   
   
<script>

$(document).ready(function(){
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
});





$("#findIdBtn").click(function(e){
	
  	var id = $('#id').val();
  	var name = $('#name').val();
	  e.preventDefault();
	  if(id == ""){
		  alert("아이디를 입력해주세요");
		  $("#email").focus();
		return;
	  }else if(name == ""){
		  alert("이름을 입력해주세요");
		  $("#id").focus();
			return;
	  }
	  
	if(confirm("아이디를 찾으시겠습니까?")){
		$("#findIdForm").submit();
		return false;
	}
})
 
  
</script>

</body>
</html>