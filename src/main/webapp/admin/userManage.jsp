<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Manage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            background-color: whitesmoke;
        }

        .container-fluid,
        .container {
            padding: 0;
        }

        .title {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: black;
            color: white;
            font-size: large;
            line-height: 50px;
        }

        hr {
            height: 10px;
            margin: 30px;
        }

        .nav-tabs {
            background-color: #000000;
        }

        .nav-tabs .nav-link {
            color: white;
        }

        .nav-tabs .nav-link.active {
            background-color: #FFFFFF;
            color: black;
        }

        .articles {
            display: flex;
            justify-content: center;
            width: 100%;
            height: 500px;
            border-radius: 5px;
            background-color: white;
        }

        #userlist {
            padding-left: 30px;
            margin: 0;
            list-style: none;
        }

        #userlist a {
            text-decoration: none;
            color: #000000;
        }

        #userlist a:hover li {
            color: white;
            background-color: black;
        }

        #userlist li {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 40px;
        }

        .blank50 {
            height: 50px;
        }
    </style>

    <script>
        function updateTitle(tabId) {
            document.getElementById('titleText').innerText = (tabId === 'normalUsers') ? '일반 회원' : '블랙 리스트 회원';
        }
    </script>
</head>

<body>
    <div class="container-fluid">
        <div id="title" class="row header title">
            <b id="titleText">회원정보 관리</b>
        </div>
    </div>

    <div class="bodycontainer">
        <hr>
        <div class="row">
            <div class="col-12 col-md-12 order-0 order-md-0 title">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" id="normalUsersTab" data-bs-toggle="tab" href="#normalUsers" onclick="updateTitle('normalUsers')">일반 회원</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="blacklistTab" data-bs-toggle="tab" href="#blacklist" onclick="updateTitle('blacklist')">블랙 리스트</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="row articles">
            <div class="col-12 col-md-10 order-1 order-md-1">
                <div class="tab-content">
                    <!-- 일반 회원 탭 -->
                    <div class="tab-pane fade show active" id="normalUsers">
                        <ul id="userlist">
                            <c:forEach var="i" items="${list}" varStatus="loopStatus">
                                <a href="/userInfo.admin?id=${i }">
                                    <li>${i}</li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                    <!-- 블랙 리스트 탭 -->
                    <div class="tab-pane fade" id="blacklist">
                        <ul id="userlist">
                            <c:forEach var="i" items="${banlist}" varStatus="loopStatus">
                                <a href="/userInfo.admin?id=${i }">
                                    <li>${i}</li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row blank50"></div>

        <div class="row">
            <div class="col-12 col-md-10 order-5 order-md-5"></div>
            <div class="col-12 col-md-2 order-5 order-md-5">
                <a href="/returnToAdmin.admin"><button type="button" class="btn btn-dark">돌아가기</button></a>
            </div>
        </div>
    </div>
</body>

</html>