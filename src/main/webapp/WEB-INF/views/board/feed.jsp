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
		padding: 45px 0 20px;
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
	.reply-view, .reply-add, .modal-reply-add {
		color: #757575;
		font-size: 15px;
	}
	.reply-view p {
		padding: 5px 0 10px;
		margin:0;
	}
	.reply-add, .modal-reply-add {
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
 	.d-flex {
 		align-items: center;
	}
	.reply-content {
		margin: 0;
	}
	.text-red {
		color: red;
	}
	.slider-wrapper {
		width:620px;
    }
    .bx-wrapper{
        box-shadow: none;
        border: 0;
        overflow: hidden;
    }
	


</style>

<div class="feed-main">

	<div class="myfeed">
		<div class="slider-wrapper">
			<div class="slider story d-flex flex-row ">
				<div class="d-flex me-3">
					<div class="story-active">
						<a href="">
							<img class="story-img" src="${pageContext.request.contextPath }/resources/img/attach.jpg">
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="boards">
			
		</div>

	</div>



	<div class="myinfo myinfo_moblie">
		<div class="cardbox-header pt-5 ms-4">
			<div class="media">
				<div class="d-flex me-3" style="object-fit: cover; object-position: center">
					<a href="${pageContext.request.contextPath}/member/profile/${member.email}/damso">
						<div class="d-flex feed-profile-img" >
		 					<div class="feedInfoAttach rounded-circle d-flex justify-content-center align-items-center overflow-hidden" 
							style="background-color:#dedede; width:60px; height:60px">
							<!-- 프사가 있는 경우 -->
							<c:if test="${not empty currentMember.attaches[0].uuid}">
		  					<img class="thisclub-img info-img"
								style="background-color: white;"
								src="${pageContext.request.contextPath }/display?aname=${currentMember.attaches[0]['aname']}&path=${currentMember.attaches[0]['path']}&uuid=${currentMember.attaches[0]['uuid']}&image=${currentMember.attaches[0]['image']}&thumb=on"
								alt="Image">	
							</c:if>
							<!-- 프사가 없는 경우 -->
							<c:if test="${empty currentMember.attaches[0].uuid}">
								<img class="bg-light rounded-circle" style="width: 100%; height:auto;" src="${pageContext.request.contextPath }/resources/img/favi.png" alt="Image">
							</c:if>
							</div> 
						</div>
					</a>
				</div>
				<div class="media-body">
					<p class="m-0" style="font-weight: 600">${member.id}</p>
					<p class="m-0">${member.name}</p>
					<a href="${pageContext.request.contextPath}/member/logout" style="font-size:10px;">로그아웃</a>
					세션 ${member }<br>
					현재 ${currentMember }
				</div>
			</div>
		</div>
	</div>
</div>
<%--<script> cp = '${pageContext.request.contextPath}'</script>--%>
<%--<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>--%>
<script>
	$(function () {
		jQuery.fn.serializeObject = function() {
		    var obj = null;
		    try {
		        if ( this[0].tagName && this[0].tagName.toUpperCase() == "FORM" ) {
		            var arr = this.serializeArray();
		            if ( arr ) {
		                obj = {};
		                jQuery.each(arr, function() {
		                    obj[this.name] = this.value;
		                });
		            }
		        }
		    }
		    catch(e) {alert(e.message);}
		    finally  {}

		    return obj;
		};

		var id = '${member.email}';

		moment.locale('ko')
		let str = "";
		var rno = '${reply.rno}';

		boardService.getList({}, function (result) {
			console.log(result)
			for (let i in result) {
				str += getBoardLiStr(result[i])
			}
			$(".boards").html(str)
		});
		

		// 댓글 보기
		$(".boards").on("click", ".myboard .feed-detail", function(replyfunction) {
			console.log($(this).data("id"))
			let src = $(this).data("imagesrc");
			$(".icn-more").css("color", "#009CFF").css("cursor", "pointer");

			boardService.get($(this).data("bno"), function (result) {
				console.log(result)
				$("#boardModal").modal("show").data("bno", result.bno)
				$("#detailImage").attr("src", src)
				$("#writer").text(result.writer)
				$("#content").text(result.content)
				$("#regdate").text(moment(result.regdate).startOf('day').fromNow())
				$("#modalFooter button").show()
				$("#modalFooter button").eq(2).hide()
				$("#boardModal").modal("show").data("bno", result.bno)
				$("#boardModal form [name='bno']").val(result.bno);
				$(".boardWriterAttach").find("a")
					.attr("href", "${pageContext.request.contextPath}/member/profile/" + result.writeremail + "/damso")
				
				if(result.writerattaches[0]){
					$(".boardWriterAttach").find("img")
						.attr("src", "${pageContext.request.contextPath}/display?aname=" + result.writerattaches[0].aname 
								+ "&path=" + result.writerattaches[0].path + "&uuid=" + result.writerattaches[0].uuid + "&image=" + result.writerattaches[0].image + "&thumb=on")
				} else {
					$(".boardWriterAttach").find("img")
						.attr("src", "${pageContext.request.contextPath}/resources/img/favi.png")					
				}	
				

				replyService.getList({bno:$("#boardModal").modal("show").data("bno"), rno:rno}, function(result) {
					console.log(result)
					var str = "";
					for(var i in result) {
						str += getReplyLiStr(result[i]);
					}
					$(".chat").html(str);
				})
			})
		});


		$(".boards").on("click", ".fa-heart", function () {
			let $this = $(this);
			console.log($(this).data("bno") + " heart")

			if ($this.closest("i").hasClass("fa-heart far") || $this.closest("i").hasClass("far fa-heart")) {
				boardService.insertLike({bno : $(this).data("bno"), id :'${member.email}'}, function (result) {
					$this.closest("i").attr("class", "fas fa-heart").css("color", "red").closest("div").find(".likeCnt").text(parseInt($this.closest("div").find(".likeCnt").text()) + 1);

					notiService.insert({type: 'like', sender : '${member.email}', receiver : $this.closest(".myboard").find(".feed-writer").text(), bno : $this.data("bno")}, function (result) {})

					let msg = "like," + '${member.id}' + "," + $this.closest(".myboard").find(".feed-writer").text() + "," + $this.data("bno")
					aws.send(msg);
				})
			} else {
				boardService.removeLike({bno : $(this).data("bno"), id :'${member.email}'}, function (result) {
					$this.closest("i").attr("class", "far fa-heart").css("color", "#757575").closest("div").find(".likeCnt").text(parseInt($this.closest("div").find(".likeCnt").text()) - 1);
				})
			}
		})

		/* 이미지 더블 클릭 시 좋아요 */
		$(".boards").on("dblclick", ".cardbox-item", function() {
			let $this = $(this);
			console.log($(this).closest(".myboard").data("bno") + " heart")
			let imgheart = $this.parent().find(".fa-heart");
			console.log(imgheart)

			if (imgheart.closest("i").hasClass("fa-heart far") || imgheart.closest("i").hasClass("far fa-heart")) {
				boardService.insertLike({bno : $(this).closest(".myboard").data("bno"), id :'${member.email}'}, function (result) {
					imgheart.closest("i").attr("class", "fas fa-heart").css("color", "red").closest("div").find(".likeCnt").text(parseInt(imgheart.closest("div").find(".likeCnt").text()) + 1);
				})
			} else {
				boardService.removeLike({bno : $(this).closest(".myboard").data("bno"), id :'${member.email}'}, function (result) {
					imgheart.closest("i").attr("class", "far fa-heart").css("color", "#757575").closest("div").find(".likeCnt").text(parseInt(imgheart.closest("div").find(".likeCnt").text()) - 1);
				})
			}
		})

		// 수정, 삭제
		$(".boards").on("click", '.btn-flat-icon:has(.fa-ellipsis-h)', function () {
			let $this = $(this).find(".fa-ellipsis-h");
			console.log("edit modal :: " + $this.data("bno"))
			$("#editModal").data("bno", $this.data("bno"))

			console.log($this.data("writer"))
			console.log('${member.id}')
			console.log($this.data("writer") === '${member.id}')

			if ($this.data("writer") === '${member.id}') {
				$("#editModal").modal("show")
			}
		})

		$("#remove").click(function () {
			$("#editModal").modal("hide")
			$("#removeModal").modal("show");
			$("#removeModal").data("bno", $("#editModal").data("bno"))
		});
		
		$("#removeModal div:first").click(function () {
			boardService.remove($("#removeModal").data("bno"), function (result) {
				$(".boards .myboard").each(function () {
					if ($(this).data("bno") == $("#editModal").data("bno")) {
						$(this).remove()
					}
				})

				$("#removeModal").modal("hide")
			})
		})

		$("#editModal .col-12 div:last").click(function () {
			$("#editModal").modal("hide")
		})

		$("#removeModal div:last").click(function () {
			$("#removeModal").modal("hide")
		})

 		$("#modify").click(function () {
			$("#editModal").modal("hide")
			$("#write-modal").modal("show")
			$("#write-modal").data("bno", $("#editModal").data("bno"));
			boardService.get($("#editModal").data("bno"), function (data) {
				console.log(data)
				imgStr = '<img src="${pageContext.request.contextPath}/display?aname=' + data.attaches[0]['aname'] + '&path=' + data.attaches[0]['path'] + '&uuid=' + data.attaches[0]['uuid'] + '&image=' + data.attaches[0]['image'] + '&thumb=on">'
				$("#imgInsert").empty().html(imgStr)
			})
			console.log($("#write-modal").data("bno"));
			$("#register").text("수정하기").addClass("btn-modify");
			$(".myboard").each(function() {
				if($("#write-modal").data("bno") == $(this).data("bno")) {
					$("#board-content").val($(this).find("i").data("content"));
				}
			})
 		});
		
		
		$(document).on("click", "#register.btn-modify", function () {
			console.log("hello")
			boardService.modify({content : $("#board-content").val(), writer : '${member.email}', bno : $("#write-modal").data("bno")}, function (result) {
				$(".boards .myboard").each(function () {
					if ($(this).data("bno") == $("#write-modal").data("bno")) {
						$this = $(this)
						boardService.get($this.data("bno"), function (data) {
							$this.replaceWith(getBoardLiStr(data))
						})
					}
				})
				$("#write-modal").modal("hide")
				$("#register.btn-modify").removeClass("btn-modify");
			})
		})

		// 글 쓰기 str 분리

		function getBoardLiStr(obj) {
			console.log(obj)
			let hasLike = obj.likeOn;
			let like = hasLike ? 'fas\" style=\"color: red' : 'far';
			
			let writerAttach = obj.writerattaches[0];
			let	writerAttachOn = writerAttach ? `<img class="img-fluid rounded-circle" 
					src="${pageContext.request.contextPath}/display?aname=\${obj.writerattaches[0].aname}&path=\${obj.writerattaches[0].path}&uuid=\${obj.writerattaches[0].uuid}&image=\${obj.writerattaches[0].image}&thumb=on" 
					alt="User">` : `<img class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/resources/img/favi.png" alt="User">`;
			
			let myBoard = obj.writeremail == '${member.email}';
			let isMyBoard = myBoard ?
					`<div class="float-end">
						<button class="btn btn-flat btn-flat-icon myboard-edit" type="button" data-value="\{obj.writeremail}">
							<i data-writer="\${obj.writer}" data-bno="\${obj.bno}" data-content="\${obj.content}" class="fas fa-ellipsis-h"></i>
						</button>
					</div>` : "";
					
			return `
			<div class="myboard" data-bno="\${obj.bno}">
				<div class="cardbox-header py-2">
					\${isMyBoard}
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
						<li><a><i data-bno="\${obj.bno}" class="fa-heart \${like}"></i></a></li>
						<li><a><i class="far fa-comment"></i></a></li>
						<li><a><i class="far fa-paper-plane"></i></a></li>
						<li><a><i data-bno="\${obj.bno}" class="far fa-bookmark"></i></a></li>
					</ul>
					<div>
						<p style="margin-bottom:5px">좋아요 <span class="likeCnt">\${obj.likecnt}</span>개</p>
					</div>
					<div class="feed-detail" data-bno="\${obj.bno}" data-imageSrc="${pageContext.request.contextPath}/display?aname=\${obj.attaches[0]['aname']}&path=\${obj.attaches[0]['path']}&uuid=\${obj.attaches[0]['uuid']}&image=\${obj.attaches[0]['image']}&thumb=on">
						<a class="feed-writer">\${obj.writer}</a><span class="board-content" style="padding: 5px">\${obj.content}</span>
						<a class="reply-view"><p>댓글 \${obj.replycnt}개 모두 보기</p></a>
						<input type="text" class="reply-add" placeholder="댓글 달기.."/>
					</div>
				</div>
			</div>
			`
		}

		let timer;
		document.addEventListener("scroll", () => {
			if (!timer) {
				timer = setTimeout(() => {
					timer = null;
					if ($(window).scrollTop() + $(window).height() > $(document).height() - 2000) {
						boardService.getList({bno : $(".myboard:last").data("bno"), category : null}, function (result) {
							let str = ""
							for (let i in result) {
								str += getBoardLiStr(result[i])
							}
							$(".boards").append(str)
							console.log(result)
						})
					}
				}, 1000);
			}
		})

		// 댓글 리스트 조회
		function getReplyLiStr(obj) {
			let hasLike = obj.likeOn;
			let like = hasLike ? 'fas text-red' : 'far';
			
			
			let writerAttach = obj.attaches[0];
			let	writerAttachOn = writerAttach ? `<img class="write-img" 
					src="${pageContext.request.contextPath}/display?aname=\${obj.attaches[0].aname}&path=\${obj.attaches[0].path}&uuid=\${obj.attaches[0].uuid}&image=\${obj.attaches[0].image}&thumb=on" 
					alt="User">` : `<img class="write-img" src="${pageContext.request.contextPath}/resources/img/favi.png" alt="User">`;
			
			return `<li class="list-group-item border-0" data-rno="\${obj.rno}">
			   		<div class="header">
				   		<a href="${pageContext.request.contextPath}/member/profile/\${obj.writeremail}/damso">
						\${writerAttachOn}
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
					</li>`;
		}
		
		
		// 더보기 버튼 클릭 이벤트
		$(".icn-more").click(function() {
			var rno = $(".chat li:last").data("rno"); //last:마지막 번호
			replyService.getList({bno:$("#boardModal").modal("show").data("bno"), rno:rno}, function(result) {
				if(!result.length) { 
					$(".icn-more").prop("disabled", true);
					$(".icn-more").css("color", "#757575").css("cursor", "default");
					return;
				}
				var str = "";
				for(var i in result) {
					str += getReplyLiStr(result[i]);
				}
				$(".chat").append(str);
			});
		})
		
		// 댓글에 마우스 hover 이벤트
		$(document).on('mouseover', '.list-group-item', function(){
			var rno = $(this).closest(".list-group-item").data("rno");
			var writer = $(this).closest(".list-group-item").find(".primary-font").data("writer");
			/* 댓글 작성자와 일치하지 않으면 ... 아이콘이 보이지 않고 클릭 금지 */
			if ('${member.id}' != writer) {
				$(this).find('.dropicon').css('color', 'white');
				$(this).find('.btn').css("pointer-events", "none");
			/* 일치하면 ...이 보임 */
			}
			else {
				$(this).find('.dropicon').css('color', '#757575');
				$(this).find('.btn').css("cursor", "pointer");
			}
		});
		// 본인 작성 게시글에서 마우스가 벗어나면 ...이 보이지 않게
 		$(document).on('mouseout', '.list-group-item', function(){
		    $(this).find('.dropicon').css('color', 'white');
		});
		
	    
	    $(document.replyform).submit(function() {
			event.preventDefault();
			if(!this.content.value.length) {
				alert("댓글 내용을 입력해주세요.");
				return false;
			}
			// 작성 수정 분기
			var obj = $(this).serializeObject();
			// 수정일때
			if($(this).prop("modify")) {
				replyService.modify(obj, function(result) {
					// 초기화
				    $(document.replyform).prop("modify", false).find("button").text("등록").prev().val("");
			    	$(".list-group-item").each(function() {
						if($(this).data("rno") == obj.rno) {
							var $this = $(this);
							replyService.get($this.data("rno"), function(r) {
								console.log(r);
								$this.replaceWith(getReplyLiStr(r))
                            })
                        }
                    })
				});
			}
			else {
				replyService.add(obj, function(result) {
				    $("#modalFooter").find("input[name='content']").val("");
				    // 작성한 댓글을 맨 위로 보냄
				    replyService.get(result, function(data) {
				    	$(".chat").prepend(getReplyLiStr(data));
				    });
				});
			}
		})

	    $(".chat").on("click", ".replymodify", function() {
			var $li = $(this).closest("li");
			var content = $li.find(".reply-content").text();
			var rno = $li.data("rno");
			console.log(rno, content);
			$(document.replyform)
			.prop("modify", true)
			.find("[name='rno']")
			.val(rno)
			.end()
			.find("button")
			.text("수정")
			.prev()
			.val(content)
			.focus()
			.on("blur", function() {
				$(document.replyform).prop("modify", false).find("[name='rno']").val("").end()
				.find("button").text("등록").prev().val("");
			});
		});
	    
	    $(".chat").on("click", ".replydelete", function() {
            var $listItem = $(this).closest(".list-group-item");
            var rno = $listItem.data("rno");
            replyService.remove(rno, function(result) {
                $listItem.remove();
	        })
	    })
	    
		
     	// 댓글 좋아요
		$(".chat").on("click", ".heart", function () {
			let $this = $(this);
			var rno = $(this).closest(".list-group-item").data("rno");
			var obj = {rno : rno, id : id};
			replyService.like(obj, function(data) {
				if(data < 0) { // 좋아요 빼기
					$this.removeClass("fas text-red").addClass("far")
				} else { // 좋아요 상태 되기
					$this.removeClass("far").addClass("fas text-red")
				}
				$likeCnt = $this.closest(".list-group-item").find(".likeCnt");
				$likeCnt.text(parseInt($likeCnt.text()) + parseInt(data));
			})
		})
		
		/*-------------------------- 스토리 슬라이더 -------------------------- */
		$(function(){
			$(".slider").bxSlider();
/* 	        $('.story').bxSlider({
	            auto : true,
	            autoHover : true,
	            pager : false,
	            KeyboardEnabled : true
	        }); */
	        $('.slider').css('border-style','none')
	    });
	})
	
	
</script>

<jsp:include page="../layout/footer.jsp"></jsp:include>


