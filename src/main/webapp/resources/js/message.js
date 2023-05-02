let messageService = (function() {
	
	function send(obj, callback) {
		$.ajax({
			url: cp + "message/new",
			method : "post",
			dataType : "json",
			data : JSON.stringify(obj),
			contentType : "application/json; charset=utf-8",
			success : callback
		})
	}
	
	function chat(param, callback) {
		$.getJSON(cp + "message/" + param.receiver + "/r/" + param.sender + "/s")
		.done(callback);
	}	
	
	function uncheckedList(param, callback) {
		$.getJSON(cp + "message/" + param.receiver + "/" + param.sender + "/uncheck")
		.done(callback)
	}
	
	function receive(obj, callback) {
		$.ajax({
			url : cp + "message/check/" + obj.mno,
			method : "put",
			dataType : "json",
			data : JSON.stringify(obj),
			contentType : "application/json; charset=utf-8",
			success : callback
		})
	}
	
	function chatRoom(param, callback) {
		$.getJSON(cp + "massage/" + param.room).done(callback)
	}
	
	
	function remove(param, callback) {
		let url = cp + "message/" + param.mno
		
		$.ajax({
    		url : url,
    		method : "delete",
    		dataType : "json"
		}).done(function (data) {
    		if(callback) {
    			callback(data)
    		}
    	})
	}
	
	function removeRoom(param, callback) {
		let url = cp + "message/removeRoom/" + param.room
		
		$.ajax({
    		url : url,
    		method : "delete",
    		dataType : "json"
		}).done(function (data) {
    		if(callback) {
    			callback(data)
    		}
    	})
	}
	
	return {
		send : send,
		chat : chat,
		uncheckedList : uncheckedList,
		receive : receive,
		remove : remove,
		chatRoom : chatRoom,
		remove : remove,
		removeRoom : removeRoom
	}
})()


let memberService = (function () {
	
	    function getList(param, callback) {
	    	
	        let memberurl = cp + 'member/getList';
	
	        $.getJSON(memberurl)
	            .done(function (data) {
	                if (callback) {
	                    callback(data)
	                }
	            }).fail(function (data) {
	            	if(callback) {
	            		callback(data)
	            	}
	            })
	    }
	    
	    return {
	    	getList : getList
	    }
})()


let messageRoomService = (function () {
	
	function get(param, callback) {
		$.getJSON(cp + "messageroom/" + param.mrno).done(callback)
	}
	
	function setName(param, callback) {
		$.ajax({
			url : cp + "messageroom/setname/" + obj.mrno,
			method : "put",
			dataType : "json",
			data : JSON.stringify(obj),
			contentType : "application/json; charset=utf-8",
			success : callback
		})
	}
	
	return {
		get : get,
		setName : setName
	}
	
})()
