// let xhr = new XMLHttpRequest();

let boardService = (function () {
    // 글 단일 조회
    function get(bno, callback) {
        url = cp + "board/" + bno
        $.getJSON(url)
            .done(function (data) {
                if (callback) {
                    callback(data)
                }
            })
    }

    // 글 목록 조회
    function getList(param, callback) {
        let url = cp + 'board/list/'+ (param.id ? "member/" + param.id : "") + (param.bno ?? "")  + '/' + (param.category ? param.category + "/club" : "");
        console.log(url)

        $.getJSON(url)
            .done(function (data) {
                if (callback) {
                    callback(data)
                }
            })
    }

    function getAllList(param, callback) {
        let url = cp + "board/" + param.email + "/allList"

        $.getJSON(url)
            .done(function (data) {
                if (callback) {
                    callback(data)
                }
            })
    }

    // 글 삭제
    function remove(bno, callback) {
        let url = cp + 'board/' + bno

        $.ajax({
            url : url,
            method: "delete",
            dataType : 'json'
        }).done(function (data) {
            if (callback) {
                callback(data)
            }
        })
    }

    function insertLike(param, callback) {
        let url = cp + "board/like/" + param.bno

        $.post({
            url : url,
            data : {bno : param.bno, id : param.id}
        }).done (function (data) {
            if (callback) {
                callback(data)
            }
        })
    }

    function removeLike(param, callback) {
        let url  = cp + "board/unlike/" + param.id + '/' + param.bno

        $.ajax({
            url : url,
            method : "delete",
            dataType : 'json'
        }).done (function (data) {
            if (callback) {
                callback(data)
            }
        })
    }

    function register(board, callback) {
        let url = cp + "board/register"

        $.ajax({
            url : url,
            method : 'post',
            data : JSON.stringify(board),
            dataType : 'json',
            contentType : "application/json; charset=utf-8"
        }).done(function (data) {
            if (callback) {
                callback(data)
            }
        })
    }

    function modify(board, callback) {
        url = cp + 'board/' + board.bno

        $.ajax({
            url : url,
            data : JSON.stringify(board),
            method : 'put',
            dataType : 'json',
            contentType : "application/json; charset=utf-8"
        }).done(function (data) {
            if (callback) {
                callback(data)
            }
        })
    }

    return {
        get : get,
        getList : getList,
        getAllList : getAllList,
        register : register,
        modify : modify,
        remove: remove,
        insertLike : insertLike,
        removeLike : removeLike
    }
})()