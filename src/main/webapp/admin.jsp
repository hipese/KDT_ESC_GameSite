<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * {
                box-sizing: border-box;
        }
        a{
            text-decoration:none;
            color:white;
            padding:5px;
        }
        .container-fluid{
            padding:0px;
        }
        #header{
            width:100%;
            height:50px;
            margin:0px;
            background-color:black;
            display:flex;
            justify-content: center;
            align-items: center;
        }
        #titlediv{
            color:white;
        }
        #profile{
            background-color: white;
            border-radius: 5px;
            height:200px;
        }
        #hello{
            display:flex;
            justify-content: center;
            align-items: center;
        }
        .btns{
            display:flex;
            justify-content: center;
        }
        body {
            margin:0px;
            background-color: whitesmoke;
        }
        .graph{
            background-color: white;
            border-radius: 5px;
            height:500px;
        }
        .blank20{
            height:20px;
        }
        .blank30{
            height:30px;
        }
        .blank50{
            height:50px;
        }
        .blank100{
            height:100px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div id="header" class="row">
            <div id="titlediv" class="col-2 g-0 text-center">
                <b>관리자 페이지</b>
            </div>
            <div id="menudiv" class="col-9 g-0"></div>
            <div class="col-1 g-0">
                <a href="/logout.admin" id="logoutdiv">로그아웃</a>
            </div>
        </div>
    </div>
    <div class="blank20"></div>
    <div id="bodycontainer" class="container">
        <div id="profile" class="row">
            <div id="hello" class="col-12 g-0">
                <strong>관리자 ${id} 님 환영합니다</strong>
            </div>
            <div class="col-12 g-0 blank20"></div>
            <div class="col-12 g-0 btns">
                <a href="...">
                    <button class="btn btn-dark">게시판 관리</button>
                </a>
                <a href="/manageMembers.admin">
                    <button class="btn btn-dark">회원정보 관리</button>
                </a>
            </div>
        </div>
        <div class="blank50"></div>
        <div id="body" class="row">
            <div class="graph">
                <canvas  class="chart" id="myChart1"></canvas>
            </div>
            <div class="blank100"></div>
            <div class="graph">
                <canvas class="chart" id="myChart2"></canvas>
            </div>
        </div>
    </div>
    <div class="blank100"></div>
</body>
<script>
    const ctx1 = document.getElementById('myChart1');
  
    new Chart(ctx1, {
      type: 'bar',
      data: {
        labels: ['Jump King', 'Vampire Survivor', 'Dino Game', '휘재님', '성진님', '승준님'],
        datasets: [{
          label: '플레이 횟수',
          data: [12, 19, 3, 5, 2, 3],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
       maintainAspectRatio: false,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });


    const colors = ['red','yellow','blue','#c3e6cb','#dc3545','#6c757d'];

    var ctx2 = document.getElementById('myChart2');

    var chartData = {
    labels: ["S", "M", "T", "W", "T", "F", "S"],
    datasets: [{
        data: [589, 445, 483, 503, 689, 692, 634],
        label: '기대 방문자수',
        backgroundColor: colors[2],
        borderColor: colors[2],
        borderWidth: 3,
        pointBackgroundColor: colors[2]
    },
    {
        data: [346, 503, 609, 503, 589, 483, 445],
        label: '실제 방문자수',
        backgroundColor: colors[0],
        borderColor: colors[0],
        borderWidth: 3,
        pointBackgroundColor: colors[0]
    }
    ]
    };

    var myChart2 = new Chart(ctx2, {
        // 챠트 종류를 선택
        type: 'line',

        // 챠트를 그릴 데이타
        data: chartData,

        // 옵션
        options: {
           maintainAspectRatio: false,
        legend: {
            display: true
        }
        }
    });
</script>
</html>