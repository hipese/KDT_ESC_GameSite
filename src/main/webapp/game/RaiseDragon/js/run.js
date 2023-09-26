class RunScene extends Phaser.Scene{

    constructor(){
        super({key:"RunScene"});
    }
    init(data){
        this.frame=0
        this.randombox=[];
        this.num=0;
        this.scoreboard=data.score;
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

           this.player = this.physics.add.sprite(400,400,"runSheet");
            this.player.setOrigin(0,0);
            this.player.setScale(1.5);
            this.player.setSize((20),(60));
            this.player.setCollideWorldBounds(true);
            this.player.play("run");

            this.meat = this.physics.add.sprite(400,-10,"meat");
            this.meat.setOrigin(0,0);
            this.meat.setScale(0.2);
            this.meat.setSize((20),(60));

            let y = 500;
            for(let i=0;i<4;i++){
                let random = Phaser.Math.Between(1,4)
                
                this.random = this.physics.add.sprite(300,y-=100,"random"+random);
                this.random.setOrigin(0,0);
                this.random.setScale(0.2);
                this.randombox.push(this.random);
                console.log(this.random.texture.key)
            }
            
                
            this.smeat = this.physics.add.sprite(750,10,"meat");
            this.smeat.setOrigin(0,0);
            this.smeat.setScale(0.1);
            this.smeat.setSize((20),(60));
            this.score=0;
            this.text = this.add.text(
                    860,
                    30,
                    this.score + " / 10",
                    {fontSize:"20px"}
        
                ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능
                this.second=0
                this.textSecond = this.add.text(70, 5,"13초 안에 고기 10개를 모으세요", { font: "20px", fill: "#000000" }).setInteractive().setPadding(15);
                this.text1 = this.add.text(600, 5, 'Time : '+this.second, { font: "20px", fill: "#000000" }).setInteractive().setPadding(15);
            
            this.time.addEvent({
                delay: 1000, // 시간 단위 ms
                callback: () => this.second++, // delay 주기마다 수행할 로직
                callbackScope: this, // callback 범위
                loop: true, // 반복 여부
            });
            
            
            
            
    }
    
    update(){
        this.frame++;
        this.text1.setText('Time : '+this.second);
        this.physics.add.overlap(this.player,this.meat,(player,meat)=>{
            this.text.setText(++this.score + " / 10");
            meat.destroy();
            this.meat = this.physics.add.sprite(400,-10,"meat");
            this.meat.setOrigin(0,0);
            this.meat.setScale(0.2);
            this.meat.setSize((20),(60));
            for(let i=this.randombox.length-4;i<this.randombox.length;i++){
                this.randombox.pop();
            }
            
            this.player.y=400;
            let y=500;
            for(let i=0;i<4;i++){
                let random = Phaser.Math.Between(1,4)
                this.random = this.physics.add.sprite(300,y-=100,"random"+random);
                this.random.setOrigin(0,0);
                this.random.setScale(0.2);
                this.randombox.push(this.random);
            }
        })
        
        
        if(this.cursors.left.isDown){
            if(this.randombox[0].texture.key=="random3"){
                this.scoreboard+=50;
                this.player.y-=100;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }
        else if(this.cursors.up.isDown){
            if(this.randombox[0].texture.key=="random1"){
                this.scoreboard+=50;
                this.player.y-=100;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }
        else if(this.cursors.down.isDown){
            if(this.randombox[0].texture.key=="random2"){
                this.scoreboard+=50;
                this.player.y-=100;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }
        else if(this.cursors.right.isDown){
            if(this.randombox[0].texture.key=="random4"){
                this.scoreboard+=50;
                this.player.y-=100;
                this.player.anims.play('left', true);
                this.randombox[0].destroy();
                this.randombox.shift()
            }
        }
        this.dataToPass = {
            stage: 4,
            score: this.scoreboard 
        };
        if(this.second==13){
            this.scene.start("GameOverScene",this.dataToPass)
        }
        if(this.score==10){
            this.scene.start("MainScene",this.dataToPass)
        }
        

    }
}