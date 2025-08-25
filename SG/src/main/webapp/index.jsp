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
    * {
        box-sizing: border-box;
    }

    /* div {
       border: 1px solid black;
    }  */
    .container {
        width: 500px;
        height: 200px;
        margin: auto;
        border: 2px solid rgb(0, 106, 255);
        border-radius: 7px;
    }

    /* 1층 */
    .first {
        width: 100%;
        height: 25%;
        display: flex;
        justify-content: center;
        align-items: center;
        color: rgb(0, 106, 255);
        font-size: 20px;
        font-weight: 700;
    }

    /* 2층 */
    .second {
        width: 100%;
        height: 45%;
        display: flex;
    }

    .second-left {
        width: 35%;
        height: 100%;
        float: left;
    }

    .second-left div {
        text-align: right;
        margin-top: 10px;
        padding-right: 15px;
        color: rgb(112, 112, 112);
    }

    .second-right {
        width: 65%;
        height: 100%;
        float: left;
    }

    .second-right div {
        margin-top: 10px;
    }

    #id, #pw {
        width: 200px;
    }

    /* 3층 */
    /* .third {
       width: 100%;
       height: 15%;
       text-align: center;
    }

    .third button {
       margin: auto;
    } */
    #login {
        color: white;
        background-color: rgb(0, 106, 255);
        border: none;
        border-radius: 3px;
        padding: 4px 8px;

        position:relative;
        bottom:10px;
        left: 180px;
    }

    #login:hover {
        background-color: rgb(23, 41, 66);
        border: rgb(23, 41, 66);
        color: white;
        cursor: pointer;
    }

    #signin {
        background-color: rgb(0, 106, 255);
        border: rgb(0, 106, 255);
        border-radius: 3px;
        color: white;
        padding: 4px 8px;

        position:relative;
        bottom: 37px;
        left: 248px;
    }

    #signin:hover {
        background-color: rgb(23, 41, 66);
        border: rgb(23, 41, 66);
        color: white;
        cursor: pointer;
    }



    /* 4층 */
    .fourth {
        width: 100%;
        height: 15%;
        text-align: center;
        color: rgb(112, 112, 112);
    }

    #chceckbox{
        position:relative;
        bottom: 30px;
    }

    #checkboxText{
        position:relative;
        bottom: 30px;
    }

</style>
</head>
<body>

<c:choose>
    <c:when test="${loginId == null }">
        <div class="container">
            <div class="first">Login Box</div>

            <div class="second">
                <div class="second-left">
                    <div>아이디</div>
                    <div>비번</div>
                </div>

                <form action="/login.member" method="get">
                    <div class="second-right">
                        <div>
                            <input type="text" placeholder="ID" name="id" id="id">
                        </div>
                        <div>
                            <input type="password" placeholder="PW" name ="pw" id="pw">
                        </div>
                    </div>

            <button id="login">로그인</button>
            </form>

            <form action="/join.member">
                <button id="signin">회원가입</button>
            </form>



            <div class="fourth">
                <input type="checkbox" id="chceckbox">
                <a id="checkboxText">ID 기억하기</a>
            </div>
        </div>             <!-- 세션 방식도 키값을 -->
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th colspan="4">${loginId } 님 안녕하세요</th>
            </tr>
            <tr>
                <td><a href="/list.board?cpage=1"><button id="memberBoard">회원게시판</button></a></td>
                <td>
                    <button id="myPage">마이페이지</button>
                </td>
                <td>
                    <a href="/logout.member"><button>로그아웃</button></a>
                </td>
                <td>
                    <button id="cancelMembership">회원탈퇴</button>
                </td>
            </tr>
        </table>

    </c:otherwise>

</c:choose>
<script>
    $("#cancelMembership").on("click",function(){
        if(confirm("정말 탈퇴하시겠습니까>")){
            window.location.href = "/memout.member";
        }
        else{

        }
    })

    $("#myPage").on("click",function(){
        window.location.href = "/member/myPage.jsp";
    })



</script>




</body>
</html>
