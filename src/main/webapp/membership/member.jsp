<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            padding-right: 50px;
            padding-left: 50px;
            overflow-y: auto;
        }

        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background-color: rgba(255, 255, 255, 0);
        }

        ::-webkit-scrollbar-thumb {
            background-color: rgb(0, 174, 255);
            border-radius: 10px;
            background-clip: border-box;
        }

        .back {
            position: fixed;
            top: 30px;
            left: 5px;
            z-index: 9999;
            cursor: pointer;
        }

        .container {
            max-width: 900px;
            height: 100vh;
            padding-top: 50px;
        }

        .exe {
            font-size: 15px;
            color: gray;
        }

        abc {
            color: coral;
        }

        .checkbutton {
            width: 100%;
            background-color: skyblue;
            border-radius: 5px;
            color: white;
            border: none;
        }

        .checkbutton:hover {
            background-color: #00bfff;
        }

        .row1 {
            border: 1px solid gray;
            border-radius: 5px;
            padding: 5px;
            margin-bottom: 5px;
        }

        .row1:focus-within {
            border: 2px solid gray;
        }

        .id {
            padding: 0%;
            border: 1px solid black;
        }

        .checktext {
            display: none;
            height: 25px;
            font-size: 12px;
            color: red;
            padding-left: 5px;
        }

        input {
            justify-content: center;
            border: none;
        }

        input:focus {
            outline: none;
        }

        input {
            width: 100%;
        }

        .address {
            width: 100%;
        }

        .row2 {
            padding-bottom: 50px;
        }

        .user {
            width: 130px;
            height: 40px;
            background-color: skyblue;
            border-radius: 5px;
            color: white;
            border: none;
        }

        .reset {
            width: 130px;
            height: 40px;
            background-color: coral;
            border-radius: 5px;
            color: white;
            border: none;
        }

        .user:hover {
            background-color: #00bfff;
        }

        .reset:hover {
            background-color: #ff4400;
        }
    </style>
</head>

