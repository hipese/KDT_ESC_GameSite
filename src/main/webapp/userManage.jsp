<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Manage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        

        *{box-sizing: border-box;}
        
        body {
                background-color: whitesmoke;
            }
        .container-fluid{
            padding:0px;
        }
        .title b{
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black;
            color: white;
            width:100%;
        }
        .title{
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black;
            color: white;
            font-size: large;
            line-height: 50px;
        }
        hr{
            height: 10px;
            margin: 30px; /* 좌우 여백 설정 */

        }
        .vertical-line {
            border-left: 1px solid #000; /* 수직 구분선 스타일 지정 */
            height: 500px; /* 원하는 높이로 조절  ***script로 회원이 추가 될때 마다 높이 늘리기***   */ 
            margin: 0 70px; /* 좌우 여백 설정 */
        }
        .loginbtn {
                background-color: #000000;
                color: white;
                border: none;
                border-radius: 10px;
                padding: 5px;
                font-size: 10px;
                font-weight: bold;
                cursor: pointer;
                width: 100%; 
                
            }
            .list {
                background-color: #000000;
                height: 50px;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 20px;
                font-weight: bold;
                color: white;
            }
            .leftbox {
                background-color: white;
                max-width: 150px;
                margin-left: 20px;
                margin-right: 20px;
                height:100%;
            }
            .leftbox ul {
                padding: 0px;
                list-style: none;
                margin: 0px;
                text-align: center;
            }

            .leftbox li {
                display: flex;
                justify-content: center;
                align-items: center;
                height:40px;
            }

            .leftbox li:hover {
                background-color: #000000;
                color:white;
            }

            a{
                text-decoration: none;
            }

            .leftbox a:hover li {
                color: white;
            }

            .leftbox a li {
                color: #000000;
            }

        .articles{
            display: flex;
            justify-content: center;
            width:100%;
            height:500px;
            border-radius: 5px;
            background-color: white;
        }
        #userlist{
            padding-left:30px;
            margin:0px;
        }
        .blank50{
            height:50px;
        }

    </style>
</head>

<body>

    <div class="container-fluid">
        <div id="title" class="row header title">
            <b>회원정보 관리</b>
        </div>
    </div>
    <div class="bodycontainer">
        <hr>
        <div class="row">
            <div class="col-12 col-md-12 order-0 order-md-0 title">
                일반 회원
            </div>
        </div>
        <div class="row blank50"></div>
        <div class="row body">
            <div class="col-12 col-md-2 d-md-block order-1 order-md-1 leftbox">
                <div class="list">목록</div>
                <ul>
                    <a href="/userManage.admin"><li>일반 회원</li></a>
                    <a href="..."><li>블랙 리스트</li></a>
                </ul>
            </div>
            <div class="col-12 col-md-10 order-1 order-md-1">
                <div class="row articles">
                   <ul id="userlist">
                   		<c:forEach var="i" items="${list}" varStatus="loopStatus">
							<a href="/userMypage.admin?id=${i }"><li>${i}</li></a>
						</c:forEach>
                   </ul>
                </div>
            </div>
           
        </div>
        <div class="row blank50"></div>
        <div class="row">
            <div class="col-12 col-md-10 order-5 order-md-5"></div>
            <div class="col-12 col-md-2 order-5 order-md-5">
                <button type="button" class="btn btn-dark">돌아가기</button>
            </div>
        </div>
    </div>
    


</body>
</html>