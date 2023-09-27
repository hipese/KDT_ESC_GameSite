package dto;

import java.util.List;

public class GameInfoDTO {
	private String gameName;
	private List<WeekCounts> weekCounts;
	private int todayCounts;
	private int allCounts;
	
	public GameInfoDTO() {
		super();
	}
	public GameInfoDTO(String gameName, List<WeekCounts> weekCounts, int todayCounts, int allCounts) {
		super();
		this.gameName = gameName;
		this.weekCounts = weekCounts;
		this.todayCounts = todayCounts;
		this.allCounts = allCounts;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public List<WeekCounts> getWeekCounts() {
		return weekCounts;
	}
	public void setWeekCounts(List<WeekCounts> weekCounts) {
		this.weekCounts = weekCounts;
	}
	public int getTodayCounts() {
		return todayCounts;
	}
	public void setTodayCounts(int todayCounts) {
		this.todayCounts = todayCounts;
	}
	public int getAllCounts() {
		return allCounts;
	}
	public void setAllCounts(int allCounts) {
		this.allCounts = allCounts;
	}
	
	

}
