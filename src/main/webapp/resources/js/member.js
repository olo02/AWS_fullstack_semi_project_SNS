let memberservice = (function(){
	
	 // 클럽 이름 검색
    function searchName(param, callback) {
    	let url = cp + 'member/searchMember/' + param.id;
        $.getJSON(url)
        .done(function (data) {
            if (callback) {
                callback(data)
            }
        })
    }
    
    // 멤버 정보 수정하기
    function update(param, callback) {
    	let url = cp + "member/profile/" + param.email + "/damso";
    	
		$.ajax({
			url : url,
			method : 'put',
			data : JSON.stringify(param),
			dataType : 'json',
			contentType : "application/json; charset=utf-8"
		})
		.done(function(data) {
			if(callback){
				callback(data);
			}
		})
    }
    
    // 멤버 단일 조회
    function getEmail(param, callback) {
    	let url = cp +  "member/get/" + param.email +"/email";
    	
    	$.getJSON(url)
    	.done(function (data) {
    		if (callback) {
    			callback(data)
    		}
    	})
    }
	
    return {
        searchName : searchName,
        update : update,
        getEmail : getEmail
    }
})()