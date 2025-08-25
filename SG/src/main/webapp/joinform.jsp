<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 25. 8. 25.
  Time: 오후 2:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/register.member" method="post">

    <div class=container>

        <!--1층-->
        <div class="header">회원가입 정보 입력</div>

        <!--2층-->
        <div class="contents">
            <div class="idbox">
                <div class="leftName">
                    <div class="text">ID</div>
                </div>

                <div class="right">
                    <input type=text placeholder="아이디를 입력하세요" id="id" name="id">
                    <button id="dupliCheck" type="button">중복확인</button>
                    <div id="dupliCheckMsg"></div>
                </div>
            </div>


            <div class="pwbox">
                <div class="leftName">
                    <div class="text">PW</div>
                </div>

                <div class="right">
                    <input type=text class="longtext" placeholder="비밀번호를 입력하세요"
                           name="pw" id="pw">
                </div>
            </div>


            <div class="pwcheckbox">
                <div class="leftName">
                    <div class="text">PW 확인</div>
                </div>

                <div class="right">
                    <input type=text class="longtext" placeholder="비밀번호를 다시 입력하세요"
                           id="pwcheck">
                </div>
            </div>


            <div class="name">
                <div class="leftName">
                    <div class="text">이름</div>
                </div>

                <div class="right">
                    <input type=text class="longtext" placeholder="이름을 입력하세요"
                           name="name" id="name">
                </div>
            </div>



            <div class="phone">
                <div class="leftName">
                    <div class="text">전화번호</div>
                </div>

                <div class="right">
                    <input type=text class="longtext" placeholder="전화번호를 입력하세요"
                           name="phone" id="phone">
                </div>
            </div>




            <div class="email">
                <div class="leftName">
                    <div class="text">이메일</div>
                </div>

                <div class="right">
                    <input type=text class="longtext" placeholder="이메일을 입력하세요"
                           name="email" id="email">
                </div>
            </div>



            <div class="code">
                <div class="leftName">
                    <div class="text">우편번호</div>
                </div>

                <div class="right">
                    <input type=text class="longtext" placeholder="우편번호" id="zoneCode"
                           readonly name="zipcode"> <input type="button"
                                                           id="searchBtn" value="찾기">
                </div>
            </div>



            <div class="address1">
                <div class="leftName">
                    <div class="text">주소</div>
                </div>

                <div class="right">
                    <input type=text class="longlongtext" placeholder="주소를 입력하세요"

                           readonly id="inputedAddress" name="address1">
                </div>
            </div>


            <div class="address2">
                <div class="leftName">
                    <div class="text">상세주소</div>
                </div>

                <div class="right">
                    <input type=text class="longlongtext" placeholder="상세주소를 입력하세요"
                           name="address2">
                </div>
            </div>
        </div>

        <!--3층-->
        <div class="footer">
            <button id="completeBtn" type="submit">완료</button>
            <input type="button" id="rewriteBtn" value="다시입력">
        </div>
    </div>

</form>



<script>

    $("form").on("submit", function(e) {
        // 여기에 기존 유효성 검사 코드 넣기
        //필수칸 비어있는지 먼저 확인후 return false시키기
        if ($("#id").val() == "" || $("#pw").val() == ""
            || $("#pwcheck").val() == ""
            || $("#phone").val() == "") {
            alert("아이디, 패스워드, 연락처는 필수입력칸 입니다");
            return false;
        }



        // 아이디 유효성 검사
        let regex1 = /^[0-9a-z_]{4,12}$/;
        let result1 = regex1.test($("#id").val());

        if (!result1) { //아이디가 유효하지 않으면
            alert("아이디 형식을 확인하세요");
            $("#id").val("");
            $("#id").focus();
            return false;
        }


        // 비번 유효성 검사
        let regex2 = /^[0-9a-zA-Z`~!@#$%^&*()\-_=+{}\[\]\\:;"'<>,.?]{8,16}$/;


        let result2 = regex2.test($("#pw").val());

        if (!result2) { //비번1이 유효하지 않으면
            alert("비밀번호 형식을 확인하세요");
            $("#pw").val("");
            $("#pwcheck").val("");
            $("#pw").focus();
            return false;


        } else if ((!/[0-9]/.test($("#pw").val()))
            || (!/[a-z]/.test($("#pw").val()))
            || (!/^[0-9a-zA-Z`~!@#$%^&*()\-_=+{}\[\]\\:;"'<>,.?]{8,16}$/
                .test($("#pw").val()))) {
            alert("비밀번호는 하나 이상의 숫자, 영문, 특수문자를 포함해야 합니다");

            $("#pw").val("");
            $("#pwcheck").val("");
            $("#pw").focus();
            return false;
        }



        //비번 체크 검사
        let pw2 = $("#pwcheck").val();
        if (($("#pw").val()) != pw2) {
            alert("동일한 비밀번호가 아닙니다");
            $("#pw").val("");
            $("#pwcheck").val("");
            $("#pw").focus();
            return false;
        }



        // 이름 유효성검사
        let regex3 = /^[가-힣]{2,6}$/;
        let result3 = regex3.test($("#name").val());


        if (!result3) { //이름이 유효하지 않으면
            alert("정확한 이름을 입력하세요");
            $("#name").val("");
            $("#name").focus();
            return false;
        }


        // 전화번호 유효성 검사
        let regex4 = /^010-?[0-9]{4}-?[0-9]{4}$/;
        let result4 = regex4.test($("#phone").val());


        if (!result4) { //이름이 유효하지 않으면
            alert("정확한 전화번호를 입력하세요");
            $("#phone").val("");
            $("#phone").focus();
            return false;
        }


        //이메일 유효 검사
        let regex5 = /^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.(com|co\.kr)$/;
        let result5 = regex5.test($("#email").val());


        if (!result5) { //이메일이 유효하지 않으면
            alert("정확한 이메일을 입력하세요");
            $("#email").val("");
            $("#email").focus();
            return false;
        }
        // 모든 검사 통과하면 return true라 서브밋 됨
    });


    // 다시입력 누르면
    $("#rewriteBtn").on("click", function() {
        $("form")[0].reset();
        return false;
    });



    // 우편번호 찾기 클릭했을때
    $("#searchBtn").on("click", function() {
        let post = new daum.Postcode({ ////포스트 코드 인스턴스 생성하고

            oncomplete : function(data) {
                $("#zoneCode").val(data.zonecode);
                $("#inputedAddress").val(data.address);
            }
        })
        post.open();//인스턴스에 있는 open함수 콜해서 팝업띄우기
    })


    //아이디 중복 체크 ajax

    $("#dupliCheck").on("click", function(){

        $.ajax({
            url: "/idcheck.member",
            data : {id : $("#id").val()}
        }).done(function(response){

            if(response==="true"){
                $("#dupliCheckMsg").empty();
                $("#dupliCheckMsg").append("사용 불가한 아이디입니다");


            }else if(response==="false"){

                $("#dupliCheckMsg").empty();

                $("#dupliCheckMsg").append("사용 가능한 아이디입니다");

            }
        })
    })

</script>





</body>
</html>