<body>
    <div class="container-fluild">
        <div class="row">
            <div class="col-12 back">
                <img src="/img/back.png" alt="" width="40px" height="40px">
            </div>
        </div>
    </div>
    <div class="container">
        <form action="/AcceptLogin.members" method="post" id="frm">
            <div class="row">
                <div class="col-12 g-0">
                    <h2>회원가입</h2>
                </div>
                <div class="col-12 g-0">
                    <div class="exe">회원이 되어 다양한 혜택을 경험해보세요!</div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 opacity-0">
                    <div>null</div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">아이디<abc>*</abc>
                </div>
            </div>
            <div class="row row1">
                <div class="col-9 col-md-10 g-0">
                    <input type="text" id="id" class="text" placeholder="아이디 입력해주세요.(8자~30자까지)" name="id" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">
                    <div id="idcheck" class="checktext"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col g-0">비밀번호<abc>*</abc>
                </div>
            </div>
            <div class="row row1">
                <div class="col-12 g-0">
                    <input type="password" id="password" placeholder="비밀번호를 입력해주세요.(특수문자는 !,@,#,$ 만 사용 가능합니다.)" name="pw" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">
                    <div id="pwcheck" class="checktext"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col g-0">비밀번호 확인<abc>*</abc>
                </div>
            </div>
            <div class="row row1">
                <div class="col-12 g-0">
                    <input type="password" id="password2" placeholder="비밀번호를 한번 더 입력해주세요." class="text" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">
                    <div id="pwcheckpw" class="checktext"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col g-0">이름<abc>*</abc>
                </div>
            </div>
            <div class="row row1">
                <div class="col-12 g-0">
                    <input type="text" id="name" placeholder="이름을 입력해주세요." class="text" name="name" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">
                    <div id="namecheck" class="checktext"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col g-0">전화번호<abc>*</abc>
                </div>
            </div>
            <div class="row row1">
                <div class="col-12 g-0">
                    <input type="text" id="phone" placeholder="전화번호를 입력해주세요." class="text" name="phone" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">
                    <div id="phonecheck" class="checktext"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col g-0">이메일<abc>*</abc>
                </div>
            </div>
            <div class="row row1">
                <div class="col-12 g-0">
                    <input type="text" id="email" placeholder="이메일을 입력해주세요." class="text" name="email" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">
                    <div id="emcheck" class="checktext"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col g-0">주소
                </div>
            </div>
            <div class="row row1">
                <div class="col-9 col-md-10 col g-0">
                    <input type="text" id="postcode" placeholder="우편번호" name="zipcode" readonly />
                </div>
                <div class="col-3 col-md-2 col g-0">
                    <input type="button" onclick="execDaumPostcode()" id="searchAddress" value="찾기" class="checkbutton" />
                </div>

            </div>
            <div class="row row1">
                <div class="col-12 g-0">
                    <input type="text" id="roadAddress" placeholder="도로명주소" name="address1" readonly />
                </div>
            </div>
            <div class="row row1">
                <div class="col-12 g-0">
                    <input type="text" id="detailAddress" placeholder="상세주소" name="address2" />
                </div>
            </div>
            <div class="row">
                <div class="col-12 g-0">
                    <div id="adcheck" class="checktext"></div>
                </div>
            </div>
            <div class="row g-0">
                <div class="col-12 fs">
                    <span><strong>(필수) 개인정보 수집·이용에 대한 안내</strong></span>
                </div>
            </div>

            <div class="row row2">
                <div class="col-12 text-center g-0">
                    <input type="submit" class="user" value="회원가입" />
                    <button type="reset" class="reset">다시 입력</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        let duplcheck = false;
        let emailduplcheck = false;
        // 무조건 마지막에 숫자 나오게 하기
        let regexid = /^[A-Za-z]\w{6,28}[0-9]$/;
        let regexpw = /^[A-Za-z]\w{6,}[!,@,#,$]$/;
        let regexname = /^[가-힣]{2,5}$/;
        let regexphone = /^\d{3}\d{4}\d{4}$/;
        let regexemail = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;

        $("#id").on("input", function() {
            duplcheck = false;
        }); // 아이디를 수정하면 중복확인을 다시 해야한다.

        $("#id").on("input", function() {
            if ($("#id").val() == "") {
                $("#idcheck").css("display", "none");
                return;
            }
            $.ajax({
                url: "/idcheck.members",
                type: "post",
                data: {
                    id: $("#id").val()
                }
            }).done(function(response) {
                if (response == "false") {
                    if (regexid.test($("#id").val())) {
                        $("#idcheck").css("display", "block");
                        $("#idcheck").html("사용 가능한 아이디 입니다.");
                        $("#idcheck").css("color", "skyblue");
                        duplcheck = true;
                    } else {
                        $("#idcheck").css("display", "block");
                        $("#idcheck").html("사용 불가능한 아이디 입니다.");
                        $("#idcheck").css("color", "red");
                        duplcheck = false;
                    }

                } else {
                    $("#idcheck").css("display", "block");
                    $("#idcheck").html("중복된 아이디 입니다.");
                    $("#idcheck").css("color", "red");
                    duplcheck = false;
                }
            })

        });
        $("#password").on("keyup", function() {
            if ($("#password").val() == "") {
                $("#pwcheck").css("display", "none");
                return;
            }
            if (regexpw.test($("#password").val())) {
                $("#pwcheck").css("display", "block");
                $("#pwcheck").html("사용 가능한 비밀번호 입니다.");
                $("#pwcheck").css("color", "skyblue");
            } else {
                $("#pwcheck").css("display", "block");
                $("#pwcheck").html("사용 불가능한 비밀번호 입니다.");
                $("#pwcheck").css("color", "red");
            }
        });
        $("#password2").on("keyup", function() {
            if ($("#password2").val() == "") {
                $("#pwcheckpw").css("display", "none");
                return;
            }
            if ($("#password").val() == $("#password2").val()) {
                $("#pwcheckpw").css("display", "block");
                $("#pwcheckpw").html("비밀번호가 일치합니다.");
                $("#pwcheckpw").css("color", "skyblue");
            } else {
                $("#pwcheckpw").css("display", "block");
                $("#pwcheckpw").html("비밀번호가 일치하지 않습니다.");
                $("#pwcheckpw").css("color", "red");
            }
        });
        $("#name").on("keyup", function() {
            if ($("#name").val() == "") {
                $("#namecheck").css("display", "none");
                return;
            }
            if (regexname.test($("#name").val())) {
                $("#namecheck").css("display", "block");
                $("#namecheck").html("사용 가능한 이름 입니다.");
                $("#namecheck").css("color", "skyblue");
            } else {
                $("#namecheck").css("display", "block");
                $("#namecheck").html("사용 불가능한 이름 입니다.");
                $("#namecheck").css("color", "red");
            }
        });
        $("#phone").on("keyup", function() {
            if ($("#phone").val() == "") {
                $("#phonecheck").css("display", "none");
                return;
            }
            if (regexphone.test($("#phone").val())) {
                $("#phonecheck").css("display", "block");
                $("#phonecheck").html("사용 가능한 전화번호 입니다.");
                $("#phonecheck").css("color", "skyblue");
            } else {
                $("#phonecheck").css("display", "block");
                $("#phonecheck").html("사용 불가능한 전화번호 입니다.");
                $("#phonecheck").css("color", "red");
            }
        });
        
        $("#email").on("input", function() {
            emailduplcheck = false;
        });
        $("#email").on("keyup", function() {
            if ($("#email").val() == "") {
                $("#emcheck").css("display", "none");
                return;
            }
            $.ajax({
                url: "/emailcheck.members",
                type: "post",
                data: {
                    id: $("#id").val(),
                    email: $("#email").val()
                }
            }).done(function(response) {
                if (response == "false") {
                	if (regexemail.test($("#email").val())) {
                        $("#emcheck").css("display", "block");
                        $("#emcheck").html("사용 가능한 이메일 입니다.");
                        $("#emcheck").css("color", "skyblue");
                    } else {
                        $("#emcheck").css("display", "block");
                        $("#emcheck").html("사용 불가능한 이메일 입니다.");
                        $("#emcheck").css("color", "red");
                    }

                } else {
                    $("#emcheck").css("display", "block");
                    $("#emcheck").html("중복된 이메일 입니다.");
                    $("#emcheck").css("color", "red");
                    emailduplcheck = false;
                }
            })
            
        });
        $(".reset").on("click", function() {
            $("#idcheck").css("display", "none");
            $("#pwcheck").css("display", "none");
            $("#pwcheckpw").css("display", "none");
            $("#namecheck").css("display", "none");
            $("#phonecheck").css("display", "none");
            $("#emcheck").css("display", "none");
        });

        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var roadAddr = data.roadAddress;
                    var extraRoadAddr = "";

                    document.getElementById("postcode").value = data.zonecode;
                    document.getElementById("roadAddress").value = roadAddr;
                },
            }).open();
        }
        document.getElementById("searchAddress").onclick = execDaumPostcode;

        $("#frm").on("submit", function() {
            if ($("#id").val() == "" || $("#idcheck").html() == "사용 불가능한 아이디 입니다.") {
                alert("아이디를 정확하게 입력해 주세요.");
                id.focus();
                return false;
            } else if ($("#password").val() == "" || $("#pwcheck").html() == "사용 불가능한 비밀번호 입니다.") {
                alert("비밀번호를 정확하게 입력해 주세요.");
                password.focus();
                return false;
            } else if ($("#password2").val() == "" || $("#pwcheckpw").html() == "비밀번호가 일치하지 않습니다.") {
                alert("비밀번호를 한번 더 입력해 주세요.");
                password2.focus();
                return false;
            } else if ($("#name").val() == "" || $("#namecheck").html() == "사용 불가능한 이름 입니다.") {
                alert("이름을 정확하게 입력해 주세요.");
                name.focus();
                return false;
            } else if ($("#phone").val() == "" || $("#phonecheck").html() == "사용 불가능한 전화번호 입니다.") {
                alert("전화번호를 정확하게 입력해 주세요.");
                phone.focus();
                return false;
            } else if ($("#email").val() == "" || $("#emcheck").html() == "사용 불가능한 이메일 입니다.") {
                alert("이메일을 정확하게 입력해 주세요.");
                email.focus();
                return false;
            } else if (!duplcheck) {
                alert("아이디를 제대로 작성해주세요");
                $("#id").focus();
                return false;
            }else if (!emailduplcheck) {
                alert("이메일을 제대로 작성해주세요");
                $("#email").focus();
                return false;
            }
            alert("회원가입이 완료되었습니다.");
        });
        $(".back").on("click", function() {
            location.href = "/logout.members";
        });
    </script>
</body>

</html>