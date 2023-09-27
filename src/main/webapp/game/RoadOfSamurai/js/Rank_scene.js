class RankScene extends Phaser.Scene{

    constructor() {
        super({ key: 'RankScene' });
    }
    init(data) {
		this.rankingData = data.rankingData;
    }
    preload() {
        
    }
    create() {
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 200, '랭킹보기', { fontSize: '60px', fill: '#FFFFFF', fontWeight: 'bold' }).setOrigin(0.5).setPadding(15);

        //랭킹 보여주기
        // gameStartScene에서 가져온 랭킹을 보여준다.
        this.add.text(this.cameras.main.width / 2 - 170, this.cameras.main.height / 2 - 150, '순위', { fontSize: '20px', fill: '#ffffff' }).setOrigin(0.5).setPadding(15);
        this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 150, '점수', { fontSize: '20px', fill: '#ffffff' }).setOrigin(0.5).setPadding(15);
        this.add.text(this.cameras.main.width / 2 + 170, this.cameras.main.height / 2 - 150, '아이디', { fontSize: '20px', fill: '#ffffff' }).setOrigin(0.5).setPadding(15);
        
        function formatTime(milliseconds) {
	        const minutes = Math.floor(milliseconds / 60000);
	        const seconds = Math.floor((milliseconds % 60000) / 1000);
            const millisecondsDisplay = Math.floor((milliseconds % 1000) / 10);
            let formattedMinutes = minutes.toString().padStart(2, "0"); // padStart를 사용하여 2자리로 만들어줌
            let formattedSeconds = seconds.toString().padStart(2, "0"); // padStart를 사용하여 2자리로 만들어줌
            let formattedMillisecondsDisplay = millisecondsDisplay.toString().padStart(2, "0"); // padStart를 사용하여 2자리로 만들어줌
            
            if (minutes < 1) {
                return `${formattedSeconds}.${formattedMillisecondsDisplay}초`;
            }else {
                return `${formattedMinutes}:${formattedSeconds}.${formattedMillisecondsDisplay}초`;
            }
	    }

        for (let i = 0; i < this.rankingData.length; i++){
            let formattedTime = formatTime(this.rankingData[i].score);
            this.add.text(this.cameras.main.width / 2 - 170, this.cameras.main.height / 2 - 110 + (i * 30), this.rankingData[i].seq, { fontSize: '20px', fill: '#ffffff' }).setOrigin(0.5).setPadding(15);
            this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 - 110 + (i * 30), formattedTime, { fontSize: '20px', fill: '#ffffff' }).setOrigin(0.5).setPadding(15);
            this.add.text(this.cameras.main.width / 2 + 170, this.cameras.main.height / 2 - 110 + (i * 30), this.rankingData[i].player, { fontSize: '20px', fill: '#ffffff' }).setOrigin(0.5).setPadding(15);
        }

        let backBtn = this.add.text(this.cameras.main.width / 2, this.cameras.main.height / 2 + 220, "되돌아가기", { fontSize: '30px', fill: '#ffffff' }).setOrigin(0.5).setInteractive().setPadding(15);
        backBtn.on('pointerover', () => {
            this.game.canvas.style.cursor = "pointer";
        });
        backBtn.on('pointerout', () => {
            this.game.canvas.style.cursor = "default";
        });
        backBtn.on('pointerdown', () => {
            this.scene.start("titleScene");
        });
    }
    update() {
        
    }
}