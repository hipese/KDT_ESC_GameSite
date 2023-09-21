<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Find ID</title>

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
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        h1 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .btn-group {
            text-align: center;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 10px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Find Your ID</h1>
        <form id="frm">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" required>
            </div>
            <div class="btn-group">
                <button type="submit">Find ID</button>
            </div>
        </form>
        <a href="index.jsp">Back to Home</a>
    </div>
    
    <script>
	    $(document).ready(function () {
	        // 폼 전송 이벤트 리스너 등록
	        $("#frm").submit(function (e) {
	            e.preventDefault(); // 기본 폼 전송 방지
	
	            // 입력된 데이터 가져오기
	            var name = $("#name").val();
	            var email = $("#email").val();
	
	            // AJAX 요청 설정
	            $.ajax({
	                type: "POST",
	                url: "/findMemberId.members", // 서블릿 URL
	                data: { name: name, email: email }, // 전송할 데이터
	                success: function (response) {
	                    if (response !== null && response !== "null") { // 수정된 부분
	                        alert("ID found: " + response);
	                    } else {
	                        alert("ID not found.");
	                    }
	                },
	                error: function (error) {
	                    // 에러 처리
	                    alert("An error occurred: " + error.responseText);
	                }
	            });
	        });
	    });
	</script>
</body>

</html>