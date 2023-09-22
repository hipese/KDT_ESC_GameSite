class GameScene extends Phaser.Scene {
    constructor() {
        super({ key: "GameScene" });
    }

    init() {
        this.isGameOver = false;
        this.angleIncrement = 0;
        this.level = 1; // 현재 레벨
        this.enemySpawnTimer = 0; // 적 생성 타이머
        this.score = 0;
        this.enemiesKilled = 0; // 처치한 적 수
        this.totalEnemiesKilled = 0; // 총 처치한 적 수
        this.enemiesKilledToLevelUp = 10; // 레벨 업을 위한 처치 적 수
        this.playerCollisionCount = 0; // 플레이어와 적의 충돌 횟수
        this.playerHealth = 5; // 게임 오버 조건: 충돌 횟수가 이 값 이상이면 게임 오버
    }

    preload() {
        this.load.image("background", "asset/img/field.png");
        this.load.spritesheet("skullSheet", "asset/img/skullsprite.png", { frameWidth: 64, frameHeight: 64 });
        this.load.image("skull", "asset/img/skull.png");
        this.load.image("boneX", "asset/img/boneX.png");
        this.load.image("boneY", "asset/img/boneY.png");
        this.load.image("enemy1", "asset/img/devil1.png");
        this.load.image("enemy2", "asset/img/devil2.png");
        this.load.image("enemy3", "asset/img/devil3.png");
        this.load.image("enemy4", "asset/img/devil4.png");
        this.load.image("enemy5", "asset/img/devil5.png");
        this.load.image("skullheart", "asset/img/skeleton_heart.png");
    }

    create() {
        let background = this.add.tileSprite(0, 0, 3840, 2560, "background");
        background.setOrigin(0, 0);
        this.physics.world.setBounds(0, 0, background.width, background.height);
        //this.cursors = this.input.keyboard.createCursorKeys();
        this.player = this.physics.add.sprite(1920, 1280, "player");

        this.player.setSize(25, 50);
        this.player.setCollideWorldBounds(true);
        this.player.setMass(300);
        this.anims.remove("upward");
        this.anims.remove("leftward");
        this.anims.remove("downward");
        this.anims.remove("rightward");
        this.anims.create({
            key: "upward",
            frames: this.anims.generateFrameNumbers("skullSheet", { start: 0, end: 8 }),
            frameRate: 20,
            repeat: -1,
        });

        this.anims.create({
            key: "leftward",
            frames: this.anims.generateFrameNumbers("skullSheet", { start: 9, end: 17 }),
            frameRate: 20,
            repeat: -1,
        });

        this.anims.create({
            key: "downward",
            frames: this.anims.generateFrameNumbers("skullSheet", { start: 18, end: 26 }),
            frameRate: 20,
            repeat: -1,
        });

        this.anims.create({
            key: "rightward",
            frames: this.anims.generateFrameNumbers("skullSheet", { start: 27, end: 35 }),
            frameRate: 20,
            repeat: -1,
        });

        this.cursors = this.input.keyboard.createCursorKeys();

        this.player.setCollideWorldBounds(true);
        this.player.setMass(300);

        this.player.play("downward", true);
        this.player.body.setOffset(20, 15);
        this.cameras.main.startFollow(this.player);
        this.cameras.main.setBounds(0, 0, background.width, background.height);

        this.circularObjects = this.physics.add.group();

        const numObjects = 6;
        const radius = 150;
        this.angleIncrement = (Phaser.Math.PI2) / numObjects;

        for (let i = 0; i < numObjects; i++) {
            const angle = i * this.angleIncrement;
            const x = this.player.x + radius * Math.cos(angle);
            const y = this.player.y + radius * Math.sin(angle);
            const object = this.physics.add.sprite(x, y, "skull");
            object.setOrigin(0.5);
            this.circularObjects.add(object);
        }

        // 투사체 그룹 생성
        this.shoots = this.physics.add.group();

        this.enemies = this.physics.add.group();

        this.physics.add.collider(this.shoots, this.enemies, this.shootObjectHitEnemy, null, this);

        this.physics.add.collider(this.player, this.enemies, this.playerHitByEnemy, null, this);


        this.scoreText = this.add.text(16, 32, 'Score : 0', { fontSize: '24px', fill: '#fff' });
        this.scoreText.setScrollFactor(0); // 카메라에 바인딩되지 않도록 설정
        this.levelText = this.add.text(16, 62, 'Level : 0', { fontSize: '24px', fill: '#fff' })
        this.levelText.setScrollFactor(0);
        this.killedText = this.add.text(16, 92, 'Kill : 0', { fontSize: '24px', fill: '#fff' })
        this.killedText.setScrollFactor(0);

        // 체력 이미지 스프라이트 배열 생성
        this.healthSprites = [];

        // 체력 이미지를 스프라이트로 추가
        this.updateHealthSprites();
    }

    update(time, delta) {
        this.player.setVelocity(0);

        if (this.isGameOver) {
            return;
        }


        const isDiagonalMovement =
            (this.cursors.up.isDown && this.cursors.left.isDown) ||
            (this.cursors.up.isDown && this.cursors.right.isDown) ||
            (this.cursors.down.isDown && this.cursors.left.isDown) ||
            (this.cursors.down.isDown && this.cursors.right.isDown);

        if (this.cursors.left.isDown) {
            this.player.play("leftward", true);
            if (this.cursors.up.isDown) {
                this.player.setVelocityX(-212);
                this.player.setVelocityY(-212);
            } else if (this.cursors.down.isDown) {
                this.player.setVelocityX(-212);
                this.player.setVelocityY(212);
            } else {
                this.player.setVelocityX(-300);
            }
        } else if (this.cursors.right.isDown) {
            this.player.play("rightward", true);
            if (this.cursors.up.isDown) {
                this.player.setVelocityX(212);
                this.player.setVelocityY(-212);
            } else if (this.cursors.down.isDown) {
                this.player.setVelocityX(212);
                this.player.setVelocityY(212);
            } else {
                this.player.setVelocityX(300);
            }
        } else if (this.cursors.up.isDown) {
            this.player.setVelocityY(-300);
            this.player.play("upward", true);
        } else if (this.cursors.down.isDown) {
            this.player.setVelocityY(300);
            this.player.play("downward", true);
        } else {
            if (this.player.anims.currentAnim.key === "leftward") {
                this.player.setFrame(9);
            } else if (this.player.anims.currentAnim.key === "rightward") {
                this.player.setFrame(27);
            } else if (this.player.anims.currentAnim.key === "upward") {
                this.player.setFrame(0);
            } else if (this.player.anims.currentAnim.key === "downward") {
                this.player.setFrame(18);
            }
        }

        const radius = 100;
        const angularSpeed = - 0.002;
        const centerX = this.player.x;
        const centerY = this.player.y;

        this.circularObjects.getChildren().forEach((object, index) => {
            const initialAngle = (index / this.circularObjects.getChildren().length) * Phaser.Math.PI2;
            const elapsedMilliseconds = this.time.now;
            const angle = initialAngle + elapsedMilliseconds * angularSpeed;
            const x = centerX + radius * Math.cos(angle);
            const y = centerY + radius * Math.sin(angle);
            object.setPosition(x, y);
        });

        this.physics.world.overlap(this.circularObjects, this.enemies, this.circularObjectHitEnemy, null, this);

        // 스페이스 바를 눌렀을 때만 발사 로직을 처리합니다.
        const spaceKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.SPACE);
        if (Phaser.Input.Keyboard.JustDown(spaceKey) && !isDiagonalMovement) {
            this.handleShooting();
        }

        // 타이머 초기화
        this.enemySpawnTimer += delta;
        if (this.enemySpawnTimer >= this.getSpawnIntervalForLevel(this.level)) {
            // 적 생성
            for (let i = 0; i < this.level; i++) {
                this.spawnEnemy();
            }
            // 타이머 초기화
            this.enemySpawnTimer = 0;
        }

        this.enemies.getChildren().forEach((enemy) => {
            if (enemy.x < this.player.x) {
                enemy.setScale(-1, 1);
                enemy.body.setOffset(90, 10);
            } else {
                enemy.setScale(1, 1);
                enemy.body.setOffset(10, 10);
            }

            // 플레이어의 현재 위치
            const playerX = this.player.x;
            const playerY = this.player.y;

            // 적의 현재 위치
            const enemyX = enemy.x;
            const enemyY = enemy.y;

            // 플레이어를 향한 벡터 계산
            const directionX = playerX - enemyX;
            const directionY = playerY - enemyY;

            // 벡터를 단위 벡터로 정규화
            const length = Math.sqrt(directionX * directionX + directionY * directionY);
            const normalizedDirectionX = directionX / length;
            const normalizedDirectionY = directionY / length;

            // 적의 이동 속도 설정
            const enemySpeed = enemy.speed; // 적의 이동 속도 조절
            const enemyVelocityX = normalizedDirectionX * enemySpeed;
            const enemyVelocityY = normalizedDirectionY * enemySpeed;

            // 적을 이동시킴
            enemy.setVelocity(enemyVelocityX, enemyVelocityY);

        });

        // 레벨 업을 확인하고 처리
        if (this.enemiesKilled >= this.enemiesKilledToLevelUp) {
            this.levelUp();
        }

        this.scoreText.setText('Score : ' + this.score);
        this.levelText.setText('Level : ' + this.level);
        this.killedText.setText('Kill : ' + this.totalEnemiesKilled);


    }


    updateHealthSprites() {
        // 기존의 체력 이미지 스프라이트 제거
        this.healthSprites.forEach((heart) => {
            heart.destroy();
        });
    
        // 새로운 체력 이미지 스프라이트 배열 생성
        const heartSpacing = 32; // 하트 이미지 사이의 간격
        const heartX = 16; // 첫 번째 하트 이미지의 X 좌표
        const heartY = 16; // 하트 이미지의 Y 좌표
    
        for (let i = 0; i < this.playerHealth-this.playerCollisionCount; i++) {
            const heart = this.add.sprite(heartX + i * heartSpacing, heartY, "skullheart");
            heart.setScrollFactor(0); // 카메라에 바인딩되지 않도록 설정
            this.healthSprites.push(heart);
        }
    }

    levelUp() {
        this.level += 1;
        this.enemiesKilled = 0;
        this.enemiesKilledToLevelUp += 10; // 다음 레벨 업을 위해 필요한 처치 적 수 증가
    }

    handleShooting() {
        // 플레이어의 현재 위치를 기반으로 발사 각도 업데이트
        const playerX = this.player.x;
        const playerY = this.player.y;

        let shootAngle = 0;

        if (this.player.anims.currentAnim.key === "upward") {
            shootAngle = Phaser.Math.PI2 * 3 / 4;
        }
        if (this.player.anims.currentAnim.key === "leftward") {
            shootAngle = Phaser.Math.PI2 * 1 / 2;
        }
        if (this.player.anims.currentAnim.key === "downward") {
            shootAngle = Phaser.Math.PI2 * 1 / 4;
        }
        if (this.player.anims.currentAnim.key === "rightward") {
            shootAngle = 0;
        }

        const shootSpeed = 1000;

        const velocityX = Math.cos(shootAngle) * shootSpeed;
        const velocityY = Math.sin(shootAngle) * shootSpeed;

        let shoot;
        if (this.player.anims.currentAnim.key === "upward" || this.player.anims.currentAnim.key === "downward") {
            shoot = this.physics.add.sprite(playerX, playerY, "boneY");
            shoot.setSize(15, 30);
        } else {
            shoot = this.physics.add.sprite(playerX, playerY, "boneX");
            shoot.setSize(30, 15);
        }

        this.shoots.add(shoot);

        // 투사체에 초기 속도 설정
        shoot.setVelocity(velocityX, velocityY);

        shoot.outOfBoundsKill = true;
        shoot.checkWorldBounds = true;
    }

    // 현재 레벨에 따라 적의 생성 속도를 반환
    getSpawnIntervalForLevel(level) {
        switch (level) {
            case 1:
                return 5000;
            case 2:
                return 4000;
            case 3:
                return 3000;
            default:
                return 5000;
        }
    }

    // 적 생성 함수
    spawnEnemy() {
        // 반지름이 400인 원 바깥에서 적 생성
        const radius = 400;
        const angle = Math.random() * Phaser.Math.PI2; // 임의의 각도
        const x = this.player.x + radius * Math.cos(angle);
        const y = this.player.y + radius * Math.sin(angle);
        let enemy;
        let random = Math.random() * 5;
        if (random < 1) {
            enemy = this.physics.add.sprite(x, y, "enemy1");
            enemy.setSize(80, 80);
            enemy.health = 3 * (this.level + 2);
            enemy.score = 20;
            enemy.speed = 50 + this.level * 40;
            this.enemies.add(enemy);
        } else if (random < 2) {
            enemy = this.physics.add.sprite(x, y, "enemy2");
            enemy.setSize(80, 80);
            enemy.health = 4 * (this.level + 2);
            enemy.score = 30;
            enemy.speed = 50 + this.level * 50;
            this.enemies.add(enemy)
        } else if (random < 3) {
            enemy = this.physics.add.sprite(x, y, "enemy3");
            enemy.setSize(80, 80);
            enemy.health = 5 * (this.level + 2);
            enemy.score = 40;
            enemy.speed = 50 + this.level * 60;
            this.enemies.add(enemy)
        } else if (random < 4) {
            enemy = this.physics.add.sprite(x, y, "enemy4");
            enemy.setSize(80, 80);
            enemy.health = 6 * (this.level + 2);
            enemy.score = 60;
            enemy.speed = 50 + this.level * 70;
            this.enemies.add(enemy)
        } else if (random < 5) {
            enemy = this.physics.add.sprite(x, y, "enemy5");
            enemy.setSize(80, 80);
            enemy.health = 7 * (this.level + 2);
            enemy.score = 80;
            enemy.speed = 50 + this.level * 80;
            this.enemies.add(enemy)
        }

    }

    // 투사체와 적 간의 충돌 시 호출될 함수
    shootObjectHitEnemy(shootObject, enemy) {
        // 적의 체력을 1만큼 감소시킴
        enemy.health -= this.level*2;

        if (enemy.health <= 0) {
            // 적의 체력이 0 이하이면 적 제거
            enemy.destroy();
            this.enemiesKilled += 1;
            this.totalEnemiesKilled += 1;
            this.score += enemy.score;
        } else {
            // 적의 색상을 빨갛게 변경
            enemy.setTint(0xff0000); // 빨간색
            // 몇 초 후에 색상을 원래대로 돌리기 위해 타이머 설정
            this.time.delayedCall(200, () => {
                enemy.clearTint(); // 원래 색상으로 돌림
            });
        }

        // 투사체 제거
        shootObject.destroy();


    }

    circularObjectHitEnemy(object, enemy) {
        // 적의 체력을 3 감소.
        enemy.health -= this.level*3;

        // 적의 체력이 0 이하로 떨어졌을 경우 적을 제거.
        if (enemy.health <= 0) {
            enemy.destroy();
            this.enemiesKilled += 1;
            this.totalEnemiesKilled += 1;
            this.score += enemy.score;

        } else {
            // 적의 색상을 빨갛게 변경
            enemy.setTint(0xff0000); // 빨간색
            // 몇 초 후에 색상을 원래대로 돌리기 위해 타이머 설정
            this.time.delayedCall(200, () => {
                enemy.clearTint(); // 원래 색상으로 돌림
            });
        }

        // circularObjects 그룹에서 객체를 비활성화합니다.
        object.disableBody(true, true);

        // 일정 시간 후에 circularObjects 객체를 다시 활성화합니다.
        this.time.addEvent({
            delay: 2000, // 1초 동안 비활성화 상태 유지
            callback: () => {
                object.enableBody(true, object.x, object.y, true, true);
            },
            callbackScope: this,
            loop: false // 한 번만 실행
        });
    }

    playerHitByEnemy(player, enemy) {
        enemy.destroy();

        // 충돌 횟수 기록
        this.playerCollisionCount += 1;

        // 생명력 감소 등의 처리 추가

        // 생명력이 0 이하로 떨어진 경우 또는 충돌 횟수가 임계값에 도달하면 게임 오버
        if (this.playerCollisionCount >= this.playerHealth) {
            this.gameOver();
        } else {
            player.setTint(0xff0000); // 빨간색
            // 몇 초 후에 색상을 원래대로 돌리기 위해 타이머 설정
            this.time.delayedCall(200, () => {
                player.clearTint(); // 원래 색상으로 돌림
            });
        }

        this.updateHealthSprites();

    }

    gameOver() {
        // 게임 오버 상태로 전환하는 로직 추가

        // 게임 오버 상태로 설정
        this.isGameOver = true;

        // 게임 일시 정지
        this.scene.pause();

        this.registry.set("score", this.score);
        this.scene.start("GameOverScene");
    }




}
