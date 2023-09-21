<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
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
<script>
	
</script>
<style>
* {
	box-sizing: border-box;
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

.body>.header {
	width: 100%;
	height: 10%;
	display: flex;
	font-size: 20px;
}

.titleContents>form {
	height: 100%;
	width: 70%;
}

form>.searchArea {
	padding: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	width: 100%;
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

.header>div{
	height: 100%;
	font-size: 20px;
	font-weight: bold;
}

.boardLogo {
	display: flex;
	height: 150px;
	width: 60%;
}

.loginbox {
	color:white;
	padding: 10px;
	height: 150px;
	width: 40%;
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
.loginbox{
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
	display:felx;
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

.searchArea>button {
	width: 10%;
	height: 40px;
}

.searchArea>input {
	height: 40px;
	width: 300px;
}

.nav-link {
	color: white;
}
.pageNav>a{
 	font-size: 15;
    margin: 5px;
}
.footer>.details{
	
}
.footer>.buttonbox{
	height: 50%;
	display: flex;
	justify-content: right;
	align-items: center;
}
.details>.copyright{
	height: 200px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	color: white;
}
</style>
</head>

<body class="bg-light">
	<!-- 현재 이 페이지를 실행하기 위해 받아와야할 정보
	1. 현재 페이지 정보 (기본 1로 설정)
	2. 게시물 목록
	3. 게시물의 총 개수
	4. 게시물을 페이지당 몇 개씩 보여줄 것인지에 대한 변수 
	5. 네비게이션을 몇 개씩 보여줄 것인가에 대한 변수
	6. 검색 텍스트 기본("")
	7. 텍스트가 존재하는지 확인하는 여부(없어도 될듯?)
	  -->

	<div class="container">
		<div class="title">
			<div class="titleContents">
				<div class="left col-12 col-sm-5">✨사이트 이름✨</div>

				<!-- 검색시 정보를 controller로 전송 -->
				<form action="/showBoardList.board" method="get"
					class="col-12 col-7">
					<div class="searchArea">
						<input type="text" id="search" name="searchText">
						<button id="searchBtn" class="btn btn-primary col-12 col-sm-2 m-2">검색</button>
					</div>
				</form>

			</div>
		</div>


		<!-- 게시판 nav용 코드 -->
		<div class="navbox">
			<div class="navlist bg-dark col-12 col-sm-12 m-1">
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

			<div class="nonnav col-12 col-sm-12">
				<div class="boardLogo col-12 col-sm-8">
					<div class="boardimage">로고로 꾸밀 이미지를 삽입하시요(최대크기 400X 150) 그
						이상은 조절해야함</div>

					<div class="managerNames">
						<fieldset>
							<legend>관리자</legend>
							hipes<br> 
							관리자의 닉네임1  
						</fieldset>
					</div>

				</div>
				
				<!-- 로그인 폼이 존재하는 장소(로그인 여부에 따라 바꿔야함) -->
				<div class="loginbox col-12 col-sm-4 bg-secondary rounded-3 m-1">

					<div class="loginInputbox">
					
						
						<div class="remember">
							로그인 폼을 여기에 등록
						</div>
					</div>
					
				</div>
			</div>

		</div>

		<div class="body">
		
			<div class="header col-12 col-sm-12">
				<div class="nav col-12 col-sm-1 d-none d-sm-block ">번호</div>
				<div class="nav col-12 col-sm-4 ">제목</div>
				<div class="nav col-12 col-sm-3 d-none d-sm-block">작성자</div>
				<div class="nav col-12 col-sm-1 d-none d-sm-block">조회</div>
				<div class="nav col-12 col-sm-3 d-none d-sm-block text-center">작성일</div>
			</div>

			<c:choose>
				<c:when test="${boardList.size()==0}">
					표시할 내용이 없습니다.
				</c:when>
				<c:otherwise>
					<c:forEach var="i" items="${boardlist }">
						<div class="col-12 c">
							<div class="row contents">
								<div class="col-4 col-sm-1 d-none d-sm-block">${i.seq }</div>
								<div class="col-12 col-sm-4 ">
									<a
										href="/showContents.board?title=${i.title}&seq=${i.seq}&searchText=${searchText}">${i.title}</a>
								</div>
								<div class="col-4 col-sm-3">${i.writer }</div>
								<div class="col-4 col-sm-1">${i.view_count }</div>
								<div class="col-4 col-sm-3 p-1 text-center">${i.formedSignupData}</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>

		</div>

		<div class="footer">
			<div class="buttonbox">
					<button type="button" class="btn btn-primary col-12 col-sm-2 m-2"
						id="write">작성하기</button>
					<button type="button" class="btn btn-primary col-12 col-sm-2 m-2"
						id="back">돌아가기</button>
				</div>
				
			<div class="pageNav"></div>
			
			 <div class="details">
				<div class="copyright col-12 col-sm-2 m-12 bg-secondary rounded-3">
						여기에 footer를 꾸미는 내용을 작성
				</div>
			 </div>
			
			
		</div>
	</div>
	<script>
		${isExistText}
		$("#write").on("click", function() {
			let okorNo = confirm("게시글을 작성하시겠습니까?");
			if (okorNo == false) {
				return false;
			}
			location.href = "/board/write.jsp";
		});

		$("#back").on("click", function() {
			let okorNo = confirm("메인화면으로 돌아가겠습니까?");
			if (okorNo == false) {
				return false;
			}
			location.href = "/index.jsp";
		});
		
	</script>
	<script>
	
	
	let recordTotalCount=${recordTotalCount};
	let recordCountPerPage=${recordCountPerPge};
	let naviCountPerPage=${NaviCountPerPage};
	let currentPage=${latesPageNum};

	
	let pageTotalCount = 0;
	
	let pageNav=$(".pageNav");
	
	if (recordTotalCount % recordCountPerPage > 0) {
		pageTotalCount =  Math.floor(recordTotalCount / recordCountPerPage + 1);
	} else {
		pageTotalCount =  Math.floor(recordTotalCount / recordCountPerPage);
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
	
	if (needPrev) {
		pageNav.append("<a href='/showBoardList.board?cpage="+(startNavi-1)+"&searchText=${searchText}'> < </a>");
	}
	for (let i = startNavi; i <= endNavi; i++) {
		pageNav.append("<a href='/showBoardList.board?cpage="+i+"&searchText=${searchText}'>" + i + " </a>");
	}
	if (needNext) {
		pageNav.append("<a href='/showBoardList.board?cpage="+(endNavi+1)+"&searchText=${searchText}'> > </a>");
	}

	
	</script>
</body>

</html>