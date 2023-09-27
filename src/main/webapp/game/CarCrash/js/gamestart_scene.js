class GameStartScene extends Phaser.Scene {
    constructor() {
        super({ key: "GameStartScene" });
    }
    preload() {
        this.load.image("start", "./image/start.png");
        this.load.audio("select", "./sound/select.mp3");
        this.load.audio("startsound", "./sound/startsound.mp3");
    }
    create() {
        this.startsound = this.sound.add("startsound");
        this.select = this.sound.add("select");

        this.start = this.add.tileSprite(this.cameras.main.width / 2, this.cameras.main.height / 2  + 10, 868, 650, "start");

        this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 - 180,
            "Let's drive",
            { fontFamily: "PressStart2P", fontSize: "50px"}
        ).setOrigin(0.5).setPadding(10, 10, 10, 10);

        this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 - 120,
            "Safely!",
            { fontFamily: "PressStart2P", fontSize: "50px", fill: "#01DF01"}
        ).setOrigin(0.5).setPadding(10, 10, 10, 10);

        let startBtn = this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 80,
            "Start",
            {fontFamily: "PressStart2P", fontSize: "30px" }
        ).setOrigin(0.5).setInteractive();

        let explainBtn = this.add.text(
            this.cameras.main.width / 2,
            this.cameras.main.height / 2 + 170,
            "How to play",
            {fontFamily: "PressStart2P", fontSize: "30px" }
        ).setOrigin(0.5).setInteractive();
        let killText = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 260, "Get Out", { fontSize: '30px', fontFamily: "PressStart2P" }).setOrigin(0.5).setInteractive().setPadding(15);
            
            killText.on('pointerover', () => {
	            this.game.canvas.style.cursor = "pointer";
	            killText.setBackgroundColor("#2209FF");
	        });
	        killText.on('pointerout', () => {
	            this.game.canvas.style.cursor = "default";
	            killText.setBackgroundColor("transparent");
	        });
	        killText.on('pointerdown', () => {
				this.select.play();
	            window.close();
	        });

        startBtn.on("pointerover", () => {
            startBtn.setStyle({ backgroundColor: "#2209FF" });
            this.game.canvas.style.cursor = "pointer";
        });
        
        startBtn.on("pointerout", () => {
            startBtn.setStyle({ backgroundColor: "transparent" });
            this.game.canvas.style.cursor = "default";
        });
        
        startBtn.on("pointerdown", () => {
            this.startsound.play();
            this.scene.start("CarScene");
        });

        explainBtn.on("pointerover", () => {
            explainBtn.setBackgroundColor("#2209FF");
            this.game.canvas.style.cursor = "pointer";
        });

        explainBtn.on("pointerout", () => {
            explainBtn.setBackgroundColor("transparent");
            this.game.canvas.style.cursor="default";
        });

        explainBtn.on("pointerdown", () => {
            this.select.play();
            this.scene.start("GameExplainScene");
        });
    }
    update() {

    }
}