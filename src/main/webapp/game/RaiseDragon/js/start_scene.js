class StartScene extends Phaser.Scene{

    constructor(){
        super({key:"StartScene"});
    }
    init(){
        
    }

    preload(){
        this.load.image("bgg","image/room.jpg")
    }
    create(){
        this.back = this.add.tileSprite(0,0,1000,500,"bgg");
        this.back.setOrigin(0,0);

        
        
        this.add.text(
            this.cameras.main.width/2,
            this.cameras.main.height/3,
            "드래곤 알 키우기",
            {font:"40px",fill:"#FF0000"}
            ).setOrigin(0.5).setInteractive().setPadding(15);;

            let startBtn = this.add.text(
                this.cameras.main.width/2,
                this.cameras.main.height/2.7+80,
                "게임시작",
                {fontSize:"30px"}

            ).setOrigin(0.5).setInteractive().setPadding(5);// Interactive 추가로 이벤트 추가 가능
            
            startBtn.on("pointerover",() => {
                
                this.game.canvas.style.cursor = "pointer"
            });
            startBtn.on("pointerout",() => {
                
                this.game.canvas.style.cursor = "default"
            });
            
            startBtn.on("pointerdown",() => {
				this.registry.set('score', 0);
				this.registry.set('stage', 1);
                this.scene.start("MainScene");
            })
    }
    update(){
       
        
     
}
}