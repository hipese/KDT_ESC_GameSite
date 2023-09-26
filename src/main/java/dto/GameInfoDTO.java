package dto;

import java.util.List;

public class GameInfoDTO {
	private String gameName;
	private List<Integer> weekData;
	private int todayData;
	
	public GameInfoDTO() {
		super();
	}
	public GameInfoDTO(String gameName, List<Integer> weekData, int todayData) {
		super();
		this.gameName = gameName;
		this.weekData = weekData;
		this.todayData = todayData;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public List<Integer> getWeekData() {
		return weekData;
	}
	public void setWeekData(List<Integer> weekData) {
		this.weekData = weekData;
	}
	public int getTodayData() {
		return todayData;
	}
	public void setTodayData(int todayData) {
		this.todayData = todayData;
	}
	
	

}
