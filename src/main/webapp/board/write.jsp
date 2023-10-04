<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css" integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js" integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>

    <!-- language pack -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js" integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link href="https://fonts.googleapis.com/earlyaccess/nanumpenscript.css" rel="stylesheet" />
    <style>
        /* div {
                            border: 1px solid black;
                        } */
        .title>.titleContents {
            display: flex;
            width: 100%;
            height: 100%;
        }

        .titleContents>.left {
            width: 30%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 30px;
            font-weight: bold;
        }

        .titleContents>form {
            height: 100%;
            width: 70%;
        }

        form>.searchArea {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            width: 100%;
        }

        .navbox {
            width: 100%;
        }

        .navlist {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .nonnav {
            display: flex;
        }

        #write_area {
            margin-top: 70px;
        }

        #title {
            width: 80%;
        }

        .headerul2 {
            top: 5px;
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
    </style>
</head>

<body class="bg-light">
    <div class="container-fluid">
        <div class="row header">
            <div class="col-1 d-sm-block d-none"></div>
            <div class="col-2 "><a href="/"><img src="../../img/ESC HEADER.png" alt="" width="110px" height="50px"></a></div>
            <div class="col-8 d-sm-block d-none">
                <ul class="headerul">
                    <c:choose>
                        <c:when test="${empty sessionScope.loginID}">
                            <li class="headerli headerlogin">
                                <div class="login" id="login-button">로그인</div>
                            </li>
                            <li class="headerli membership"><a href="/Membership.members">회원가입</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="headerli headerlogout"><a href="/logout.members">로그아웃</a>
                            </li>
                            <li class="headerli"><a href="/showBoardList.board?cpage=${latesPageNum}&searchText=">게시판</a></li>
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
                            <li class="headerli membership2"><a href="/Membership.members">회원가입</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="headerli headerlogout2"><a href="/logout.members">로그아웃</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
                <input type="checkbox" id="active"> <label for="active" class="menu-btn"><span></span></label> <label for="active" class="close"></label>
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
        <div class="row mb-4">
            <div class="col-md-11" id="write_area">

                <!-- 제목 칸과 넓이를 동일하게 하기 위해 col 제거 -->
                <div class="title" id="contents_title">
                    <input type="text" placeholder="제목을 입력하세요" id="title">
                </div>
            </div>
        </div>
        <div class="row mb-4">
            <div class="col-md-11">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="files" multiple>
                    <!-- 추가: multiple 속성을 추가하여 여러 개의 파일 선택을 허용 -->
                    <label class="custom-file-label" for="customFile"></label>
                </div>

            </div>
        </div>
        <div class="row contents mb-4">
            <div class="col contents justify-content-end" id="contentContainer">
                <div id="summernoteContainer">
                    <textarea id="summernote" name="contents"></textarea>
                </div>
            </div>
        </div>
        <div class="row update_buttons mb-4">
            <div class="col botton d-flex justify-content-end">
                <!-- ajax /write.board에게 정보를 보낸다. -->
                <button type="button" class="btn btn-outline-secondary" id="write_check_button" style="margin-right: 10px;">확인</button>

                <button type="button" class="btn btn-outline-secondary" id="write_cancel">취소</button>

            </div>
        </div>
        <div class="row botton mb-4">
            <div class="col botton d-flex justify-content-end"></div>
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
                    <span class="col-12 service"> <a target="_blank" href="https://pf.kakao.com"> 카카오톡 상담 문의 </a></span>
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
                    <a target="_blank" class="instaicon" href="https://www.instagram.com"><img class="icon" src="../img/instagram.svg" alt="icon" width="40px" /></a> <a target="_blank" class="youtubeicon" href="https://youtube.com"><img class="youtube" src="../img/youtube.svg" alt="icon" width="40px" /></a>
                </div>
            </div>
        </div>
    </div>

    <script>
        /*작성 버튼을 클릭시 ajax로 board controller에 데이터를 전송 후 리스트로 돌아오는 함수 */
        $("#write_check_button").on("click", function() {

            if ($("#title").val() == "") {
                alert("제목을 입력하세요");
                return;
            }

            let dataToSend = new FormData(); // FormData 객체 생성

            // 기존 데이터 추가
            dataToSend.append("title", $("#title").val());
            dataToSend.append("contents", $("#summernote").val());

            // 파일 필드에서 파일 추가
            let filesInput = $("#customFile")[0]; // 파일 입력 필드 가져오기
            let files = filesInput.files; // 선택한 파일 가져오기

            for (let i = 0; i < files.length; i++) {
                dataToSend.append("files", files[i]); // "files"라는 이름으로 파일 추가
            }

            $.ajax({
                url: '/write.board',
                method: 'POST',
                data: dataToSend,
                processData: false, // 필수: FormData를 변환하지 않음
                contentType: false, // 필수: 컨텐츠 타입 설정하지 않음
            }).done(function(resp) {
                window.location.href = "/showBoardList.board?searchText=";
            });
        });

        $("#write_cancel")
            .on(
                "click",
                function() {
                    // 확인 창 표시
                    if (confirm("작성을 취소하시겠습니까?")) {
                        // 사용자가 확인을 선택한 경우

                        // Summernote 에디터 초기화
                        $("#summernote").summernote("code", "");

                        // 이미지를 삭제
                        // 여기에서는 이미지 업로드를 서버로 직접 하지 않았으므로, 에디터에서 삭제할 경우 다른 처리가 필요합니다.
                        // 이미지를 업로드한 경우, 서버에서 이미지를 삭제하고 에디터에 이미지를 추가했을 때 이 부분을 적절하게 처리해야 합니다.

                        // 뒤로 돌아가기
                        window.location.href = location.href = "/showBoardList.board?cpage=${latesPageNum}&searchText=";
                    }
                });

        $(document)
            .ready(
                function() {
                    $('#summernote')
                        .summernote({
                            toolbar: [
                                // [groupName, [list of button]]
                                ['fontname',
                                    ['fontname']
                                ],
                                ['fontsize',
                                    ['fontsize']
                                ],
                                [
                                    'style',
                                    [
                                        'bold',
                                        'italic',
                                        'underline',
                                        'strikethrough',
                                        'clear'
                                    ]
                                ],
                                [
                                    'color',
                                    ['forecolor',
                                        'color'
                                    ]
                                ],
                                ['table', ['table']],
                                [
                                    'para',
                                    ['ul', 'ol',
                                        'paragraph'
                                    ]
                                ],
                                ['height',
                                    ['height']
                                ],
                                [
                                    'insert',
                                    ['picture',
                                        'link',
                                        'video'
                                    ]
                                ],
                                [
                                    'view',
                                    ['fullscreen',
                                        'help'
                                    ]
                                ]
                            ],
                            fontNames: ['Arial',
                                'Arial Black',
                                'Comic Sans MS',
                                'Courier New', '맑은 고딕',
                                '궁서', '굴림체', '굴림',
                                '돋움체', '바탕체'
                            ],
                            fontSizes: ['8', '9', '10',
                                '11', '12', '14', '16',
                                '18', '20', '22', '24',
                                '28', '30', '36', '50',
                                '72'
                            ],
                            placeholder: '내용을 작성해 주세요',
                            tabsize: 2,
                            height: 400,
                            lang: 'ko-KR',
                            callbacks: {
                                onImageUpload: function(
                                    files) {
                                    let editor = $(this);

                                    // FormData 객체를 생성하고 이미지를 추가합니다.
                                    let formData = new FormData();
                                    formData.append(
                                        "image",
                                        files[0]);

                                    // 이미지를 서버로 업로드합니다.
                                    $
                                        .ajax({
                                            url: "/upload.file",
                                            method: "post",
                                            data: formData,
                                            processData: false, // 필수 : FormData 객체를 문자열로 변환하지 않음
                                            contentType: false, // 필수 : x-www-form-urlencoded로 파싱되는 것을 방지
                                        })
                                        .done(
                                            function(
                                                resp) {
                                                let img = $("<img>");
                                                img
                                                    .attr(
                                                        "src",
                                                        resp);
                                                console
                                                    .log(img);
                                                $(
                                                        "#summernote")
                                                    .summernote(
                                                        "insertNode",
                                                        img[0]);
                                            })
                                }
                            }
                        });
                });
    </script>
</body>

</html>