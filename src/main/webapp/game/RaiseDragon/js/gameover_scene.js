class GameOverScene extends Phaser.Scene{

    constructor(){
        super({key:"GameOverScene"});
    }
    init(data){
        this.scoreboard=data.score
        console.log(data.score);
    }   

    preload(){

    }
    create(){
        this.add.text(
            this.cameras.main.width/2,
            this.cameras.main.height/3,
            "점수 : " + this.scoreboard,
            {font:"60px"}
            ).setOrigin(0.5).setPadding(15);

        this.add.text(
            this.cameras.main.width/2,
            this.cameras.main.height/2,
            "Game Over",
            {font:"60px",fill:"#FF0000"}
            ).setOrigin(0.5);

            let restartBtn = this.add.text(
                this.cameras.main.width/2,
                this.cameras.main.height/2+80,
                "Restart",
                {fontSize:"30px"}

            ).setOrigin(0.5).setInteractive().setPadding(15);// Interactive 추가로 이벤트 추가 가능
            
            restartBtn.on("pointerover",() => {
                restartBtn.setBackgroundColor("#0000FF")
                this.game.canvas.style.cursor = "pointer"
            });
            restartBtn.on("pointerout",() => {
                restartBtn.setBackgroundColor("#000000")
                this.game.canvas.style.cursor = "default"
            });

            let dataToPass = {
                stage: 1,
                score:0
            };

            restartBtn.on("pointerdown",() => {
                this.scene.start("MainScene", dataToPass);
            })
    }
    update(){

    }
}