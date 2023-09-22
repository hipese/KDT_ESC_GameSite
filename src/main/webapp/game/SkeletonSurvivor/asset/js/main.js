let option = {
    type: Phaser.AUTO,
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
    scene: [StartScene,GameScene,GameOverScene],
    fps: {
        target: 60, 
        forceSetTimeOut: true 
    }
};

let game = new Phaser.Game(option);