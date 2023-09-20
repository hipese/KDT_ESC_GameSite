<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Login</title>
            <link rel="bigcut icon" href="img/game.png" />
            <link href="https://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" />
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.2/css/all.min.css" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
            <script src="https://kit.fontawesome.com/a076d05399.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.5/dist/js.cookie.min.js"></script>
            <style>
                .loginbox {
                    background-color: white;
                    border-radius: 20px;
                    padding-top: 55px;
                    padding-right: 10px;
                    padding-left: 10px;
                    height: 300px;

                }

                .loginbox .idlogin {
                    border: 1px solid rgba(128, 128, 128, 0.5);
                    border-top-left-radius: 10px;
                    border-top-right-radius: 10px;
                    width: 100%;
                    height: 15%;
                    display: flex;
                    align-items: center;
                    font-size: 20px;
                }

                .idlogin:focus-within {
                    border: 1px solid black;
                }

                .idlogin>i {
                    margin-left: 15px;
                    margin-right: 5px;
                }

                .idlogin>.inputlogin {
                    width: 100%;
                    height: 100%;
                    border: none;
                    outline: none;
                    background: none;
                    font-size: 18px;
                }

                .inputlogin {
                    border-bottom-left-radius: 10px;
                    border-bottom-right-radius: 10px;
                    width: 100%;
                    height: 50%;
                    font-size: 20px;
                }

                .pwlogin {
                    border: 1px solid rgba(128, 128, 128, 0.5);
                    border-top: 1px solid rgba(0, 0, 0, 0);
                    border-bottom-left-radius: 10px;
                    border-bottom-right-radius: 10px;
                    width: 100%;
                    height: 15%;
                    display: flex;
                    align-items: center;
                    font-size: 20px;
                }

                .pwlogin:focus-within {
                    border: 1px solid black;
                }

                .pwlogin>i {
                    margin-left: 15px;
                    margin-right: 5px;
                }

                .pwlogin>.inputpw {
                    width: 100%;
                    height: 100%;
                    border: none;
                    outline: none;
                    background: none;
                    font-size: 18px;
                }

                .inputpw {
                    border-bottom-left-radius: 10px;
                    border-bottom-right-radius: 10px;
                    width: 100%;
                    height: 50%;
                    font-size: 20px;
                }

                .check {
                    margin-top: 5px;
                    margin-left: 10px;
                    font-size: 15px;
                }

                .check .text {
                    margin-left: 5px;
                }

                .circle {
                    display: inline-block;
                    /* 영역적용가능해짐 */
                    width: 17px;
                    height: 17px;
                    border: 2px solid #666;
                    box-sizing: border-box;
                    border-radius: 10px;
                    /* 모서리둥글게 처리 */
                    position: relative;
                    top: 4px;
                    cursor: pointer;
                    /* 마우스 올렸을때 손모양 처리 */

                    background-image: url(check_gray.png);
                    background-size: 70%;
                    background-repeat: no-repeat;
                    background-position: center;
                }

                #chk:checked+.circle {
                    background-color: rgb(0, 0, 0);
                    border-color: rgb(0, 0, 0);
                    background-image: url(img/check_white.png);
                }

                #chk {
                    position: absolute;
                    left: -999em;
                }

                .loginbtn {
                    background-color: #000000;
                    color: white;
                    border: none;
                    border-radius: 10px;
                    padding: 5px;
                    font-size: 20px;
                    font-weight: bold;
                    cursor: pointer;
                    width: 100%;
                    margin-top: 20px;
                }
            </style>
        </head>

        <body>
            <div class="container">
                <div class="row">
                    <div class="col-12 g-0">
                        <form action="/login.members" method="post">
                            <div class="loginbox">
                                <div class="idlogin">
                                    <i class="fa-regular fa-user"></i>
                                    <input type="text" placeholder="아이디" id="id" class="inputlogin" name="id" />
                                </div>

                                <div class="pwlogin">
                                    <i class="fa-solid fa-lock"></i>
                                    <input type="password" placeholder="비밀번호" class="inputpw" name="pw" />
                                </div>
                                <div class="check">
                                    <label for="chk">
                                        <input type="checkbox" id="chk" />
                                        <i class="circle"></i>
                                        <span class="text">로그인 상태 유지</span>
                                    </label>
                                </div>
                                <input type="submit" value="로그인" class="loginbtn" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                // 쿠키 생성해서 아이디 저장
                let inputID = document.getElementById("id");
                let remID = document.getElementById("chk");

                let userID = Cookies.get("remID");
                if (userID) {
                    inputID.value = userID;
                    remID.checked = true;
                }
                remID.onchange = function () {
                    if (remID.checked) {
                        Cookies.set("remID", inputID.value, { expires: 7 }); // 7일간 저장
                    } else {
                        s
                        Cookies.remove("remID"); // 쿠키 삭제
                    }
                }
            </script>
        </body>

        </html>