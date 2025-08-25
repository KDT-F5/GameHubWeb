<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
    border{ box-sizing: border-box;}

    div*{   border: 1px solid black;


    }

    .container{ width: 300px; height: 300px;}


</style>

</head>


<body>

<div>

<div> 정말 탈퇴하시겠습니까?</div>

<form action="delete.member" method="get">
    <button type="submit" name="del_id" value="{sessionScope.loginId}"> 탈퇴한다.</button>
    <%--밸류 세션 id 이름 양식따라 변경--%>
</form>

<div id = "container">

    <button id="cancel_btn"> 취소</button>

    <script>
        $("#cancel_btn").on("click", function () {

            window.close();

        });


    </script>


</div>

</div> <%--container--%>
</body>
</html>
