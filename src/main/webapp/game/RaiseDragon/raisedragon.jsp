<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.60.0/phaser.min.js" 
    integrity="sha512-YQL0GVx/Too3vZjBl9plePRIYsRnd1s8N6QOvXPdZ+JMH2mtRTLQXGUDGjNW6zr1HUgcOIury67IvWe91oeEwQ==" 
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="./js/ball.js"></script>
    <script src="./js/bounce.js"></script>
    <script src="./js/end.js"></script>
    <script src="./js/gameover_scene.js"></script>
    <script src="./js/main_scene.js"></script>
    <script src="./js/run.js"></script>
    <script src="./js/start_scene.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <style>
        #container{
            border: 3px solid black;
            width: 1000px;
            height: 500px;
            margin: auto;
        }
        .explanation{
            width: 1000px;
            margin: auto;
        }
    </style>
</head>
<body>
    <div id="container">

    </div>
    <div class="explanation">
        <br>
        <p>조작법 : 방향키 < , > 를 이용하여 이동합니다.</p>
        <p>-------------------------------------  총 3가지의 스테이지를 클리어 하셔야합니다. ------------------------------------- </p>
        <p>       첫번째 스테이지 : 머리 위에서 해골과 버섯이 쏟아집니다. 해골을 피해서 버섯을 획득하세요</p>
        <p>       두번째 스테이지 : 30초 동안 튕겨다니는 공들을 피해서 버텨보세요</p>
        <p>       세번째 스테이지 : 13초 동안 왼쪽에 나오는 방향키를 눌러주세요</p>
    </div>
    
    <script>
        let option = {
            type:Phaser.AUTO,   // 컴퓨터의 상황에 맞는 Game Component 선택
            parent:"container",
            width:"100%",
            height:"100%",
            physics:{
                default:"arcade",
                arcade:{
                    gravity:{y:0},
                    debug:false
                }
            },
            scene:[StartScene,EndScene,RunScene,BallScene,MainScene,BounceScene,GameOverScene],
            fps: {
                target: 60, 
                forceSetTimeOut: true 
            }
        };
        let game = new Phaser.Game(option);
    </script>
</body>
</html>