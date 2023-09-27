class BounceScene extends Phaser.Scene {

	constructor() {
		super({ key: "BounceScene" });

	}
	init() {
		this.frame = 0;
		this.bboxes = [];
		this.mboxes = [];
		this.score=0;
		this.scoreboard = this.registry.get('score');
		this.gameover = false;
		this.urlParams = new URLSearchParams(window.location.search);
        this.loginID = this.urlParams.get("loginID");
	}

	preload() {
		this.cursors = this.input.keyboard.createCursorKeys(); // 방향키를 통제할 수 있음
		this.load.spritesheet("runSheet", "image/char.png", { frameWidth: 60, frameHeight: 60 });
		this.load.image("bg", "image/bounce.jpg")
		this.load.image("bone", "image/bone.png")
		this.load.image("mush", "image/mush.png")

	}
	create() {
		this.back = this.add.tileSprite(0, -145, 1000, 700, "bg");
		this.back.setOrigin(0, 0);

		let bottomBoundary = this.add.rectangle(0, this.cameras.main.height - 1, this.cameras.main.width, 5, 0xFFFFFF); // 사각형 만들기 (x좌표 , y좌표,넓이,높이)
		bottomBoundary.setOrigin(0, 0);
		this.physics.add.existing(bottomBoundary, true);




		this.physics.add.collider(bottomBoundary, this.bboxes, function(boundary, box) {
			box.destroy();
		});
		this.physics.add.collider(bottomBoundary, this.mboxes, function(boundary, box) {
			box.destroy();
		});

		this.anims.create({
			key: "run",
			frames: this.anims.generateFrameNumbers("runSheet", { start: 0, end: 7 }),
			frameRate: 20, //숫자가 높을수록 속도가 빠르다
			repeat: -1 // 몇번 반복할지 -1은 무한
		});
		this.anims.create({
			key: "left",
			frames: this.anims.generateFrameNumbers("runSheet", { start: 8, end: 15 }),
			frameRate: 20, //숫자가 높을수록 속도가 빠르다
			repeat: -1 // 몇번 반복할지 -1은 무한
		});
		this.anims.create({
			key: "right",
			frames: this.anims.generateFrameNumbers("runSheet", { start: 16, end: 23 }),
			frameRate: 20, //숫자가 높을수록 속도가 빠르다
			repeat: -1 // 몇번 반복할지 -1은 무한
		});
		this.player = this.physics.add.sprite(400, this.cameras.main.height - 100, "runSheet");
		this.player.setOrigin(0, 0);
		this.player.setScale(1.5);
		this.player.setSize((20), (60));
		this.player.setCollideWorldBounds(true);
		this.player.play("run");
		this.score = 0;
		this.textSecond = this.add.text(400, 50, '목표 : ' + this.score + " / 20", { font: "20px", fill: "#000000" }).setInteractive().setPadding(15);
		this.textScore = this.add.text(700, 50, '점수 : ' + this.scoreboard, { font: "20px", fill: "#000000" }).setInteractive().setPadding(15);

		this.physics.add.overlap(this.player,this.bboxes,(player,bone)=>{
			this.registry.set('score', this.scoreboard );
			this.gameover = true;
			bone.destroy();
			const postData = {
				loginID: this.loginID,
				score: this.scoreboard
			};
			if (this.loginID != "") { // 로그인을 했을 때만 점수를 저장한다.
				$.ajax({
					url: "/RaiseDragonGameOver.game",
					type: "POST",
					data: postData
				});
				this.scene.start("GameOverScene");
			}else {
				// 로그인을 하지 않았다면 로그인을 할 수 있는 모달창을 띄운다.
				const modal = document.getElementById('login-modal');
				modal.style.display = "block";
				//body.style.overflow = "hidden";
				$(".scroll").val(scrollY);
				this.scene.start("GameOverScene");
			}
        });
	}
	update() {
		if(!this.gameover) {
            this.frame++;
        }
        if (this.gameover) {
            this.bboxes.forEach(bone => {
                bone.destroy();
            });  
        }

		this.bnum = Phaser.Math.Between(1, 7)
		this.mnum = Phaser.Math.Between(1, 3)
		if (this.frame % 40 == 0) {
			for (let i = 0; i < this.bnum; i++) {
				this.x = Phaser.Math.Between(10, 1000)
				this.bdown = this.physics.add.sprite(this.x, 0, "bone");
				// boxes[i].setImmovable(); //움직이게 못하게 만듦. 지형으로 설정 가능.
				this.bdown.setScale(0.3);
				this.bdown.setSize((60), (60));
				this.bdown.setVelocityY(Phaser.Math.Between(200, 300));
				// boxes[i].setCollideWorldBounds(true);
				// boxes[i].setBounce(1);
				this.bboxes.push(this.bdown);
			}
		};
		if (this.frame % 60 == 0) {
			for (let i = 0; i < this.mnum; i++) {
				this.x = Phaser.Math.Between(10, 1000)
				this.mdown = this.physics.add.sprite(this.x, 0, "mush");
				// boxes[i].setImmovable(); //움직이게 못하게 만듦. 지형으로 설정 가능.
				this.mdown.setScale(0.1);
				this.mdown.setSize((150), (150));
				this.mdown.setVelocityY(Phaser.Math.Between(200, 300));
				// boxes[i].setCollideWorldBounds(true);
				// boxes[i].setBounce(1);
				this.mboxes.push(this.mdown);
			}
		};

		this.player.setVelocityX(0);
		if (this.cursors.left.isDown) {
			this.player.setVelocityX(-500);
			this.player.anims.play('left', true);
		}

		else if (this.cursors.right.isDown) {
			this.player.setVelocityX(500);
			this.player.anims.play('right', true);
		}
		else if (this.cursors.down.isUp) {
			this.player.setVelocityX(0);
			this.player.anims.play('run', true);
		}
		this.physics.add.overlap(this.player, this.mboxes, (player, mush) => {
			this.textSecond.setText('목표 : ' + ++this.score + " / 20");
			this.textScore.setText('점수 : ' + (this.scoreboard += 40));

			mush.destroy();

		})
		 if(this.score==20){
            this.registry.set('score', this.scoreboard );
            this.registry.set('stage', 2);
            this.scene.start("MainScene");
        }

	}
}