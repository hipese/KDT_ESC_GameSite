class MainScene extends Phaser.Scene{

    constructor(){
        super({key:"MainScene"});
    }
    init(){
        this.frame=0;
        this.number=0;
        this.scoreboard = this.registry.get('score');
        this.stage = this.registry.get('stage'); 
        this.urlParams = new URLSearchParams(window.location.search);
        this.loginID = this.urlParams.get("loginID");
        
    }

    preload(){
        this.load.spritesheet("egg","image/egg.png",{frameWidth:90,frameHeight:175});
        this.load.spritesheet("runSheet","image/char.png",{frameWidth:60,frameHeight:60});
        this.load.image("bgg","image/room.jpg")
        this.load.image("potal","image/potal.gif")
        this.load.image("baby","image/babydragon.png")
        this.load.spritesheet("dragon","image/dragon.png",{frameWidth:191,frameHeight:161});
    }
    create(){
        console.log(this.stage)
        this.cursors =this.input.keyboard.createCursorKeys(); // 방향키를 통제할 수 있음
        this.back = this.add.tileSprite(0,0,1000,500,"bgg");
        this.back.setOrigin(0,0);

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
           this.anims.create({
            key:"egg",
            frames:this.anims.generateFrameNumbers("egg",{start:0,end:0})
           });
           this.anims.create({
            key:"egg1",
            frames:this.anims.generateFrameNumbers("egg",{start:1,end:3}),
            frameRate: 1 //숫자가 높을수록 속도가 빠르다,
           });
           this.anims.create({
            key:"dragon",
            frames:this.anims.generateFrameNumbers("dragon",{start:3,end:5}),
            frameRate: 3, //숫자가 높을수록 속도가 빠르다
            repeat:-1 // 몇번 반복할지 -1은 무한
           });

           

        let scoreboard = this.add.text(
            this.cameras.main.width-150,
            30,
            "점수 : "+(this.scoreboard),
            {fontSize:"20px"}

        ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능

        this.potal = this.physics.add.sprite(800,237,"potal"); // 이미지 추가
        this.potal.setOrigin(0,0);
        this.potal.setScale(1);
        this.potal.setSize((30),(50));
        this.potal.setCollideWorldBounds(true); // 화면 밖으로 나가는것 방지

        this.player = this.physics.add.sprite(400,this.cameras.main.height-230,"runSheet");
        this.player.setOrigin(0,0);
        this.player.setScale(2.5);
        this.player.setSize((0.3),(0.3));
        this.player.setCollideWorldBounds(true);
        this.player.play("run");

        if(this.stage==1){
        this.egg = this.physics.add.sprite(250,255,"egg"); // 이미지 추가
        this.egg.setOrigin(0,0);
        this.egg.setScale(0.6);
        this.player.play("egg");
        this.add.text(
            this.cameras.main.width/2,
            100,
            "알을 부화시키기 위해 포탈에 입장하여 재료를 구해오세요",
            {fontSize:"20px"}

        ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능
        }
        if(this.stage==2){
            this.egg1 = this.physics.add.sprite(250,255,"egg"); // 이미지 추가
            this.egg1.setOrigin(0,0);
            this.egg1.setScale(0.6);
            this.egg1.play("egg1");
            this.add.text(
                this.cameras.main.width/2,
                100,
                "곧 알이 부화합니다. 마지막 재료를 포탈에 입장하여 구해오세요",
                {fontSize:"20px"}
    
            ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능
        }
        if(this.stage==3){
            this.egg1 = this.physics.add.sprite(250,300,"baby"); // 이미지 추가
            this.egg1.setOrigin(0,0);
            this.egg1.setScale(0.07);
            this.add.text(
                this.cameras.main.width/2,
                100,
                "아기 드래곤이 알을 깨고 나왔습니다.\n\n배고픈 드래곤을 위해서 포탈에 입장하여 먹이를 구해오세요",
                {fontSize:"20px"}
    
            ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능
            
        }
        if(this.stage==4){
            this.dragon = this.physics.add.sprite(100,100,"dragon");
            this.dragon.setOrigin(0,0);
            this.dragon.setScale(2)
            this.dragon.setSize(50,50)
            this.dragon.setCollideWorldBounds(true);
            this.dragon.play("dragon");
            this.dragon.setVelocityX(500);
            
               
        }
        
       this.registry.set('score', this.scoreboard);	
        
        if(this.stage==1){
            this.physics.add.overlap(this.player,this.potal,(player,potal)=>{
                potal.destroy();
            this.scene.start("BounceScene")
        })
        }
        if(this.stage==2){
            this.physics.add.overlap(this.player,this.potal,(player,potal)=>{
            this.scene.start("BallScene")
        })
        }
        if(this.stage==3){
            console.log("asd")
            this.physics.add.overlap(this.player,this.potal,(player,potal)=>{
            this.scene.start("RunScene")
        })
        }
        if(this.stage==4){
             this.physics.add.overlap(this.dragon,this.potal,(player,potal)=>{
            this.scene.start("EndScene")
        })
        }
        
        
        
        
       
    }
    update(){
        

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
        
        
       
    }
 }
