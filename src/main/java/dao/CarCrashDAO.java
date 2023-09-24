package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CarCrashDTO;

public class CarCrashDAO {
	private CarCrashDAO() {}
	private static CarCrashDAO instance;

	public static CarCrashDAO getInstance() {
		if (instance == null) {
			instance = new CarCrashDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public int writeGameResult(String player, int score) throws Exception {
		String sql = "insert into carcrash value(null,?,?,null)";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1,player);
			pstat.setInt(2,score);
			return pstat.executeUpdate();
		}
	}
	
	public int deleteAll() throws Exception {
		String sql = "delete from carcrash";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			return pstat.executeUpdate();
		}
	}
	
	public void insertTop10Rank(List<CarCrashDTO> top10List) throws Exception {
	    String insertSQL = "INSERT INTO carcrashhistory (seq, player, score, played_time) VALUES (null, ?, ?, ?)";
	    
	    try (Connection con = this.getConnection(); 
	         PreparedStatement pstmt = con.prepareStatement(insertSQL)) {
	        
	        for (CarCrashDTO dto : top10List) {
	            pstmt.setString(1, dto.getPlayer());
	            pstmt.setInt(2, dto.getScore());
	            pstmt.setTimestamp(3, dto.getPlayed_time());
	            
	            pstmt.executeUpdate(); 
	        }
	    }
	}
	
	
	public List<CarCrashDTO> top10Rank() throws Exception{
		String sql = "SELECT ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num, player, score, played_time "
				+ "FROM carcrash "
				+ "GROUP BY player, score, played_time "
				+ "ORDER BY score DESC LIMIT 10";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			try (ResultSet rs = pstat.executeQuery()){
				List<CarCrashDTO> list = new ArrayList<>();
				while(rs.next()) {
					int rownum = rs.getInt(1);
					String player = rs.getString(2);
					int score = rs.getInt(3);
					Timestamp played_time = rs.getTimestamp(4);
					list.add(new CarCrashDTO(rownum,player,score,played_time)); 
				}
				return list;
			}
		}
	}
	
	
}
