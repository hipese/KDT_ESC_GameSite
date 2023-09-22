class GameOverScene extends Phaser.Scene {

    constructor() {
        super({ key: "GameOverScene" });
    }

    preload() {
        this.load.image("broken_skeleton", "asset/img/broken_skeleton.png");
    }

    create() {
        this.gameScene = this.scene.get('GameScene');
        this.add.sprite(
            this.cameras.main.width / 2,
            this.cameras.main.width / 2,
            "broken_skeleton").setOrigin(0.5, 1.7);

        this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2,
            "Game Over!!!",
            { fontSize: "60px", fill: "#FF0000" }).setOrigin(0.5, 1);

        this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2,
            "Score : " + this.registry.get("score"),
            { fontSize: "20px", fill: "#FFFFFF" }).setOrigin(0.5, -1);

        let restartBtn = this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 30,
            "Retry",
            { fontSize: "30px", fill: "#FFFF00" }
        ).setOrigin(0.5, -1).setInteractive().setPadding(15);

        restartBtn.on("pointerover", () => {
            restartBtn.setBackgroundColor("#720938");
            this.game.canvas.style.cursor = "pointer";
        });

        restartBtn.on("pointerout", () => {
            restartBtn.setBackgroundColor("#000000");
            this.game.canvas.style.cursor = "default";
        });

        restartBtn.on("pointerdown", () => {
            this.scene.resume();
            this.scene.stop(); // 현재 씬을 중지하여 화면에서 제거
            this.scene.start('GameScene'); // 새로운 게임 씬 시작
        });
    }



    update() {

    }

}