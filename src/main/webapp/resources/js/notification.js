let notiService = (function () {
    // 알림 insert
    function insert(noti, callback) {
        let url = cp + "noti/insert"

        $.ajax({
            url : url,
            method : 'post',
            data : JSON.stringify(noti),
            dataType : 'json',
            contentType : "application/json; charset=utf-8"
        }).done(function (data) {
            if (callback) {
                callback(data)
            }
        })
    }

    function check(param, callback) {
        let url = cp + "noti/" + param.nno;

        $.ajax({
            url : url,
            method: 'put'
        }).done(function (data) {
            if (callback) {
                callback(data)
            }
        })
    }

    function uncheckNoti(param, callback) {
        let url = cp + "noti/" + param.email + "/uncheck"

        $.getJSON(url)
            .done(function (data) {
                if (callback) {
                    callback(data)
                }
            })
    }

    return {
        insert : insert,
        check : check,
        uncheckNoti : uncheckNoti
    }
})()