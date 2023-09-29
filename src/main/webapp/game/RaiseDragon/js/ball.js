class BallScene extends Phaser.Scene{

    constructor(){
        super({key:"BallScene"});
    }
    init(data){
        this.frame=0;
        this.ballboxes=[];
        this.scoreboard = this.registry.get('score');
        this.gameover=false;
        this.loginID = loginID;
    }

    preload(){
        this.cursors =this.input.keyboard.createCursorKeys(); // 방향키를 통제할 수 있음
        this.load.spritesheet("runSheet","image/char.png",{frameWidth:60,frameHeight:60});
        this.load.image("bg","image/bounce.jpg")
        this.load.image("ball","image/ball.png")
    }
    create(){
        this.back = this.add.tileSprite(0,-145,1000,700,"bg");
        this.back.setOrigin(0,0);

        let bottomBoundary = this.add.rectangle(0,this.cameras.main.height-1,this.cameras.main.width,5,0xFFFFFF); // 사각형 만들기 (x좌표 , y좌표,넓이,높이)
        bottomBoundary.setOrigin(0,0);
        this.physics.add.existing(bottomBoundary,true);

        this.physics.add.collider(bottomBoundary,this.boxes,function(boundary,box){
            box.destroy();
        });

        this.anims.create({
            key:"run",
            frames:this.anims.generateFrameNumbers("runSheet",{start:0,end:7}),
            frameRate: 20, //숫자가 높을수록 속도가 빠르다
            repeat:-1 // 몇번 반복할지 -1은 무한
           });
           this.anims.create({
            key:"left",
            frames:this.anims.generateFrameNumbers("runSheet",{start:8,end:15}),
            frameRate: 20, //숫자가 높을수록 속도가 빠르다
            repeat:-1 // 몇번 반복할지 -1은 무한
           });
           this.anims.create({
            key:"right",
            frames:this.anims.generateFrameNumbers("runSheet",{start:16,end:23}),
            frameRate: 20, //숫자가 높을수록 속도가 빠르다
            repeat:-1 // 몇번 반복할지 -1은 무한
           });
           this.player = this.physics.add.sprite(400,this.cameras.main.height-100,"runSheet");
            this.player.setOrigin(0,0);
            this.player.setScale(1.5);
            this.player.setSize((20),(60));
            this.player.setCollideWorldBounds(true);
            this.player.play("run");
            this.second=0;
            this.textSecond = this.add.text(400, 50, '목표 : '+this.second+" / 30초", { font: "20px", fill: "#000000" }).setInteractive().setPadding(15);;
            
            this.time.addEvent({
                delay: 1000, // 시간 단위 ms
                callback: () => this.second++, // delay 주기마다 수행할 로직
                callbackScope: this, // callback 범위
                loop: true, // 반복 여부
            });
            
            let random1 = Phaser.Math.Between(0,1000)
            let random2 = Phaser.Math.Between(0,1000)
            let random3 = Phaser.Math.Between(0,1000)
            this.ball = this.physics.add.sprite(random1,this.cameras.main.height-500,"ball");
            this.ball.setCollideWorldBounds(true); // 화면 밖으로 나가는것 방지
            this.ball.setScale(0.5);
            this.ball.setSize(150,150)
            this.ball.setBounce(1);
            this.ball.body.velocity.set(250,  250);
            this.ballboxes.push(this.ball);
            this.ball = this.physics.add.sprite(random2,this.cameras.main.height-500,"ball");
            this.ball.setCollideWorldBounds(true); // 화면 밖으로 나가는것 방지
            this.ball.setScale(0.5);
            this.ball.setSize(150,150)
            this.ball.setBounce(1);
            this.ball.body.velocity.set(-200,  200);
            this.ballboxes.push(this.ball);
            this.ball = this.physics.add.sprite(random3,this.cameras.main.height-500,"ball");
            this.ball.setCollideWorldBounds(true); // 화면 밖으로 나가는것 방지
            this.ball.setScale(0.3);
            this.ball.setBounce(1);
            this.ball.setSize(120,120)
            this.ball.body.velocity.set(400,  400);
            this.ballboxes.push(this.ball);
            this.physics.add.overlap(this.player,this.ballboxes,(player,ball)=>{
                this.gameover = true;
                ball.destroy();
                this.registry.set('score', this.scoreboard );
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
    update(){
        if(!this.gameover) {
            this.frame++;
        }
        if (this.gameover) {
            this.bboxes.forEach(ball => {
                ball.destroy();
            });  
        }
        
        
        if(this.frame%60==0){
            this.textSecond.setText('목표 : '+this.second+" / 30초");
            this.scoreboard+=40
        }

        this.player.setVelocityX(0);
        if(this.cursors.left.isDown){
            this.player.setVelocityX(-500);
            this.player.anims.play('left', true);
        }
       
        else if(this.cursors.right.isDown){
            this.player.setVelocityX(500);
            this.player.anims.play('right', true);
        }
        else if(this.cursors.down.isUp){
            this.player.setVelocityX(0);
            this.player.anims.play('run', true);
        }

        if(this.second==30){
            this.registry.set('score', this.scoreboard );
            this.registry.set('stage', 3);
            this.scene.start("MainScene");
        }
        
        
    }
}