<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update MyPage</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    #updatemypage{
        width:1000px;
        margin:auto;
    }
    .btns{
        width:1000px;
        margin:auto;
        display:flex;
        justify-content:center;
    }
    .card-body{
    	padding:0px;
    }
    #changes{
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #changesdiv{
    	height:100%;
    }
    #updateNameDiv,#updatePhoneDiv,#updateEmailDiv,#updateAddressDiv{
    	width:100%;
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #updateNameDiv2,#updatePhoneDiv2,#updateEmailDiv2,#updateAddressDiv2{
    	width:100%;
    }
    #nameIcon,#phoneIcon,#emailIcon,#addressIcon{
    	width:30px;
    }
    #updateName{
    	height:70px;
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #updatePhone{
    	height:70px;
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #updateEmail{
    	height:70px;
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #cancel {
    	margin-right:5px;
    }
    #cancel>a{
            text-decoration:none;
            color:black;
        }
    #cancel:hover{
            text-decoration:none;
            cursor: pointer;
            background-color: black;
            color: white;
        }
    #cancel>a:link{
            text-decoration:none;
        }
    #cancel>a:hover{
            text-decoration:none;
            color:white;
        }
</style>
</head>
<body>
	<form id="frm" action="/updateComplete.members" method="post" novalidate>
	<div class="container">
		<div class="card" id="updatemypage">
        <div class="row g-0">
          <div class="col-12 col-md-4">
            <img src="profile.jpg" class="img-fluid rounded-start" alt="...">
            <input class="form-control" type="file" id="formFile">
          </div>
          <div class="col-12 col-md-8" id="changes">
            <div class="card-body" id="changesdiv">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" id="updateName">
                        <div id="updateNameDiv">
                        	<i class="fa-solid fa-user" id="nameIcon"></i>
                        	<div id="updateNameDiv2">
                        		<input id="name" type="text" class="form-control" name="name" placeholder="이름 입력">
                        	</div>
                        </div>
                    </li>
                    <li class="list-group-item" id="updatePhone">
                        <div id="updatePhoneDiv">
                        	<i class="fa-solid fa-phone" id="phoneIcon"></i>
                        	<div id="updatePhoneDiv2" class="input-group">
                        		<span class="input-group-text">010</span>
                            	<input type="text" id="phone1" aria-label="First phone" class="form-control" name="phone1" required>
                            	<input type="text" id="phone2" aria-label="Last phone" class="form-control" name="phone2" required>
                        	</div>
                        </div>
                    </li>
                    <li class="list-group-item" id="updateEmail">
                        <div id="updateEmailDiv">
                        	<i class="fa-solid fa-envelope" id="emailIcon"></i>
                        	<div id="updateEmailDiv2" class="input-group">
                        		<input type="text" id="email1" class="form-control" placeholder="email" aria-label="Username" name="email1">
                            	<span class="input-group-text">@</span>
                            	<input type="text" id="email2" class="form-control" placeholder="domain" aria-label="Server" name="email2">
                        	</div>
                        </div>
                    </li>
                    <li class="list-group-item" id="updateAddress">
                    	<div id="updateAddressDiv">
                    		<i class="fa-solid fa-house" id="addressIcon"></i>
                    		<div id="updateAddressDiv2">
                    			<div class="input-group mb-3">
		                        <input type="text" id="sample6_postcode" class="form-control" placeholder="우편번호" name="zipcode">
		                        <input type="button" class="btn btn-outline-secondary" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
	                        	</div>
	                        	<input type="text" id="sample6_address" class="form-control" placeholder="주소" name="address1">
	                        	<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" name="address2">
	                        	<input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소" name="address3">
                    		</div>
                    	</div>
                    </li>
                </ul>
            </div>
          </div>
        </div>
      </div>
    <br>
    <div class="row g-0">
    	<div class="btns">
    		<button id="cancel" type="button" class="btn btn-light"><a href="/mypage.members">수정취소</a></button>
			<button class="btn btn-dark">수정완료</button>
    	</div>
    </div>
    </div>
	</form>
    
        
</body>
<script>
    // 무조건 마지막에 숫자 나오게 하기
    let regexname = /^[가-힣]{2,5}$/;
    let regexphone1 = /^[\d]{4}$/;
    let regexphone2 = /^[\d]{4}$/;
    let regexemail1 = /^[a-zA-Z0-9]+$/;
    let regexemail2 = /^[a-zA-Z0-9]+\.[a-zA-Z0-9]+$/;
    
    let nameCheck = false;
    let phone1Check = false;
    let phone2Check = false;
    let email1Check = false;
    let email2Check = false;
    
    $("#name").on("keyup",function() {
		if(!regexname.test($("#name").val())){
			this.classList.remove("is-valid");
	        this.classList.add("is-invalid");
	    	nameCheck = false;
	    } else {
	    	this.classList.remove("is-invalid");
	        this.classList.add("is-valid");
	    	nameCheck = true;
	    }
	});
    
    
	$("#phone1").on("keyup",function() {
		if(!regexphone1.test($("#phone1").val())){
			this.classList.remove("is-valid");
	        this.classList.add("is-invalid");
	    	phone1Check = false;
	    } else {
	    	this.classList.remove("is-invalid");
	        this.classList.add("is-valid");
	    	phone1Check = true;
	    }
	});
	$("#phone2").on("keyup",function() {
		if(!regexphone2.test($("#phone2").val())){
			this.classList.remove("is-valid");
	        this.classList.add("is-invalid");
	    	phone2Check = false;
	    } else {
	    	this.classList.remove("is-invalid");
	        this.classList.add("is-valid");
	    	phone2Check = true;
	    }
	});
	
	$("#email1").on("keyup",function() {
		if(!regexemail1.test($("#email1").val())){
			this.classList.remove("is-valid");
	        this.classList.add("is-invalid");
	    	email1Check = false;
	    } else {
	    	this.classList.remove("is-invalid");
	        this.classList.add("is-valid");
	    	email1Check = true;
	    }
	});
	$("#email2").on("keyup",function() {
		if(!regexemail2.test($("#email2").val())){
			this.classList.remove("is-valid");
	        this.classList.add("is-invalid");
			email2Check = false;
	    } else {
	    	this.classList.remove("is-invalid");
	        this.classList.add("is-valid");
	    	email2Check = true;
	    }
	});
	
	$("#frm").on("submit", function() {
		if(!nameCheck) {
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '이름은 2~5글자의 한글이여야합니다'
			})
			return false;
		}
		if(!phone1Check) {
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '전화번호 앞 자리는 숫자 4자리여야합니다'
			})
			return false;
		}
		if(!phone2Check) {
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '전화번호 뒷 자리는 숫자 4자리여야합니다'
			})
			return false;
		}
		if(!email1Check || !email2Check) {
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '올바른 이메일 형식을 입력해주세요'
			})
			return false;
		}
		if(nameCheck && phone1Check && phone2Check && email1Check && email2Check){
			return true;
		}
	});
    
    
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</html>