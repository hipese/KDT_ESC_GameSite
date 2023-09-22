<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change PW</title>
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
	body{
		background-color:whitesmoke;
	}
    #changeMembers{
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
    #title{
    	display:flex;
        justify-content:center;
        align-items: center;
        height:100px;
    }
    #changes{
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #changesdiv{
    	height:100%;
    }

    #changeidDiv,#changepw1Div,#changepw2Div{
    	width:100%;
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #changeidDiv2,#changepw1Div2,#changepw2Div2{
    	width:100%;
    }
    #idIcon,#pwIcon{
    	width:30px;
    }
    #changeid{
    	height:70px;
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #cancel {
    	margin-right:5px;
    }
    .blank{
    	height:50px;
    }
</style>
</head>
<body>
	<div class="container">
		<div class="card" id="changeMembers">
            <div class="card-body" id="changesdiv">
            	<div id="title">
            		<b>비밀번호 변경</b>
            	</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" id="changeid">
                        <div id="changeidDiv">
                        	<i class="fa-solid fa-user" id="idIcon"></i>
                        	<div id="changeidDiv2">
                        		<input id="id" type="text" class="form-control" name="id" placeholder="아이디 입력">
                        	</div>
                        </div>
                    </li>
                    <li class="list-group-item" id="changepw">
                        <div id="changepw1Div">
                        	<i class="fa-solid fa-key" id="pwIcon"></i>
                        	<div id="changepw1Div2">
                        		<input id="pw" type="password" class="form-control" name="pw1" placeholder="변경 전 비밀번호">
                        	</div>
                        </div>
                    </li>
                    <li class="list-group-item" id="changepw1">
                        <div id="changepw1Div">
                        	<i class="fa-solid fa-lock" id="pwIcon"></i>
                        	<div id="changepw1Div2">
                        		<input id="pw1" type="password" class="form-control" name="pw2" placeholder="변경 후 비밀번호">
                        	</div>
                        </div>
                    </li>
                    <li class="list-group-item" id="changepw2">
                        <div id="changepw2Div">
                        	<i class="fa-solid fa-lock" id="pwIcon"></i>
                        	<div id="changepw2Div2">
                        		<input id="pw2" type="password" class="form-control" placeholder="변경 후 비밀번호 재입력">
                        	</div>
                        </div>
                    </li>
                </ul>
                <div class="blank"></div>
            </div>
          </div>
    <br>
    <div class="row g-0">
    	<div class="btns">
    		<a href="/mypage.members"><button id="cancel" type="button" class="btn btn-light">변경취소</button></a>
			<button id="delete" class="btn btn-dark">변경하기</button>
    	</div>
    </div>
    </div>
    
        
</body>
<script>
	let regexpw = /^[A-Za-z]\w{6,}[!,@,#,$]$/;
	$("#delete").on("click",function(){
		if($("#pw1").val()!=$("#pw2").val()){
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '비밀번호를 다시 확인해주세요.',
			})
		} else if($("#id").val()=="" || $("#pw").val()=="" || $("#pw1").val()=="" || $("#pw2").val()=="" ) {
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '모든 문항을 빠짐 없이 입력해주세요.',
			})
		} else if(!regexpw.test($("#pw1").val())) {
			Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: '비밀번호는 6자 이상의 문자 및 특수문자로 이루어져야 합니다.',
			})
		} else {
				$.ajax({
					url:"/changeCompletePW.members",
					contentType : "application/json; charset:UTF-8",
					data:{
						id:$("#id").val(),
						pw1:$("#pw").val(),
						pw2:$("#pw1").val()
					}
				}).done(function(resp){
					if(resp == "") {
						Swal.fire(
							      'Changed!',
							      '비밀번호 변경이 완료되었습니다.',
							      'success'
							    ).then((result)=>{
							    	window.location.href = "/mypage.members";
						})
					} else {
						Swal.fire(resp);
					}
				});
			
		}
	});
		

</script>
</html>