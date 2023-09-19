class GameStartScene extends Phaser.Scene {
    constructor() {
        super({ key: "GameStartScene" });
    }

    init() {

    }

    preload() {
        this.load.image("background", "background.png");
        this.load.spritesheet("rundino", "dino.png", { frameWidth: 88, frameHeight: 94 });
    }
    create() {
        this.back = this.add.tileSprite(0, 0, 1000, 300, "background");
        this.back.setOrigin(0, 0);
        this.back.setScale(3/2);

        this.bottomBoundary = this.add.rectangle(0, this.cameras.main.height - 50, this.cameras.main.width, 1, 0xFFFFFF);
        this.bottomBoundary.setOrigin(0, 0);
        this.physics.add.existing(this.bottomBoundary, true);

        this.dino = this.physics.add.sprite(150, 220, "rundino");
        this.dino.setCollideWorldBounds(true);
        this.dino.body.gravity.y = 1000;
        this.dino.setScale(0.5);
        this.dino.setSize(40,60);

        this.physics.add.collider(this.bottomBoundary, this.dino, (boundary, dino)=> {
            this.jump = true;
        });

        this.spaceKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.SPACE);

        let text = this.add.text(200, 40, '플레이 하려면 스페이스바를 누르세요', { fontFamily: '폰트', fontSize: 30, color: '색상' });
    }

    update() {
        if (Phaser.Input.Keyboard.JustDown(this.spaceKey)) {
            this.dino.setVelocityY(-450);
            this.scene.start("UserRun");
        }
    }
}