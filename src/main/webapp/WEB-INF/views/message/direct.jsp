<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>


<jsp:include page="../layout/header.jsp"></jsp:include>
<link
	href="${pageContext.request.contextPath }/resources/css/styleBoard_230407.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/css/clubget.css"
	rel="stylesheet">

<style>
	.content {
		overflow-y:hidden;
	}
	.dm {
		background-color: white;
		border: #e8e8e8 solid 1px;
		margin: 40px auto;
		max-height: 700px;
		height:85%;
		overflow-y: hidden;
	}
	select {
	   -webkit-appearance:none; /* for chrome */
	   -moz-appearance:none; /*for firefox*/
	   appearance:none;
	}
	select::-ms-expand{
	   display:none;/*for IE10,11*/
	}
	select {
	   background:url('arr_pink.gif') no-repeat 97% 50%/15px auto;
	}
	.chatList > .p-2:hover {
	background-color:#f4f4f4d1;
	}

</style>

<div class="dm d-flex">
		<div class="col-12 d-flex flex-row flex-wrap align-content-start">

			<div class="chatList-wrap h-100 col-4 align-content-start flex-column flex-wrap position-relative">
				<div class="col-12 m-0 py-3 border-bottom " style="height:fit-content;text-align: center; "><span class="fw-bold">${member.id }&nbsp;</span></div>
				<i class="sendMessage position-absolute fas fa-edit" style="cursor:pointer; top:16px; right:23px; font-size:20px"></i>
				<div class="col-12 mb-auto" style="flex: 1; overflow-y: auto;">
					<!-- 채팅 리스트 -->
					<div class="chatList pt-2 d-flex flex-column" style="">

					</div>
				</div>
			</div>

			<div class="col-12 col-md-8 h-100 d-flex flex-wrap">
				<div class="d-flex col-12 h-100 position-relative flex-wrap border-start">
					<!-- 채팅 상대 -->
					<div class="col-12 0 p-3 border-bottom position-absolute top-0"
						style="height:fit-content; background-color: white;">
						<div class="noteBox-title ps-4">
							<span class="fw-bold">&nbsp;</span>
						</div>
					</div>
					<div class="noteBox p-3 col-12 my-5 d-flex border-bottom bg-white flex-column-reverse"
						style="height: -webkit-fill-available; overflow-y: auto; ">
						<!-- js로 채팅 내용 -->
						<div class="d-flex col-12 h-100 justify-content-center sendMessage"
							style="cursor:pointer">
							<span class="d-inline-flex align-items-center flex-column justify-content-center fs-5">
							<i class="fas fa-edit fs-2 pb-4" style="cursor:pointer; color:#959595"></i>
							친구에게 메시지를 보내보세요
							</span>
						</div>
					</div>
					<div class="col-12 d-flex position-absolute bottom-0 border-top " >
					<input type="text" id="textMessage" class="py-3 px-2 col-10"
						style="border: none;">
					<button id="btnSend" class="col-2 align-self-stretch bg-white"
						style="border: none;">
						전송</button>
					</div>
				</div>
			</div>
		</div>
</div>

<!-- 메시지 상대 선택하기 모달 Strat -->
	<div class="modal fade" id="receiver-modal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" style="width: 400px; height:450px"
			role="document">
			<div class="modal-content flex-column flex-wrap" style="border-radius: 10px;height:450px">
				<div class="h-25 border-bottom">
					<div class="h-50 text-center fw-bold py-3">새로운 메시지</div>
					<div class="h-50 d-inline-flex align-items-end pb-3">
						<div class="px-3 ps-4 py-2">받는 사람:</div>
						<input class="border-0 bg-light px-2" type="text" placeholder="아이디 검색"
							style="height: 40px; width: 250px">
					</div>
				</div>
				<div class="sendTo h-75 overflow-auto">
					

				</div>
			</div>
		</div>
<!-- 메시지 상대 선택하기 모달 End -->



