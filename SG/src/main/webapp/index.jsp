<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
            margin-top: 100px;
            padding: 20px;
            border: 1px solid #005cb8;
            border-radius: 20px;
            background-color: white;
        }

        .d-flex {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px 0;
        }

        .d-flex button {
            margin-left: 10px;
            width: 20%;
        }

        .login-label {
            width: 80px;
            margin-bottom: 10px;
        }

        .login-input {
            flex: 1;
        }

        .checkbox-text {
            font-size: 14px;
            color: #555;
        }

        .text-primary {
            font-weight: bold;
        }
        #two {
            display: none
        }

        /* 제목과 내용 수정 전 스타일 */
        textarea[readonly], input[readonly] {
            background-color: transparent !important;
            border: none;
            box-shadow: none;
            color: #495057;
            cursor: not-allowed;
            padding: 0;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="update.member" method="post">
        <div class="text-center mb-4">
            <h4 class="text-primary">My Page</h4>
        </div>

        <div class="d-flex align-items-center">
            <label class="login-label">아이디</label>
            <input type="text" id="id" name="id" class="form-control login-input" readonly>
        </div>

        <div class="d-flex align-items-center">
            <label class="login-label">이름</label>
            <input type="text" id="name" class="form-control login-input" name="name" readonly>
        </div>

        <!-- 수정가능 필드 (처음엔 readonly 설정) -->
        <div class="d-flex align-items-center">
            <label class="login-label">전화번호</label>
            <input type="text" id="phone" class="form-control login-input" name="phone" readonly>
        </div>

        <div class="d-flex align-items-center">
            <label class="login-label">이메일</label>
            <input type="text" id="email" class="form-control login-input" name="email" readonly>
        </div>

        <div class="d-flex align-items-center">
            <label class="login-label">우편번호</label>
            <input type="text" id="zipcode" class="form-control login-input" name="zipcode" readonly>
        </div>

        <div class="d-flex align-items-center">
            <label class="login-label">주소</label>
            <input type="text" id="address1" class="form-control login-input" name="address1" readonly>
        </div>

        <div class="d-flex align-items-center">
            <label class="login-label">상세주소</label>
            <input type="text"
                   id="address2" class="form-control login-input"
                   name="address2"
                   readonly>
        </div>

        <!-- 가입날짜 -->
        <div class="d-flex align-items-center">
            <label class="login-label">가입날짜</label>
            <input type="text" id="signupDate" class="form-control" readonly>
        </div>

        <!-- 수정모드 진입 버튼 -->
        <div class="d-flex justify-content-between mb-3" id="one">
            <button type="button" class="btn btn-primary w-50 me-2" id="btnone">수정하기</button>
            <a href="/index.jsp" class="btn btn-outline-secondary w-50">뒤로가기</a>
        </div>

        <!-- 수정모드 중 버튼 -->
        <div class="d-flex justify-content-between mb-3" id="two">
            <button type="submit" class="btn btn-primary w-50 me-2">수정완료</button>
            <a class="btn btn-outline-secondary w-50" id="cancelBtn">취소</a>
        </div>
    </form>
</div>


<script>
    $("#btnone").on("click", function () {
        $("#phone").prop("readonly", false);
        $("#email").prop("readonly", false);
        $("#zipcode").prop("readonly", false);
        $("#address1").prop("readonly", false);
        $("#address2").prop("readonly", false);

        $("#one").hide();
        $("#two").show();
    });

    // 수정 취소
    $("#cancelBtn").on("click", function () {
        $("#phone").prop("readonly", true);
        $("#email").prop("readonly", true);
        $("#zipcode").prop("readonly", true);
        $("#address1").prop("readonly", true);
        $("#address2").prop("readonly", true);

        $("#two").hide();
        $("#one").show();
    });

    $(function () {
        // 회원 정보 불러오기
        $.ajax({
            url: "/mypages.members",
            type: "GET",
            dataType: "json"
        }).done(function (data) {
            $("#name").val(data.name);
            $("#phone").val(data.phone);
            $("#email").val(data.email);
            $("#zipcode").val(data.zipcode);
            $("#address1").val(data.address1);
            $("#address2").val(data.address2);
            $("#signupDate").val(data.join_date);
        });
    });
</script>

</body>
</html>
