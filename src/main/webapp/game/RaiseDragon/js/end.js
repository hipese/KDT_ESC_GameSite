class EndScene extends Phaser.Scene{

    constructor(){
        super({key:"EndScene"});
    }
    init(data){
        this.scoreboard=data.score
    }
   
    preload() {
        this.load.spritesheet("dragon","image/dragon.png",{frameWidth:191,frameHeight:161});
        this.load.image("sky","image/sky.jpg")
    }
    create(){
        this.back = this.add.tileSprite(0,0,1700,550,"sky");
        this.back.setOrigin(0,0)

        this.anims.create({
            key:"dragon",
            frames:this.anims.generateFrameNumbers("dragon",{start:3,end:5}),
            frameRate: 3, //숫자가 높을수록 속도가 빠르다
            repeat:-1 // 몇번 반복할지 -1은 무한
           });
           this.dragon = this.physics.add.sprite(30,100,"dragon");
           this.dragon.setOrigin(0,0);
           this.dragon.setScale(1)
           this.dragon.setCollideWorldBounds(true);
           this.dragon.play("dragon");
           
            
            
            this.add.text(
                this.cameras.main.width/2,
                100,
                "점수 : "+ this.scoreboard,
                {fontSize:"30px" ,fill: "#000000" }
    
            ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능
            
            let restartBtn = this.add.text(
                this.cameras.main.width/2,
                400,
                "다시 시작",
                {fontSize:"30px",fill: "#000000" }

            ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능
            restartBtn.on("pointerover",() => {
                
                this.game.canvas.style.cursor = "pointer"
            });
            restartBtn.on("pointerout",() => {
                
                this.game.canvas.style.cursor = "default"
            });
            restartBtn.on("pointerdown",() => {
                this.scene.start("StartScene");
            })

    }
    
    update(){
        this.back.tilePositionX += 5; // 배경 움직이기
    }
}