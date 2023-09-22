class GameOverScene extends Phaser.Scene{
    constructor(){
        super({key:"GameOverScene"});
    }

    init(data){
        this.killcount=data.score1
        this.time=data.score2
        this.total=data.totalscore;
    }

    preload(){
        this.load.image("background","BackGround/background3.jpg")
    }

    create(data){

        this.background = this.add.tileSprite(0, 0, 2000, 630, "background");
        this.background.setOrigin(0, 0);
        this.background.setScale(1);

        this.add.text(this.cameras.main.width/2+10,
        this.cameras.main.height/2-160,"Game Over",{fontFamily: "DungGeunMo",fontSize:"100px",fill:"#FFFFFF"}).setOrigin(0.5);

        let restartBtn=  this.add.text(this.cameras.main.width/2,
        this.cameras.main.height/2,"Restart",{fontFamily: "DungGeunMo",fontSize:"40px"}).setOrigin(0.5).setInteractive().setPadding(15);

        restartBtn.on("pointerover",()=>{
            restartBtn.setBackgroundColor("#720938");
            this.game.canvas.style.cursor="pointer";
        });

        restartBtn.on("pointerout",()=>{
            restartBtn.setBackgroundColor("transparent");
            this.game.canvas.style.cursor="default";
        });

        restartBtn.on("pointerdown",()=>{
            this.scene.start("playScene")
        });
        

        let scoreText=this.add.text(this.cameras.main.width/2,
        this.cameras.main.height/2-70,"종합점수:"+(this.killcount+this.total)+"점",{fontFamily: "DungGeunMo",fontSize:"50px",fill:"#FFFFFF"}).setOrigin(0.5).setPadding(15);

        let timeText=this.add.text(this.cameras.main.width/2,
        this.cameras.main.height/2+60,"생존 시간:"+this.time+"초",{fontFamily: "DungGeunMo",fontSize:"30px"}).setOrigin(0.5).setPadding(15);


        let killText=this.add.text(this.cameras.main.width/2,
        this.cameras.main.height/2+120,"처치한 적:"+this.killcount,{fontFamily: "DungGeunMo",fontSize:"30px"}).setOrigin(0.5).setPadding(15);

        let lobbyText=this.add.text(this.cameras.main.width/2,
        this.cameras.main.height/2+180,"로비로 가기",{fontFamily: "DungGeunMo",fontSize:"30px"}).setOrigin(0.5).setInteractive().setPadding(15);

        lobbyText.on("pointerover",()=>{
            lobbyText.setBackgroundColor("#720938");
            this.game.canvas.style.cursor="pointer";
        });

        lobbyText.on("pointerout",()=>{
            lobbyText.setBackgroundColor("transparent");
            this.game.canvas.style.cursor="default";
        });

        lobbyText.on("pointerdown",()=>{
            this.scene.start("titleScene")
        });
    };

    

}