<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>E.S.C</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <link rel="bigcut icon" href="img/game.png" />
        <link href="https://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.5/dist/js.cookie.min.js"></script>
        <link rel="stylesheet" href="css/header.css">
        <link rel="stylesheet" href="css/footer.css">
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
                margin-top: 70px;
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

            .carousel-item {
                padding-top: 30px;
                padding-left: 50px;
            }

            .bannerimg {
                width: 100%;
                height: 240px;
                border-radius: 20px;
                object-fit: cover;
            }

            .bannertext {
                font-size: 2rem;
                font-weight: bold;
                margin-top: 10px;
            }

            .playbutton {
                background-color: #000000;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 5px;
                font-size: 20px;
                font-weight: bold;
                cursor: pointer;
                width: 100px;
            }

            .playbutton:hover {
                background-color: #ffffff;
                color: rgb(0, 0, 0);
                border: 1px solid #000000;
            }

            .loginbox {
                background-color: white;
                border-radius: 20px;
                margin-top: 70px;
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
                background-image: url(img/check_gray.png);
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

            .loginbtn:hover {
                background-color: #ffffff;
                color: rgb(0, 0, 0);
                border: 1px solid #000000;
            }

            .findelement {
                margin-top: 10px;
                padding-left: 0px;
                display: flex;
                justify-content: space-between;
            }

            .findelement li {
                list-style: none;
                color: black;
                font-size: 15px;
            }

            .loginbox3 {
                background-color: white;
                border-radius: 20px;
                margin-top: 70px;
                height: 300px;
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .imgbox {
                margin-top: 20px;
                border: 1px solid rgba(128, 128, 128, 0.5);
                border-radius: 50%;
                width: 50%;
                height: 50%;
                display: flex;
                justify-content: center;
            }

            .imgbox img {
                width: 100%;
                height: 100%;
                border-radius: 50%;
                object-fit: cover;
            }

            .mpname {
                margin-top: 10px;
                font-size: 20px;
                font-weight: bold;
            }

            .mpbtn {
                background-color: #000000;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 7px;
                font-size: 13px;
                font-weight: bold;
                cursor: pointer;
                margin-top: 20px;
            }

            .mpbtn:hover {
                background-color: #ffffff;
                color: rgb(0, 0, 0);
                border: 1px solid #000000;
            }

/* 기본틀 만들기 */
.container>.title {
	height: 10%;
}

.title>.titleContents {
	display: flex;
	width: 100%;
	height: 100%;
}

.titleContents>.left {
	padding: 10px;
	width: 30%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 30px;
	font-weight: bold;
}

.boardheader {
	padding: 5px;
	border-top: 2px solid black; /* 위쪽 테두리 */
    border-bottom: 1px solid black; /* 아래쪽 테두리 */
	width: 100%;
	height: 10%;
	font-size: 25px;
}

.titleContents>form {
	height: 100%;
	width: 70%;
}
.searchbox{
	margin-top: 20px;
	margin-bottom: 20px;

    border-radius: 20px;
}
form>.searchArea {
	display: flex;
	justify-content: end;
	align-items: center;
	height: 100%;
	width: 100%;
}
.searchArea>button{
	height: 100%;
	width: 100px;
}
/* 네비박스 틀 */
.navbox {
	width: 100%;
}

.navlist {
	padding: 10px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.nonnav {
	display: flex;
}

.boardheader>div {
	height: 100%;
	font-size: 20px;
	font-weight: bold;
	color: black;
}
.boardLogo {
	display: flex;
	height: 150px;
	width: 60%;
}

.boardLogo>.boardimage {
	padding: 10px;
	height: 100%;
	width: 60%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.boardLogo>.managerNames {
	padding: 10px;
	overflow-y: auto;
	height: 100%;
	width: 40%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container>.body {
	padding: 10px;
	height: 65%;
	align-items: center;
}

.container>.footer {
	display: felx;
	padding: 10px;
	height: 20%;
}

.footer>.pageNav {
	padding: 5px;
	height: 50%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pageNav>a {
	margin: 2px;
}

.c:hover {
	background-color: aquamarine;
	color: white;
	font-weight: bold;
}

.searchArea>input {
	height: 40px;
	width: 300px;
}

.nav{
	padding: 10px;
	font-size: 15;
	
}
.pageNav>a {
	font-size: 15;
	margin: 5px;
}

.footer>.buttonbox {
	height: 50%;
	display: flex;
	justify-content: right;
	align-items: center;
}

.details>.copyright {
	height: 200px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
}
/*댓글의 내용물을 꾸미는 부분*/
.contents{
	border-top: 1px solid black; /* 위쪽 테두리 */
    border-bottom: 1px solid black; /* 아래쪽 테두리 */
}

/* 현재 페이지 네비게이션 링크 스타일 */
.page-link.active {
    text-decoration: underline !important;
    color: white !important; /* 현재 페이지 링크의 글자 색상을 변경 */
    background-color:black !important;
}

</style>
</head>

<body class="bg-light">
	 <div class="container-fluid">
                <div class="row header">
                    <div class="col-1 d-sm-block d-none"></div>
                    <div class="col-2 ">E.S.C</div>
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
                                    <li class="headerli"><a href="/showBoardList.board?cpage=1">게시판</a></li>
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
                <div class="row">
                    <div class="col-12 col-xl-8 banner g-0">

                        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-5">
                                            <img src="img/game.gif" class="d-block bannerimg" alt="...">
                                        </div>
                                        <div class="col-7">
                                            <div class="bannertext">
                                                <strong>Jump King</strong>
                                            </div>
                                            <br> 떨어지면 죽을 것을 알기에<br> 끝없이 위를 향해 뛰어야만하는<br>
                                            안타까운 엘프의 이야기<br> <br> <a href="game/JumpKing/jumpking.jsp"
                                                target="_blank"><button class="playbutton">Play</button></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-5">
                                            <img src="img/VampireSurvival.gif" class="d-block bannerimg" alt="...">
                                        </div>
                                        <div class="col-7">
                                            <div class="bannertext">
                                                <strong>Skeleton Survivor</strong>
                                            </div>
                                            <br> 죽어서도 악마들을 퇴치하는 <br> 뼈다귀 마법사의 처절한 이야기<br><br>
                                            <br> <a href="game/SkeletonSurvivor/skeletonsurvivor.jsp"
                                                target="_blank"><button class="playbutton">Play</button></a>

                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-5">
                                            <img src="img/dino.gif" class="d-block bannerimg" alt="...">
                                        </div>
                                        <div class="col-7">
                                            <div class="bannertext">
                                                <strong>Dino Game</strong>
                                            </div>
                                            <br> 404 Not Found가<br> 반가운 공룡의 이야기<br><br>
                                            <br> <a href="game/DinoGame/dinogame.jsp" target="_blank"><button
                                                    class="playbutton">Play</button></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-5">
                                            <img src="img/cargame.gif" class="d-block bannerimg" alt="...">
                                        </div>
                                        <div class="col-7">
                                            <div class="bannertext">
                                                <strong>Drive Safely!</strong>
                                            </div>
                                            <br> 안전운전을 하고 싶지만 <br> 역주행 하는 차들을 피해 <br> 돈을 버는 가장의 이야기 <br>
                                            <br> <a href="game/CarCrash/carcrash.jsp" target="_blank"><button
                                                    class="playbutton">Play</button></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-5">
                                            <img src="img/samurai.gif" class="d-block bannerimg" alt="...">
                                        </div>
                                        <div class="col-7">
                                            <div class="bannertext">
                                                <strong>Samurai Game</strong>
                                            </div>
                                            <br> 조국을 지키기 위해서 <br> 백만 대군도 물리칠 수 있는 <br> 용감한 사무라이! <br>
                                            <br> <a href="game/RoadOfSamurai/roadofsamurai.jsp" target="_blank"><button
                                                    class="playbutton">Play</button></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-5">
                                            <img src="img/RaiseDragon.gif" class="d-block bannerimg" alt="...">
                                        </div>
                                        <div class="col-7">
                                            <div class="bannertext">
                                                <strong>RaiseDragon</strong>
                                            </div>
                                            <br> 드래곤의 알을 구해서 <br> 열심히 키워가지고 펫을 삼으려는 <br> 아름다운 여전사의 이야기 <br>
                                            <br> <a href="game/RaiseDragon/raisedragon.jsp" target="_blank"><button
                                                    class="playbutton">Play</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 d-none d-xl-block loginbox2">
                        <div class="row">
                            <c:choose>
                                <c:when test="${empty sessionScope.loginID}">
                                    <div class="col-12 g-0">
                                        <form action="/login.members" method="post">
                                            <div class="loginbox">
                                                <div class="idlogin">
                                                    <i class="fa-regular fa-user"></i> <input type="text"
                                                        placeholder="아이디" id="id" class="inputlogin" name="id" />
                                                </div>

                                                <div class="pwlogin">
                                                    <i class="fa-solid fa-lock"></i> <input type="password"
                                                        placeholder="비밀번호" class="inputpw" name="pw" />
                                                </div>
                                                <input type="url" class="url" name="url" style="display: none;" />
                                                <div class="check">
                                                    <label for="chk"> <input type="checkbox" id="chk" /> <i
                                                            class="circle"></i>
                                                        <span class="text">로그인 상태 유지</span>
                                                    </label>
                                                </div>
                                                <input type="submit" value="로그인" class="loginbtn" />
                                                <div class="row">
                                                    <div class="col-12">
                                                        <ul class="findelement">
                                                            <a href="findMyId.jsp">
                                                                <li>아이디 찾기</li>
                                                            </a>
                                                            <a href="findMyPw.jsp">
                                                                <li>비밀번호 찾기</li>
                                                            </a>
                                                            <a href="/Membership.members">
                                                                <li>회원가입</li>
                                                            </a>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-12 g-0">
                                        <div class="loginbox3">
                                            <div class="imgbox">
                                                <img src="img/쥐돌이.png" class="img" />
                                            </div>
                                            <div class="mpname">${name}</div>
                                            <div class="mpemail">${email}</div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <a href="/logout.members"><button type="button"
                                                            class="mpbtn">로그아웃</button></a>
                                                    <a href="/mypage.members"><button type="button"
                                                            class="mpbtn">마이페이지</button></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                 <div class="row">
	  				<div class ="col-12 col-xl-12 searchbox g-0">
	  					<form action="/showBoardList.board" method="get" class="col-12 col-7">
							<div class="searchArea">
								<input type="text" id="search" name="searchText" placeholder="게시글 통합검색">					
								<button id="searchBtn" class="mpbtn btn-primary col-12 col-sm-2 m-2">검색</button>
							</div>
						</form>
	  				</div>
	  			</div>
            </div>
	<div class="container">

		<div class="body">
		<div class="row">
			<div class="boardheader col-12 col-sm-12">
				<div class="row">
					<div class="col-12 col-sm-1 d-none d-sm-block">번호</div>
					<div class="col-12 col-sm-4 ">제목</div>
					<div class="col-12 col-sm-3 d-none d-sm-block">작성자</div>
					<div class="col-12 col-sm-1 d-none d-sm-block">조회</div>
					<div class="col-12 col-sm-3 d-none d-sm-block text-center">작성일</div>
				</div>
			</div>
		</div>
		<c:choose>
				<c:when test="${boardlist.size()==0}">
					표시할 내용이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach var="i" items="${boardlist }">
						<div class="col-12 c">
							<div class="row contents">
								<div class="nav col-4 col-sm-1 d-none d-sm-block">${i.seq }</div>
								<div class="nav col-12 col-sm-4 ">
								<a href="/showContents.board?
								title=${i.title}&seq=${i.seq}&searchText=${searchText}" 
								style="color: #000000; font-weight: bold;">${i.title}</a>
								</div>
								<div class="nav col-4 col-sm-3">${i.writer }</div>
								<div class="nav col-4 col-sm-1">${i.view_count }</div>
								<div class="nav col-4 col-sm-3 p-1 text-center">${i.formedSignupData}</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>

		<div class="footer">
			<div class="buttonbox">
				<button type="button" class="mpbtn btn-primary col-12 col-sm-2 m-2"
					id="write">작성하기</button>
				<button type="button" class="mpbtn btn-primary col-12 col-sm-2 m-2"
					id="back">돌아가기</button>
			</div>

			<div class="pageNav">
				
			</div>
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
                <div class="col-12 col-xl-1 order-2 order-xl-3 opacity-0"></div>
                <div class="col-12 col-xl-2 order-1 order-xl-4">
                    <div class="footertitle d-none d-xl-block">
                        <span> Social</span>
                    </div>
                    <div class="footericon">
                        <a target="_blank" class="instaicon" href="https://www.instagram.com"><img class="icon"
                                src="img/instagram.svg" alt="icon" width="40px" /></a>
                        <a target="_blank" class="youtubeicon" href="https://youtube.com"><img class="youtube"
                                src="img/youtube.svg" alt="icon" width="40px" /></a>
                    </div>
                </div>
            </div>
        </div>
          <div id="login-modal" class="modal">
                <div class="modal-content">
                    <span class="close-button">&times;</span>
                    <h2>Login</h2>
                    <form action="/login.members" method="post">
                        <label> <i class="fa fa-user"></i> <input type="text" id="username" placeholder="아이디"
                                name="id"></label>
                        <label> <i class="fa fa-lock"></i> <input type="password" id="password" placeholder="비밀번호"
                                name="pw">
                        </label>
                        <input type="url" class="url" name="url" style="display: none;" />
                        <input type="text" class="scroll" name="scroll" style="display: none;">
                        <button type="submit">로그인</button>
                    </form>
                </div>
            </div>
	<script>
		${isExistText}
		let previousPageURL = window.location.href;
		$("#write").on("click", function() {
			location.href = "/board/write.jsp";
		});

		$("#back").on("click", function() {
			let okorNo = confirm("메인화면으로 돌아가겠습니까?");
			if (okorNo == false) {
				return false;
			}
			location.href = "/updateBack.members";
		});
		
	</script>
	<script>
    let recordTotalCount = ${recordTotalCount};
    let recordCountPerPage = ${recordCountPerPge};
    let naviCountPerPage = ${NaviCountPerPage};
    let currentPage = ${latesPageNum};

    let pageTotalCount = 0;

    let pageNav = $(".pageNav");

    if (recordTotalCount % recordCountPerPage > 0) {
        pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage + 1);
    } else {
        pageTotalCount = Math.floor(recordTotalCount / recordCountPerPage);
    }

    if (currentPage < 1) {
        currentPage = 1;
    } else if (currentPage > pageTotalCount) {
        currentPage = pageTotalCount;
    }

    let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;

    let endNavi = startNavi + (naviCountPerPage - 1);

    if (endNavi > pageTotalCount) {
        endNavi = pageTotalCount;
    }

    let needPrev = true;
    let needNext = true;

    if (startNavi == 1) {
        needPrev = false;
    }
    if (endNavi == pageTotalCount) {
        needNext = false;
    }
	
    let paginationHTML = '<nav aria-label="Page navigation example"><ul class="pagination PageNavi">';

    if (needPrev) {
        paginationHTML += '<li class="page-item"><a class="page-link text-dark bg-white " href="/showBoardList.board?cpage=' + (startNavi - 1) + '&searchText=${searchText}" aria-label="Previous">&laquo;</a></li>';
    }

    for (let i = startNavi; i <= endNavi; i++) {
        paginationHTML += '<li class="page-item"><a class="page-link text-dark bg-white" href="/showBoardList.board?cpage=' + i + '&searchText=${searchText}">' + i + '</a></li>';
    }

    if (needNext) {
        paginationHTML += '<li class="page-item"><a class="page-link text-dark bg-white" href="/showBoardList.board?cpage=' + (endNavi + 1) + '&searchText=${searchText}" aria-label="Next">&raquo;</a></li>';
    }

    paginationHTML += '</ul></nav>';

    // Append the generated pagination HTML to the pageNav element
    pageNav.append(paginationHTML);
 	
    let currentPageNumber = ${latesPageNum}; // 현재 페이지 번호
    let pageLinks = document.querySelectorAll(".page-link");

    for (let i = 0; i < pageLinks.length; i++) {
        let pageLink = pageLinks[i];
        let pageNumber = parseInt(pageLink.textContent); // 네비게이션 링크의 페이지 번호

        // 현재 페이지와 네비게이션 링크의 페이지 번호가 일치하는 경우 "active" 클래스 추가
        if (pageNumber === currentPageNumber) {
            pageLink.classList.add("active");
        } else {
            pageLink.classList.remove("active"); // 현재 페이지가 아닌 경우 "active" 클래스 제거
        }
    }
    
</script>

<script>
                // 게임 박스 마우스 오버시 효과)(hover)
                $(".game").on("mouseover", function () {
                    $(this).css("transform", "scale(1.1)");
                    $(this).css("transition", "all 0.5s");
                    $(this).css("cursor", "pointer");
                    $(this).css("box-shadow", "0px 0px 10px 2px rgba(0, 0, 0, 0.5)");
                });
                $(".game").on("mouseleave", function () {
                    $(this).css("transform", "scale(1)");
                    $(this).css("transition", "all 0.5s");
                    $(this).css("box-shadow", "none");
                });

                // 베너 크기가 변할 때마다 margin 조정
                function adjustBannerMargin() {
                    const windowWidth = window.innerWidth;
                    const banner = document.querySelector('.banner');
                    const loginbox = document.querySelector('.loginbox');
                    const loginbox3 = document.querySelector('.loginbox3');

                    if (loginbox) {
                        // loginbox가 있는 경우
                        if (windowWidth > 1200) {
                            banner.style.marginLeft = '50px';
                            banner.style.marginRight = '30px';
                        } else {
                            banner.style.marginLeft = '0px';
                            banner.style.marginRight = '0px';
                        }
                    }

                    if (loginbox3) {
                        // loginbox가 있는 경우
                        if (windowWidth > 1200) {
                            banner.style.marginLeft = '50px';
                            banner.style.marginRight = '30px';
                        } else {
                            banner.style.marginLeft = '0px';
                            banner.style.marginRight = '0px';
                        }
                    }
                }
                window.addEventListener('load', adjustBannerMargin);
                window.addEventListener('resize', adjustBannerMargin);

                let loginID = "${sessionScope.loginID}";
                // 베너 이미지 클릭시 게임 페이지로 이동
                $(".game1").on("click", function () {
                	$.ajax({
    			        url: "/JumpkingStart.game",
    			        type: "GET",
    			        data: { loginID: loginID }, // loginID를 사용하여 전달합니다.
    			        success: function (gameURL) {
    			            window.open(gameURL, "_blank");
    			        },
    			        error: function () {
    			            alert("게임을 시작하는 데 문제가 발생했습니다.");
    			        }
    			    });
                });
                $(".game2").on("click", function () {
                	$.ajax({
    			        url: "/SkeletonSurvivorStart.game",
    			        type: "GET",
    			        data: { loginID: loginID }, // loginID를 사용하여 전달합니다.
    			        success: function (gameURL) {
    			           
    			            window.open(gameURL, "_blank");
    			        },
    			        error: function () {
    			            alert("게임을 시작하는 데 문제가 발생했습니다.");
    			        }
    			    });
                });
                $(".game3").on("click", function () {
                	$.ajax({
    			        url: "/DinoGameStart.game",
    			        type: "GET",
    			        data: { loginID: loginID }, // loginID를 사용하여 전달합니다.
    			        success: function (gameURL) {
    			           
    			            window.open(gameURL, "_blank");
    			        },
    			        error: function () {
    			            alert("게임을 시작하는 데 문제가 발생했습니다.");
    			        }
    			    });
                });
                $(".game4").on("click", function () {
    			    $.ajax({
    			        url: "/CarCrashStart.game",
    			        type: "GET",
    			        data: { loginID: loginID }, // loginID를 사용하여 전달합니다.
    			        success: function (gameURL) {
    			           
    			            window.open(gameURL, "_blank");
    			        },
    			        error: function () {
    			            alert("게임을 시작하는 데 문제가 발생했습니다.");
    			        }
    			    });
    			});
                $(".game5").on("click", function () {
                	$.ajax({
    			        url: "/RoadOfSamuraiStart.game",
    			        type: "GET",
    			        data: { loginID: loginID }, // loginID를 사용하여 전달합니다.
    			        success: function (gameURL) {
    			           
    			            window.open(gameURL, "_blank");
    			        },
    			        error: function () {
    			            alert("게임을 시작하는 데 문제가 발생했습니다.");
    			        }
    			    });
                })
                $(".game6").on("click", function () {
                    window.open("game/RaiseDragon/raisedragon.jsp");
                })

                // 로그인을 실행했을때 넣을 속성들이 사라지면서 error가 나기 때문에
                // 로그인을 성공하기 전에만 실행하고, 로그인을 성공하면 error가 나지 않도록 제어
                if (loginID == "") {
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
                            Cookies.set("remID", inputID.value, {
                                expires: 7
                            }); // 7일간 저장
                        } else {
                            Cookies.remove("remID"); // 쿠키 삭제
                        }
                    }
                    const loginButton = document.getElementById("login-button");
                    const loginButton2 = document.getElementById("login-button2");
                    const loginModal = document.getElementById("login-modal");
                    const closeButton = document.querySelector(".close-button");

                    loginButton.addEventListener("click", function () {
                        loginModal.style.display = "block";
                    });
                    loginButton2.addEventListener("click", function () {
                        loginModal.style.display = "block";
                    });

                    closeButton.addEventListener("click", function () {
                        loginModal.style.display = "none";
                    });

                    window.addEventListener("click", function (event) {
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
                    openButton.onclick = function () {
                        modal.style.display = 'block';
                        body.style.overflow = 'hidden'; // 배경 스크롤 막기
                        $(".scroll").val(scrollY);
                    };
                    openButton2.onclick = function () {
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
                    window.onclick = function (event) {
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
                }).done(function (response) {
                    // console.log(response);
                    // window.scrollTo(0, response);
                });

            </script>

</body>

</html>