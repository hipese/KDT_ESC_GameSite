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
	body{
		background-color:whitesmoke;
	}
    #deleteMembers{
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

    #deleteidDiv,#deletepwDiv{
    	width:100%;
    	display:flex;
        justify-content:center;
        align-items: center;
    }
    #deleteidDiv2,#deletepwDiv2{
    	width:100%;
    }
    #idIcon,#pwIcon{
    	width:30px;
    }
    #updateid{
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
		<div class="card" id="deleteMembers">
            <div class="card-body" id="changesdiv">
            	<div id="title">
            		<b>회원 탈퇴</b>
            	</div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item" id="deleteid">
                        <div id="deleteidDiv">
                        	<i class="fa-solid fa-user" id="idIcon"></i>
                        	<div id="deleteidDiv2">
                        		<input id="id" type="text" class="form-control" name="id" placeholder="아이디 입력">
                        	</div>
                        </div>
                    </li>
                    <li class="list-group-item" id="deletepw">
                        <div id="deletepwDiv">
                        	<i class="fa-solid fa-lock" id="pwIcon"></i>
                        	<div id="deletepwDiv2">
                        		<input id="pw" type="password" class="form-control" name="pw" placeholder="비밀번호 입력">
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
    		<a href="/mypage.members"><button id="cancel" type="button" class="btn btn-light">탈퇴취소</button></a>
			<button id="delete" class="btn btn-dark">탈퇴하기</button>
    	</div>
    </div>
    </div>
    
        
</body>
<script>
	$("#delete").on("click",function(){
		$.ajax({
			url:"/deleteComplete.members",
			contentType : "application/json; charset:UTF-8",
			data:{
				id:$("#id").val(),
				pw:$("#pw").val()
			},
		}).done(function(resp){
			if(resp == "정말로 탈퇴하시겠습니까?") {
				Swal.fire({
					  title: resp,
					  text: "탈퇴 후 모든 정보가 사라집니다.",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes, delete it!'
					}).then((result) => {
					  if (result.isConfirmed) {
					    Swal.fire(
					      'Deleted!',
					      '탈퇴가 완료되었습니다.',
					      'success'
					    ).then((result)=>{
					    	window.location.href = "/realDelete.members";
					    })
					  }
					})
			} else {
				Swal.fire(resp);
			}
			
			console.log(resp);
		});
	});
</script>
</html>