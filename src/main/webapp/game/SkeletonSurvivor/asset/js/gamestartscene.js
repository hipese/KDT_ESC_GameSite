class StartScene extends Phaser.Scene {
    constructor() {
        super({ key: "StartScene" });
    }

    preload() {
        this.load.image("gametitle","asset/img/skeleton_game.png");
        this.load.image("gametitlename","asset/img/skeleton_title.png");
    }

    create() {

        this.add.sprite(
            this.cameras.main.width/2,
            this.cameras.main.height/2-100,
            "gametitle").setOrigin(0.5);

        
        this.add.sprite(
            this.cameras.main.width/2,
            this.cameras.main.height/2+100,
            "gametitlename").setOrigin(0.5);
        

        const startBtn = this.add.text(
            this.cameras.main.width/2,
            this.cameras.main.height/2+250,
            "Game Start",
            {fontSize:"30px",fill:"#FFFF00"}
            ).setOrigin(0.5).setInteractive().setPadding(15);

        startBtn.on("pointerover",()=>{
            startBtn.setBackgroundColor("#720938");
            this.game.canvas.style.cursor = "pointer";
        });

        startBtn.on("pointerout",()=>{
            startBtn.setBackgroundColor("#000000");
            this.game.canvas.style.cursor = "default";
        });

        startBtn.on('pointerdown', () => {
            // 게임 시작 버튼을 클릭하면 GameScene으로 전환합니다.
            this.scene.start('GameScene');
        });
       
    }
}