<%--
  Created by IntelliJ IDEA.
  User: MSI
  Date: 2023-04-07
  Time: 오전 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <style>
        .bigPictureWrapper {
            position : absolute;
            display: none;
            justify-content: center;
            align-items: center;
            top: 0;
            height: 100%;
            width: 100%;
            background-color: gray;
            z-index: 100;
            background: rgba(0, 0, 0, .5);
        }

        .bigPicture {
            position: relative;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .bigPicture img {
            width: 600px;
        }
    </style>
</head>
<body>
<form method="post" enctype="multipart/form-data">
    <label for="files"><i class="fas fa-folder-plus"></i></label>
    <input id="files" type="file" name="files" multiple accept="image/jpeg">
    <button>submit</button>
</form>
<div class="uploadResult">
    <ul>

    </ul>
</div>
<div class="bigPictureWrapper">
    <div class="bigPicture"></div>
</div>

<script>


    $(function () {
        $(".bigPictureWrapper").on("click", function (e) {
            $(".bigPicture").animate({width: '0%', height: '0%'}, 1000);
            setTimeout(function () {
                $(".bigPictureWrapper").hide();
            }, 1000)
        })

        function checkExtension(files) {
            const MAX_SIZE = 5 * 1024 * 1024;
            const EXCLUDE_EXT = new RegExp("(.*?)\.(js|jsp|asp|php)");

            for (let i in files) {
                if (files[i].size >= MAX_SIZE || EXCLUDE_EXT.test(files[i].name)) {
                    return false;
                }
            }
            return true
        }


        function showUploadedFile(uploadResultArr) {
            let str = "";
            for(let i in uploadResultArr) {
                let obj = uploadResultArr[i];
                obj.thumb = "on";
                let params = new URLSearchParams(obj).toString();
                if(!obj.image){
                    str += "<li><a href='/download?" + params + "'><i class='far fa-file'></i> ";
                }
                else {
                    obj.thumb = "off";
                    let params2 = new URLSearchParams(obj).toString();
                    str += '<li><a class="img-thumb" href=""><img src="${pageContext.request.contextPath}/display?' + params  + '" data-src="'+ params2 +'" >' ;
                    /*                 str += '<li><a href="javascript:showImage(\''+ params2 +'\')"><img src="/display?' + params  + '" >' + obj.name + '</a></li>' */
                }
                str += obj.name + "</a> <i class='far fa-times-circle btn-remove' style='cursor:pointer'></i> </li>"
            }
            // 내부적으로 스트림 사용
            $(".uploadResult ul").append(str);
        }

        $(".uploadResult ul").on("click", ".btn-remove", function () {
            event.preventDefault()
            let file = $(this).closest("li").find("img").data("src");
            console.log(file)
            $.getJSON("/deleteFile?" + file).done(function (data) {

            })
        })

        $(".uploadResult ul").on("click" , ".img-thumb", function () {
            event.preventDefault()
            $(".bigPictureWrapper").css("display", "flex").show();
            let param = $(this).find("img").data("src")
            console.log(param)
            $(".bigPicture")
                .html("<img src='${pageContext.request.contextPath}/display?" + param + "'>")
                .animate({width: '100%', height : '100%'}, 1000)
        })

        $("form button").click(function () {
            event.preventDefault();
            let files = $(":file").get(0).files;
            console.log(files);

            if (!checkExtension(files)) {
                alert("조건 불일치")
                return false;
            }

            let formData = new FormData();

            for (let i in files) {
                formData.append("files", files[i])
            }

            $.ajax({
                url : cp + "uploadAjax",
                processData: false,
                contentType : false,
                data : formData,
                method : "post",
                success : function (data) {
                    console.log(data)
                    $("form").get(0).reset();
                    showUploadedFile(data)
                }
            })
        })
    })
</script>
</body>
</html>
