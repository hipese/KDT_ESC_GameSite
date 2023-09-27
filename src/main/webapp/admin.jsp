<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Admin Page</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
            <style>
                * {
                    box-sizing: border-box;
                }

                a {
                    text-decoration: none;
                    color: white;
                    padding: 5px;
                }

                .container-fluid {
                    padding: 0px;
                }

                #header {
                    width: 100%;
                    height: 50px;
                    margin: 0px;
                    background-color: black;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                #titlediv {
                    color: white;
                }

                #profile {
                    background-color: white;
                    border-radius: 5px;
                    height: 200px;
                }

                #hello {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

                .btns {
                    display: flex;
                    justify-content: center;
                }

                body {
                    margin: 0px;
                    background-color: whitesmoke;
                }

                .graph {
                    background-color: white;
                    border-radius: 5px;
                    height: 500px;
                }

                .blank20 {
                    height: 20px;
                }

                .blank30 {
                    height: 30px;
                }

                .blank50 {
                    height: 50px;
                }

                .blank100 {
                    height: 100px;
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
                        <a href="/logout.members" id="logoutdiv">로그아웃</a>
                    </div>
                </div>
            </div>
            <div class="blank20"></div>
            <div id="bodycontainer" class="container">
                <div id="profile" class="row">
                    <div id="hello" class="col-12 g-0">
                        <strong>${sessionScope.loginID}님 환영합니다</strong>
                    </div>
                    <div class="col-12 g-0 blank20"></div>
                    <div class="col-12 g-0 btns">
                    <a href="/showBoardList.board?cpage=1&searchText=">
                            <button class="btn btn-dark">게시판 관리</button>
                        </a>
                        <a href="/showBoardList.adminboard?cpage=1&searchText=">
                            <button class="btn btn-dark">공지 게시판</button>
                        </a>
						<a href="/userManage.admin">
                            <button class="btn btn-dark">회원정보 관리</button>
                        </a>
                    </div>
                </div>
                <div class="blank50"></div>
                <div id="body" class="row">
                	<div class="graph">
                        <canvas class="chart" id="myChart0"></canvas>
                    </div>
                	<div class="blank50"></div>
                    <div class="graph">
                        <canvas class="chart" id="myChart1"></canvas>
                    </div>
                    <div class="blank100"></div>
                    <div class="graph">
                        <canvas class="chart" id="myChart2"></canvas>
                    </div>
                    <div class="blank100"></div>
                    <div class="graph">
                        <canvas class="chart" id="myChart3"></canvas>
                    </div>
                    <div class="blank100"></div>
                    <div class="graph">
                        <canvas class="chart" id="myChart4"></canvas>
                    </div>
                    <div class="blank100"></div>
                    <div class="graph">
                        <canvas class="chart" id="myChart5"></canvas>
                    </div>
                    <div class="blank100"></div>
                    <div class="graph">
                        <canvas class="chart" id="myChart6"></canvas>
                    </div>
                    <div class="blank100"></div>
                    <div class="graph">
                        <canvas class="chart" id="myChart7"></canvas>
                    </div>
                </div>
            </div>
            <div class="blank100"></div>
        </body>
        <script>
            function formatDate(inputDate) {
                const parts = inputDate.split(' '); // 공백으로 문자열 분리
                const monthName = parts[0]; // 월 이름 (예: "9월")
                const day = parts[1].slice(0, -1); // 날짜에서 ',' 제거
                const year = parts[2]; // 연도 (예: "2023")

                // 월 이름을 숫자 형태로 변환
                const months = {
                    '1월': '01',
                    '2월': '02',
                    '3월': '03',
                    '4월': '04',
                    '5월': '05',
                    '6월': '06',
                    '7월': '07',
                    '8월': '08',
                    '9월': '09',
                    '10월': '10',
                    '11월': '11',
                    '12월': '12'
                };
                const month = months[monthName];

                // 날짜를 YYYY-MM-DD 형식으로 반환
                return year+"-"+month+"-"+day;
            }
            let jsonData = ${ gamesData };
            

            new Chart(document.getElementById('myChart0'), {
                type: 'bar',
                data: {
                    labels: [jsonData[0]["gameName"], jsonData[1]["gameName"], jsonData[2]["gameName"], jsonData[3]["gameName"], jsonData[4]["gameName"], jsonData[5]["gameName"]],
                    datasets: [{
                        label: '총 플레이 한 횟수',
                        data: [jsonData[0]["allCounts"], jsonData[1]["allCounts"], jsonData[2]["allCounts"], jsonData[3]["allCounts"], jsonData[4]["allCounts"], jsonData[5]["allCounts"]],
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

            new Chart(document.getElementById('myChart1'), {
                type: 'bar',
                data: {
                    labels: [jsonData[0]["gameName"], jsonData[1]["gameName"], jsonData[2]["gameName"], jsonData[3]["gameName"], jsonData[4]["gameName"], jsonData[5]["gameName"]],
                    datasets: [{
                        label: '오늘 ('+ formatDate(jsonData[0]["weekCounts"][6]["date"]) +') 플레이 한 횟수',
                        data: [jsonData[0]["todayCounts"], jsonData[1]["todayCounts"], jsonData[2]["todayCounts"], jsonData[3]["todayCounts"], jsonData[4]["todayCounts"], jsonData[5]["todayCounts"]],
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


            const colors = ['red', 'orange', 'yellow', 'green', 'blue', 'purple'];
            
            for(let i = 0; i < jsonData.length;i++){
            	new Chart(document.getElementById('myChart'+(2+i)), {
                    // 챠트 종류를 선택
                    type: 'line',

                    // 챠트를 그릴 데이타
                    data: {
                        labels: [formatDate(jsonData[i]["weekCounts"][0]["date"]), formatDate(jsonData[i]["weekCounts"][1]["date"]), formatDate(jsonData[i]["weekCounts"][2]["date"]), formatDate(jsonData[i]["weekCounts"][3]["date"]), formatDate(jsonData[i]["weekCounts"][4]["date"]), formatDate(jsonData[i]["weekCounts"][5]["date"]), formatDate(jsonData[i]["weekCounts"][6]["date"])],
                        datasets: [{
                            data: [jsonData[i]["weekCounts"][0]["value"], jsonData[i]["weekCounts"][1]["value"], jsonData[i]["weekCounts"][2]["value"], jsonData[i]["weekCounts"][3]["value"], jsonData[i]["weekCounts"][4]["value"], jsonData[i]["weekCounts"][5]["value"], jsonData[i]["weekCounts"][6]["value"]],
                            label: jsonData[i]["gameName"],
                            backgroundColor: colors[i],
                            borderColor: colors[i],
                            borderWidth: 3,
                            pointBackgroundColor: colors[i]
                        }
                        ]
                    },

                    // 옵션
                    options: {
                        maintainAspectRatio: false,
                        legend: {
                            display: true
                        }
                    }
                });
            }


            console.log(${ gamesData });
        </script>

        </html>