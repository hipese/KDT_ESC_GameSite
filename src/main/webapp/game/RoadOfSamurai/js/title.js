class titleScene extends Phaser.Scene {
    constructor() {
        super({ key: "titleScene" });
    }

    init(data) {

    }

    preload() {
        this.load.image("titleimage", "icons/titleimage.png");
        this.load.image("left_arrow_image", "icons/left_arrow.png");
        this.load.image("right_arrow_image", "icons/right_arrow.png");
        this.load.image("spacebarimage", "icons/spacebar.png");
        this.load.image("Akey", "icons/A.png");
        this.load.image("titlebackgrond", "BackGround/background1.jpg")
    }

    create(data) {

        this.background = this.add.tileSprite(0, 0, 2000, 630, "titlebackgrond");
        this.background.setOrigin(0, 0);
        this.background.setScale(1.08);

		
        this.titleimage = this.add.sprite(this.cameras.main.width / 2 + 40, this.cameras.main.height / 2 - 150, "titleimage")
        this.left_arrow = this.add.sprite(this.cameras.main.width / 2 - 725, this.cameras.main.height / 2 - 200, "left_arrow_image")
        this.right_arrow = this.add.sprite(this.cameras.main.width / 2 - 525, this.cameras.main.height / 2 - 200, "right_arrow_image")
        this.A = this.add.sprite(this.cameras.main.width / 2 - 625, this.cameras.main.height / 2 - 125, "Akey")
        this.spacebar = this.add.sprite(this.cameras.main.width / 2 - 625, this.cameras.main.height / 2 - 40, "spacebarimage")

        this.moveText = this.add.text(this.cameras.main.width / 2 - 250, this.cameras.main.height / 2 - 200,
            ": 원하는 방향으로 이동합니다", {fontFamily: "DungGeunMo", fontSize: "30px", fill: "#FFFFFF" }).setOrigin(0.5).setPadding(10, 10, 10, 10);

        this.attackText = this.add.text(this.cameras.main.width / 2 + 12, this.cameras.main.height / 2 - 110,
            ": 움직이는 방향으로 공격을 시도합니다. .\n  점프중에 사용할 수 있으며 이동시 사용하면 이동을 중지합니다.", {fontFamily: "DungGeunMo", fontSize: "30px", fill: "#FFFFFF" }).setOrigin(0.5).setPadding(10, 10, 10, 10);

        this.jumpText = this.add.text(this.cameras.main.width / 2 - 80, this.cameras.main.height / 2 - 30,
            ": 점프를 실행합니다. 이동하면서 사용할 수 있으며,.\n  연속으로 사용할 수 없습니다.  ", {fontFamily: "DungGeunMo", fontSize: "30px", fill: "#FFFFFF" }).setOrigin(0.5).setPadding(10, 10, 10, 10);

        this.description = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 120,
            "목표 \n최대한 오래 살아남아서 많은 적을 처치하는 것이 목표입니다. 적을 처지하면 점수를 획득합니다."
            +" \n방어벽에 접근을 허용하면 점수를 잃고, 공격상태가 아닌데  적에게 접근을 허용하거나\n점수가 0인 상태에서 방어벽에 적이 도착하면  life를 하나 손실하며,"
            + "\nlife가 0이 되면 게임이 끝납니다. 랭킹은 킬점수와 score의 합으로 결정합니다. \n또한 적들은 시간이 지날수록 공격이 강해지니 능력을 발휘하여 막아보시길 바랍니다! ", {fontFamily: "DungGeunMo", fontSize: "30px", fill: "#FFFFFF" }).setOrigin(0.5).setPadding(10, 10, 10, 10);


        this.left_arrow.setVisible(false);
        this.right_arrow.setVisible(false);
        this.A.setVisible(false);
        this.spacebar.setVisible(false);
        this.moveText.setVisible(false);
        this.attackText.setVisible(false);
        this.jumpText.setVisible(false);
        this.description.setVisible(false);



        this.titleText = this.add.text(this.cameras.main.width / 2 + 40,
            this.cameras.main.height / 2 - 20, "Guardian", {fontFamily: "DungGeunMo", fontSize: "60px", fill: "#FF0000" }).setOrigin(0.5);

        let startBtn = this.add.text(this.cameras.main.width / 2 + 40,
            this.cameras.main.height / 2 + 40, "Start", { fontFamily: "DungGeunMo",fontSize: "40px" }).setOrigin(0.5).setInteractive().setPadding(15);

        startBtn.on("pointerover", () => {
            startBtn.setBackgroundColor("#720938");
            this.game.canvas.style.cursor = "pointer";
        });

        startBtn.on("pointerout", () => {
            startBtn.setBackgroundColor("transparent");
            this.game.canvas.style.cursor = "default";
        });

        startBtn.on("pointerdown", () => {
            this.scene.start("playScene")
        });

        let descriptionText = this.add.text(this.cameras.main.width / 2 + 40,
            this.cameras.main.height / 2 + 100, "게임설명", {
            fontFamily: "DungGeunMo", // 올바른 속성 이름을 사용
            fontSize: "30px"
        }).setOrigin(0.5).setInteractive().setPadding(15);

        let rankBtn = this.add.text(this.cameras.main.width / 2 + 40,
            this.cameras.main.height / 2 + 160, "게임랭킹", { fontFamily: "DungGeunMo",fontSize: "30px" }).setOrigin(0.5).setInteractive().setPadding(15);
            
            let killText = this.add.text(this.cameras.main.width / 2 + 40, this.cameras.main.height / 2 + 220, "나가기", { fontSize: '30px', fontFamily: "DungGeunMo" }).setOrigin(0.5).setInteractive().setPadding(15);
            
            killText.on('pointerover', () => {
	            this.game.canvas.style.cursor = "pointer";
	        });
	        killText.on('pointerout', () => {
	            this.game.canvas.style.cursor = "default";
	        });
	        killText.on('pointerdown', () => {
	            window.close();
	        });


        this.backText = this.add.text(this.cameras.main.width - 100,
            this.cameras.main.height - 20, "돌아가기", { fontFamily: "DungGeunMo",fontSize: "30px" }).setOrigin(0.5).setInteractive().setPadding(15);
        this.backText.setVisible();


        // 설명 버튼을 누르면 기존의 UI를 지우고 설명하는  UI를 띄움
        descriptionText.on("pointerover", () => {
            descriptionText.setBackgroundColor("#720938");
            this.game.canvas.style.cursor = "pointer";
        });

        descriptionText.on("pointerout", () => {
            descriptionText.setBackgroundColor("transparent");
            this.game.canvas.style.cursor = "default";
        });

        descriptionText.on("pointerdown", () => {
            this.titleimage.setVisible(false);
            this.titleText.setVisible(false);
            startBtn.setVisible(false);
            descriptionText.setVisible(false);
            rankBtn.setVisible(false);
            killText.setVisible(false);
            this.backText.setVisible(true);
            this.left_arrow.setVisible(true);
            this.right_arrow.setVisible(true);
            this.A.setVisible(true);
            this.spacebar.setVisible(true);
            this.moveText.setVisible(true);
            this.attackText.setVisible(true);
            this.jumpText.setVisible(true);
            this.description.setVisible(true);
        });


        this.backText.on("pointerover", () => {
            this.backText.setBackgroundColor("#720938");
            this.game.canvas.style.cursor = "pointer";
        });

        this.backText.on("pointerout", () => {
            this.backText.setBackgroundColor("#000000");
            this.game.canvas.style.cursor = "default";
        });

        this.backText.on("pointerdown", () => {
            this.titleimage.setVisible(true);
            this.titleText.setVisible(true);
            startBtn.setVisible(true);
            descriptionText.setVisible(true);
            rankBtn.setVisible(true);
            killText.setVisible(true);
            this.backText.setVisible(false);
            this.left_arrow.setVisible(false);
            this.right_arrow.setVisible(false);
            this.A.setVisible(false);
            this.spacebar.setVisible(false);
            this.moveText.setVisible(false);
            this.attackText.setVisible(false);
            this.jumpText.setVisible(false);
            this.description.setVisible(false);

        });
        

        rankBtn.on('pointerover', () => {
			rankBtn.setBackgroundColor("#720938");
            this.game.canvas.style.cursor = "pointer";
        });
        rankBtn.on('pointerout', () => {
			rankBtn.setBackgroundColor("transparent");
            this.game.canvas.style.cursor = "default";
        });
       
        rankBtn.on('pointerdown', () => {
            $.ajax({
                url: "/RoadOfSamuraiTop10.game",
                type: "get",
                dataType: "json",
            }).done(function (data) {
                this.scene.start('RankScene', { rankingData: data });
            }.bind(this)).fail(function (xhr, status, errorThrown) {
                console.log(xhr, status, errorThrown);
            });
        });

    }



}