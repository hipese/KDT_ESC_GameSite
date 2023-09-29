class playScene extends Phaser.Scene {
	constructor() {
		super({ key: "playScene" });
	}
	init() {
		this.cursors;
		this.isJump = false; // 초기에 isJump를 false로 설정합니다.
		this.emenys = [];
		this.emenys2 = [];
		this.frame = 0;
		this.emenySpawnTime = 60;
		this.emenySpawnTime2 = 180;
		this.emenyMoveSpeed = 200;
		this.minimumEmenyMove = 100;
		this.killCount = 0;
		this.time = 0;
		this.isattack = false;
		this.playerStatus = "idle";
		this.playerLife = 3;
		this.lifes = [];
		this.score = 0;
		this.attackcount = 0;
		this.maxattackcount = 5;
		this.loginID = loginID;
		this.gameOverSent = false;
	}

	preload() {
		this.load.spritesheet("runsheet", "player_Sprites/Run.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("runsheet2", "player_Sprites/Run2.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("attacksheet1", "player_Sprites/Attack_1.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("attacksheet2", "player_Sprites/Attack_1_left.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("Idlesheet", "player_Sprites/Idle.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("Idlesheet2", "player_Sprites/Idle2.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("deadsheet", "player_Sprites/Dead.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("jumpsheet", "player_Sprites/Jump.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("jumpsheet2", "player_Sprites/Jump2.png", { frameWidth: 128, frameHeight: 128 });

		this.load.spritesheet("emenyRun", "player_Sprites/emenyRun.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("emenyRun2", "player_Sprites/emenyRun2.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("emenydead", "player_Sprites/emenydead.png", { frameWidth: 128, frameHeight: 128 });
		this.load.spritesheet("emenydead2", "player_Sprites/emenyDead2.png", { frameWidth: 128, frameHeight: 128 });


		this.load.image("life", "icons/heart.png");
		this.load.image("attack", "icons/attack.png")
		this.load.image("background2", "BackGround/background2.png");
		this.load.image("wall", "icons/Timber_Wall.png")


		this.load.audio("sword", "player_Sprites/sound2.wav");
		this.load.audio("Maneuver", "player_Sprites/sound1.wav")
		this.load.audio("hunt", "sound/male_hurt7.mp3");
		this.load.audio("dead", "sound/dead.mp3");
		this.load.audio("BGM", "sound/BGM.mp3");
		this.load.audio("alert", "sound/alert.mp3");
	}

	create() {
		this.cursors = this.input.keyboard.createCursorKeys();

		this.background = this.add.tileSprite(0, 0, 2000, 620, "background2");
		this.background.setOrigin(0, 0);
		this.background.setScale(0.8);


		this.sword = this.sound.add("sword");
		this.Maneuver = this.sound.add("Maneuver");
		this.hunt = this.sound.add("hunt");
		this.dead = this.sound.add("dead");
		this.BGM = this.sound.add("BGM");
		this.alert = this.sound.add("alert");

		this.BGM.play();
		this.BGM.setLoop(true);

		this.ground = this.add.rectangle(0, this.cameras.main.height - 80, this.cameras.main.width, 80);
		this.ground.setOrigin(0, 0);
		this.physics.add.existing(this.ground, true);


		this.lifes = []; // 배열 초기화

		for (let i = 0; i < this.playerLife; i++) {
			this.lifes.push(this.add.sprite(this.cameras.main.width / 2 + 60 * i + 600, 50, "life"));
		}

		this.attackOk = []
		this.attackUIs = [];

		for (let i = 0; i < this.maxattackcount; i++) {
			let attackUI = this.createAttackUI(this.cameras.main.width / 2 + 60 * this.attackcount + 250, 50);
			this.attackUIs.push(attackUI);
			this.attackcount += 1;
		}


		this.attackcount = this.maxattackcount;

		// 게임에 사용되는 애니메이션 등독
		this.anims.create({
			key: "run1",
			frames: this.anims.generateFrameNumbers("runsheet", { start: 0, end: 7 }),
			frameRate: 10,
			repeat: 0
		});

		this.anims.create({
			key: "run2",
			frames: this.anims.generateFrameNumbers("runsheet2", { start: 0, end: 7 }),
			frameRate: 10,
			repeat: 0
		});

		this.anims.create({
			key: "emeny",
			frames: this.anims.generateFrameNumbers("emenyRun", { start: 0, end: 7 }),
			frameRate: 10,
			repeat: -1
		});

		this.anims.create({
			key: "emeny2",
			frames: this.anims.generateFrameNumbers("emenyRun2", { start: 0, end: 7 }),
			frameRate: 10,
			repeat: -1
		});


		this.anims.create({
			key: "attack",
			frames: this.anims.generateFrameNumbers("attacksheet1", { start: 0, end: 3 }),
			frameRate: 10,
			repeat: 0 // 1회만 재생하고 멈춥니다.
		});

		this.anims.create({
			key: "attack2",
			frames: this.anims.generateFrameNumbers("attacksheet2", { start: 0, end: 3 }),
			frameRate: 10,
			repeat: 0 // 1회만 재생하고 멈춥니다.
		});

		this.anims.create({
			key: "idle",
			frames: this.anims.generateFrameNumbers("Idlesheet", { start: 0, end: 4 }),
			frameRate: 10,
			repeat: -1
		});

		this.anims.create({
			key: "idle2",
			frames: this.anims.generateFrameNumbers("Idlesheet2", { start: 0, end: 4 }),
			frameRate: 10,
			repeat: -1
		});

		this.anims.create({
			key: "jump",
			frames: this.anims.generateFrameNumbers("jumpsheet", { start: 0, end: 6 }),
			frameRate: 10,
			repeat: 0
		});

		this.anims.create({
			key: "jump2",
			frames: this.anims.generateFrameNumbers("jumpsheet2", { start: 0, end: 6 }),
			frameRate: 10,
			repeat: 0
		});

		this.anims.create({
			key: "dead",
			frames: this.anims.generateFrameNumbers("deadsheet", { start: 0, end: 5 }),
			frameRate: 10,
			repeat: 0 // 1회만 재생하고 멈춥니다.
		});

		this.anims.create({
			key: "edead",
			frames: this.anims.generateFrameNumbers("emenydead", { start: 0, end: 5 }),
			frameRate: 10,
			repeat: 0 // 1회만 재생하고 멈춥니다.
		});

		this.anims.create({
			key: "edead2",
			frames: this.anims.generateFrameNumbers("emenydead2", { start: 0, end: 4 }),
			frameRate: 10,
			repeat: 0 // 1회만 재생하고 멈춥니다.
		});

		// 플레이어 생성
		this.char = this.physics.add.sprite(this.cameras.main.width / 2 - 100, 200, "Idlesheet");
		this.char.setOrigin(0, 0);


		this.char.setCollideWorldBounds(true);
		this.char.setMass(1000);
		this.char.setScale(1);
		this.char.setSize(20, 60);
		this.char.body.gravity.y = 3500;


		// 충돌방지를 위한 코드
		this.physics.add.collider(this.char, this.ground, () => {
			this.isJump = true; // 충돌 발생 시 isJump를 true로 설정합니다.
		});


		// 게임에 사용되는 키 등록
		this.spaceKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.SPACE);
		this.A = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.A);

		this.char.play("idle", true);

		//    적이 끝까지 오면 제거하는 박스를
		let rightBoundary = this.physics.add.sprite(0, -50, "wall");
		rightBoundary.setOrigin(0, 0);
		this.physics.add.existing(rightBoundary, true);


		rightBoundary.setImmovable(true);
		this.physics.add.collider(this.char, rightBoundary, () => { });
		this.physics.add.overlap(rightBoundary, this.emenys, (boundary, emenys) => {
			if (emenys.anims.currentAnim.key == "edead") {
				emenys.destroy();
				return; // 충돌 처리를 하지 않고 함수를 종료
			}

			// 적이 살아있은데 방어벽에 충돌하면 점수감소
			if (this.playerLife > 0) {

				if (this.score >= 0) {
					this.score -= 1;
					if (this.score <= 0) {
						this.playerLife -= 1;
						this.lifes[this.playerLife].destroy();
						this.score = 0;
					}
				}

				this.scoreText.setText("Score: " + this.score);
			}
			emenys.destroy();
		});

		this.physics.add.overlap(rightBoundary, this.emenys2, (boundary, emenys2) => {
			if (emenys2.anims.currentAnim.key == "edead2") {
				emenys2.destroy();
				return; // 충돌 처리를 하지 않고 함수를 종료
			}

			// 적이 살아있은데 방어벽에 충돌하면 점수 감소
			if (this.playerLife > 0) {
				if (this.score >= 0) {
					this.score -= 2;
					if (this.score <= 0) {
						this.playerLife -= 1;
						this.lifes[this.playerLife].destroy();
						this.score = 0;
					}
				}
				this.scoreText.setText("Score: " + this.score);
			}
			emenys2.destroy();
		});



		// 적과의 충돌을 제어하는 함수
		this.physics.add.overlap(this.char, this.emenys, (boundary, emenys) => {

			if (this.Life)

				// 플레이어가 사망했을경우 처리를 하지않고 함수 종료
				if (this.playerAnimationState == "dead") {
					return;
				}

			if (emenys.anims.currentAnim.key == "edead") {
				emenys.setCollideWorldBounds(false); // 충돌 비활성화
				return; // 충돌 처리를 하지 않고 함수를 종료
			}

			// 공격상태가 아닐때 적과 충돌하면 목슴 1개 제거
			if (!this.isattack) {
				this.playerLife -= 1;
				if (this.playerLife > 0) {
					this.lifes[this.playerLife].destroy();
					this.hunt.play();
					emenys.destroy();
				} else if(this.playerLife === 0){
					this.lifes[this.playerLife].destroy();
					const postData = {
						loginID: this.loginID,
						score: this.score
					};

					if (this.loginID != "") { // 로그인을 했을 때만 점수를 저장한다.
						$.ajax({
							url: "/RoadOfSamuraiGameOver.game",
							type: "POST",
							data: postData,
						});
					}else {
						// 로그인을 하지 않았다면 로그인을 할 수 있는 모달창을 띄운다.
						const modal = document.getElementById('login-modal');
						modal.style.display = "block";
						body.style.overflow = "hidden";
						$(".scroll").val(scrollY);
					}
				}

			} else if (this.isattack) {
				this.killCount++;
				this.score += 1;
				this.dead.play();
				emenys.play("edead", true);
				emenys.setScale(-1, 1);
				emenys.setVelocityX(0);
				setTimeout(() => {
					emenys.destroy();
				}, 2000);
			}

			this.scoreText.setText("Score: " + this.score);
			this.killCountText.setText("Kill Count: " + this.killCount);
		});


		// 2번째 적과의 충돌을 제어하는 함수
		this.physics.add.overlap(this.char, this.emenys2, (boundary, emenys2) => {



			// 플레이어가 사망했을경우 처리를 하지않고 함수 종료
			if (this.playerAnimationState == "dead") {
				return;
			}

			if (emenys2.anims.currentAnim.key == "edead2") {
				emenys2.setCollideWorldBounds(false); // 충돌 비활성화
				return; // 충돌 처리를 하지 않고 함수를 종료
			}

			// 공격상태가 아닐때 적과 충돌하면 목슴 1개 제거
			if (!this.isattack) {
				this.playerLife -= 1;
				if (this.playerLife > 0) {
					this.lifes[this.playerLife].destroy();
					this.hunt.play();
					emenys2.destroy();
				} else if(this.playerLife === 0) {
					this.lifes[this.playerLife].destroy();
					const postData = {
						loginID: this.loginID,
						score: this.score
					};
					if (this.loginID != "") { // 로그인을 했을 때만 점수를 저장한다.
						$.ajax({
							url: "/RoadOfSamuraiGameOver.game",
							type: "POST",
							data: postData,
						});
					}else {
						// 로그인을 하지 않았다면 로그인을 할 수 있는 모달창을 띄운다.
						const modal = document.getElementById('login-modal');
						modal.style.display = "block";
						body.style.overflow = "hidden";
						$(".scroll").val(scrollY);
					}
				}

			} else if (this.isattack) {
				this.killCount++;
				this.score += 2;
				this.dead.play();
				emenys2.play("edead2", true);
				emenys2.setScale(-1, 1);
				emenys2.setVelocityX(0);
				setTimeout(() => {
					emenys2.destroy();
				}, 2000);
			}

			this.scoreText.setText("Score: " + this.score);
			this.killCountText.setText("Kill Count: " + this.killCount);
		});



		this.playerAnimationState = "idle";


		// 애니메이션을 실행후 상태를 idle로 바꾸는 함수
		this.char.on("animationcomplete", (animation) => {


			if (animation.key == "jump" && this.playerAnimationState == "jump") {
				// 점프 애니메이션이 완료되면 상태를 "idle"로 변경하고 "idle" 애니메이션 재생
				this.playerAnimationState = "idle";
				this.char.play("idle", true);
			} else if (animation.key == "jump2" && this.playerAnimationState == "jump2") {
				this.playerAnimationState = "idle2";
				this.char.play("idle2", true);
			} else if (animation.key == "attack" && this.playerAnimationState == "attack") {
				// "attack" 애니메이션이 완료되면 상태를 "idle"로 변경하고 "idle" 애니메이션 재생
				this.playerAnimationState = "idle";
				this.char.play("idle", true);
				this.char.setSize(20, 60); // 사이즈 변경
				this.isattack = false;
			} else if (animation.key == "run1" && this.playerAnimationState == "run1") {
				this.char.setVelocityX(0);
				this.playerAnimationState = "idle";
				this.char.play("idle", true);
			} else if (animation.key == "run2" && this.playerAnimationState == "run2") {
				this.char.setVelocityX(0);
				this.playerAnimationState = "idle2";
				this.char.play("idle2", true);

			} else if (animation.key == "attack2" && this.playerAnimationState == "attack2") {
				this.char.setVelocityX(0);
				this.playerAnimationState = "idle2";
				this.char.setSize(20, 60);
				this.char.play("idle2", true);
				this.isattack = false;
			}
		});
		this.scoreText = this.add.text(200, 50, "Score: " + this.score, { fontFamily: "DungGeunMo", fontSize: "40px", fill: "#FF0000" }).setOrigin(0.5);
		this.killCountText = this.add.text(500, 50, "Kill Count: " + this.killCount, { fontFamily: "DungGeunMo", fontSize: "40px", fill: "#FF0000" }).setOrigin(0.5);
		this.timeText = this.add.text(800, 50, "생존시간: " + this.time, { fontFamily: "DungGeunMo", fontSize: "40px", fill: "#FF0000" }).setOrigin(0.5).setPadding(10, 10, 10, 10);


	}

	update() {
		this.frame++;
		this.background.tilePositionX += 5;

		this.cameras.main.setViewport(0, 0, this.cameras.main.width, this.cameras.main.height);
		// 안죽었을대 작동{}
		if (this.playerAnimationState !== "dead") {

			if (Phaser.Input.Keyboard.JustDown(this.spaceKey) && this.isJump) {
				if (this.playerAnimationState === "idle2") {
					this.playerAnimationState = "jump2"; // "idle2" 상태일 때 "jump2" 애니메이션 상태 설정
					this.char.setVelocityY(-1250);
					this.char.play("jump2", true); // "jump2" 애니메이션 재생
				} else {
					this.playerAnimationState = "jump"; // "idle" 상태에서는 "jump" 애니메이션 상태 설정
					this.char.setVelocityY(-1250);
					this.char.play("jump", true);
				}
				this.isJump = false;
			}



			// A애니메이션 실행하는 동안에는 뱡항키로 조작을 막음
			if (this.playerAnimationState !== "attack" && this.playerAnimationState !== "attack2") {
				if (this.cursors.right.isDown) {
					this.char.setVelocityX(500);
					this.playerAnimationState = "run1"; // 달리기 애니메이션 상태 설정
					this.char.play("run1", true);


				} else if (this.cursors.left.isDown) {
					this.char.setVelocityX(-500);
					this.playerAnimationState = "run2"; // 반대 방향 달리기 애니메이션 상태 설정
					this.char.play("run2", true);
				} else if (Phaser.Input.Keyboard.JustUp(this.cursors.right) || Phaser.Input.Keyboard.JustUp(this.cursors.left)) {


					if (this.playerAnimationState == "run1") {

						this.char.setVelocityX(0);
						this.playerAnimationState = "idle"; // 정지 애니메이션 상태 설정
						this.char.play("idle", true);
					} else if (this.playerAnimationState == "run2") {
						this.char.setVelocityX(0);
						this.playerAnimationState = "idle2"; // 정지 애니메이션 상태 설정
						this.char.play("idle2", true);
					}

				}

				if (Phaser.Input.Keyboard.JustDown(this.A) && this.attackcount > 0) {

					this.attackcount -= 1;
					console.log("공격 가능 횟수" + this.attackcount);

					// 공격 가능횟수를 확인하여 제거

					let attackUI = this.attackUIs.pop();
					if (attackUI) {
						attackUI.destroy();
					}

					this.char.setVelocityX(0);
					this.sword.play();
					this.Maneuver.play();
					this.isattack = true;

					// "attack2" 애니메이션을 실행할 조건 추가 (playerAnimationState가 "idle2" 또는 "run2"일 때)
					if (this.playerAnimationState == "idle2" || this.playerAnimationState == "run2" || this.playerAnimationState == "jump2") {
						this.char.setSize(80, 60);
						this.playerAnimationState = "attack2";
						this.char.play("attack2", true);
					} else {
						this.char.setSize(80, 60);
						this.playerAnimationState = "attack";
						this.char.play("attack", true);

					}
				}
			}




			// 적을 생성하는 코드
			if (this.frame % this.emenySpawnTime == 0) {
				let emeny = this.physics.add.sprite(2000, (Math.floor(Math.random() * 200) + 200), "emenyRun");

				// 설정 추가
				let lastIndex = this.emenys.length - 1;
				emeny.setVelocityX(-1 * (Math.floor(Math.random() * this.emenyMoveSpeed) + this.minimumEmenyMove));
				emeny.setSize(40, 80);


				// 적(emeny)의 애니메이션 설정
				emeny.play("emeny", true); // "emeny" 애니메이션을 반복 재생합니다.

				this.emenys.push(emeny);
			}


			// 2번째 적을 생성하는 코드
			if (this.frame % this.emenySpawnTime2 == 0) {
				let emeny2 = this.physics.add.sprite(2000, (Math.floor(Math.random() * 200) + 200), "emenyRun");

				// 설정 추가
				let lastIndex = this.emenys.length - 1;
				emeny2.setVelocityX(-1 * (Math.floor(Math.random() * this.emenyMoveSpeed) + this.minimumEmenyMove + 200));
				emeny2.setSize(60, 80);


				// 적(emeny)의 애니메이션 설정
				emeny2.play("emeny2", true); // "emeny" 애니메이션을 반복 재생합니다.

				this.emenys2.push(emeny2);
			}

			// 생존시간 확인(초)
			if (this.frame % 60 == 0) {
				this.time++;

				console.log("공격 가능 횟수" + this.attackcount);

				//공격 횟수가 비어있으면 생성
				if (this.attackcount < 5) {
					let attackUI = this.createAttackUI.call(this, this.cameras.main.width / 2 + 60 * this.attackcount + 250, 50);
					this.attackUIs.push(attackUI);
					this.attackcount += 1;
				}

				this.timeText.setText("생존시간: " + this.time);

				// 일정 시간이 지날수록 난이도 상승
				if (this.time % 30 == 0) {
					if (this.emenySpawnTime > 15) {
						this.emenySpawnTime -= 10;
					}


					this.emenyMoveSpeed += 50;
					this.minimumEmenyMove + 50;
					this.alert.play();
					this.warningText = this.add.text(800, 200, "적들의 공격이 더욱 거세집니다.", { fontFamily: "DungGeunMo", fontSize: "50px", fill: "#FFFFFF" }).setOrigin(0.5).setPadding(10, 10, 10, 10);

					setTimeout(() => {
						this.warningText.destroy();
					}, 2000);

				}


			}

		}


		// 라이프가 0이되면 사망
		if (this.playerLife <= 0 && this.playerAnimationState !== "dead") {
			this.playerAnimationState = "dead"; // 상태를 "dead"로 변경
			this.char.play("dead", true); // "dead" 애니메이션 재생
			this.dead.play();
			this.char.setVelocityX(0);

			// 5초 후에 캐릭터 제거
			setTimeout(() => {
				// Ajax 요청을 보냅니다.
				this.BGM.stop();
				this.char.destroy(); // 캐릭터 제거
				this.scene.start("GameOverScene", { score1: this.killCount, score2: this.time - 3, totalscore: this.score })
			}, 3000); // 5초 (5000 밀리초) 후에 캐릭터 제거
		}


	}

	// UI 요소를 그릴 때 사용하는 함수
	createAttackUI(x, y) {
		let attackUI = this.add.sprite(x, y, "attack");
		return attackUI;
	}

}