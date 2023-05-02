<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>		 
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<title>담소 - 담아요 소소한 이야기</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<meta content="" name="keywords">
	<meta content="" name="description">

	<!-- Favicon -->
	<link
			href="${pageContext.request.contextPath }/resources/img/favi2.png"
			rel="icon">

	<%-- 제이쿼리 --%>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.js"></script>


	<!-- Google Web Fonts -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
			href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap"
			rel="stylesheet">
	<link
			href="https://fonts.googleapis.com/css2?family=Hahmlet&display=swap"
			rel="stylesheet">

	<!-- Icon Font Stylesheet -->
	<link
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
			rel="stylesheet">
	<link
			href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
			rel="stylesheet">

	<!-- Libraries Stylesheet -->
	<link
			href="${pageContext.request.contextPath }/resources/lib/owlcarousel/assets/owl.carousel.min.css"
			rel="stylesheet">
	<link
			href="${pageContext.request.contextPath }/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
			rel="stylesheet" />

	<!-- Customized Bootstrap Stylesheet -->
	<link
			href="${pageContext.request.contextPath }/resources/css/bootstrap.min0427.css"
			rel="stylesheet">

	<!-- Template Stylesheet -->
	<link
			href="${pageContext.request.contextPath }/resources/css/style230428.css"
			rel="stylesheet">


	<!-- editor -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/ckeditor.min.js" integrity="sha512-u1sLXXwUefvooLCurgZpkZnSlf4Q3DJ4hIzrpB4mXFdbKsGbcekHI1x2G+ZDSVPj1r2wGnW+takK8AcAVDlqfQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/translations/af.min.js" integrity="sha512-rgMJ9d5QsgyLPmGUJgwHo5XbE690dL8rEuYVauZJEKhhImh1blMLpnS0ybAsOilt2xM14jO+AsTsdQH8ULbQEQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



	<!-- dropdown -->
<%--	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>--%>

  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<script>
		let email = '${member.email}'
		let id = '${member.id}'
		cp = '${pageContext.request.contextPath}/'
	</script>
  	
	<!-- bxslider -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


	<!-- toastr -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<style>
		textarea::placeholder, input::placeholder {
			color: #b1b1b1 !important;
		}
		.nav-item {
			font-size: 17px;
			padding: 7px;
		}

		.sidebar .navbar .navbar-nav .nav-link i{
			width: 40px;
			height: 45px;
			color: rgb(192, 202, 191);
		}
		.top-noti i, .top-club i {
			color: rgb(192, 202, 191);
		}

		.sidebar .navbar .navbar-nav .nav-link:active i, .sidebar .navbar .navbar-nav .nav-link:hover i
		, .top-noti:active i, .top-noti:hover i, .top-club:active i, .top-club:hover i
		{
			color: #454843;
		}

		.main_logo {
			margin: auto;
			margin-left: 0;
			padding: 10px 0 50px 0;
		}

		.sub-nav {
			display: none;
			width: 380px;
			height: 100%;
			z-index: 200;
			position: absolute;
			top: 0;
			background-color: white;
			border: solid #e8e8e8 1px;
			right: -380px;
			border-bottom-right-radius: 20px;
			border-top-right-radius: 20px;
			overflow-y: auto;
		}

		.submenu-title {
			width: 100%;
			height: 180px;
			padding: 30px;
			padding-bottom: 10px;
			margin: 0;
			border-bottom: solid #e8e8e8 2px;
			margin: 0;
		}

		.clublist, .noti-list {
			width: 100%;
			height: 100%;
			flex-direction: column;
		}

		.clublist a {
			width: 100%;
			color: #757575;
		}
		.boardsearch-list {
			width: 100%;
			height: 100%;
			flex-direction: column;
		}

		.boardsearch-list a {
			width: 100%;
			color: #757575;
		}

		.noti-list div {
			color: #757575;
		}

		.select-club {
			font-size: 18px;
			width: 100%;
			height: 70px;
			padding: 10px 30px;
		}

		.submenu-search {
			width: 100%;
			margin: 0 auto;
			flex-direction: column;
			margin-top: 35px;
		}

		.submenu-search input {
			height: 40px;
			border-radius: 7px;
			background-color: #ededed;
			border: none;
			padding: 0 15px 3px;
		}

		.submenu-search i {
			position: absolute;
			right: 14px;
			font-size: 20px;
			top: 9px;
			cursor: pointer;
		}

		.submenu-search i:hover, .clublist a:hover, .noti-list div:hover {
			color: #fdb2b5;
		}

		.select-club img {
			margin-right: 15px;
		}
		
		.nav-noti {
			position: relative;
		}
		.sidebar-noti {
			display : none;
		}
		.noti-block {
			position:relative;
			width: 45px;
			height: 40px;
			background-color:#fdb4b7;
			border-radius: 5px;
		}
		.noti-block::after {
			content:'';
			position: absolute;
			top: 12px;
			left: -20px;
			border: 8px solid transparent; 
			border-right: 12px solid #fdb4b7; 
		}
		::-webkit-scrollbar {
			width:12px;
 			background-color: white;
		}
		::-webkit-scrollbar-thumb {
			width:5px;
			background-color:#cecece;
			border-radius:6px;
		}
		::-webkit-scrollbar-track {
			width:5px;
 			background-color: transparent;
			border-radius:6px;
		}
		.top-board-search::placeholder {
			font-size: 14px
		}
		.pointer {
			cursor:pointer;
		}
		.pointer:hover {
			background-color:#f8f8f8;
		}

	</style>

