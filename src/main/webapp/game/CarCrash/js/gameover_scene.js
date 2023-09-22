class GameOverScene extends Phaser.Scene {
    constructor() {
        super({ key: "GameOverScene" });
    }

    preload() {
        this.load.image("accident", "./image/accident.png");
        this.load.audio("select", "./sound/select.mp3");
    }
    create() {
        this.accident = this.add.tileSprite(this.cameras.main.width / 2, this.cameras.main.height / 2 - 160, 100, 100, "accident");
        this.select = this.sound.add("select");

        this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 200, // 위아래 위치를 조절하여 겹치지 않게 합니다.
            `Score: ${this.scene.get("CarScene").score}`, // CarScene에서의 count 값을 가져와 출력합니다.
            {fontFamily: "PressStart2P", fontSize: "30px", fill: "#FFFFFF" }
        ).setOrigin(0.5);

        this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 - 80,
            "Game Over",
            {fontFamily: 'PressStart2P', fontSize: "60px", fill: "#FF0000" }
        ).setOrigin(0.5);

        let restartBtn = this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 30,
            "Restart",
            {fontFamily: 'PressStart2P', fontSize: "30px" }
        ).setOrigin(0.5).setInteractive().setPadding(15);

        let rankBtn = this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 130,
            "Rank",
            {fontFamily: 'PressStart2P', fontSize: "30px" }
        ).setOrigin(0.5).setInteractive().setPadding(15);

        restartBtn.on("pointerover", () => {
            
            restartBtn.setBackgroundColor("#2209FF");
            this.game.canvas.style.cursor = "pointer";
        });

        restartBtn.on("pointerout", () => {
            restartBtn.setBackgroundColor("#000000");
        });

        restartBtn.on("pointerdown", () => {
            this.select.play();
            this.scene.start("CarScene");
        });

        rankBtn.on("pointerover", () => {
            
            rankBtn.setBackgroundColor("#2209FF");
            this.game.canvas.style.cursor = "pointer";
        });

        rankBtn.on("pointerout", () => {
            rankBtn.setBackgroundColor("#000000");
        });


    }
    update() {

    }
}