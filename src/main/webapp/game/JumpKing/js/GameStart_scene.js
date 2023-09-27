class GameStartScene extends Phaser.Scene{

    constructor() {
        super({ key: 'GameStartScene' });
    }
    

    preload() {
        this.load.spritesheet("player", "img/tinkerbell.png", { frameWidth: 57.7, frameHeight: 60 });
    }
    create() {
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 200, 'Game Start', { fontSize: '60px', fill: '#ffffff', fontWeight: 'bold' }).setOrigin(0.5);
        let startBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 110, "게임 시작하기", { fontSize: '40px', fill: '#ff0000' }).setOrigin(0.5).setInteractive().setPadding(15);
        let rankBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 160, "랭킹 보기", { fontSize: '40px', fill: '#00ff' }).setOrigin(0.5).setInteractive().setPadding(15);
        let outBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 210, "나가기", { fontSize: '40px', fill: '#ffffff' }).setOrigin(0.5).setInteractive().setPadding(15);
        if (!this.anims.exists("playerdown")) {
	        this.anims.create({
	            key: "playerdown",
	            frames: this.anims.generateFrameNumbers('player', { start: 0, end: 9 }),
	            frameRate: 10,
	            repeat: -1
	        });
	    }
        this.player = this.physics.add.sprite(250, 250, "player");

        
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
        // rankBtn을 누르면 RankScene으로 이동하면서 ajax로 랭킹을 가져온다.
        rankBtn.on('pointerdown', () => {
            $.ajax({
                url: "/JumpKingTop10.game",
                type: "get",
                dataType: "json",
            }).done(function (data) {
                this.scene.start('RankScene', { rankingData: data });
            }.bind(this)).fail(function (xhr, status, errorThrown) {
                console.log(xhr, status, errorThrown);
            });
        });
        outBtn.on('pointerover', () => {
            this.game.canvas.style.cursor = "pointer";
        });
        outBtn.on('pointerout', () => {
            this.game.canvas.style.cursor = "default";
        });
        outBtn.on('pointerdown', () => {
            window.close();
        });
    }



    update() {
        this.player.anims.play("playerdown", true);
    }
}