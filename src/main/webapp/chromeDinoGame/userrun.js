class UserRun extends Phaser.Scene {
    constructor() {
        super({ key: "UserRun" });
    }

    init() {
        this.frame = 0;
        this.cactuses = [];
        this.cactusvel = -200;
        this.gameover = false;
        this.score = 0;
    }

    preload() {
        this.load.image("background", "background.png");
        this.load.spritesheet("rundino", "dino.png", { frameWidth: 88, frameHeight: 94 });
        this.load.image("cactus1", "cactus1.png");
        this.load.image("cactus2", "cactus2.png");
        this.load.image("cactus3", "cactus3.png");
        this.load.image("cactus4", "cactus4.png");
        this.load.image("cactus5", "cactus5.png");
    }
    create() {
        this.back = this.add.tileSprite(0, 0, 1000, 300, "background");
        this.back.setOrigin(0, 0);
        this.back.setScale(3/2);

        this.bottomBoundary = this.add.rectangle(0, this.cameras.main.height - 50, this.cameras.main.width, 1, 0xFFFFFF);
        this.bottomBoundary.setOrigin(0, 0);
        this.physics.add.existing(this.bottomBoundary, true);

        this.leftBoundary = this.add.rectangle(-10,0,5,this.cameras.main.height,0xFFFFFF);
        this.leftBoundary.setOrigin(0,0);
        this.physics.add.existing(this.leftBoundary,true); // 기존에 있는걸 물리 체계에 추가
        this.physics.add.overlap(this.leftBoundary,this.cactus,function(boundary,cactus){
            cactus.destroy();
        });

        this.dino = this.physics.add.sprite(150, 220, "rundino");
        this.dino.setCollideWorldBounds(true);
        this.dino.body.gravity.y = 2000;
        this.dino.setScale(0.5);
        this.dino.setSize(40,60);

        this.physics.add.collider(this.bottomBoundary, this.dino, (boundary, dino)=> {
            this.jump = true;
        });

        this.anims.create({
            key: "movedino",
            frames: this.anims.generateFrameNumbers("rundino", { start: 0, end: 3}),
            frameRate: 10,
            repeat: -1
        });
        this.anims.create({
            key: "stopdino",
            frames: this.anims.generateFrameNumbers("rundino", { start: 4, end: 4}),
            frameRate: 10,
            repeat: -1
        });

        this.dino.play("movedino");

        this.spaceKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.SPACE);

        this.cactusTypes = ["cactus1", "cactus2", "cactus3", "cactus4", "cactus5"];
        this.cactusShow = [60,120,180];
        this.hardcactusShow = [50,60,120,160];

        this.physics.add.overlap(this.dino, this.cactuses, (dino, cactus)=> {
            let text = this.add.text(200, 40, '다시 플레이 하려면 스페이스바를 누르세요', { fontFamily: '폰트', fontSize: 30, color: '색상' });
            this.dino.play("stopdino");
            this.gameover = true;
        });
        
    }

    update() {
        if(!this.gameover) {
            this.frame++;
        }
        if (this.scoreText) {
            this.scoreText.destroy(); 
        }
        this.scoreText = this.add.text(850, 10, "score : "+ Math.floor(this.frame/10) , { fontFamily: '폰트', fontSize: 20, color: '색상' });
        
        if(this.gameover) {
            this.back.tilePositionX = 0;
            this.cactuses.forEach(cactus => {
                cactus.setVelocityX(0);
            });
            this.score = Math.floor(this.frame/10);
        } else {
            this.back.tilePositionX += 1;
        }
        
        if (Phaser.Input.Keyboard.JustDown(this.spaceKey) && this.jump) {
            if(this.gameover) {
                this.scene.restart();
            } else if(this.jump) {
                this.dino.setVelocityY(-550);
                this.jump = false;
            }
            
        }
        let randomCactusVel = Phaser.Math.RND.pick(this.cactusShow);
        let hardrandomCactusVel = Phaser.Math.RND.pick(this.hardcactusShow);
        if(this.frame<5000){
            if(this.frame%randomCactusVel==0) {
                let randomCactus = Phaser.Math.RND.pick(this.cactusTypes);
                this.cactus = this.physics.add.sprite(1000,210,randomCactus);
                this.cactus.setOrigin(0,0);
                this.cactus.setScale(0.5);
                this.cactus.setSize(40,60);
                if (!this.gameover) {
                    this.cactus.setVelocityX(this.cactusvel);
                }
                this.cactus.body.gravity.y = 1000;
                this.physics.add.collider(this.bottomBoundary, this.cactus);
                this.cactuses.push(this.cactus);
            }
        } else {
            if(this.frame%hardrandomCactusVel==0) {
                let randomCactus = Phaser.Math.RND.pick(this.cactusTypes);
                this.cactus = this.physics.add.sprite(1000,210,randomCactus);
                this.cactus.setOrigin(0,0);
                this.cactus.setScale(0.5);
                this.cactus.setSize(40,60);
                if (!this.gameover) {
                    this.cactus.setVelocityX(this.cactusvel);
                }
                this.cactus.body.gravity.y = 1000;
                this.physics.add.collider(this.bottomBoundary, this.cactus);
                this.cactuses.push(this.cactus);
            }
        }
        

        if(this.frame%10==0 && this.cactusvel>-1000) {
            this.cactusvel--;
        }
        
    }
}