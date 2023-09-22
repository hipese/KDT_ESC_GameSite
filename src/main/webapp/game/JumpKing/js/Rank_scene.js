class RankScene extends Phaser.Scene{

    constructor() {
        super({ key: 'RankScene' });
    }
    

    preload() {
        
    }
    create() {
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 200, '랭킹보기', { fontSize: '60px', fill: '#FFFFFF', fontWeight: 'bold' }).setOrigin(0.5).setPadding(15);

        //랭킹 보여주기
        

        let backBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 200, "되돌아가기", { fontSize: '40px', fill: '#ffffff' }).setOrigin(0.5).setInteractive().setPadding(15);
        backBtn.on('pointerover', () => {
            this.game.canvas.style.cursor = "pointer";
        });
        backBtn.on('pointerout', () => {
            this.game.canvas.style.cursor = "default";
        });
        backBtn.on('pointerdown', () => {
            this.scene.start('GameStartScene');
        });
        
    }
    update() {
        
    }
}