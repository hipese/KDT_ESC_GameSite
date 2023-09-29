<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Info</title>
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
<link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
<style>
	body{
		background-color:whitesmoke;
	}
	#mypagediv{
		width:400px;
		margin:auto;
	}
	#iddiv{
		height:60px;
	}
	
</style>
</head>
<body>
		<div id="mypagediv" align="center" class="card">
			<img src="files/${sys_name}" id="profile" class="card-img-top" alt="...">
			<div id="iddiv" class="card-body" align="center">
				<h5 class="card-title">${dto.id }</h5>
				<input type="hidden" id="id" value="${dto.id }">
			</div>
				<ul class="list-group list-group-flush">
				    <li class="list-group-item">
				    	<div class="container">
						  <div class="row">
						    <div class="col">
						      <b>Name</b>
						    </div>
						    <div class="col editable" data-name="name">
						      ${dto.name }
						    </div>
						  </div>
						</div>
				    </li>
				    <li class="list-group-item">
				    	<div class="container">
						  <div class="row">
						    <div class="col">
						      <b>Phone Number</b>
						    </div>
						    <div class="col editable" data-name="phone">
						      ${dto.phone }
						    </div>
						  </div>
						</div>
					</li>
				    <li class="list-group-item">
				    	<div class="container">
						  <div class="row">
						    <div class="col">
						      <b>Email</b>
						    </div>
						    <div class="col editable" data-name="email">
						      ${dto.email }
						    </div>
						  </div>
						</div>
					</li>
					<li class="list-group-item">
				    	<div class="container">
						  <div class="row">
						    <div class="col">
						      <b>Zip Code</b>
						    </div>
						    <div class="col editable" data-name="zipcode">
						      ${dto.zipcode }
						    </div>
						  </div>
						</div>
					</li>
					<li class="list-group-item">
				    	<div class="container">
						  <div class="row">
						    <div class="col">
						      <b>Address</b>
						    </div>
						    <div class="col editable" data-name="address">
                  				${dto.address1 } ${dto.address2 }
						    </div>
						  </div>
						</div>
					</li>
					<li class="list-group-item">
				    	<div class="container">
						  <div class="row">
						    <div class="col">
						      <b>Signup Date</b>
						    </div>
						    <div class="col">
						      ${signup_date }
						    </div>
						  </div>
						</div>
					</li>
				  </ul>
				  <div class="card-body">
				    <button id="back" type="button" class="btn btn-light">뒤로가기</button>
				    <c:if test="${isbanned == true}">
						<button id="cancelbanned" type="button" class="btn btn-dark">블랙리스트 취소</button>
					</c:if>
					<c:if test="${isbanned == false}">
						<button id="banned" type="button" class="btn btn-dark">블랙리스트 추가</button>
					</c:if>
				  </div>
				</div>
	
</body>
<script>
	$("#back").on("click",function() {
		$("#back").on("click", function () {
		    window.location.href = 'userManage.admin'; // 이동하려는 페이지의 경로로 변경
		});
	});
	
	$("#banned").on("click", function () {
	    Swal.fire({
	        title: '이 사용자를 블랙리스트에 등록하시겠습니까?',
	        showDenyButton: true,
	        showCancelButton: true,
	        confirmButtonText: 'Yes',
	        denyButtonText: 'No',
	    }).then((result) => {
	        /* Read more about isConfirmed, isDenied below */
	        if (result.isConfirmed) {
	            $.ajax({
	                url: "/userban.admin",
	                type: "POST", // 또는 다른 HTTP 메서드
	                data: {
	                    id: $("#id").val()
	                }
	            }).done(function (resp) {
	                if (resp === "true") {
	                    Swal.fire('해당 사용자가 블랙리스트에 등록되었습니다.', '', 'success').then(() => {
	                        // 페이지 새로고침
	                        window.location.href = 'userManage.admin';
	                    });
	                } else {
	                    Swal.fire('블랙리스트 등록에 실패하였습니다.', '', 'error');
	                }
	            });
	        } else if (result.isDenied) {
	            Swal.fire('취소되었습니다', '', 'info');
	        }
	    });
	});

	
	$("#cancelbanned").on("click", function () {
	    Swal.fire({
	        title: '이 사용자를 블랙리스트에서 해제하시겠습니까?',
	        showDenyButton: true,
	        showCancelButton: true,
	        confirmButtonText: 'Yes',
	        denyButtonText: 'No',
	    }).then((result) => {
	        /* Read more about isConfirmed, isDenied below */
	        if (result.isConfirmed) {
	            $.ajax({
	                url: "/userbancancel.admin",
	                type: "POST", // 또는 다른 HTTP 메서드
	                data: {
	                    id: $("#id").val()
	                }
	            }).done(function (resp) {
	                if (resp === "true") {
	                    Swal.fire('해당 사용자가 블랙리스트에서 해제되었습니다.', '', 'success').then(() => {
	                        // 페이지 새로고침
	                        window.location.href = 'userManage.admin';
	                    });
	                } else {
	                    Swal.fire('블랙리스트 해제에 실패하였습니다.', '', 'error');
	                }
	            });
	        } else if (result.isDenied) {
	            Swal.fire('취소되었습니다', '', 'info');
	        }
	    });
	});

</script>
</html>