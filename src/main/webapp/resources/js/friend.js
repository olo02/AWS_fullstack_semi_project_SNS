/**
 * @강태수
 * 4/10일 생성
 * 모달 
 * 4/11 수정
 * ajax 비동기 처리 
 * 
 * 4/15 일 
 * test1 아이디 기준으로 팔로우 목록 팔로워 목록 나오게해서 팔로우 언팔로우 버튼 테스트 성공
 * 추후 개인피드에서 정보를 끌고와야됨
 * 
 * 4/16일 
 * var followed = data[i].id -> var followed = data[i].email 변경 언팔로우 팔로우 정상작동 
 * 
 * 4/18 일 
 * $(document).ready(function() {
    const url = window.location.href;
    const email = url.substr(url.lastIndexOf('/') + 1);
  //  console.log(email);
    var following = email; 쿼리스트링 가져옴 그값으로 following, followed 값 넣고 실행 성공
 * 
 * 4/19일 
 * 사람숫자보여주는 count 추가 
 * 
 * 4/21일
 * 이메일값 가져오는 부분 수정 
 * 
 * 4/24일
 * 팔로우 언팔로우 공통부분 하나로 해서 밖으로 빼둠
 * id name값에 링크 연결 
 * 
 */


$(document).on("click", "#followerBtn", function() {
	$('#followerModal').modal('show');
	const url = window.location.href;
	const following = url.match(/\/(\w+@\w+\.\w+)/)[1];
	var followed = email;
	$.ajax({
		type: "GET",
		url:  "/friend/select?following=" + following + "&followed=" + followed,
		dataType: "json",
		success: function(data) {
			var tbody = $("#followerTable tbody");
			tbody.empty();

			data.forEach(function(follower) {
				console.log(follower);
				if (follower.email === email) {
					return;
				}

				var followBtnText = "";
				var followBtnClass = "";
				if (follower.followedStatus == 1) {
					followBtnText = "삭제";
					followBtnClass = "btn-danger unfollow-btn";
				} else {
					followBtnText = "팔로우";
					followBtnClass = "btn-primary follow-btn";
				}
				var row = $("<tr></tr>");
				row.append('<td><a href="/member/profile/' + follower.email + '/damso">' + follower.id + '</a></td>');
				row.append('<td><a href="/member/profile/' + follower.email + '/damso" style="color: black">' + follower.name + '</a></td>');				
				row.append('<td><button class="btn ' + followBtnClass + '" data-followed-status="' + followed.followedStatus + '" data-following="' + following + '" data-followed-user="' + follower.email + '">' + followBtnText + '</button></td>');
				tbody.append(row);
			});
		}
	});
});




//팔로워 목록        
$(document).on("click", "#followingBtn", function() {
	$('#followingModal').modal('show');

	const url = window.location.href;
	const following = url.match(/\/(\w+@\w+\.\w+)/)[1];
	var followed = email;
	$.ajax({
		type: "GET",
		url:  "/friend/selectFriend?following=" + following + "&followed=" + followed,
		dataType: "json",
		success: function(data) {
			var tbody = $("#followingTable tbody");
			tbody.empty();

			data.forEach(function(follower) {
				console.log(follower);
				if (follower.email === email) {
					return;
				}

				var followBtnText = "";
				var followBtnClass = "";
				if (follower.followedStatus == 1) {
					followBtnText = "삭제";
					followBtnClass = "btn-danger unfollow-btn";
				} else {
					followBtnText = "팔로우";
					followBtnClass = "btn-primary follow-btn";
				}
				var row = $("<tr></tr>");
				row.append('<td><a href="/member/profile/' + follower.email + '/damso">' + follower.id + '</a></td>');
				row.append('<td><a href="/member/profile/' + follower.email + '/damso" style="color: black">' + follower.name + '</a></td>');
				row.append('<td><button class="btn ' + followBtnClass + '" data-followed-status="' + followed.followedStatus + '" data-following="' + following + '" data-followed-user="' + follower.email + '">' + followBtnText + '</button></td>');
				tbody.append(row);
			});
		}
	});
});


