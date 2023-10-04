<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E.S.C Ranking</title>
    <link rel="bigcut icon" href="../img/ESC.png" />
    <link href="https://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.5/dist/js.cookie.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <style>
        * {
            box-sizing: border-box;
        }

        @keyframes colorChange {
            0% {
                filter: invert(16%) sepia(89%) saturate(6054%) hue-rotate(0deg) brightness(97%) contrast(113%);
            }

            100% {
                filter:
                    invert(16%) sepia(89%) saturate(6054%) hue-rotate(360deg) brightness(97%) contrast(113%);
            }
        }

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


        body {
            background-color: whitesmoke;
        }

        .banner {
            height: 300px;
            margin-top: 80px;
            background-color: white;
            border-radius: 20px;
            cursor: pointer;
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
                transform:
                    scale(1);
            }
        }

        @keyframes close-modal-animation {
            0% {
                transform: scale(1);
            }

            100% {
                transform:
                    scale(0);
            }
        }

        .pdbottom {
            margin-top: 50px;
        }

        .footer {
            padding: 50px 50px 50px;
        }

        .foottitle {
            font-family: "Nanum Pen Script", cursive;
            font-size: calc(1.2rem + 2vw);
        }

        .footenter {
            font-size: 13px;
        }

        .footertitle {
            font-family: "Nanum Pen Script", cursive;
            font-size: 25px;
            border-bottom: 1px solid black;
        }

        .footericon {
            padding-top: 5px;
        }

        .icon {
            animation: colorChange 2s infinite;
        }

        .youtube {
            animation: colorChange 3s infinite;
        }

        .service {
            font-family: "Nanum Pen Script", cursive;
            font-size: 20px;
        }

        .service>a {
            text-decoration-line: none;
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

        .margintop {
            margin-top: 70px;
        }

        h2 {
            text-align: start;
            margin-left: 5px;
        }

        .RankHeader {
            margin-top: 15px;
            font-size: 20px;
            font-weight: bold;
            border-top: 2px solid black;
            border-bottom: 1px solid black;
            padding: 10px 0 10px 0;
            margin-left: 3px;
            margin-right: 3px;
        }

        .RankBody {
            border-bottom: 1px solid black;
            padding: 5px 0 5px 0;
            margin-left: 3px;
            margin-right: 3px;
        }

        .RankBody:hover {
            background-color: #e9ecef;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row header">
            <div class="col-1 d-sm-block d-none"></div>
            <div class="col-2 "><a href="/"><img src="../img/ESC HEADER.png" alt="" width="110px" height="50px"></a></div>
            <div class="col-8 d-sm-block d-none">
                <ul class="headerul">
                    <c:choose>
                        <c:when test="${empty sessionScope.loginID}">
                            <li class="headerli headerlogin">
                                <div class="login" id="login-button">로그인</div>
                            </li>
                            <li class="headerli membership"><a href="/Membership.members">회원가입</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="headerli headerlogout"><a href="/logout.members">로그아웃</a>
                            </li>
                            <li class="headerli"><a href="/showBoardList.board?cpage=1&searchText=">게시판</a></li>
                            <li class="headerli headerboard"><a href="/mypage.members">마이페이지</a></li>
                        </c:otherwise>

                    </c:choose>


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
                <input type="checkbox" id="active"> <label for="active" class="menu-btn"><span></span></label>
                <label for="active" class="close"></label>
                <div class="wrapper">
                    <ul>
                        <li><a href="#">Board</a></li>
                        <li><a href="/mypage.members">MyPage</a></li>
                        <li><a href="#">Rank</a></li>
                        <li><a href="#">Shop</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>








    <div class="container">
        <div class="row text-center RankTop">
            <div class="col-12 col-md-6 margintop JumpKing">
                <h2>JumpKing</h2>
                <div class="row RankHeader">
                    <div class="col-3">
                        RANK
                    </div>
                    <div class="col-3">
                        ID
                    </div>
                    <div class="col-3">
                        SCORE
                    </div>
                    <div class="col-3">
                        DATE
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 margintop SkeletonSurvivor">
                <h2>Skeleton Survivor</h2>
                <div class="row RankHeader">
                    <div class="col-3">
                        RANK
                    </div>
                    <div class="col-3">
                        ID
                    </div>
                    <div class="col-3">
                        SCORE
                    </div>
                    <div class="col-3">
                        DATE
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 margintop DinoGame">
                <h2>Dino Game</h2>
                <div class="row RankHeader">
                    <div class="col-3">
                        RANK
                    </div>
                    <div class="col-3">
                        ID
                    </div>
                    <div class="col-3">
                        SCORE
                    </div>
                    <div class="col-3">
                        DATE
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 margintop CarCrash">
                <h2>Car Crash</h2>
                <div class="row RankHeader">
                    <div class="col-3">
                        RANK
                    </div>
                    <div class="col-3">
                        ID
                    </div>
                    <div class="col-3">
                        SCORE
                    </div>
                    <div class="col-3">
                        DATE
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 margintop RoadOfSamurai">
                <h2>Road Of Samurai</h2>
                <div class="row RankHeader">
                    <div class="col-3">
                        RANK
                    </div>
                    <div class="col-3">
                        ID
                    </div>
                    <div class="col-3">
                        SCORE
                    </div>
                    <div class="col-3">
                        DATE
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 margintop RaiseDragon">
                <h2>Raise Dragon</h2>
                <div class="row RankHeader">
                    <div class="col-3">
                        RANK
                    </div>
                    <div class="col-3">
                        ID
                    </div>
                    <div class="col-3">
                        SCORE
                    </div>
                    <div class="col-3">
                        DATE
                    </div>
                </div>
            </div>
        </div>
    </div>










    <div class="container-fluid">
        <div class="row">
            <div class="col-12 opacity-0 pdbottom"></div>
        </div>
    </div>
    <div class="second-fluid">
        <div class="row footer gx-0">
            <div class="col-12 col-md-4 order-4 order-md-1">
                <div class="row">
                    <div class="col-12 foottitle">
                        <span>Team E.S.C</span>
                    </div>
                    <span class="footenter"> <span>팀 프로젝트로 만든 재밌는 게임들</span>
                    </span>
                </div>
            </div>
            <div class="col-12 col-md-3 order-3 order-md-2">
                <div class="footertitle d-none d-md-block">
                    <span>고객센터</span>
                </div>
                <div class="row">
                    <span class="col-12 service"> 문의 : 010-9554-7757 </span>
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
            <div class="col-12 col-md-1 order-2 order-md-3 opacity-0"></div>
            <div class="col-12 col-md-2 order-1 order-md-4">
                <div class="footertitle d-none d-md-block">
                    <span> Social</span>
                </div>
                <div class="footericon">
                    <a target="_blank" class="instaicon" href="https://www.instagram.com"><img class="icon" src="../img/instagram.svg" alt="icon" width="40px" /></a>
                    <a target="_blank" class="youtubeicon" href="https://youtube.com"><img class="youtube" src="../img/youtube.svg" alt="icon" width="40px" /></a>
                </div>
            </div>
        </div>
    </div>
    <div id="login-modal" class="modal">
        <div class="modal-content">
            <span class="close-button">&times;</span>
            <h2>Login</h2>
            <form action="/login.members" method="post">
                <label> <i class="fa fa-user"></i> <input type="text" id="username" placeholder="아이디" name="id"></label>
                <label> <i class="fa fa-lock"></i> <input type="password" id="password" placeholder="비밀번호" name="pw">
                </label>
                <input type="url" class="url" name="url" style="display: none;" />
                <input type="text" class="scroll" name="scroll" style="display: none;">
                <button type="submit">로그인</button>
            </form>
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

</body>
<script>
    function formatTime(milliseconds) {
        const minutes = Math.floor(milliseconds / 60000);
        const seconds = Math.floor((milliseconds % 60000) / 1000);
        const millisecondsDisplay = Math.floor((milliseconds % 1000) / 10);
        let formattedMinutes = minutes.toString().padStart(2, "0"); // padStart를 사용하여 2자리로 만들어줌
        let formattedSeconds = seconds.toString().padStart(2, "0"); // padStart를 사용하여 2자리로 만들어줌
        let formattedMillisecondsDisplay = millisecondsDisplay.toString().padStart(2, "0"); // padStart를 사용하여 2자리로 만들어줌

        return `\${formattedMinutes}분 \${formattedSeconds}.\${formattedMillisecondsDisplay} `;
    }

    function formatDate(date) {
        const dateParts = date.split(" ");

        const monthName = dateParts[0];
        const day = dateParts[1].replace(',', '');
        const year = dateParts[2];

        const monthNames = {
            'Jan': 1,
            'Feb': 2,
            'Mar': 3,
            'Apr': 4,
            'May': 5,
            'Jun': 6,
            'Jul': 7,
            'Aug': 8,
            'Sep': 9,
            'Oct': 10,
            'Nov': 11,
            'Dec': 12
        };
        const month = monthNames[monthName];
        const formattedDate = `\${month}월 \${day}일`;
        return formattedDate;
    }
    $(document).ready(function() {
        $.ajax({
            url: "/JumpKingTop10.game",
            type: "get",
            dataType: "json",
        }).done(function(data) {

            for (let i = 0; i < data.length; i++) {

                let rank = data[i].seq;
                let id = data[i].player;
                let score = data[i].score;
                let formattedScore = formatTime(score);
                let date = data[i].played_time;
                let formattedDate = formatDate(date);
                let html = "<div class='row RankBody'><div class='col-3'>" + rank +
                    "</div><div class='col-3'>" + id + "</div><div class='col-3'>" + formattedScore +
                    "</div><div class='col-3'>" + formattedDate + "</div></div>";
                $(".JumpKing").append(html);

                if (i === 0) {
                    $(".JumpKing .RankBody:first").css("background-color", "gold");
                } else if (i == 1) {
                    $(".JumpKing .RankBody:eq(1)").css("background-color", "silver");
                } else if (i == 2) {
                    $(".JumpKing .RankBody:eq(2)").css("background-color", "#cd7f32");
                }
            }
        });
    });
    $(document).ready(function() {
        $.ajax({
            url: "/SkeletonSurvivorTop10.game",
            type: "get",
            dataType: "json",
        }).done(function(data) {

            for (let i = 0; i < data.length; i++) {

                let rank = data[i].seq;
                let id = data[i].player;
                let score = data[i].score;
                let date = data[i].played_time;
                let formattedDate = formatDate(date);
                let html = "<div class='row RankBody'><div class='col-3'>" + rank +
                    "</div><div class='col-3'>" + id + "</div><div class='col-3'>" + score +
                    "</div><div class='col-3'>" + formattedDate + "</div></div>";
                $(".SkeletonSurvivor").append(html);

                if (i === 0) {
                    $(".SkeletonSurvivor .RankBody:first").css("background-color", "gold");
                } else if (i == 1) {
                    $(".SkeletonSurvivor .RankBody:eq(1)").css("background-color", "silver");
                } else if (i == 2) {
                    $(".SkeletonSurvivor .RankBody:eq(2)").css("background-color", "#cd7f32");
                }
            }
        });
    });
    $(document).ready(function() {
        $.ajax({
            url: "/DinoGameTop10.game",
            type: "get",
            dataType: "json",
        }).done(function(data) {

            for (let i = 0; i < data.length; i++) {

                let rank = data[i].seq;
                let id = data[i].player;
                let score = data[i].score;
                let date = data[i].played_time;
                let formattedDate = formatDate(date);
                let html = "<div class='row RankBody'><div class='col-3'>" + rank +
                    "</div><div class='col-3'>" + id + "</div><div class='col-3'>" + score +
                    "</div><div class='col-3'>" + formattedDate + "</div></div>";
                $(".DinoGame").append(html);

                if (i === 0) {
                    $(".DinoGame .RankBody:first").css("background-color", "gold");
                } else if (i == 1) {
                    $(".DinoGame .RankBody:eq(1)").css("background-color", "silver");
                } else if (i == 2) {
                    $(".DinoGame .RankBody:eq(2)").css("background-color", "#cd7f32");
                }
            }
        });
    });
    $(document).ready(function() {
        $.ajax({
            url: "/CarCrashTop10.game",
            type: "get",
            dataType: "json",
        }).done(function(data) {

            for (let i = 0; i < data.length; i++) {

                let rank = data[i].seq;
                let id = data[i].player;
                let score = data[i].score;
                let date = data[i].played_time;
                let formattedDate = formatDate(date);
                let html = "<div class='row RankBody'><div class='col-3'>" + rank +
                    "</div><div class='col-3'>" + id + "</div><div class='col-3'>" + score +
                    "</div><div class='col-3'>" + formattedDate + "</div></div>";
                $(".CarCrash").append(html);

                if (i === 0) {
                    $(".CarCrash .RankBody:first").css("background-color", "gold");
                } else if (i == 1) {
                    $(".CarCrash .RankBody:eq(1)").css("background-color", "silver");
                } else if (i == 2) {
                    $(".CarCrash .RankBody:eq(2)").css("background-color", "#cd7f32");
                }
            }
        });
    });
    $(document).ready(function() {
        $.ajax({
            url: "/RoadOfSamuraiTop10.game",
            type: "get",
            dataType: "json",
        }).done(function(data) {

            for (let i = 0; i < data.length; i++) {

                let rank = data[i].seq;
                let id = data[i].player;
                let score = data[i].score;
                let date = data[i].played_time;
                let formattedDate = formatDate(date);
                let html = "<div class='row RankBody'><div class='col-3'>" + rank +
                    "</div><div class='col-3'>" + id + "</div><div class='col-3'>" + score +
                    "</div><div class='col-3'>" + formattedDate + "</div></div>";
                $(".RoadOfSamurai").append(html);

                if (i === 0) {
                    $(".RoadOfSamurai .RankBody:first").css("background-color", "gold");
                } else if (i == 1) {
                    $(".RoadOfSamurai .RankBody:eq(1)").css("background-color", "silver");
                } else if (i == 2) {
                    $(".RoadOfSamurai .RankBody:eq(2)").css("background-color", "#cd7f32");
                }
            }
        });
    });
    $(document).ready(function() {
        $.ajax({
            url: "/RaiseDragonTop10.game",
            type: "get",
            dataType: "json",
        }).done(function(data) {

            for (let i = 0; i < data.length; i++) {

                let rank = data[i].seq;
                let id = data[i].player;
                let score = data[i].score;
                let date = data[i].played_time;
                let formattedDate = formatDate(date);
                let html = "<div class='row RankBody'><div class='col-3'>" + rank +
                    "</div><div class='col-3'>" + id + "</div><div class='col-3'>" + score +
                    "</div><div class='col-3'>" + formattedDate + "</div></div>";
                $(".RaiseDragon").append(html);

                if (i === 0) {
                    $(".RaiseDragon .RankBody:first").css("background-color", "gold");
                } else if (i == 1) {
                    $(".RaiseDragon .RankBody:eq(1)").css("background-color", "silver");
                } else if (i == 2) {
                    $(".RaiseDragon .RankBody:eq(2)").css("background-color", "#cd7f32");
                }

            }
        });
    });
    let loginID = "${sessionScope.loginID}";

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

    if (loginID != "") {
        $(".headerlogout2").show();
        $(".headerlogin2").hide();
        $(".membership2").hide();
    } else {
        $(".headerlogout2").hide();
        $(".headerlogin2").show();
        $(".membership2").show();
    }

    let scrollPosition = 0;
    scrollPosition = "${ scrollPosition }";
    window.scrollTo(0, scrollPosition);

    $.ajax({
        type: "POST",
        url: "/scrollout.members",
        data: {
            action: scrollY
        },
    }).done(function(response) {
        // console.log(response);
        // window.scrollTo(0, response);
    });
</script>

</html>