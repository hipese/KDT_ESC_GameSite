class RunScene extends Phaser.Scene{

    constructor(){
        super({key:"RunScene"});
    }
    init(data){
        this.frame=0
        this.randombox=[];
        this.num=0;
        this.second=0;
        this.score=0;
        this.scoreboard = this.registry.get('score');
        this.urlParams = new URLSearchParams(window.location.search);
        this.loginID = this.urlParams.get("loginID");
    }
   
    preload() {
        this.load.image("bg","image/bounce.jpg")
        this.load.image("random1","image/up.png")
        this.load.image("random2","image/down.png")
        this.load.image("random3","image/left.png")
        this.load.image("random4","image/right.png")
        this.load.spritesheet("runSheet","image/char.png",{frameWidth:60,frameHeight:60});
        this.load.image("meat","image/meat.png")
       
    }
    create(){
        this.back = this.add.tileSprite(0,-145,1000,700,"bg");
        this.back.setOrigin(0,0);
        this.cursors =this.input.keyboard.createCursorKeys(); // 방향키를 통제할 수 있음
        this.anims.create({
            key:"run",
            frames:this.anims.generateFrameNumbers("runSheet",{start:0,end:7}),
            frameRate: 20, //숫자가 높을수록 속도가 빠르다
            repeat:-1 // 몇번 반복할지 -1은 무한
           });

           this.player = this.physics.add.sprite(70,300,"runSheet");
            this.player.setOrigin(0,0);
            this.player.setScale(1.5);
            this.player.setSize((20),(60));
            this.player.setCollideWorldBounds(true);
            this.player.play("run");

            this.meat = this.physics.add.sprite(830,250,"meat");
            this.meat.setOrigin(0,0);
            this.meat.setScale(0.2);
            this.meat.setSize((20),(60));

            
            let x=50;
            for(let i=0;i<16;i++){
                let random = Phaser.Math.Between(1,4)
                this.random = this.physics.add.sprite(x+=50,200,"random"+random);
                this.random.setOrigin(0,0);
                this.random.setScale(0.2);
                this.randombox.push(this.random);
            }
            
                
            
                
               
                this.text1 = this.add.text(600, 5, 'Time : '+this.second, { font: "20px", fill: "#000000" }).setInteractive().setPadding(15);
            
            this.time.addEvent({
                delay: 1000, // 시간 단위 ms
                callback: () => this.second++, // delay 주기마다 수행할 로직
                callbackScope: this, // callback 범위
                loop: true, // 반복 여부
            });
            
            
            
            this.physics.add.overlap(this.player,this.meat,(player,meat)=>{
                this.registry.set('score', this.scoreboard );
                this.registry.set('stage', 4);
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
				this.scene.start("MainScene")
			}else {
				// 로그인을 하지 않았다면 로그인을 할 수 있는 모달창을 띄운다.
				const modal = document.getElementById('login-modal');
				modal.style.display = "block";
				//body.style.overflow = "hidden";
				$(".scroll").val(scrollY);
				this.scene.start("MainScene")
			}
                
            })
            
            
            
            
    }
    
    update(){
        this.frame++;
        this.text1.setText('Time : '+this.second);
        
        
        if(this.second<5){
            
          if(this.cursors.left.isDown){
            if(this.randombox[0].texture.key=="random3"){
                this.scoreboard+=50;
                this.player.x+=50;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }
        else if(this.cursors.up.isDown){
            if(this.randombox[0].texture.key=="random1"){
                this.scoreboard+=50;
                this.player.x+=50;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }
        else if(this.cursors.down.isDown){
            if(this.randombox[0].texture.key=="random2"){
                this.scoreboard+=50;
                this.player.x+=50;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }
        else if(this.cursors.right.isDown){
            if(this.randombox[0].texture.key=="random4"){
                this.scoreboard+=50;
                this.player.x+=50;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }  
        }else{
            if(this.cursors.left.isDown){
                if(this.randombox[0].texture.key=="random3"){
                    this.scoreboard+=30;
                    this.player.x+=50;
                    this.player.anims.play('left', true);
                    this.randombox[0].destroy();
                    this.randombox.shift()
                }
            }
            else if(this.cursors.up.isDown){
                if(this.randombox[0].texture.key=="random1"){
                    this.scoreboard+=30;
                    this.player.x+=50;
                    this.player.anims.play('left', true);
                    this.randombox[0].destroy();
                    this.randombox.shift()
                }
            }
            else if(this.cursors.down.isDown){
                if(this.randombox[0].texture.key=="random2"){
                    this.scoreboard+=30;
                    this.player.x+=50;
                    this.player.anims.play('left', true);
                    this.randombox[0].destroy();
                    this.randombox.shift()
                }
            }
            else if(this.cursors.right.isDown){
                if(this.randombox[0].texture.key=="random4"){
                    this.scoreboard+=30;
                    this.player.x+=50;
                    this.player.anims.play('left', true);
                    this.randombox[0].destroy();
                    this.randombox.shift()
                }
            } 
        }
    }
}