//  나를 팔로우한 숫자
$(document).ready(function() {
	const url = window.location.href;
	const emaill = url.match(/\/(\w+@\w+\.\w+)/)[1];
	console.log(email);


	$.ajax({
		url: "/friend/" + emaill + "/followerCount",
		method: "GET",
		dataType : "json",
		success: function(response) {

			$("#followerCount").text(response);
		},
		error: function(error) {
			console.log(error);
		}
	});
});
//내가 팔로우한 숫자 
$(document).ready(function() {
	const url = window.location.href;
	const emaill = url.match(/\/(\w+@\w+\.\w+)/)[1];
	console.log(email);



	$.ajax({
		url:  "/friend/" + emaill + "/followCount",
		method: "GET",
		dataType : "json",
		success: function(response) {

			$("#followCount").text(response);
		},
		error: function(error) {
			console.log(error);
		}
	});
});

//============================================================


$(document).on("click", ".addFriend", function () {
	$('#addFriendModal').modal('show');
	const url = window.location.href;
	const followed = url.match(/\/(\w+@\w+\.\w+)/)[1];
	var following = email;
	$.ajax({
		type: "GET",
		url:  "/friend/check?following=" + following + "&followed=" + followed,
		dataType: "json",
		success: function(data) {
			var tbody = $("#addFriendTable tbody");
			tbody.empty();

			var row = $("<tr></tr>");
			row.append("<td>" + data.name + "</td>");
			row.append("<td>" + data.id + "</td>");
			var followBtnText = "";
			var followBtnClass = "";
			if (data.followedStatus == 1) {
				followBtnText = "삭제";
				followBtnClass = "btn-danger unfollow-btn";
			} else {
				followBtnText = "팔로우";
				followBtnClass = "btn-primary follow-btn";
			}
			row.append('<td><button class="btn ' + followBtnClass + '" data-followed-status="' + data.followedStatus + '" data-following="' + following + '" data-followed-user="' + data.email + '">' + followBtnText + '</button></td>'); // 변경된 부분
			tbody.append(row);
		}
	});
});

	
	

$(document).on("click", ".follow-btn", function() {
	var btn = $(this);
	var following = email;
	console.log(following);
	var followed = btn.data("followed-user");
	console.log(followed);
	var followedStatus = btn.data("followed-status");
	$.ajax({
		type: "POST",
		url:  "/friend/follow",
		data: JSON.stringify({
			"following": following,
			"followed": followed
		}),
		contentType: "application/json",
		dataType: "json",
		success: function(data) {
			btn.text("삭제");
			btn.removeClass("btn-primary follow-btn");
			btn.addClass("btn-danger unfollow-btn");
			btn.data("followed-status", 1);

			notiService.insert({type: 'follow', sender : email, receiver : btn.closest("tr").find("td:first-child").text()}, function (result) {})
			let msg = "follow," + id + "," + btn.closest("tr").find("td:first-child").text()
			aws.send(msg);
		},
		error: function(e) {
			console.log(e);
		}
	});
});
		
	
$(document).on("click", ".unfollow-btn", function() {
	var btn = $(this);
	
	var following = email;
	console.log(email);
	var followed = btn.data("followed-user");
	console.log(followed);
	var followedStatus = btn.data("followed-status");
	$.ajax({
		type: "DELETE",
		url:  "/friend/unfollow/" + following + "/" + followed + ".com",
		dataType: "json",
		success: function(data) {
			btn.text("팔로우");
			btn.removeClass("btn-danger unfollow-btn");
			btn.addClass("btn-primary follow-btn");
			btn.data("followed-status", 0);
		},
		error: function(e) {
			console.log(e);
		}
	});
});


