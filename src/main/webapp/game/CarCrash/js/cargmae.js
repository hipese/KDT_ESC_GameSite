class CarScene extends Phaser.Scene {
    constructor() {
        super({ key: "CarScene" });
        this.speedMultiplier = 1;
    }

    init() {
        this.frame = 0;
        this.boxes = [];
        this.score = 0;
        this.coins = [];
		this.gameoverCondition = false;
        this.loginID = loginID;
    }

    preload() {
        this.load.image("car", "./image/car.png");
        this.load.image("bus", "./image/bus.png");
        this.load.image("truck", "./image/truck.png");
        this.load.image("sports_car", "./image/sports-car.png");
        this.load.image("police_car", "./image/police_car.png");
        this.load.image("background", "./image/background-1.png");
        this.load.audio("accidentSound", "./sound/자동차 충돌.wav");
        this.load.audio("bgm", "./sound/bgm2.mp3");
        this.load.image("coin", "./image/coin.png");
        this.load.audio("coinsound", "./sound/코인획득3.wav");
        this.load.audio("level", "./sound/level.mp3");
    }

    create() {
        this.back = this.add.tileSprite(0, 0, 840, 650, "background");
        this.back.setOrigin(0, 0);
        this.bgm = this.sound.add("bgm");
        this.accidentSound = this.sound.add("accidentSound");
        this.cursors = this.input.keyboard.createCursorKeys();
        this.coinsound = this.sound.add("coinsound");
        this.level = this.sound.add("level");

        this.time.addEvent({
            delay: 1000, // 밀리초 단위로 딜레이 설정 (예: 1000밀리초 = 1초)
            callback: () => {
                this.bgm.play();
                this.bgm.setLoop(true);
            },
            callbackScope: this,
        });
        this.player = this.physics.add.sprite(450, 580, "car");
        this.player.setCollideWorldBounds(true);
        this.player.setMass(500);
        this.player.setScale(32 / 50);
        this.player.setSize(20 / (32 / 56), 20 / (32 / 100));

        let bottomBoundary = this.add.rectangle(0, this.cameras.main.height + 10, this.cameras.main.width, 5, 0xFFFFFF);
        bottomBoundary.setOrigin(0, 0);
        this.physics.add.existing(bottomBoundary, true);

        this.physics.add.collider(this.player, bottomBoundary, () => {
        });

        let rightBoundary = this.add.rectangle(this.cameras.main.width - 140, 0, 5, this.cameras.main.height);
        rightBoundary.setOrigin(0, 0);
        this.physics.add.existing(rightBoundary, true);

        this.physics.add.collider(this.player, rightBoundary, () => {
        });

        let leftBoundary = this.add.rectangle(this.cameras.main.width - 700, 0, 5, this.cameras.main.height);
        leftBoundary.setOrigin(0, 0);
        this.physics.add.existing(leftBoundary, true);

        this.physics.add.collider(this.player, leftBoundary, () => {
        });

        this.physics.add.overlap(bottomBoundary, this.boxes, function (boundnary, box) {
            box.destroy();
        });

        this.physics.add.overlap(this.player, this.coins, (player, coin) => {
            this.coinsound.play();
            coin.destroy();
            this.score++;
            this.text.setText(`Score: ${this.score}`);
        });

        this.physics.add.overlap(this.player, this.boxes, (boundary, box) => {
            
            
        });
        
        this.physics.add.overlap(this.player, this.boxes, (boundary, box) => {
				box.destroy();
				this.accidentSound.play();
            	this.bgm.stop();
			    this.gameoverCondition = true;
			    const postData = {
			        loginID: this.loginID,
			        score: this.score
			    };
				
				if (this.loginID != "") { // 로그인을 했을 때만 점수를 저장한다.
					$.ajax({
						url: "/CarCrashGameOver.game",
						type: "POST",
						data: postData,
					});
					this.scene.start("GameOverScene");
				}else {
					this.scene.start("GameOverScene");
					const modal = document.getElementById('login-modal');
					modal.style.display = "block";
					body.style.overflow = "hidden";
					$(".scroll").val(scrollY);
				}
	
			},null,this,true);

        this.time.addEvent({
            delay: 10000,
            callback: () => {
                this.speedMultiplier += 0.1;
                this.level.play();
                this.warningText = this.add.text(this.cameras.main.width / 2,
                    this.cameras.main.height / 2 - 200, "Speed UP!", { fontFamily: 'PressStart2P', fontSize: "30px", fill: "#FF0000" }).setOrigin(0.5).setPadding(10, 10, 10, 10);
                setTimeout(() => {
                    this.warningText.destroy();
                }, 2000);

            },
            loop: true,
        });

        this.text = this.add.text(16, 16, 'Score: 0', { fontFamily: 'PressStart2P', fontSize: '16px', backgroundColor: "#000000", fill: '#fff' });

    }

    update() {
		
		if (!this.gameoverCondition) {
		
	        this.back.tilePositionY -= 7;
	
	        this.frame++;
	        if (this.frame % 30 == 0) {
	
	            let roadType = Phaser.Math.Between(1, 4);
	            let boxType = Phaser.Math.Between(1, 4);
	
	            let box;
	            switch (boxType) {
	                case 1:
	                    if (roadType == 1) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(150, 285), 0, "bus");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(400 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 2) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(150, 285), 0, "truck");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(500 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 3) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(150, 285), 0, "sports_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(700 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 4) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(150, 285), 0, "police_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(900 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    break;
	                case 2:
	                    if (roadType == 1) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(285, 400), 0, "bus");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(400 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 2) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(285, 400), 0, "truck");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(500 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 3) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(285, 400), 0, "sports_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(700 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 4) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(285, 400), 0, "police_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(900 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    break;
	                case 3:
	                    if (roadType == 1) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(400, 515), 0, "bus");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(400 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 2) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(400, 515), 0, "truck");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(500 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 3) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(400, 515), 0, "sports_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(700 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 4) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(400, 515), 0, "police_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(900 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    break;
	                case 4:
	                    if (roadType == 1) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(515, 630), 0, "bus");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(400 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 2) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(500, 630), 0, "truck");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(500 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 3) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(500, 630), 0, "sports_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(700 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    else if (roadType == 4) {
	                        box = this.physics.add.sprite(Phaser.Math.Between(500, 630), 0, "police_car");
	                        box.setOrigin(0, 0);
	                        box.setVelocityY(900 * this.speedMultiplier);
	                        this.boxes.push(box);
	                    }
	                    break;
	            }
	            let coinType = Phaser.Math.Between(1, 4);
	            let coin;
	            switch (coinType) {
	                case 1:
	                    coin = this.physics.add.sprite(Phaser.Math.Between(150, 285), 0, "coin");
	                    coin.setOrigin(0, 0);
	                    coin.setVelocityY(300); // Adjust the velocity as needed
	                    this.coins.push(coin);
	                    break;
	                case 2:
	                    coin = this.physics.add.sprite(Phaser.Math.Between(285, 400), 0, "coin");
	                    coin.setOrigin(0, 0);
	                    coin.setVelocityY(300); // Adjust the velocity as needed
	                    this.coins.push(coin);
	                    break;
	                case 3:
	                    coin = this.physics.add.sprite(Phaser.Math.Between(400, 515), 0, "coin");
	                    coin.setOrigin(0, 0);
	                    coin.setVelocityY(300); // Adjust the velocity as needed
	                    this.coins.push(coin);
	                    break;
	                case 4:
	                    coin = this.physics.add.sprite(Phaser.Math.Between(515, 630), 0, "coin");
	                    coin.setOrigin(0, 0);
	                    coin.setVelocityY(300); // Adjust the velocity as needed
	                    this.coins.push(coin);
	                    break;
	            }
	
	        }
	
	        // if (this.frame % 60 == 0) {
	
	        //     this.count++; // 경과 시간을 1초 증가시킵니다.
	        //     this.text.setText(`Time: ${this.count}`); // 시간을 화면에 표시합니다.
	
	        // }
	
	        this.player.setVelocityX(0);
	        this.player.setVelocityY(0);
	
	        if (this.cursors.left.isDown) {
	            this.player.setVelocityX(-300);
	        }
	
	        if (this.cursors.right.isDown) {
	            this.player.setVelocityX(300);
	        }
	        
	        
        
        }
    }

}
