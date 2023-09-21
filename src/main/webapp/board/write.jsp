<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg="
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg="
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
	integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw="
	crossorigin="anonymous"></script>

<!-- language pack -->
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
	integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ="
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	rel="stylesheet">
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

#contents_title {
	background-color: whitesmoke;
}

@font-face {
	font-family: 'NotoSansKR';
	src: url('font/NotoSansKR-Black.otf') format('opentype')
}
</style>
</head>
<body>
	<div class="container">
		<div class="title mb-4">
			<div class="titleContents">
				<div class="left col-12 col-sm-5">✨사이트 이름✨</div>

				<!-- 검색시 정보를 controller로 전송 -->
				<form action="/showBorderList.Border" method="get"
					class="col-12 col-7">
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
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Active</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				</ul>
			</div>
		</div>
		<div class="row header mb-4">
			<div class="col-md-11">
				<!-- 제목 칸과 넓이를 동일하게 하기 위해 col 제거 -->
				<div class="title" id="contents_title">
					<input type="text" placeholder="제목을 입력하세요" size=100 id="title">
				</div>
			</div>
		</div>
		<div class="row contents mb-4">
			<div class="col contents justify-content-end" id="contentContainer">
				<div id="summernoteContainer">
					<textarea id="summernote" name="summernote_contents"></textarea>
				</div>
			</div>
		</div>
		<div class="row update_buttons mb-4">
			<div class="col botton d-flex justify-content-end">
				<!-- ajax /write.board에게 정보를 보낸다. -->
				<button type="button" class="btn btn-outline-secondary"
					id="write_check_button" style="margin-right: 10px;">확인</button>

				<button type="button" class="btn btn-outline-secondary"
					id="update_cancel">취소</button>

			</div>
		</div>
		<div class="row botton mb-4">
			<div class="col botton d-flex justify-content-end"></div>
		</div>
	</div>

	<script>
		/*작성 버튼을 클릭시 ajax로 board controller에 데이터를 전송 후 리스트로 돌아오는 함수 */
		$("#write_check_button").on("click", function() {

			let dataToSend = {
				title : $("#title").val(),
				contents : $("#summernote").val()
			// 필요한 데이터 필드를 추가하십시오.
			};

			$.ajax({
				url : '/write.board', // 요청을 보낼 URL
				method : 'POST', // HTTP 메서드 (POST로 보냅니다)
				data : dataToSend, // 보낼 데이터
			}).done(function(resp) {
				window.location.href = "/showBoardList.board";
			});
		})

		$(document).ready(function() {
			let fontList = [ '맑은 고딕', 'NotoSansKR' ];
			$('#summernote').summernote({
				toolbar: [
				    // [groupName, [list of button]]
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    ['color', ['forecolor','color']],
				    ['table', ['table']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link','video']],
				    ['view', ['fullscreen', 'help']]
				  ],
				fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
				fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
				placeholder : '내용을 작성해 주세요',
				tabsize : 2,
				height : 400,
				lang : 'ko-KR'
			});
		});
	</script>
</body>
</html>