</head>

<body>
<div class="position-relative bg-white d-flex p-0">

	<!-- Sidebar Start -->
	<div class="sidebar pb-3"
		 style="background-color: white; border-right: #dee2e6 solid 1px">
		<nav class="navbar navbar-light">
			<div class="main_logo d-flex flex-row align-items-center">
				<a href="${pageContext.request.contextPath }/board/feed" class="navbar-logo" > 
					<img src="${pageContext.request.contextPath }/resources/img/logo_text.png"
						id="logoText">
					<img src="${pageContext.request.contextPath }/resources/img/logosmall.png"
						id="logoSmall" >
				</a>
				<!-- 보류 -->
 				<div class="input-group submenu-search topbar-search ms-auto">
					<input class="top-board-search" type="text" placeholder="글 내용 #태그 @작성자 검색"> 
					<i class="fas fa-search"></i>
				</div>
<!-- 				<div class="me-2 ms-3 top-club ms-auto">
					<i class="fa fa-seedling me-2 fa-lg "></i>
				</div> -->
				<div class="me-2 ms-3 top-noti">
					<i class="fas fa-heart me-2 fa-lg"></i>
				</div>
			</div>
			<div class="navbar-nav w-100 dropdown">
				<a href="${pageContext.request.contextPath }/board/feed" class="nav-item nav-link"><i
						class="fas fa-home me-2 fa-lg"></i><span class="nav-text">홈</span></a>
				<a class="nav-item nav-link nav-search"><i
						class="fas fa-search me-2 fa-lg"></i><span class="nav-text">검색</span></a>
				<a class="nav-item nav-link nav-club"> <i
						class="fa fa-seedling me-2 fa-lg "></i> <span class="nav-text">모임</span></a>
				<a class="nav-item nav-link nav-message"><i
						class="fas fa-paper-plane me-2 fa-lg"></i><span class="nav-text">메시지</span></a>
				<a class="nav-item nav-link nav-noti"><i
						class="fas fa-heart me-2 fa-lg"></i><span class="nav-text">알림</span>
						<div class="sidebar-noti">
							<div class="noti-block d-flex align-items-center justify-content-center">
								<div class="small" id="notiCnt" style="color:white"></div>
							</div>
						</div>
				</a>
				<a class="nav-item nav-link"><i
						class="far fa-plus-square me-2 fa-lg"></i><span class="nav-text">만들기</span></a>
				<a href="${pageContext.request.contextPath }/member/profile/${member.email}/damso"class="nav-item nav-link"><i
						class="fas fa-user-circle me-2 fa-lg"></i><span class="nav-text">프로필</span></a>
			</div>
		</nav>
		
		<div class="sub-nav">
			<!-- 모임 탭 화면 -->
			<div class="club-submenu" style="display:none">
				<div class="submenu-title">
					<h4 class="float-start pb-4 mb-4">모임</h4>
					<a class="club-create float-end mt-1">
						<i class="fas fa-seedling"></i> 모임 만들기
					</a>
					<div class="input-group submenu-search">
						<input class="club-search" type="text" placeholder="모임 이름 검색"> <i
							class="fas fa-search"></i>
					</div>
				</div>
				<div class="clublist media">
					<div class="clublist-title p-4 pb-3 fw-bold">나의 모임</div>
				</div>
			</div>
			
			<!-- 검색 탭 화면 -->
			<div class="search-submenu" style="display:none">
				<div class="submenu-title">
					<h4 class="float-start pb-4 mb-4">검색</h4>
					<div class="input-group submenu-search">
						<input class="board-search" type="text" placeholder="글 내용 #태그 @작성자 검색"> <i
							class="fas fa-search"></i>
					</div>
				</div>
				<div class="boardsearch-list media">
					<div class="boardsearch-title p-4 pb-3 fw-bold">최근 검색</div>
				</div>
			</div>
			
			<!-- 알림 탭 화면 -->
			<div class="noti-submenu" style="display:none">
				<div class="submenu-title" style="height:107px">
					<h4 class="float-start pb-4 mb-4">알림</h4>
				</div>
				<div class="noti-list media">
					<div class="noti-title p-4 pb-3 fw-bold">최근 알림</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Sidebar End -->

	<div class="modal fade" id="attachModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
				<div class="col-12 text-center" style="height: 50px">
					새 게시물 만들기
				</div>
				<div class="justify-content-center align-middle" style="height: 400px">
					<button class="btn btn-primary">사진 선택</button>
				</div>
			</div>
		</div>
	</div>


	<!-- 글쓰기 폼 Start -->
	<div class="modal fade" id="write-modal" tabindex="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
				<div class="col-12" style="height: 38px">
					<a> <i class="fas fa-arrow-left float-start pt-2"
						   style="font-size: 22px; padding-left: 10px"></i>
					</a>
					<button type="button" id="register" class="float-end btn text-primary" style="padding: 8px 12px 0">글쓰기</button>
				</div>
				<div id="imgInsert" class="col-7 align-items-md-center" style="display: flex; justify-content: space-evenly;">
					<label for="file"><span class="btn btn-primary">사진 선택</span></label>
					<input type="file" class="form-control" id="file" name="file" style="display: none">
				</div>
				<div class="col-5">
					<div class="media p-3">
						<div class="d-flex">
							<!-- 프사가 있는 경우 -->
							<c:if test="${not empty member.attaches[0].uuid}">
		  					<img class="write-img "
								style="background-color: white;"
								src="${pageContext.request.contextPath }/display?aname=${member.attaches[0]['aname']}&path=${member.attaches[0]['path']}&uuid=${member.attaches[0]['uuid']}&image=${member.attaches[0]['image']}&thumb=on"
								alt="Image">	
							</c:if>
							<!-- 프사가 없는 경우 -->
							<c:if test="${empty member.attaches[0].uuid}">
							<img class="write-img rounded-circle" src="${pageContext.request.contextPath }/resources/img/favi.png" alt="Image">
							</c:if>
						</div>
						<div class="media-body" style="padding-top: 2px">
							<%--${member.email} : email을 id로 변경--%>
							<span class="">${member.id}</span>
						</div>
					</div>
					<div>
						<textarea id="board-content" placeholder="소소한 이야기를 담아보세요"></textarea>
					</div>
					<div class="write-option">
						<span class=" float-start pt-1 ps-3">위치 추가</span><i
							class="fas fa-map-marker-alt float-end p-3"
							style="margin-top: -8px"></i>
					</div>
					<div class="write-option"
						 style="height: 45.6px">
						<span class=" float-start pt-2 ps-3">태그 추가</span><i
							class="fas fa-hashtag float-end p-3" style="margin-top: -2px"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 글쓰기 폼 End -->
	
	
	<!-- 모임 만들기 폼 Start -->
	<div class="modal fade" id="clubcreate-modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="width: 700px;"
			role="document">
			<div class="modal-content p-3" style="flex-direction: row; flex-wrap: wrap; border-radius: 10px;">
				<div class="col-12 px-3 py-2 fw-bold" style="color:#2b2b2b;">
					<i class="fas fa-seedling pe-2"></i>모임 만들기
				</div>
				<form class="col-10 m-auto d-flex flex-row flex-wrap" name="clubcreate-form" id="clubcreate-form">
					<div class="col-12 h-25 my-4 d-flex flex-column align-items-start">
						<label class="" for="cname">모임 이름</label>
						<input class="col-12 h-75 p-2 border-0 border-bottom" type="text" id="cname" name="cname"
						placeholder="모임 이름을 입력해 주세요">
					</div>
					<label for="clubProfileAttach" class="col-6">
						<div class="club-attach bg-light mb-4 d-flex justify-content-center align-items-center"
						style="max-width:280px ; height: 280px; cursor:pointer; overflow:hidden">
							<i class="fas fa-image fs-3"></i>
						</div>
					</label>
					<input type="file" id="clubProfileAttach" style="display : none">

					<div class="col-6 d-flex flex-column p-3 ps-4 pt-0 align-items-start">
						<label class="py-2 col-12" for="intro">모임 소개</label>
						<textarea class="h-25 border col-12 p-2" id="intro" name="intro"></textarea>
						<label class="py-2 col-12" for="town">모임 동네</label>
						<input class="border col-12 py-1 px-2" type="text" id="town" name="town">
						<label class="py-2 col-12" for="question">모임 가입 질문</label>
						<input class="border col-12 py-1 px-2" type="text" id="question" name="question">
						<div class="col-12 py-2 mt-2 d-flex align-items-center justify-content-end">
							<label class="py-2 pe-2" for="status">비밀 모임 설정</label>
							<input class="pt-1" type="checkbox" id="status" name="status" style="width:16px; height:16px;">
						</div>
						<input type="hidden" id="cleader" name="cleader">
					</div>
					<div class="col-12 d-flex justify-content-end py-1 mb-3">
						<button class="p-2 px-3 btn border-0 bg-light">만들기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 모임 만들기 폼 End -->
	
	

	<script> let cp = '${pageContext.request.contextPath}/'</script>
	<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/club.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/notification.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>

	<script>
		let awsPath = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}"+ cp +"notification"
		let aws = new WebSocket(awsPath)

		$(function() {
			toastr.options = {
				"closeButton": false,
				"debug": false,
				"newestOnTop": false,
				"progressBar": false,
				"positionClass": "toast-bottom-right",
				"preventDuplicates": false,
				"showDuration": "100",
				"hideDuration": "1000",
				"timeOut": "2000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
			}

			aws.onopen = function (ev) {
				console.log("notification 연결", ev);
			}

			aws.onclose = function (ev) {
				console.log("notification 종료", ev);
			}

			aws.onmessage = function (ev) {
				console.log(ev.data)

				let obj = JSON.parse(ev.data);
				console.log("type :: " + obj.type);
				console.log("sender :: " + obj.sender);
				console.log("receiver :: " + obj.receiver);
				console.log("bno :: " + obj.bno);


				toastr.options.onclick = function () {
					if (obj.type === 'chat') {
						location.pathname = "/message/direct"
					} else {
						$(".sub-nav").css('display', 'block')
						$(".noti-submenu").css('display', 'block')
						notificationList()
					}
				}

				if (obj.sender !== obj.receiver && '${member.id}' === obj.receiver) {
					if (obj.type === 'like') {
						console.log(obj.sender + "님이 회원님의 게시물을 좋아합니다")
						toastr.info(String(obj.sender) + "님이 회원님의 게시물을 좋아합니다").css('paddingLeft', '15px').css('opacity', '1 !important').addClass('bg-white').addClass('text-dark').removeClass('toast-info')
					} else if (obj.type === 'reply') {
						console.log(obj.sender + "님이 회원님의 게시물에 댓글을 남겼습니다")
						toastr.info(String(obj.sender) + "님이 회원님의 게시물에 댓글을 남겼습니다").css('paddingLeft', '15px').css('opacity', '1 !important').addClass('bg-white').addClass('text-dark').removeClass('toast-info')
					} else if (obj.type === 'clubRegister') {
						console.log(obj.sender + "님이 모임에 가입했습니다")
						toastr.info(String(obj.sender) + "님이 모임에 가입했습니다").css('paddingLeft', '15px').css('opacity', '1 !important').addClass('bg-white').addClass('text-dark').removeClass('toast-info')
					} else if (obj.type === 'chat' && location.pathname !== '/message/direct') {
						toastr.info(String(obj.sender) + " : " + obj.chatContent).css('paddingLeft', '15px').css('opacity', '1 !important').addClass('bg-white').addClass('text-dark').removeClass('toast-info')
					} else if (obj.type === 'follow') {
						toastr.info(String(obj.sender) + "님이 회원님을 팔로우했습니다").css('paddingLeft', '15px').css('opacity', '1 !important').addClass('bg-white').addClass('text-dark').removeClass('toast-info')
					}
					
					notificationList()
					$("#notiCnt").html(obj.uncheckList.length)
				}
				
				if(obj.uncheckList.length != 0){
					$(".sidebar-noti").css("display", "block")
				} else {
					$(".sidebar-noti").css("display", "none")
				}
			}

			moment.locale('ko')
			
			
	
	/*-------------------------- 탭 토글 -------------------------- */			
			function allNavClose() {
				if($(".sub-nav").css('display') == 'block'){
					$(".sub-nav").children().css('display', 'none')
				}
			}
	
			// 검색 탭 선택 화면 토글
			$(".nav-search").click(function() {
				if($(".search-submenu").css('display') == 'none') {
					allNavClose();
					$(".sub-nav").css('display', 'block')
					$(".search-submenu").css('display', 'block')
				} else {
					allNavClose();
					$(".sub-nav").css('display', 'none')					
					$(".search-submenu").css('display', 'none')
				}
			})
			
			// 모임 탭 선택 화면 토글
			$(".nav-club").click(function() {
				if($(".club-submenu").css('display') == 'none') {
					allNavClose();
					$(".sub-nav").css('display', 'block')
					$(".club-submenu").css('display', 'block')
				} else {
					allNavClose();
					$(".sub-nav").css('display', 'none')					
					$(".club-submenu").css('display', 'none')
				}
			})

			// 알림 탭 선택 화면 토글
			$(".nav-noti").click(function() {
				if($(".noti-submenu").css('display') == 'none') {
					allNavClose();
					$(".sub-nav").css('display', 'block')
					$(".noti-submenu").css('display', 'block')
				} else {
					allNavClose();
					$(".sub-nav").css('display', 'none')					
					$(".noti-submenu").css('display', 'none')
					$(".search-submenu").css('display', 'none')
				}
			})
			
			// 사이드 탭 외의 영역 클릭시 탭 닫기
			$("body > div *").on("click", ":not(.sidebar *)", function() {
				allNavClose()
				$(".sub-nav").css('display', 'none')
				$(".noti-submenu").css('display', 'none')
				$(".club-submenu").css('display', 'none')
			})

			// DM 탭 선택 화면
			$(".nav-message").click(function() {
				location.href = cp + "message/direct"
			})


	/*-------------------------- 회원 탭-------------------------- */
			function getMyMemberListStr(obj){
				let profileImg = obj.attaches[0].uuid;
				let profileImgOn = profileImg ? `<img class="img-fluid rounded-circle m-0 me-3" data-value="\${obj.attaches[0].uuid}"
						 src="${pageContext.request.contextPath }/display?aname=\${obj.attaches[0]['aname']}&path=\${obj.attaches[0]['path']}&uuid=\${obj.attaches[0]['uuid']}&image=\${obj.attaches[0]['image']}&thumb=on"
						 alt="Image">` : `<div class="img-fluid rounded-circle bg-light m-0 me-3 sideClubProfile" style="width:48px; height:48px">
						 <i class="fas fa-user ps-1" style="font-size: 45px; color: white; padding-top:10px"></i></div>`;
				
				return `
					<a href= "${pageContext.request.contextPath }/member/profile/\${obj.email}/damso">
						<div class="select-club d-flex align-items-center justify-content-between" style="font-size:16px">
						\${profileImgOn}
						<span style="display:inline-flex; width:190px">\${obj.id}</span>
						<div class="privateClub ms-auto px-2"></div>
						<div class="clubleader"></div>
						</div>
					</a>`;
			}

			/* 회원 검색하기 */
			$(".board-search").on("input", function() {
				let id = $(".board-search").val();
				$(".boardsearch-list").html('<div class="boardsearch-title p-4 pb-3 fw-bold" style="color:#72a3d4">검색 결과</div>');
				memberservice.searchName({id: id}, function(result) {

						for(let i in result){
							var str = '';
							str = getMyMemberListStr(result[i]);
							console.log(str)
							$(".boardsearch-list").append(str);
						}
				})
			})

	/*-------------------------- 모임 탭-------------------------- */
			
	
			/* 모임 검색하기 */		
			$(".club-search").on("input", function() {
				
				let keyword = $(".club-search").val();
				
				$(".clublist").html('<div class="clublist-title p-4 pb-3 fw-bold" style="color:#72a3d4">검색 결과</div>');
				clubService.searchName({keyword: keyword}, function(result) {

					if(keyword == ""){
						clubListPrint();
					}
					else {
						AddClubOption(result)
					}
				})			
			})
	
			function getMyClubListStr(obj){
				let profileImg = obj.attaches[0].uuid;
				let profileImgOn = profileImg ? `<img class="img-fluid rounded-circle m-0 me-3 sideClubProfile" data-value="\${obj.attaches[0].uuid}"
						 src="${pageContext.request.contextPath }/display?aname=\${obj.attaches[0]['aname']}&path=\${obj.attaches[0]['path']}&uuid=\${obj.attaches[0]['uuid']}&image=\${obj.attaches[0]['image']}&thumb=on"
						 alt="Image">` : `<div class="img-fluid rounded-circle bg-light m-0 me-3 sideClubProfile" style="width:48px; height:48px">
						 <i class="fas fa-user ps-1" style="font-size: 45px; color: white; padding-top:10px"></i></div>`;
				return `
					<a href= "${pageContext.request.contextPath }/club/get/\${obj.cno}">
						<div class="select-club d-flex align-items-center justify-content-between" style="font-size:16px">
						\${profileImgOn}						
						<span style="display:inline-flex; width:190px">\${obj.cname}</span>
						<div class="privateClub ms-auto px-2"></div>
						<div class="clubleader"></div>
						</div>
					</a>`;
			}
			
			/* 모임탭 클릭시 : 해당 이용자의 모임 리스트 출력 */
			$(".nav-club").on("click", function() {
				clubListPrint();
			})
			
			function clubListPrint() {
				if('${not empty member}'){
					clubService.getMyClubList({email: encodeURIComponent('${member.email}')}, function(result){
						$(".clublist").html('<div class="clublist-title p-4 pb-3 fw-bold">나의 모임</div>');
						AddClubOption(result);
					})
				}
			}

			function AddClubOption(result) {
				for(let i in result){
					var str = '';
					str = getMyClubListStr(result[i]);
					/* 프로필 사진 유무 처리 작업*/
					if($(document.sideClubProfile).data("value") != null) {
						
						console.log("!")
						$(".sideClubProfile").html("")
					}
					/* 모임장일 경우 클래스 변경 clubleader -> clubleader-on */
  					if(result[i].cleader == '${member.email}'){
						str = str.replace('clubleader', 'clubleader-on')
 					}
					if(result[i].status == 1){
						str = str.replace('privateClub', 'privateClub-on')
					}
					$(".clublist").append(str);
				}

				/* 모임장 아이콘 추가 */
				$(".clubleader-on").html('<i class="fas fa-crown"></i>');
				/* 비밀클럽 아이콘 추가 */
				$(".privateClub-on").html('<i class="fas fa-lock"></i>');
			}


			/* 모임 만들기 클릭 -> 모달 show*/
			$(".club-create").on("click", function() {
				$("#clubcreate-modal").modal("show")
			})	
			
			/* 모임 만들기 모달 닫힐 때 초기화 */
			$("#clubcreate-modal").on('hidden.bs.modal', function () {
				$(".club-attach").empty().html('<i class="fas fa-image fs-3"></i>');
				$("#clubcreate-modal input[type='file']").val('')
				$("#clubcreate-modal input").val('')
				$("#clubcreate-modal textarea").val('')
			})
			
			/* 모임 만들기 모달 -> form submit 이벤트 */	
			$("#clubcreate-form").submit(function() {
				event.preventDefault();
					
				/* status의 체크유무 값이 받아와지지 않아서 만든 조건식 */
				let checked = $("#status").is(':checked');
				if(checked){
					$("#status").val('true')
				} else {
					$("#status").val('false')
				}

 	  			if($(".club-attach").find("li").length != 0){
				
					let attaches = [];
					attaches.push({
						aname : $(".club-attach li").data("aname"),
						path : $(".club-attach li").data("path"),
						uuid : $(".club-attach li").data("uuid"),
						image : $(".club-attach li").data("image")
					})
	 	  			clubService.register({
						cname : $("#cname").val(),
						intro : $("#intro").val(),
						cleader : '${member.email}',
						town : $("#town").val(),
						status : $("#status").val(),
						question : $("#question").val(),
		 				attaches : attaches
	 				}
	 	  			, function(result) {
	 					clubMemberService.register({
							member : result.cleader,
							club : result.cno
						}, function(resultCM) {
							$(".clublist").append(getMyClubListStr(result))
	 						$("#clubcreate-modal input[type='file']").val('')
	 						$("clubcreate-modal input").val('')
			 				location.href = cp + "club/get/" + result.cno
						})
					})
 	  			} else {
	 	  			clubService.register({
						cname : $("#cname").val(),
						intro : $("#intro").val(),
						cleader : '${member.email}',
						town : $("#town").val(),
						status : $("#status").val(),
						question : $("#question").val()
 					}
	 	  			, function(result) {
	 					console.log(result)
	 					clubMemberService.register({
							member : result.cleader,
							club : result.cno
						}, function(resultCM) {
	 						$("#clubcreate-modal input[type='file']").val('')
	 						$("clubcreate-modal input").val('')
			 				location.href = cp + "club/get/" + result.cno
						})
					})
 	  			}
				$("#clubcreate-modal").modal("hide")
			})


			// 모입 생성에서 파일 업로드시 이벤트
			$("#clubProfileAttach").on("change", function () {
				event.preventDefault();
				let files = $(this).get(0).files;
				console.log(files);

				if (!checkExtension(files)) {
					alert("조건 불일치")
					return false;
				}

				let formData = new FormData();

				for (let i in files) {
					console.log(files[i])
					formData.append("files", files[i])
				}

				$.ajax({
					url : cp + "uploadAjax",
					method : "post",
					processData: false,
					contentType : false,
					data : formData,
					success : function (data) {
						console.log(data)
						showClubProfileUpload(data)
					}
				})
			})
			
			// 업로드한 파일 보이기
			function showClubProfileUpload(result) {
				let imgStr = "";
				result.thumb = "on";
				
				console.log(result)
				
				for(let i in result) {
					let obj = result[i];
					obj.thumb = "on";
					let params = new URLSearchParams(obj).toString();
					
					if (obj.image) {
						obj.thumb = "off";
						let params2 = cp + new URLSearchParams(obj).toString();
						imgStr += '<li class="nav-item m-0 p-0" data-uuid="' + obj.uuid +'" data-aname="' + obj.aname + '" data-path="' + obj.path + '" data-image="' + obj.image + '" style="list-style: none"><a class="img-thumb"><img class="img-thumbnail" src="${pageContext.request.contextPath}/display?' + params  + '" data-src="'+ params2 +'" ></a></li>';
					}
				}
				console.log(imgStr)
				$(".club-attach").empty().html(imgStr);
			}
			

			/*-------------------------- 알림 탭-------------------------- */
			notiService.uncheckNoti({email: email}, function (result) {
				if (result.length != 0) {
					$("#notiCnt").text(result.length)
				}
			})

			$(".nav-noti").on("click", notificationList())

			function notificationList() {
				let str = "";
				notiService.uncheckNoti({email: '${member.email}'}, function (result) {
					$(".noti-list > *:not(:first)").empty();
					console.log(result)
					for (let i in result) {
						console.log(result[i])
						str = getNoti(result[i])
						$(".noti-list").append(str)
					}
				})
			}

			$(".noti-list").on("click", "a", function () {
				event.preventDefault();
				let $this = $(this)
				let type = $(this).data("type")
				var rno = '${reply.rno}'

				if (type == "clubRegister") {
					console.log("클럽 가입 알림")
					location.href = cp + "club/get/" + $this.data("cno");
				} else if (type == "like" || type == "reply") {
					console.log("좋아요 알림")

					boardService.get($this.data("bno"), function (result) {
						console.log($this.data("bno"))
						console.log(result)
						$("#boardModal").modal("show").data("bno", result.bno)
						$("#writer").text(result.writer)
						$("#content").text(result.content)
						$("#regdate").text(moment(result.regdate).startOf('day').fromNow())
						$("#detailImage").attr("src", "${pageContext.request.contextPath}/display?aname=" + result.attaches[0]['aname'] + "&path=" + result.attaches[0]['path'] + "&uuid=" + result.attaches[0]['uuid'] + "&image=" + result.attaches[0]['image'] + "&thumb=on")

						replyService.getList({bno:$("#boardModal").modal("show").data("bno"), rno:rno}, function(result) {
							var str = "";
							for(var i in result) {
								str += getReplyLiStr(result[i]);
							}
							$(".chat").html(str);
						})
					})
				} else if (type == 'follow') {
					location.href = cp + "member/profile/" + $this.data("sendemail") + "/damso";
				}

				notiService.check({nno : $(this).data("nno")}, function (result) {
					$this.remove()
				})

				notiService.uncheckNoti({email: email}, function (result) {
					$("#notiCnt").text(result.length)
				})
			})

			function getNoti(obj) {
				let comment = "";
				switch (obj.type) {
					case 'like' :
						comment = obj.sender + "님이 회원님의 게시물을 좋아합니다"
						break;

					case 'clubRegister' :
						comment = obj.sender +'님이 모임에 가입했습니다';
						break;

					case 'reply' :
						comment = obj.sender + '님이 회원님의 게시물에 댓글을 남겼습니다'
						break;

					case 'follow' :
						comment = obj.sender + '님이 회원님을 팔로우하기 시작했습니다'
						break;

					default :
						comment = '알림'
				}

				return `
					<a data-nno="\${obj.nno}" data-type="\${obj.type}" data-cno="\${obj.cno}" data-bno="\${obj.bno}" data-sendemail="\${obj.senderEmail}">
						<div class="select-club d-flex align-items-center justify-content-between" style="font-size:16px">
						<span style="display:inline-flex; width:100%">\${comment}</span>
						<div class="privateClub ms-auto px-2"></div>
						</div>
					</a>`;
			}

			// 댓글 리스트 조회
			function getReplyLiStr(obj) {
				let hasLike = obj.likeOn;
				let like = hasLike ? 'fas text-red' : 'far';
				return `<li class="list-group-item" data-rno="\${obj.rno}">
					<div class="header">
						<a >
							<img class="write-img" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
						</a>
						<strong class="primary-font" data-writer="\${obj.writer}">&nbsp;\${obj.writer}</strong>
						<small class="float-right text-muted">\${moment(obj.regdate).fromNow()}</small>
					</div>
					<div class="d-flex">
						<div class="col-9">
							<span class="reply-content" data-content="\${obj.content}">\${obj.content}</span>
						</div>
						<div class="dropdown col-2 float-left" >
							<a class="btn" data-toggle="dropdown">
								<i class="fas fa-ellipsis-h dropicon" style="color: white"></i>
							</a>
							<div class="dropdown-menu">
								<a class="dropdown-item replymodify">수정</a>
								<a class="dropdown-item text-danger replydelete">삭제</a>
							</div>
						</div>
						<div class="col-2">
							<a><i class="heart fa-heart \${like} " data-rno="\${obj.rno}" ></i></a></div>
					</div>
					<div>
						<p style="margin-bottom:5px; font-size:13px">좋아요 <span class="likeCnt">\${obj.likecnt}</span>개</p>
					</div>
				</li>`
			};


			/*-------------------------- 만들기 탭-------------------------- */

			// 만들기(글 쓰기) 탭 클릭 이벤트
			$(".fa-plus-square").closest("a").click(function () {
				event.preventDefault();

				$("#write-modal").modal("show")
				$("#write-modal").on("click", "#register:not(.btn-modify)", function () {
					event.preventDefault()

					let attaches = [];
					$("#imgInsert li").each(function (i, obj) {
						attaches.push({
							aname : $(this).data("aname"),
							path : $(this).data("path"),
							uuid : $(this).data("uuid"),
							image : $(this).data("image")
						})
					})

					// if (!($("#imgInsert li").length)) {
					// 	alert("사진을 추가해주세요!")
					// 	return false;
					// }

					boardService.register({content : $("#board-content").val(), writer : '${member.email}', category : null, attaches : attaches}, function (result) {
						$("#write-modal").modal("hide")

						boardService.get(result, function (data) {
							$(".boards").prepend(getBoardLiStr(data))
						})
					})
					$("#board-content").val("")
					let input = `
						<label for="file"><span class="btn btn-primary">사진 선택</span></label>
						<input type="file" class="form-control" id="file" name="file" style="display: none">
					`
					$("#imgInsert").empty().html(input);

					/* if(위치가 board/feed가 아니라면) board/feed로 이동하게 하기 */
					if (location.pathname !== "/board/feed") {
						location.href = cp + "board/feed"
					}
				})
			})

			$("#write-modal").on('hidden.bs.modal', function () {
				$("#board-content").val("")
				let input = `
						<label for="file"><span class="btn btn-primary">사진 선택</span></label>
						<input type="file" class="form-control" id="file" name="file" style="display: none">
					`
				$("#imgInsert").empty().html(input);

				$("#write-modal input[type='file']").val('')
			})

			function showUploadedFile(uploadResultArr) {
				// let str = "";
				let imgStr = "";
				for(let i in uploadResultArr) {
					let obj = uploadResultArr[i];
					obj.thumb = "on";
					let params = new URLSearchParams(obj).toString();
					// str += `<li class='list-group-item' data-uuid='\${obj.uuid}' data-name='\${obj.name}' data-path='\${obj.path}' data-image='\${obj.image}'><a href='/download?` + params + `'><i class='far fa-file'></i> `
					// str += obj.name + "</a> <i class='far fa-times-circle btn-remove' data-file='" + params + "' style='cursor:pointer'></i> </li>"
					if (obj.image) {
						obj.thumb = "off";
						let params2 = cp + new URLSearchParams(obj).toString();
						imgStr += '<li class="nav-item m-2" data-uuid="' + obj.uuid +'" data-aname="' + obj.aname + '" data-path="' + obj.path + '" data-image="' + obj.image + '" style="list-style: none"><a class="img-thumb"><img class="img-thumbnail" src="${pageContext.request.contextPath}/display?' + params  + '" data-src="'+ params2 +'" ></a></li>';
					}
				}
				// 내부적으로 스트림 사용
				$("#imgInsert").empty().html(imgStr);
				// $(":file").get(0).reset()
			}

			function checkExtension(files) {
				const MAX_SIZE = 5 * 1024 * 1024;
				const EXCLUDE_EXT = new RegExp("(.*?)\.(js|jsp|asp|php)");

				for (let i in files) {
					if (files[i].size >= MAX_SIZE || EXCLUDE_EXT.test(files[i].name)) {
						return false;
					}
				}
				return true
			}

			$("#imgInsert").on("change", "input[type='file']", function () {
				event.preventDefault();
				let files = $(this).get(0).files;
				console.log(files);

				if (!checkExtension(files)) {
					alert("조건 불일치")
					return false;
				}

				let formData = new FormData();

				for (let i in files) {
					console.log(files[i])
					formData.append("files", files[i])
				}

				$.ajax({
					url : cp + "uploadAjax",
					method : "post",
					processData: false,
					contentType : false,
					data : formData,
					success : function (data) {
						console.log(data)
						$("form").get(0).reset();
						showUploadedFile(data)
					}
				})
			})

			// 글 쓰기 str 분리
			function getBoardLiStr(obj) {
				let hasLike = obj.likeOn;
				let like = hasLike ? 'fas\" style=\"color: red' : 'far';

				let writerAttach = obj.writerattaches[0];
				let	writerAttachOn = writerAttach ? `<img class="img-fluid rounded-circle" 
						src="${pageContext.request.contextPath}/display?aname=\${obj.writerattaches[0].aname}&path=\${obj.writerattaches[0].path}&uuid=\${obj.writerattaches[0].uuid}&image=\${obj.writerattaches[0].image}&thumb=on" 
						alt="User">` : `<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/resources/img/favi.png" alt="User">`;
				
				return `
			<div class="myboard" data-bno="\${obj.bno}">

				<div class="cardbox-header py-2">

					<div class="float-end">
						<button class="btn btn-flat btn-flat-icon" type="button">
							<i class="fas fa-ellipsis-h" data-writer="\${obj.writer}" data-bno="\${obj.bno}" data-content="\${obj.content}"></i>
						</button>
					</div>

					<div class="media m-0">
						<div class="d-flex mr-3">
							<a href="${pageContext.request.contextPath}/member/profile/\${obj.writeremail}/damso">
							\${writerAttachOn}
							</a>
						</div>
						<div class="media-body">
							<p class="m-0">\${obj.writer}</p>
							<small><span><i class="icon ion-md-pin"></i>
								\${obj.bno}</span></small> <small><span><i
								class="icon ion-md-time"></i>\${moment(obj.regdate).fromNow()}</span></small>
						</div>
					</div>
				</div>
				<div class="cardbox-item">
					<img class="img-fluid"
						 src="${pageContext.request.contextPath}/display?aname=\${obj.attaches[0]['aname']}&path=\${obj.attaches[0]['path']}&uuid=\${obj.attaches[0]['uuid']}&image=\${obj.attaches[0]['image']}&thumb=on"
						 alt="Image" style="width:100%; max-height:587.5px">
				</div>
				<div class="cardbox-base">
					<ul class="board-btnbox">
						<li><a><i data-bno="\${obj.bno}" class="far fa-heart"></i></a></li>
						<li><a><i class="far fa-comment"></i></a></li>
						<li><a><i class="far fa-paper-plane"></i></a></li>
						<li><a><i data-bno="\${obj.bno}" class="far fa-bookmark"></i></a></li>
					</ul>
					<div>
						<p style="margin-bottom:5px">좋아요 \${obj.likecnt}개</p>
					</div>
					<div class="feed-detail" data-bno="\${obj.bno}">
						<a class="feed-writer">\${obj.writer}</a><span class="board-content" style="padding: 5px">\${obj.content}</span>
						<a class="reply-view"><p>댓글 \${obj.replycnt}개 모두 보기</p></a>
					</div>
					<div>
						<input type="text" class="reply-add" placeholder="댓글 달기.." />
					</div>
				</div>
			</div>
			`
			}

			// 댓글 리스트 조회
			function getReplyLiStr(obj) {
				let hasLike = obj.likeOn;
				let like = hasLike ? 'fas\" style=\"color: red' : 'far';
				return `<li class="list-group-item" style="border-bottom: 0" data-rno="\${obj.rno}">
			   		<div class="header">
						<strong class="primary-font" data-writer="\${obj.writer}">\${obj.writer}</strong>
						<small class="float-right text-muted">\${moment(obj.regdate).fromNow()}</small>
					</div>
					<div class="d-flex">
					<div class="col-9">
					<span class="reply-content" data-content="\${obj.content}">\${obj.content}</span>
					</div>
					<div class="dropdown col-2 float-left">
					  <a class="btn" data-toggle="dropdown">
						<i class="fas fa-ellipsis-h dropicon"></i>
					  </a>
					  <div class="dropdown-menu">
					    <a class="dropdown-item">답글 달기</a>
					    <a class="dropdown-item" id="replymodify">수정</a>
					    <a class="dropdown-item text-danger" id="replydelete">삭제</a>
					  </div>
					</div>
					<div class="col-2">
					<a><i class="fa-heart \${like}" data rno="\${obj.rno}" id="heart"></i></a></div>
					</div>
					<div>
					<p style="margin-bottom:5px; font-size:13px">좋아요 <span class="likeCnt">\${obj.likecnt}</span>개</p>
					</div>
					</li>`;
			}


		})
	</script>
	<!-- Content Start -->
	<div class="content d-flex flex-column">