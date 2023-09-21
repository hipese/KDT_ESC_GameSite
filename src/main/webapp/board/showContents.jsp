<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
        integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg=" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
        integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg=" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
        integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI=" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
        integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw=" crossorigin="anonymous"></script>

    <!-- language pack -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
        integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ=" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
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

        #contents {
            width: 100%;
            height: 400px;
            background-color: whitesmoke;
        }

        #contents_title {
            background-color: whitesmoke;
        }

        /* input 요소와 textarea 요소의 테두리 없애기 */
        #contents {
            border: none;
            outline: none;
            /* 다른 스타일을 추가할 수 있습니다. */
        }

        #contents {
            display: flex;
            justify-content: center;
            align-items: center;
            display: inline-block;
        }

        #suggestion_buttons {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        #reply_pagenation {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="title mb-4">
            <div class="titleContents">
                <div class="left col-12 col-sm-5">✨사이트 이름✨</div>

                <!-- 검색시 정보를 controller로 전송 -->
                <form action="/showBorderList.Border" method="get" class="col-12 col-7">
                    <div class="searchArea">
                        <input type="text" id="search" name="searchText">
                        <button id="searchBtn" class="btn btn-primary col-12 col-sm-2 m-2">검색</button>
                    </div>
                </form>

            </div>
        </div>

        <!-- 게시판 내용 코드 -->
        <div class="navbox mb-4">
            <div class="navlist bg-dark col-12 col-sm-12">
                <ul class="nav navbar-dark bg-dark">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Active</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Link</a></li>
                </ul>
            </div>
        </div>
        <div class="row header mb-4">
            <div class="col-md-11"> <!-- 제목 칸과 넓이를 동일하게 하기 위해 col 제거 -->
                <div class="title" id="title_update" style="display: none;">
                    <input type="text" id="title_update_value" name="title_update" size=100 value="게임이 너무 어려워요"
                        placeholder="">
                </div>
                <div class="title" id="contents_title">
                    산수유
                </div>
            </div>
            <div class="col-md-1">
                <div class="row">
                    날짜
                </div>
                <div class="row">
                    조회수
                </div>
            </div>
        </div>

        <div class="row contents mb-4">
            <div class="col contents justify-content-end" id="contentContainer">
                <div id="contents" name="contents">
                    <p>산수유는 존재로서의 중량감이 전혀 없다.</p>
                    <p>꽃의 어렴풋한 기운만 파스텔처럼</p>
                    <p>산야의 번져있다.</p>
                    <p>산수유가 언제 지는 것인지는 눈치채기 어렵다.</p>
                    <p>그 꽃이 스러지는 모습은 나무가 지우개로 저 자신을 지우는 것과 같다.</p>
                    <p>그래서 산수유는 꽃이 아니라 나무가 꾸는 꿈처럼 보인다.</p>
                    <p>-김훈-</p>
                </div>
                <div id="summernoteContainer" style="display: none;">
                    <textarea id="summernote" name="summernote_contents"></textarea>
                </div>
            </div>
        </div>
        <div class="row update_buttons mb-4" style="display: none;">
            <div class="col botton d-flex justify-content-end">
                <button type="button" class="btn btn-outline-secondary" id="update_check"
                    style="margin-right: 10px;">확인</button>
                <button type="button" class="btn btn-outline-secondary" id="update_cancel">취소</button>
            </div>
        </div>
        <div class="row suggestion_buttons mb-4">
            <div class="col" id="suggestion_buttons">
                <button type="button" class="btn btn-outline-primary" id="update_check" style="margin-right: 10px;"><i
                        class="fa-regular fa-thumbs-up fa-lg"></i></button>
                <button type="button" class="btn btn-outline-danger" id="update_cancel"><i
                        class="fa-regular fa-thumbs-down fa-lg"></i></button>
            </div>
        </div>
        <div class="row botton mb-4">
            <div class="col botton d-flex justify-content-end">
                <button type="button" class="btn btn-outline-secondary" style="margin-right: 10px;">목록으로</button>
                <button type="button" class="btn btn-outline-secondary" id="updateBtn"
                    style="margin-right: 10px;">수정하기</button>
                <button type="button" class="btn btn-outline-secondary">삭제하기</button>
            </div>
        </div>
        <div class="row reply_list mb-4">
            <div class="col reply_list">
                <table class="table">
                    <tbody>
                        <tr>
                            <td>작성자</td>
                            <td>댓글내용</td>
                            <td>작성날짜</td>
                            <td width="5%">
                                <button type="button" class="btn btn-outline-secondary" style="border: none;">
                                    <i class="fa-regular fa-thumbs-up fa-2xs"></i>
                                </button>
                            </td>
                            <td width="5%">
                                <button type="button" class="btn btn-outline-secondary" style="border: none;">
                                    <i class="fa-regular fa-thumbs-down fa-2xs"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>작성자</td>
                            <td>댓글내용</td>
                            <td>작성날짜</td>
                            <td width="5%">
                                <button type="button" class="btn btn-outline-secondary" style="border: none;">
                                    <i class="fa-regular fa-thumbs-up fa-2xs"></i>
                                </button>
                            </td>
                            <td width="5%">
                                <button type="button" class="btn btn-outline-secondary" style="border: none;">
                                    <i class="fa-regular fa-thumbs-down fa-2xs"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td width="20%">작성자</td>
                            <td width="60%">댓글내용</td>
                            <td width="10%">작성날짜</td>
                            <td width="5%">
                                <button type="button" class="btn btn-outline-secondary" style="border: none;">
                                    <i class="fa-regular fa-thumbs-up fa-2xs"></i>
                                </button>
                            </td>
                            <td width="5%">
                                <button type="button" class="btn btn-outline-secondary" style="border: none;">
                                    <i class="fa-regular fa-thumbs-down fa-2xs"></i>
                                </button>
                            </td>

                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row reply_pagenation mb-4">
            <div class="col reply_pagenation" id="reply_pagenation">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="row reply_write mb-4">
            <div class="col reply_input">
                <div class="d-flex justify-content-between align-items-center">
                    댓글쓰기<br>
                    <input type="text" name="reply_write" size=100 value="" placeholder="서로를 배려하는 깨끗한 인터넷 문화를 만듭시다."
                        readonly>
                    <button type="button" class="btn btn-outline-secondary">입력</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#updateBtn').click(function () {
            $('#contents').hide();
            $('#summernoteContainer').show();
            $('.update_buttons').show(); // 수정 버튼을 클릭하면 수정 확인 및 취소 버튼을 보이도록 설정
            $('#title_update').show();
            $('#contents_title').hide();
        });

        $('#update_cancel').click(function () {
            $('#contents').show();
            $('#summernoteContainer').hide();
            $('.update_buttons').hide(); // 수정 취소 버튼을 클릭하면 원래 내용과 버튼을 숨기도록 설정
            $('#title_update').hide();
            $('#contents_title').show();
        });

        $('#update_check').click(function () {
            // 여기에 수정 확인 로직을 추가하세요.
            let updatedContent = $('#summernote').val();
            let updateTitle = $('#title_update_value').val();
            // 수정한 내용을 서버로 보내는 등의 동작을 수행할 수 있습니다.
            console.log(updatedContent);
            console.log(updateTitle);

            $('#contents').html(updatedContent);
            $('#contents_title').html(updateTitle);
            $('#contents').show();
            $('#summernoteContainer').hide();
            $('.update_buttons').hide(); // 수정 확인 버튼을 클릭하면 수정 내용을 표시하고 버튼을 숨기도록 설정
            $('#title_update').hide();
            $('#contents_title').show();
        });

        $('#summernote').summernote({
            placeholder: '내용을 작성해 주세요',
            tabsize: 2,
            height: 400,
            lang: 'ko-KR', // default: 'en-US'
        });
    </script>
</body>
</html>