<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preload" as="font" href="font/DungGeunMo.ttf" type="font/ttf" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.60.0/phaser.min.js"
        integrity="sha512-YQL0GVx/Too3vZjBl9plePRIYsRnd1s8N6QOvXPdZ+JMH2mtRTLQXGUDGjNW6zr1HUgcOIury67IvWe91oeEwQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="./js/GameOverScene.js"></script>
    <script src="./js/playerScene.js"></script>
    <script src="./js/title.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <title>Document</title>
</head>
    <style>
         div {
            border: 1px solid black;
        }

        #container {
            height: 500px;
            width: 1500px;
            margin: auto;
        }

        @font-face {
            font-family: DungGeunMo;
            src: url('font/DungGeunMo.ttf');
        }

    </style>
<body>
    <div id="container">
       
    </div>

    <script>


        let option = {
            type: Phaser.AUTO, //컴퓨터의 상황에 맞는 Game Compoent를 선택
            parent: "container",
            width: "100%",
            height: "100%",
            physics: {
                default: "arcade",
                arcade: {
                    gravity: { y: 0 },
                    debug: false
                }
            },
            fps: {
                target: 60, // 원하는 FPS 설정 (기본값은 60)
                forceSetTimeOut: true // 브라우저 지원이 안 되는 경우에 setTimeout 사용
            },
            scene: [titleScene,playScene,GameOverScene]
        };

        let game = new Phaser.Game(option);




        // 시간을 업데이트하는 함수

    </script>
</body>

</html>