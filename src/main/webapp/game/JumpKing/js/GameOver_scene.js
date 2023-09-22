class GameOverScene extends Phaser.Scene{

    constructor() {
        super({ key: 'GameOverScene' });
    }
    

    preload() {

    }
    create(data) {
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 150, 'Game Over', { fontSize: '60px', fill: '#FF0000', fontWeight: 'bold' }).setOrigin(0.5);

        // 데이터에서 타이머 값을 가져와서 표시
        const timer = data.timer;
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 80, '기록 : ' + this.formatTime(timer), { fontSize: '30px', fill: '#ffffff' }).setOrigin(0.5).setPadding(15);
        let restartBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 130, "Restart", { fontSize: '30px' }).setOrigin(0.5).setInteractive().setPadding(15);
        let backBtn = this.add.text(this.cameras.main.width / 2 , this.cameras.main.height / 2 + 180, "Back", { fontSize: '30px' }).setOrigin(0.5).setInteractive().setPadding(15);
        restartBtn.setInteractive(
            // 깜빡이는 효과
            this.tweens.add({
                targets: restartBtn,
                alpha: 0.2,
                duration: 800,
                ease: 'Power1',
                yoyo: true,
                loop: -1
            })
        );
        restartBtn.on('pointerover', () => {
            this.game.canvas.style.cursor = "pointer";
        });
        backBtn.on('pointerover', () => {
            this.game.canvas.style.cursor = "pointer";
        });
        restartBtn.on('pointerout', () => {
            this.game.canvas.style.cursor = "default";
        });
        backBtn.on('pointerout', () => {
            this.game.canvas.style.cursor = "default";
        });
        restartBtn.on('pointerdown', () => {
            this.scene.start('MoveScene');
        });
        backBtn.on('pointerdown', () => {
            this.scene.start('GameStartScene');
        });
        
    }
    formatTime(milliseconds) {
        const minutes = Math.floor(milliseconds / 60000);
        const seconds = Math.floor((milliseconds % 60000) / 1000);
        const millisecondsDisplay = Math.floor((milliseconds % 1000) / 10);
        return `${minutes}분 ${seconds}초 ${millisecondsDisplay}`;
    }
    update() {
        
    }
}