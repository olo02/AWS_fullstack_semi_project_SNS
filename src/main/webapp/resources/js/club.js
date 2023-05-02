let xhr = new XMLHttpRequest();

let clubService = (function () {

    // 클럽 목록 조회
    function getList(param, callback) {
        let url = cp + 'club/clublist';

        $.getJSON(url)
            .done(function (data) {
                if (callback) {
                    callback(data)
                }
            })
    }
    
    // 클럽 단일 조회
    function findBy(param, callback) {
    	let url = cp + 'club/findBy/' + param.cno;
    	
    	$.getJSON(url)
    	.done(function (data) {
    		if (callback) {
    			callback(data)
    		}
    	})
    }
    
    
    // 클럽 이름 검색
    function searchName(param, callback) {
    	let url = cp + 'club/searchname/' + param.keyword;
    	
        $.getJSON(url)
        .done(function (data) {
            if (callback) {
                callback(data)
            }
        })
    }
    
    // 나의 클럽 목록 조회
    function getMyClubList(param, callback) {
    	let url = cp + 'club/myclublist/' + param.email + "/email";
    	
    	$.getJSON(url)
    	.done(function (data) {
    		if (callback) {
    			callback(data)
    		}
    	})
    }
    
    // 클럽 가입하기
    function register(param, callback) {
    	let url = cp + "club/register";
    	
        $.post({
            url : url,
            method : 'post',
            data : JSON.stringify(param),
            dataType : 'json',
            contentType : "application/json; charset=utf-8"
    	}).done(function (data) {
    		if (callback) {
    			callback(data)
    		}
    	})
    }
    
    // 클럽 정보 수정하기
    function modify(param, callback) {
    	let url = cp + "club/update/" + param.cno;
    	
		$.ajax({
            url : url,
            data : JSON.stringify(param),
            method : 'put',
            dataType : 'json',
            contentType : "application/json; charset=utf-8"
		})
		.done(function(data) {
			if(callback){
				callback(data);
			}
		})
    }
    
    
    // 클럽 삭제하기
    function deleteClub(param, callback, error) {
    	let url = cp + "club/delete/" + param.cno;
    	
    	$.ajax({
    		url : url,
    		method : "delete",
    		dataType : "json"
    	}).done(function (data) {
    		if(callback) {
    			callback(data)
    		}
    	})
    	.fail(function(xhr) {
			if(error) {
				error(xhr)
			}
		})
    }
    

    return {
    	findBy : findBy,
        getList : getList,
        getMyClubList : getMyClubList,
        register : register,
        modify : modify,
        deleteClub : deleteClub,
        searchName : searchName
    }
})()


// 클럽+멤버 매핑테이블 서비스 메서드
let clubMemberService = (function () {
	
	// 해당 클럽의 멤버list 조회
	function getClubList(param, callback){
		let url = cp + "clubmember/getclublist/" + param.club;
        
		$.getJSON(url)
        .done(function (data) {
            if (callback) {
                callback(data)
            }
        })	
	}
	
	
    // 해당 클럽의 해당 멤버 조회
    function get(param, callback) {
        let url = cp + 'clubmember/get/' + param.club + '/'+ param.member + "/m" ;

        $.getJSON(url)
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
    
    // 클럽 가입
    function register(param, callback) {
    	let url = cp + 'clubmember/register';
    	
    	$.post({
    		url : url,
    		dataType : "json",
    		data : {
    			member : param.member,
    			club : param.club,
    			answer : param.answer
    		}
    	}).done(function (data) {
    		if (callback) {
    			callback(data)
    		}
    	})
    }
    
    // 클럽 탈퇴
    function deleteMember(param, callback, error) {
    	let url = cp + 'clubmember/delete/' + param.member + "/" + param.club;
    	
    	$.ajax({
    		url : url,
    		method : "delete",
    		dataType : "json"
    	}).done(function (data) {
    		if(callback) {
    			callback(data)
    		}
    	})
    	.fail(function(xhr) {
			if(error) {
				error(xhr)
			}
		})
    }
	
	
	return {
		get : get,
		getClubList : getClubList,
		register : register,
		deleteMember : deleteMember
	}
})()