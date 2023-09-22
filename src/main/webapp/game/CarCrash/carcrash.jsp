<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car</title>
    <link rel="preload" as="font" href="./font/PressStart2P.ttf" type="font/ttf" crossorigin="anonymous" />
    <link rel="preload" as="font" href="./font/Sam3KRFont.ttf" type="font/ttf" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.60.0/phaser.min.js"
        integrity="sha512-YQL0GVx/Too3vZjBl9plePRIYsRnd1s8N6QOvXPdZ+JMH2mtRTLQXGUDGjNW6zr1HUgcOIury67IvWe91oeEwQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="./js/gamestart_scene.js"></script>
    <script src="./js/gameover_scene.js"></script>
    <script src="./js/cargmae.js"></script>
    <script src="./js/gameexplain_scene.js"></script>

    <style>
        #container {
            position: relative;
            width: 840px;
            height: 650px;
            margin: auto;
        }

        @font-face {
            font-family: PressStart2P;
            src: url('PressStart2P.ttf');
        }

        @font-face {
            font-family: Sam3KRFont;
            src: url('Sam3KRFont.ttf');
        }
    </style>

</head>

<body>
    <div id="container">

    </div>
    <script>

        let option = {
            type: Phaser.AUTO, // 컴퓨터의 상황에 맞는 Game Component 선택
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
            scene: [GameStartScene, CarScene, GameOverScene, GameExplainScene],
            fps: {
                target: 60, // 원하는 FPS 설정 (기본값은 60)
                forceSetTimeOut: true // 브라우저 지원이 안 되는 경우에 setTimeout 사용
            }
        };
        let game = new Phaser.Game(option);

    </script>

</body>

</html>