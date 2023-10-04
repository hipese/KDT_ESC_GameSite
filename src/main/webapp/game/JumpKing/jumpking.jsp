<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Jump King</title>
    <link rel="bigcut icon" href="img/elf.png" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.60.0/phaser.min.js" integrity="sha512-YQL0GVx/Too3vZjBl9plePRIYsRnd1s8N6QOvXPdZ+JMH2mtRTLQXGUDGjNW6zr1HUgcOIury67IvWe91oeEwQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link href="https://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/GameStart_scene.js"></script>
    <script src="js/move.js"></script>
    <script src="js/GameOver_scene.js"></script>
    <script src="js/Rank_scene.js"></script>
    <link rel="stylesheet" href="../../css/footer.css">
    <style>
        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background-color: rgb(255, 255, 255);
        }

        ::-webkit-scrollbar-thumb {
            background-color: rgb(0, 0, 0);
            border-radius: 20px;
            background-clip: border-box;
        }

        #container {
            width: 500px;
            height: 500px;
            margin: auto;
            margin-top: 30px;
            overflow-y: hidden;
        }

        .container-fluid {
            padding: 0px;
        }

        .header {
            background-color: #000000;
            color: #fff;
            font-family: 'Nanum Pen Script', cursive;
            height: 50px;
            width: 100%;
            display: flex;
            align-items: center;
            font-size: 25px;
            z-index: 9999;
            margin: 0px;
        }

        .headerul {
            list-style: none;
            display: flex;
            justify-content: end;
            align-content: center;
            margin: 0px;

        }

        .headerli {
            margin-left: 30px;
            float: left;
        }

        .headerli a:hover {
            color: #ffb0b0;
        }

        a {
            color: #fff;
            text-decoration: none;
        }

        .navi {
            text-align: end;
        }

        .wrapper {
            position: fixed;
            top: 0;
            right: -100%;
            height: 100%;
            width: 100%;
            background: #000;
            transition: all 0.6s ease-in-out;
        }

        #active:checked~.wrapper {
            right: 0;
        }

        .menu-btn {
            position: absolute;
            z-index: 2;
            right: 20px;
            top: 20px;
            height: 50px;
            width: 50px;
            text-align: center;
            line-height: 50px;
            border-radius: 50%;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .menu-btn span,
        .menu-btn:before,
        .menu-btn:after {
            content: "";
            position: absolute;
            width: 40%;
            border-bottom: 2px solid #ffffff;
            transition: transform .6s cubic-bezier(0.215, 0.61, 0.355, 1);
        }

        .menu-btn:before {
            transform: translateY(-8px);
        }

        .menu-btn:after {
            transform: translateY(8px);
        }


        .close {
            z-index: 1;
            width: 100%;
            height: 100%;
            pointer-events: none;
            transition: background .6s;
        }

        /* closing animation */
        #active:checked+.menu-btn span {
            transform: scaleX(0);
        }

        #active:checked+.menu-btn:before {
            transform: rotate(45deg);
            border-color: #fff;
        }

        #active:checked+.menu-btn:after {
            transform: rotate(-45deg);
            border-color: #fff;
        }

        .wrapper ul {
            position: absolute;
            top: 60%;
            left: 50%;
            height: 90%;
            transform: translate(-50%, -50%);
            list-style: none;
            text-align: center;
        }

        .wrapper ul li {
            height: 10%;
            margin: 15px 0;
        }

        .wrapper ul li a {
            text-decoration: none;
            font-size: 30px;
            font-weight: 500;
            padding: 5px 30px;
            color: #fff;
            border-radius: 50px;
            position: absolute;
            line-height: 50px;
            margin: 5px 30px;
            opacity: 0;
            transition: all 0.3s ease;
            transition: transform .6s cubic-bezier(0.215, 0.61, 0.355, 1);
        }

        .wrapper ul li a:after {
            position: absolute;
            content: "";
            background: #fff;
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            border-radius: 50px;
            transform: scaleY(0);
            z-index: -1;
            transition: transform 0.3s ease;
        }

        .wrapper ul li a:hover:after {
            transform: scaleY(1);
        }

        .wrapper ul li a:hover {
            color: #ff00bb;
        }

        input[type="checkbox"] {
            display: none;
        }

        .content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: -1;
            text-align: center;
            width: 100%;
            color: #070707;
        }

        .content .title {
            font-size: 40px;
            font-weight: 700;
        }

        .content p {
            font-size: 35px;
            font-weight: 600;
        }

        #active:checked~.wrapper ul li a {
            opacity: 1;
        }

        .wrapper ul li a {
            transition: opacity 1.2s, transform 1.2s cubic-bezier(0.215, 0.61, 0.355, 1);
            transform: translateX(100px);
        }

        #active:checked~.wrapper ul li a {
            transform: none;
            transition-timing-function: ease, cubic-bezier(.1, 1.3, .3, 1);
            transition-delay: .6s;
            transform: translateX(-100px);
        }

        .gamemove {
            margin-top: 50px;

        }

        .controll {
            font-size: 35px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 40px;
            width: 400px;
            border-radius: 10px;
            box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 7px 20px 0 rgba(0, 0, 0, 0.17);
        }

        .modal-content h2 {
            font-size: 28px;
            font-weight: 500;
            text-align: center;
            margin-bottom: 30px;
        }

        .modal-content form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .modal-content label {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .modal-content label i {
            font-size: 20px;
            margin-right: 10px;
        }

        .modal-content input[type="text"],
        .modal-content input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 18px;
            border: none;
            border-bottom: 2px solid #ddd;
            outline: none;
            transition: border-bottom 0.2s ease-in-out;
        }

        .modal-content input[type="text"]:focus,
        .modal-content input[type="password"]:focus {
            border-bottom: 2px solid #000000;
        }

        .modal-content button[type="submit"] {
            background-color: #000000;
            color: #fff;
            padding: 10px 20px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            margin-top: 20px;
        }

        .modal-content button[type="submit"]:hover {
            background-color: #ffffff;
            color: #000000;
        }

        .close-button {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 30px;
            cursor: pointer;
        }

        #login-button {
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            display: block;
        }

        #login-modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.7);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            width: 400px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            animation: open-modal-animation 0.5s ease-in-out;
            transition: transform 0.5s ease-in-out;
        }

        @keyframes open-modal-animation {
            0% {
                transform: scale(0);
            }

            100% {
                transform: scale(1);
            }
        }

        @keyframes close-modal-animation {
            0% {
                transform: scale(1);
            }

            100% {
                transform: scale(0);
            }
        }

        .headerul2 {
            list-style: none;
            display: flex;
            justify-content: end;
            align-content: center;
            margin: 0px;
            position: absolute;
            right: 60px;
            cursor: pointer;
        }

        .headerul2 li:hover {
            color: pink;
        }

        .pdbottom {
            margin-top: 50px;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row header">
            <div class="col-1 d-sm-block d-none"></div>
            <div class="col-2 ">
                <a href="/"><img src="../../img/ESC HEADER.png" alt="" width="110px" height="50px"></a>
            </div>
            <div class="col-8 d-sm-block d-none">
                <ul class="headerul">
                    <li class="headerli headerlogin">
                        <a href="#" class="login" id="login-button">로그인</a>
                    </li>
                    <li class="headerli headerlogout">
                        <a href="/logout.members">로그아웃</a>
                    </li>
                    <li class="headerli">
                        <a href="/showBoardList.board?cpage=1&searchText=">게시판</a>
                    </li>
                    <li class="headerli headerboard">
                        <a href="#">마이페이지</a>
                    </li>
                </ul>
            </div>
            <div class="col-1 d-md-block d-none"></div>
            <div class="col-1 d-block d-sm-none">
                <ul class="headerul2">
                    <c:choose>
                        <c:when test="${empty sessionScope.loginID}">
                            <li class="headerli headerlogin2">
                                <div class="login" id="login-button2">로그인</div>
                            </li>
                            <li class="headerli membership2"><a href="/Membership.members">회원가입</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="headerli headerlogout2"><a href="/logout.members">로그아웃</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <input type="checkbox" id="active">
                <label for="active" class="menu-btn"><span></span></label>
                <label for="active" class="close"></label>
                <div class="wrapper">
                    <ul>
                        <li><a href="#">Board</a></li>
                        <li><a href="#">MyPage</a></li>
                        <li><a href="#">Rank</a></li>
                        <li><a href="#">Shop</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="login-modal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            <h2>Login</h2>
            <form action="/login.members" id="loginForm" method="post">
                <label> <i class="fa fa-user"></i> <input type="text" id="username" placeholder="아이디" name="id">
                </label> <label> <i class="fa fa-lock"></i> <input type="password" id="password" placeholder="비밀번호" name="pw">
                </label>
                <input type="url" id="url" name="url" style="display: none;" />
                <button type="submit">로그인</button>
            </form>
        </div>
    </div>
    <div id="container">
    </div>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="gamemove text-center">
                    <h1>조작법</h1>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="controll">
                    이동　:　
                    <img src="img/leftright.png" alt="">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="controll">
                    점프　:　
                    <img src="img/spacebar.jpg" alt="" width="120px">
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid ">
        <div class="row g-0">
            <div class="col-12 opacity-0 pdbottom"></div>
        </div>
    </div>
    <div class="second-fluid">
        <div class="row footer gx-0">
            <div class="col-12 col-xl-4 order-4 order-xl-1">
                <div class="row">
                    <div class="col-12 foottitle">
                        <span>Team E.S.C</span>
                    </div>
                    <span class="footenter"> <span>팀 프로젝트로 만든 재밌는 게임들</span>
                    </span>
                </div>
            </div>
            <div class="col-12 col-xl-3 order-3 order-xl-2">
                <div class="footertitle d-none d-xl-block">
                    <span>고객센터</span>
                </div>
                <div class="row">
                    <span class="col-12 service"> 문의 : 010-1234-5678 </span>
                </div>
                <div class="row">
                    <span class="col-12 service"> <a target="_blank" href="https://pf.kakao.com"> 카카오톡 상담 문의
                        </a></span>
                </div>
                <div class="row opacity-0">
                    <br />
                </div>
                <div class="row">
                    <span class="col-12 service"> 게임문의·단가문의·견적문의·기타문의 </span>
                </div>
                <div class="row">
                    <span class="col-12 service"> 오픈 : 24시간 </span>
                </div>
            </div>
            <div class="col-12 col-xl-1 order-2 order-xl-3 opacity-0"></div>
            <div class="col-12 col-xl-2 order-1 order-xl-4">
                <div class="footertitle d-none d-xl-block">
                    <span> Social</span>
                </div>
                <div class="footericon">
                    <a target="_blank" class="instaicon" href="https://www.instagram.com"><img class="icon" src="../../img/instagram.svg" alt="icon" width="40px" /></a>
                    <a target="_blank" class="youtubeicon" href="https://youtube.com"><img class="youtube" src="../../img/youtube.svg" alt="icon" width="40px" /></a>
                </div>
            </div>
        </div>
    </div>
	<c:if test="${not empty loginError}">
		<script>
	        Swal.fire({
	            icon: 'error',
	            title: '로그인 오류',
	            text: '${loginError}'
	        });
	    </script>
		<c:remove var="loginError" scope="session" />
	</c:if>

    <script>
        let loginID = "${sessionScope.loginID}";

        if (loginID != "") {
            $(".headerlogin").hide();
            $(".headerlogout").show();
            $(".trueable").hide();
            $(".falseable").show();
            $(".headerboard").show();
        } else {
            $(".headerlogin").show();
            $(".headerlogout").hide();
            $(".trueable").show();
            $(".falseable").hide();
            $(".headerboard").hide();
        }

        if (loginID == "") {
            const loginButton = document.getElementById("login-button");
            const loginButton2 = document.getElementById("login-button2");
            const loginModal = document.getElementById("login-modal");
            const closeButton = document.querySelector(".close-button");

            loginButton.addEventListener("click", function() {
                loginModal.style.display = "block";
            });
            loginButton2.addEventListener("click", function() {
                loginModal.style.display = "block";
            });

            closeButton.addEventListener("click", function() {
                loginModal.style.display = "none";
            });

            window.addEventListener("click", function(event) {
                if (event.target === loginModal) {
                    loginModal.style.display = "none";
                }
            });
            // 로그인 모달 관련
            const modal = document.getElementById('login-modal');
            const openButton = document.getElementById('login-button');
            const openButton2 = document.getElementById('login-button2');
            const body = document.body;
            $(".url").val(window.location.href);

            // 모달 열기
            openButton.onclick = function() {
                modal.style.display = 'block';
                body.style.overflow = 'hidden'; // 배경 스크롤 막기
                $(".scroll").val(scrollY);
            };
            openButton2.onclick = function() {
                modal.style.display = 'block';
                body.style.overflow = 'hidden'; // 배경 스크롤 막기
                $(".scroll").val(scrollY);
            };

            // 모달 닫기
            function closeModal() {
                modal.style.display = 'none';
                body.style.overflow = 'auto'; // 배경 스크롤 다시 활성화
                $(".scroll").val("");
            }

            closeButton.onclick = closeModal;

            // 모달 외부 클릭 시 모달 닫기
            window.onclick = function(event) {
                if (event.target === modal) {
                    closeModal();
                }
            };
        }


        let option = {
            type: Phaser.AUTO,
            parent: "container",
            width: "100%",
            height: "100%",
            physics: {
                default: "arcade",
                arcade: {
                    gravity: {
                        y: 0
                    },
                    debug: false
                }
            },
            scene: [GameStartScene, MoveScene, GameOverScene, RankScene],
            fps: {
                target: 60, // 원하는 FPS 설정 (기본값은 60)
                forceSetTimeOut: true // 브라우저 지원이 안 되는 경우에 setTimeout 사용
            }
        };
        let game = new Phaser.Game(option);

        $("#url").val(window.location.href);

        document.addEventListener("DOMContentLoaded", function() {

            var loginForm = document.getElementById("loginForm");
            loginForm.addEventListener("submit", function(event) {
                var loginSuccessful = true;

                if (loginSuccessful) {
                    opener.location.reload();
                }
            });
        });
    </script>
</body>

</html>