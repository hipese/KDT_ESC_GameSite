package dao;

import java.util.ArrayList;
import java.util.List;

import dto.GameInfoDTO;

public class GameInfoDAO {
	private static GameInfoDAO instance;

	public static GameInfoDAO getInstance() {
		if (instance == null) {
			instance = new GameInfoDAO();
		}
		return instance;
	}
	
	public List<GameInfoDTO> getGamesInfo(GameInfoDTO car, GameInfoDTO dino, GameInfoDTO jump, GameInfoDTO dragon, GameInfoDTO samurai,
			GameInfoDTO skeleton){
		List<GameInfoDTO> list = new ArrayList<>();
		list.add(car);
		list.add(dino);
		list.add(jump);
		list.add(dragon);
		list.add(samurai);
		list.add(skeleton);
		return list;
	}

}
