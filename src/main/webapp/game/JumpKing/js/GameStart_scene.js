class GameStartScene extends Phaser.Scene{

    constructor() {
        super({ key: 'GameStartScene' });
    }
    

    preload() {
        this.load.spritesheet("player", "img/tinkerbell.png", { frameWidth: 57.7, frameHeight: 60 });
    }
    create() {
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 200, 'Game Start', { fontSize: '60px', fill: '#ffffff', fontWeight: 'bold' }).setOrigin(0.5);
        let startBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 150, "게임 시작하기", { fontSize: '40px', fill: '#ff0000' }).setOrigin(0.5).setInteractive().setPadding(15);
        let rankBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 200, "랭킹 보기", { fontSize: '40px', fill: '#00ff' }).setOrigin(0.5).setInteractive().setPadding(15);
        this.anims.create({
            key: "playerdown",
            frames: this.anims.generateFrameNumbers('player', { start: 0, end: 9 }),
            frameRate: 10,
            repeat: -1
        });
        this.player = this.physics.add.sprite(250, 250, "player");
        this.player.play("playerdown");

        
        startBtn.on('pointerover', () => {
            this.game.canvas.style.cursor = "pointer";
        });
        rankBtn.on('pointerover', () => {
            this.game.canvas.style.cursor = "pointer";
        });
        startBtn.on('pointerout', () => {
            this.game.canvas.style.cursor = "default";
        });
        rankBtn.on('pointerout', () => {
            this.game.canvas.style.cursor = "default";
        });
        startBtn.on('pointerdown', () => {
            this.scene.start('MoveScene');
        });
        rankBtn.on('pointerdown', () => {
            this.scene.start('RankScene');
        });  
        
    }
    update() {
        
    }
}