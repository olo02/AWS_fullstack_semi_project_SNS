<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
		 isELIgnored="false"%>

<jsp:include page="../layout/header.jsp"></jsp:include>
<link
		href="${pageContext.request.contextPath }/resources/css/styleBoard_230407.css"
		rel="stylesheet">

<style>
	a {
		cursor: pointer;
	}
	.feed-main {
		display :flex;
		justify-content: center;
	}
	.myfeed {
		max-width: 620px;
	}
	.story {
		height: auto;
		display: flex;
		padding: 45px 0 20px;
		justify-content: space-around;
	}
	.myinfo {
		width: 250px;
		height: 400px;
	}
	.story-img, .media .info-img {
		width: 60px;
		height: 60px;
		border-radius: 50%;
		border: white 2px solid;
		padding: 0;
	}
	.story-active {
		width: 64px;
		height: 64px;
		border-radius: 50%;
		border: #cceabf 2px solid;
	}
	.myboard {
		width : 470px;
		margin: auto;
		padding-top: 30px;
	}
	.board-btnbox {
		margin: 0;
		padding: 10px;
	}
	.board-btnbox li {
		padding-right: 8px;
	}
	.board-btnbox li:nth-of-type(4) {
		float : right;
		padding-right: 0;
		margin-right: -23px;
	}
	.reply-view, .reply-add {
		color: #757575;
		font-size: 15px;
	}
	.reply-view p {
		padding: 5px 0 10px;
		margin:0;
	}
	.reply-add {
		border: none;
		width: 100%;
		margin-left: -2px;
		padding-bottom: 10px;
	}
	.feed-writer, .reply-view:hover, .feed-writer:hover {
		color: #fdb3b6;
	}
	.reply-addbtn {
		float: right;
		background-color: white;
		border: none;
		cursor: pointer;
		color: #757575;
	}

	.write-img {
		border: none !important;
		border-radius: 50%;
		width: 30px !important;
		height: 30px !important;
	}

	textarea {
		border: none;
		width: 100%;
		height: 300px;
		padding: 10px 15px;
		resize: none;
		border-bottom: #e9ecef solid 1px;
	}

	.write-option {
		height: 40px;
		border-bottom: solid 1px #e9ecef;
		cursor: pointer;
	}
	
	.modalscroll {
 		overflow-x: hidden; 
 		overflow-y: auto;
  		height: 412.11px;
 	}
 	
 	.modalscroll::-webkit-scrollbar {
		display: none; /* Chrome, Safari, Opera*/
	}
	.search-main img {
		width: 100%;
		height: auto;
	}
	
</style>

<div class="search-container d-flex flex-column h-100 w-100 align-items-center">

	<div class="col-12 search-main px-3">
		<div class="col-12 d-flex flex-column px-4 justify-content-around" style="">
			
			<div class="d-flex flex-row align-items-end px-5 mt-4">
				<img class="" src="${pageContext.request.contextPath }/resources/img/attach.jpg"
					style="width: 100px; height: 100px; border-radius:50%">
				<div class="d-flex align-items-center pb-2 ps-4">
					<h2 class="pe-4">#구디역</h2>
					<div>1.3만</div>
				</div>	
			</div>
			
			<!-- 검색탭을 여기도 넣을지 말지 고민! 일단 헤더의 검색탭과 클래스 네임 동일 -->
			<div class="input-group submenu-search px-4 pb-5">
				<input class="board-search" type="text" placeholder="글 내용 #태그 @작성자 검색"
					style="height:50px"> 
				<i class="fas fa-search" style="font-size: 24px;top:13px; right:38px"></i>
			</div>
			
			<div class="col-12 d-flex flex-row flex-align-center text-center " style="height:50px">
				<div class="col-3 m-auto py-2 border-bottom border-3">계정</div>
				<div class="col-3 m-auto py-2 border-bottom">모임</div>
				<div class="col-3 m-auto py-2 border-bottom">게시글</div>
				<div class="col-3 m-auto py-2 border-bottom">태그</div>
			</div>
		</div>
		
		<div class="fw-bold p-2 mt-5" style="color:#b1b1b1">최근 게시물</div>
		<!-- 게시글 목록 Start -->
		<div class="col-12 d-flex mt-1 flex-wrap">
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->
			<!-- 게시글 1 Start -->
			<div class="col-4 overflow-hidden">
				<a>
				<img class="p-1" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
				</a>
			</div>
			<!-- 게시글 1 End -->








		</div>
		<!-- 게시글 목록 End -->
	</div>

</div>

<jsp:include page="../layout/footer.jsp"></jsp:include>