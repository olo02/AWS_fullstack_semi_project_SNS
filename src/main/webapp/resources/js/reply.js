var xhr2 = new XMLHttpRequest();
var replyService = (function() {
	// 댓글 추가
	function add(reply, callback, error) {
		console.log("add() :: " + reply)
		console.log(reply)
		$.post({
			url : cp + "replies/new",
			data : JSON.stringify(reply),
			dataType : "json",
			contentType : "application/json; charset=utf-8"
		})
		.done(function(data) {
			if(callback) {
				callback(data);
			}
		})
		.fail(function(xhr2) {
			console.log(xhr2);
		})
	}
	// 댓글 단일 조회
	function get(rno, callback) {
		var url = cp + "replies/" + rno;
		console.log(url);
		$.getJSON(url)
		.done(function(data) {
			if(callback) {
				callback(data);
			}
		});
	}
	//댓글 목록 조회
	function getList(param, callback, error) {
		var url = cp + "replies/list/" + param.bno + "/" + (param.rno || "");
		$.getJSON(url)
			.done(function(data) {
				if(callback) {
					callback(data);
				}
			})
			.fail(function(xhr2) {
				if(error) {
					error(xhr2)
				}
		});
	}
	//댓글 수정
		function modify(reply, callback, error) {
		console.log("modify()");
		console.log(reply);
		$.ajax({
			url : cp + "replies/" + reply.rno,
			method : 'put',
			data : JSON.stringify(reply),
			dataType : "json",
			contentType : "application/json; charset=utf-8"
		})
		.done(function(data) {
			if(callback) {
				callback(data);
			}
		})
		.fail(function(xhr2) {
			console.log(xhr2);
		})
	}
	
	//댓글 삭제
	function remove(rno, callback, error) {
		$.ajax({
			url : cp + "replies/" + rno,
			method : 'delete',
			dataType : 'json'
		})
		.done(function(data) {
			if(callback) {
				callback(data);
			}
		})
		.fail(function(xhr2) {
			console.log(xhr2);
		})
	}
	
	// 댓글 좋아요
	function like(param, callback) {
		var url = cp + "replies/like/" + param.id + "/" + param.rno
		$.getJSON(url, function (data) {
			if(callback) {
				callback(data)
			}
		})
	}
	
	
	
	return {
		add:add,
		getList:getList,
		get:get,
		remove:remove,
		modify:modify,
		like:like
	};
})();