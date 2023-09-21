<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>E.S.C</title>
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

            .bodycontainer {
                padding-left: 30px;
                padding-right: 30px;
                position: relative;
            }

            .leftbox {
                position: sticky;
                margin-top: 70px;
                background-color: white;
                max-width: 150px;
                margin-left: 20px;
            }

            .list {
                background-color: #000000;
                height: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 20px;
                font-weight: bold;
                color: white;
            }

            .leftbox ul {
                padding-left: 0px;
                list-style: none;
                margin-top: 10px;
                text-align: center;
            }

            .leftbox li {
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .leftbox li:hover {
                background-color: #000000;
            }

            .leftbox li:hover a {
                color: white;
            }

            .leftbox li a {
                color: #000000;
                margin-top: 10px;
                margin-bottom: 10px;
            }

            .gameimg {
                width: 100%;
                height: 60%;
                border-radius: 20px;
                cursor: pointer;
                object-fit: cover;
                transition: transform 0.5s ease-in-out;
            }

            .gamebox {
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 10px;
                position: relative;
            }

            .game {
                background-color: white;
                float: left;
                width: 100%;
                height: 300px;
                border-radius: 20px;
                margin-top: 50px;
                overflow: hidden;
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 10px;
                position: relative;
                z-index: 0;
            }

            .gametitle {
                font-size: 20px;
                font-weight: bold;
                margin-top: 10px;
                margin-bottom: 10px;
                text-align: center;
                position: relative;
                z-index: 1;
            }

            /* ------------------------------------------------------------------------------------------------------- */
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
                padding-left: 10px;
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
        </style>
    </head>

    <body>
        <div class="container-fluid">
            <div class="row header">
                <div class="col-1 d-sm-block d-none"></div>
                <div class="col-2 ">E.S.C</div>
                <div class="col-8 d-sm-block d-none">
                    <ul class="headerul">
                        <li class="headerli headerlogin"><a href="#" class="login" id="login-button">로그인</a></li>
                        <li class="headerli membership"><a href="/Membership.members">회원가입</a>
                        </li>
                        <li class="headerli headerlogout"><a href="/logout.members">로그아웃</a>
                        </li>
                        <li class="headerli"><a href="/showBoardList.board?cpage=1">게시판</a></li>
                        <li class="headerli headerboard"><a href="/mypage.members">마이페이지</a></li>
                    </ul>
                </div>
                <div class="col-1 d-md-block d-none"></div>
                <div class="col-1 d-block d-sm-none">
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
                                        안타까운 엘프의 이야기<br> <br> <a target="_blank" href="Jumpking.jsp"><button
                                                class="playbutton">Play</button></a>
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
                                            <strong>Skull Survivor</strong>
                                        </div>
                                        <br> 생존을 위해서 싸우는<br> 샌즈의 처절한 이야기<br> 절찬 상영 대개봉<br>
                                        <br> <a href="#"><button class="playbutton">Play</button></a>

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
                                        <br> 살기 위해서 <br> 매일 같은 코스를 뛰는<br> 슬픈 공룡 한마리 이야기<br>
                                        <br> <a href="#"><button class="playbutton">Play</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 d-none d-xl-block loginbox2">
                    <div class="row">
                        <div class="col-12 g-0 trueable">
                            <form action="/login.members" method="post">
                                <div class="loginbox">
                                    <div class="idlogin">
                                        <i class="fa-regular fa-user"></i> <input type="text" placeholder="아이디" id="id"
                                            class="inputlogin" name="id" />
                                    </div>

                                    <div class="pwlogin">
                                        <i class="fa-solid fa-lock"></i> <input type="password" placeholder="비밀번호"
                                            class="inputpw" name="pw" />
                                    </div>
                                    <div class="check">
                                        <label for="chk"> <input type="checkbox" id="chk" /> <i class="circle"></i>
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
                                                <a href="">
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
                        <div class="col-12 g-0 falseable">
                            <div class="loginbox3">
                                <div class="imgbox">
                                    <img src="img/쥐돌이.png" class="img" />
                                </div>
                                <div class="mpname">${name }</div>
                                <div class="mpemail">${email }</div>
                                <div class="row">
                                    <div class="col-12">
                                        <a href="/logout.members"><button type="button" class="mpbtn">로그아웃</button></a>
                                        <a href="/mypage.members"><button type="button" class="mpbtn">마이페이지</button></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container bodycontainer">
            <div class="row">
                <div class="col-2 d-lg-block d-none left">
                    <div class="leftbox">
                        <div class="list">목록</div>
                        <ul>
                            <li><a href="/showBoardList.board?cpage=1">게시판</a></li>
                            <li><a href="/mypage.members?id=${id }">마이페이지</a></li>
                            <li><a href="#">랭킹보기</a></li>
                            <li><a href="#">상점</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-12 col-lg-10 right g-0">
                    <div class="row">
                        <div class="col-6 col-lg-4 gamebox g-0">
                            <div class="game game1">
                                <img src="img/game.gif" loop="infinite" class="gameimg gameimg1">
                                <div class="gametitle">Jump King</div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-4 gamebox g-0">
                            <div class="game game2">
                                <img src="img/VampireSurvival.gif" loop="infinite" class="gameimg gameimg2">
                                <div class="gametitle">Vampire Survivor</div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-4 gamebox g-0">
                            <div class="game game3">
                                <img src="img/dino.gif" loop="infinite" class="gameimg gameimg3">
                                <div class="gametitle">Dino Game</div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-4 gamebox g-0">
                            <div class="game game4">
                                <img src="img/simson.gif" loop="infinite" class="gameimg gameimg4">
                                <div class="gametitle">심슨</div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-4 gamebox g-0">
                            <div class="game game5">
                                <img src="img/simson.gif" loop="infinite" class="gameimg gameimg5">
                                <div class="gametitle">심슨</div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-4 gamebox g-0">
                            <div class="game game6">
                                <img src="img/simson.gif" loop="infinite" class="gameimg gameimg6">
                                <div class="gametitle">심슨</div>
                            </div>
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
                    <label> <i class="fa fa-user"></i> <input type="text" id="username" placeholder="아이디" name="id">
                    </label> <label> <i class="fa fa-lock"></i> <input type="password" id="password" placeholder="비밀번호"
                            name="pw">
                    </label>
                    <button type="submit">로그인</button>
                </form>
            </div>
        </div>
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
            }
            window.addEventListener('load', adjustBannerMargin);
            window.addEventListener('resize', adjustBannerMargin);

            // 베너 이미지 클릭시 게임 페이지로 이동
            $(".game1").on("click", function () {
                window.open("Jumpking.jsp");
            })

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

            let sessionScope = "${sessionScope.loginID}";

            if (sessionScope != "") {
                $(".headerlogin").hide();
                $(".membership").hide();
                $(".headerlogout").show();
                $(".trueable").hide();
                $(".falseable").show();
                $(".headerboard").show();
            } else {
                $(".headerlogin").show();
                $(".membership").show();
                $(".headerlogout").hide();
                $(".trueable").show();
                $(".falseable").hide();
                $(".headerboard").hide();
            }
            const loginButton = document.getElementById("login-button");
            const loginModal = document.getElementById("login-modal");
            const closeButton = document.querySelector(".close-button");

            loginButton.addEventListener("click", function () {
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
        </script>

    </body>

    </html>