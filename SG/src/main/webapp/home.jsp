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
</head>
<body>
<div class="card text-center">
    <div class="card-header">Welcome</div>
    <form action="delete.member" method="post">
        <div class="card-body">
            <h4 class="card-title">id님환영합니다.</h4>
            <p class="card-text">원하는 버튼을 클릭하세요.</p>
            <a href="/title.boards" class="btn btn-primary w-20">회원게시판</a>
            <a href="/mypage.jsp" class="btn btn-primary w-20">마이페이지</a>
            <a href="/logout.members" class="btn btn-outline-primary w-20">로그아웃</a>
            <button class="btn btn-outline-primary w-20" id="del">회원탈퇴</button>
        </div>
    </form>
    </form>
</div>

<script>

</script>
</body>
</html>
