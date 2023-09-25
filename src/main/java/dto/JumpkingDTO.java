package dto;

import java.sql.Timestamp;

public class JumpkingDTO {
	private int seq;
	private String player;
	private int score;
	private Timestamp played_time;
	
	
	
	public JumpkingDTO() {
		super();
	}
	public JumpkingDTO(String player, int score, Timestamp played_time) {
		super();
		this.player = player;
		this.score = score;
		this.played_time = played_time;
	}
	public JumpkingDTO(int seq, String player, int score, Timestamp played_time) {
		super();
		this.seq = seq;
		this.player = player;
		this.score = score;
		this.played_time = played_time;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Timestamp getPlayed_time() {
		return played_time;
	}
	public void setPlayed_time(Timestamp played_time) {
		this.played_time = played_time;
	}
	
	
}