<script src="${pageContext.request.contextPath }/resources/js/message.js"></script>

	<script>
	$(function() {
		let user = '${member.email}';
		let receiverEmail = "";
		
		/* 모든 멤버 리스트 html */
		function memberListStr(obj){
			let memberAttach = obj.attaches[0].uuid;
			let	memberAttachOn = memberAttach ? `<img class="m-1 ms-2 mt-2 img-fluid rounded-circle" style="width: 38px; height:38px"
					src="${pageContext.request.contextPath}/display?aname=\${obj.attaches[0].aname}&path=\${obj.attaches[0].path}&uuid=\${obj.attaches[0].uuid}&image=\${obj.attaches[0].image}&thumb=on" 
					alt="User">` : `<img class="m-1 ms-2 mt-2 bg-light img-fluid rounded-circle" style="width: 38px; height:38px" 
					src="${pageContext.request.contextPath}/resources/img/favi.png">`;
			return `
			<!-- member one -->
			<div class="p-2 ps-4" style="cursor: pointer;">
				<div class="d-flex align-content-start" style="font-size:16px">
					\${memberAttachOn}
					<div class="ps-3 pt-1 flex-column" style="display:inline-flex;">
						<span>\${obj.id}</span>
						<span style="font-size:14px; color:#b3b3b3">\${obj.name}</span>
						<input type="hidden" value="\${obj.email}" data-id="\${obj.id}">
					</div>
				</div>
			</div>			
			`;
		}
		
		/* 채팅방 목록 리스트 str */
		function ChatListStr(receive , obj){
			let receiveAttach = receive.attaches[0].uuid;
			let	receiveAttachOn = receiveAttach ? `<img class="m-1 ms-2 img-fluid rounded-circle" style="width: 48px; height:48px"
					src="${pageContext.request.contextPath}/display?aname=\${receive.attaches[0].aname}&path=\${receive.attaches[0].path}&uuid=\${receive.attaches[0].uuid}&image=\${receive.attaches[0].image}&thumb=on" 
					alt="User">` : `<img class="m-1 ms-2 img-fluid bg-light rounded-circle" style="width: 48px; height:48px" 
					src="${pageContext.request.contextPath}/resources/img/favi.png">`;
			return `
			<!-- 채팅 1 -->
			<div class="p-2 " style="cursor: pointer; height:75px" data-mno="\${obj.mno}" data-room="\${obj.room}">
				<div class="d-flex align-content-start" style="font-size:16px">
				\${receiveAttachOn}
				<div class="ps-3 pt-1 flex-column" style="display:inline-flex;">
					<span style="max-width: 150px">\${receive.id}</span>
					<span style="font-size:14px; color:#b3b3b3; max-width: 150px">\${obj.message}</span>
				</div>
					<div class="float-end pt-3 pe-2 ms-auto" style="font-size:14px">\${moment(obj.sdate).fromNow()}</div>
					<span class="float-end checkReceiveIcon d-inline-flex align-items-center " data-value="\${obj.mno}"></span>
				</div>
				<input type="hidden" value="\${receive.email}" data-id="\${receive.id}">
			</div>
			`;
		}
		
		/* 수신자와의 채팅방 초기화 */
		function showChating(receiverEmail, receiverId) {
   			$(".noteBox").html('')
			messageService.chat({receiver: receiverEmail , sender : user}, function (data) {
				$(".noteBox-title span").html(receiverId)
				console.log(data)
				for(let i in data){
					let chk = '';
					data[i].rdate == null ? chk = '1': chk = '' ;
					
 					if(data[i].sender === user) {
						$(".noteBox").prepend(sendStr(data[i], chk))
					} else {
						$(".noteBox").prepend(receiveStr(data[i], ''))
						if(data[i].rdate == null){
	 						messageService.receive({mno : data[i].mno} , function() {
	 							checkReceive(data[i], false)
	 						})
						}
					}
				}
			})
		}
		
		/* 채팅방 목록 초기화 */
		memberService.getList({}, function(result) {
			$(".chatList").html('')
			/* 채팅방 정렬을 위한 배열 선언 */
			let thisChat = "";
			/* 친구 목록 모두 탐색 */
			for(let i in result){
				/* 친구와의 채팅이 기존에 존재하면 채팅방 출력 */
				messageService.chat({receiver: result[i].email, sender: user}, function(obj) {
					if(obj.length != 0) {

						/* 채팅방 정렬을 위해, 배열에 각 채팅방의 마지막 채팅 담기 */
						/* arr.push(obj[obj.length - 1]); */
						/* console.log(arr) */
						/* console.log(Object.values(arr)) */
 						$(".chatList").prepend(ChatListStr(result[i], obj[obj.length - 1]))
						checkReceive(obj[obj.length - 1], true)
 						/* 수신 미확인 아이콘 표시 */
/* 						thisChat = obj[obj.length - 1].mno;

						console.log(thisChat)
 						if(obj[obj.length - 1].rdate == null && obj[obj.length - 1].receiver == '${member.email}') {
 							let $this = document.querySelector(".checkReceiveIcon");
 							console.log($this.dataset.value)
 							if($this.dataset.value == thisChat) {
 								console.log($this)
 								$($this).html('<i class="fas fa-circle" style="color: #fdb5b8; font-size:10px"></i>')
 							}
						} */
 					}

				})
			}
		})

		/* 수신 확인 아이콘 표시 */
		function checkReceive(obj, on) {
				if(obj.rdate == null && obj.receiver == '${member.email}') {
						let $this = document.querySelector(".checkReceiveIcon");
						console.log($this.dataset.value)
						if($this.dataset.value == obj.mno) {
							console.log($this)
							if(on){
								$($this).html('<i class="fas fa-circle" style="color: #fdb5b8; font-size:10px"></i>')
							}
							else {
								$($this).html('')
							}
						}
			}
		}

		
		/* 채팅방 선택시 채팅방 출력 */
  		$(".chatList").on("click", "> *", function() {
			receiverEmail = $(this).find("input").val();
			receiverId = $(this).find("input").data("id");
			showChating(receiverEmail, receiverId);
			$(this).find(".checkReceiveIcon").html("")
		})  
		
		/* 메시지 보내기 아이콘 클릭 후 친구 선택 모달, 선택 후 해당 채팅방 출력 */
		$(".sendMessage").on("click", function() {
			$("#receiver-modal").modal("show")			
			memberService.getList({}, function(result) {
				/* 친구 목록 출력 */
				$(".sendTo").html('');				
				let str = "";
				/* 지금은 전체 멤버! 친구목록으로 바꾸어야 함!!!!!!!!!!!!!!! */
				let title = `<div class="fw-bold pt-2 ps-3">친구목록</div>`;
				for(let i in result) {
					// 본인 제외
					if(result[i].email != '${member.email}' && result[i].email != '탈퇴된 회원입니다'){
						str += memberListStr(result[i])
					}
				}
				$(".sendTo").append(title);
				$(".sendTo").append(str);
				
				/* 친구 선택 시 친구와의 채팅방 생성 */
				$(".sendTo").children().each(function() {
					$(this).on("click", function() {
						/* 수신자 설정 */						
						receiverEmail = $(this).find("input").val();
						receiverId = $(this).find("input").data("id");
						console.log(receiverId)
						/* 모달 닫기 */
						$("#receiver-modal").modal("hide")
						/* 채팅방 출력 */
						showChating(receiverEmail, receiverId);
					})
				})
			})
		})
		
		
		
		
		/* ------------------------- websocket ------------------------- */
		let wsPath = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}"+ cp +"message";
		
		let ws = new WebSocket(wsPath)
		
		ws.onopen = function(ev) {
			console.log("연결 완료", ev);
		}
		
/* 		ws.onopen = function () {
			console.log("연결 완료", ev);
		    var t = setInterval(function(){
		        if (ws.readyState != 1) {
		            clearInterval(t);
		            return;
		        }
		        ws.send('{type:"ping"}');
		    }, 55000);
		}; */
		
		ws.onclose = function(ev) {
			console.log("연결 종료", ev);
		}
		ws.onmessage = function(ev) {

    		let obj = JSON.parse(ev.data);
   			let nowChat = obj.chat.length - 1;
   			/* ----------------------------------------------------------------------------------------------------- */

   			// obj.get : 마지막 메시지
   			// obj.unCheck : 마지막 메시지 확인 여부

   			console.log("uncheck" + obj.unCheck)
 			console.log("user" + user) // == ${member.email}
			console.log("받는 사람" + obj.receiver)
			console.log("보내는 사람email" + obj.senderEmail) //
			console.log(obj.get)
			console.log(obj.get.mno)
			console.log(obj.lastSender)

			/* 메시지 실시간 발송 */

			// 메시지 수신시, 해당 채팅방을 이용하고 있을 때(클릭된 상태)
 		   	if(user == obj.receiver && obj.senderEmail == receiverEmail) {
		   		// 해당 대상만 실시간 메시지 받기 & 채팅방 목록의 알림아이콘 삭제
 		   		$(".noteBox").prepend(receiveStr(obj.get, ''));
				$(".chatList").prepend(ChatListStr(obj.lastSender, obj.get))

				$(".chatList > .p-2[data-room = '"+ obj.get.room +"']").remove()
				$(".chatList").prepend(ChatListStr(obj.lastSender, obj.get))

				// 수신 확인 & 해당 실시간 메시지 확인 표시('1') 업데이트
		   		messageService.receive({mno : obj.get.mno} , function() {
			   		$(".unchecked").html('');
				})

			// 메시지 수신시, 현재 채팅창이 아닌 다른 채팅창을 이용하고 있을 때
		   	} else if(user == obj.receiver  && obj.senderEmail != receiverEmail) {
				$(".chatList > .p-2[data-room = '"+ obj.get.room +"']").remove()
				$(".chatList").prepend(ChatListStr(obj.lastSender, obj.get))
			   	checkReceive(obj.get, true);
		   	}

			// 현재 클릭된 채팅방과 무관
			// 메시지 발신시 채팅방 목록에 채팅 바로 뜨게 하기
			if(user == obj.senderEmail){
				$(".chatList > .p-2[data-room = '"+ obj.get.room +"']").remove()
				$(".chatList").prepend(ChatListStr(obj.receiverVO , obj.get))
			}

   		}



   		$("#btnSend").on("click", function() {
   			$("#textMessage").submit();
   		})
		$("#textMessage").on("keyup", function(e) {
			if(e.keyCode == 13) {
	   			$("#textMessage").submit();
			}
		})   		

		/* 메시지 보내기 */
		$("#textMessage").submit(function() {
			event.preventDefault();
			let receiver = receiverEmail;
			let message = $("#textMessage").val();
			
/* 			console.log(message.length)
			console.log(user);
			console.log(receiver);
			console.log(message); */
			
			let obj = {receiver: receiver, sender: user, message:message};
			console.log(obj);
			
			if(!user || !receiver || !message) {
				alert("메시지 전송에 실패하였습니다");
				return false;
			}
			messageService.send(obj, function(data) {
				ws.send(receiver);
				$(".noteBox").prepend(sendStr(obj, '1'))

				let msg = "chat," + '${member.id}' + "," + receiver + "," + obj.message
				aws.send(msg);

			}) 
			$("#textMessage").val('')
		})

		
			/* 보내는 채팅 Str */
			function sendStr(obj, unchecked) {
				/* let unchecked = '${obj.rdate == null ? "" : 1}'; */
				return `
            	<div style="display: flex; flex-direction: row-reverse;">
                	<div class="py-1 px-3 my-2 float-right" 
                		style="word-break: break-all;max-width: 400px;color:white; background-color:#b1b1b1; display:inline-block; border-radius: 8px;">
                		\${obj.message}
                	</div>
                	<span class="pb-2 px-1" style="font-size:9px; color:#b1b1b1;align-self: end;">\${moment(obj.sdate).format("HH:mm")}</span>
        			<span class="pb-2 px-1 unchecked" style="font-size:9px; color:#ded283;align-self: end">` + unchecked + `</span>
                </div>					
				`;
			}
			
			/* 받는 채팅 Str */
			function receiveStr(obj, unchecked) {
				/* let unchecked = '${obj.rdate == null ? "" : 1}'; */
				return `
            	<div style="display: flex;">
                	<div class="py-1 px-3 my-2 float-left" 
                		style="word-break: break-all;max-width: 400px;color:white; background-color:#58bbe3; display:inline-block; border-radius: 8px;">
                		\${obj.message}
                	</div>
                	<span class="pb-2 px-1" style="font-size:9px; color:#b1b1b1;align-self: end;">\${moment(obj.sdate).format("HH:mm")}</span>
        			<span class="pb-2 px-1 unchecked" style="font-size:9px; color:#ded283;align-self: end;">` + unchecked + `</span>
            	</div>
            	`;
			}
			
 	 })
	</script>

 <jsp:include page="../layout/footer.jsp"></jsp:include>
