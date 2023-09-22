<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
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
<script src="sweetalert2.all.min.js"></script>
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
	<form action="/update.members">
		<div id="mypagediv" align="center" class="card">
			<img src="/img/쥐돌이.png" class="card-img-top" alt="...">
			<div id="iddiv" class="card-body" align="center">
				<h5 class="card-title">${dto.id }</h5>
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
						      ${dto.signup_date }
						    </div>
						  </div>
						</div>
					</li>
				  </ul>
				  <div class="card-body">
				    <a href="/updateBack.members"><button id="back" type="button" class="btn btn-light">뒤로가기</button></a>
					<button class="btn btn-dark">수정하기</button>
					<a href="/delete.members"><button type="button" class="btn btn-dark">회원탈퇴</button></a>
				  </div>
				</div>
	</form>
</body>
</html>