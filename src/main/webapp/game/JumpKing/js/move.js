class MoveScene extends Phaser.Scene {

    constructor() {
        super({ key: 'MoveScene' });
    }
    init() {
        this.frame = 0;
        this.timer = 0;
        this.doubleJump = true;
        this.count = 0;
        this.box = [];
    }
    preload() {
        this.load.image("box", "img/ballpan.png");
        this.load.spritesheet("player", "img/tinkerbell.png", { frameWidth: 57.7, frameHeight: 60 });
    }

    create() {
        this.anims.create({
            key: "playerdown",
            frames: this.anims.generateFrameNumbers('player', { start: 0, end: 9 }),
            frameRate: 10,
            repeat: -1
        });
        this.anims.create({
            key: "left",
            frames: this.anims.generateFrameNumbers('player', { start: 10, end: 19 }),
            frameRate: 10,
            repeat: -1
        });
        this.anims.create({
            key: "right",
            frames: this.anims.generateFrameNumbers('player', { start: 30, end: 39 }),
            frameRate: 10,
            repeat: -1
        });

        this.cursor = this.input.keyboard.createCursorKeys();
        this.player = this.physics.add.sprite(250, 50, "player");
        this.player.setCollideWorldBounds(true);
        this.physics.world.setBounds(0, 0, 500, 500); // 화면 밖으로 나가지 못하게 설정
        this.player.body.gravity.y = 1000;
        this.player.play("playerdown");
        this.player.setSize(50, 50); // 충돌 영역 설정
        this.player.setScale(0.8);
        this.player.setMass(50);
        this.player.play("run");


        let box = this.physics.add.sprite(250, 100, "box");
        box.setVelocityY(100);
        box.setScale(0.3);
        this.physics.add.collider(this.player, box);
        box.body.immovable = true;


        this.spaceKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.SPACE);

        let bottomLine = this.add.rectangle(0, this.cameras.main.height - 1, this.cameras.main.width, 1, 0xffffff).setOrigin(0, 0);
        this.physics.add.existing(bottomLine, true);
        bottomLine.body.immovable = true; // 충돌 시 움직이지 않게 설정
        this.physics.add.overlap(bottomLine, this.player, () => {
            this.scene.start('GameOverScene', { timer: this.timer });
        });
        this.physics.add.overlap(bottomLine, this.box, (line, box) => {
            box.destroy();
        });
        this.timerText = this.add.text(10, 10, 'Time: 0', { font: '20px Courier', fill: '#ffffff' }).setScrollFactor(0).setPadding(5, 5, 5, 5) ;
    }

    update() {
        this.frame++;
        this.timer += this.time.delta;
        this.timer = this.frame * 16.666666666666668;
        let minutes = Math.floor(this.timer / 60000);
        let seconds = Math.floor((this.timer % 60000) / 1000);
        let milliseconds = Math.floor((this.timer % 1000) / 10);
        this.timerText.setText('Timer: ' + minutes + '분 ' + seconds + '초 ' + milliseconds);

        if (Phaser.Input.Keyboard.JustDown(this.spaceKey)) {
            if (this.player.body.touching.down) {
                this.player.setVelocityY(-500);
                this.doubleJump = true;
            }
            else if (this.doubleJump) {
                this.player.setVelocityY(-500);
                this.doubleJump = false;
            }
        }
        
        if (this.frame % 60 == 0) {
            let box = this.physics.add.sprite(Phaser.Math.Between(0, 500), 0, "box");
            box.setScale(0.3);
            this.physics.add.collider(this.player, box);
            box.body.immovable = true;
            this.box.push(box);
            if (Math.floor(this.timer / 60000) < 1) { 
                box.setVelocityY(100);
            } else if (Math.floor(this.timer / 60000) < 2) {
                box.setVelocityY(130);
            } else {
                box.setVelocityY(150);
            }
        }

        let speed = 150;
        if(this.cursor.left.isDown) {
            this.player.setVelocityX(-speed);
            this.player.play("left", true);
        }
        if (this.cursor.right.isDown) {
            this.player.setVelocityX(speed);
            this.player.play("right", true);
        }
        if (!this.cursor.left.isDown && !this.cursor.right.isDown) {
            this.player.setVelocityX(0);
            this.player.play("playerdown", true);
        }
    }
}