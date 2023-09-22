class GameExplainScene extends Phaser.Scene {
    constructor() {
        super({ key: "GameExplainScene" });
    }
    preload() {
        this.load.audio("select", "./sound/select.mp3");
        this.load.image("explain", "./image/game_scene.jpg");
        this.load.image("left", "./image/keyboard_key_left.png");
        this.load.image("right", "./image/keyboard_key_right.png");
    }
    create() {
        this.select = this.sound.add("select");

        this.add.tileSprite(this.cameras.main.width / 2, this.cameras.main.height / 2  - 100, 523, 400, "explain");

        this.add.tileSprite(100, this.cameras.main.height / 2  - 100, 62, 62, "left");
        this.add.tileSprite(740, this.cameras.main.height / 2  - 100, 62, 62, "right");

        this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 150,
            "방향키를 이용하여\n지나가는 차를 피해\n안전운전 하세요",
            { fontFamily: "Sam3KRFont", fontSize: "30px" }
        ).setOrigin(0.5).setPadding(10, 10, 10, 10);

        let backBtn = this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 250,
            "Back",
            {fontFamily: "PressStart2P", fontSize: "30px" }
        ).setOrigin(0.5).setInteractive();

        backBtn.on("pointerover", () => {
            backBtn.setBackgroundColor("#2209FF");
            this.game.canvas.style.cursor = "pointer";
        });

        backBtn.on("pointerout", () => {
            backBtn.setBackgroundColor("#000000");
        });

        backBtn.on("pointerdown", () => {
            this.select.play();
            this.scene.start("GameStartScene");
        });
    }
    update() {

    }
}