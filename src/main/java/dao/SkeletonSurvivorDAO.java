package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.SkeletonSurvivorDTO;
import dto.WeekCounts;

public class SkeletonSurvivorDAO {
	private SkeletonSurvivorDAO() {}
	private static SkeletonSurvivorDAO instance;

	public static SkeletonSurvivorDAO getInstance() {
		if (instance == null) {
			instance = new SkeletonSurvivorDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public int writeGameResult(String player, int score) throws Exception {
		String sql = "insert into skeletonsurvivor value(null,?,?,default)";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1,player);
			pstat.setInt(2,score);
			return pstat.executeUpdate();
		}
	}
	
	public int deleteAll() throws Exception {
		String sql = "delete from skeletonsurvivor";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			return pstat.executeUpdate();
		}
	}
	
	public void insertTop10Rank(List<SkeletonSurvivorDTO> top10List) throws Exception {
	    String insertSQL = "INSERT INTO skeletonsurvivorhistory (seq, player, score, played_time) VALUES (null, ?, ?, ?)";
	    
	    try (Connection con = this.getConnection(); 
	         PreparedStatement pstmt = con.prepareStatement(insertSQL)) {
	        
	        for (SkeletonSurvivorDTO dto : top10List) {
	            pstmt.setString(1, dto.getPlayer());
	            pstmt.setInt(2, dto.getScore());
	            pstmt.setTimestamp(3, dto.getPlayed_time());
	            
	            pstmt.executeUpdate(); 
	        }
	    }
	}
	
	
	public List<SkeletonSurvivorDTO> top10Rank() throws Exception{
		String sql = "SELECT ROW_NUMBER() OVER (ORDER BY score DESC) AS row_num, player, score, played_time "
				+ "FROM skeletonsurvivor "
				+ "GROUP BY player, score, played_time "
				+ "ORDER BY score DESC LIMIT 10";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			try (ResultSet rs = pstat.executeQuery()){
				List<SkeletonSurvivorDTO> list = new ArrayList<>();
				while(rs.next()) {
					int rownum = rs.getInt(1);
					String player = rs.getString(2);
					int score = rs.getInt(3);
					Timestamp played_time = rs.getTimestamp(4);
					list.add(new SkeletonSurvivorDTO(rownum,player,score,played_time)); 
				}
				return list;
			}
		}
	}
	
	public List<WeekCounts> countWeekPlay() throws SQLException, Exception {
	    String sql = "SELECT DATE(played_time) AS play_date, COUNT(*) AS play_count "
	            + "FROM skeletonsurvivor "
	            + "GROUP BY play_date "
	            + "ORDER BY play_date "
	            + "LIMIT 7";

	    try (Connection con = this.getConnection();
	         PreparedStatement pstat = con.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	         ResultSet rs = pstat.executeQuery()) {
	        List<WeekCounts> list = new ArrayList<>();

	        // 현재 날짜 가져오기
	        Calendar calendar = Calendar.getInstance();
	        calendar.setTime(new Date());

	        // 7일 전의 날짜 계산
	        calendar.add(Calendar.DAY_OF_MONTH, -6); // 7일 전으로 설정

	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	        for (int i = 0; i < 7; i++) {
	            Date currentDate = calendar.getTime();
	            boolean dataFound = false;

	            while (rs.next()) {
	                java.sql.Date sqlDate = rs.getDate(1); // 날짜를 java.sql.Date로 가져옴
	                java.util.Date date = new java.util.Date(sqlDate.getTime()); // java.util.Date로 변환
	                int value = rs.getInt(2);

	                // 날짜가 일치하는 데이터를 찾았을 때
	                if (sdf.format(date).equals(sdf.format(currentDate))) {
	                	java.sql.Date currentDateSql = new java.sql.Date(currentDate.getTime());
	                	list.add(new WeekCounts(currentDateSql, value));
	                    dataFound = true;
	                    break;
	                }
	            }

	            // 데이터가 없는 경우 0으로 채우기
	            if (!dataFound) {
	            	java.sql.Date currentDateSql = new java.sql.Date(currentDate.getTime());
                	list.add(new WeekCounts(currentDateSql, 0));
	            }

	            // 날짜를 하루 뒤로 이동
	            calendar.add(Calendar.DAY_OF_MONTH, 1);

	            // 결과셋 커서를 처음으로 되돌리기
	            rs.beforeFirst();
	        }

	        return list;
	    }
	}
	
	public int countTodayPlay() throws Exception {
	    String sql = "SELECT COUNT(*) AS countTodayDate FROM skeletonsurvivor WHERE DATE(played_time) = CURDATE()";
	    try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
	        try (ResultSet rs = pstat.executeQuery()){
	            if (rs.next()) {
	                return rs.getInt("countTodayDate");
	            } else {
	                return 0; 
	            }
	        }
	    }
	}
	
	public int countAllPlays() throws Exception{
		String sql = "SELECT COUNT(*) AS countTodayDate FROM skeletonsurvivor";
	    try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
	        try (ResultSet rs = pstat.executeQuery()){
	            if (rs.next()) {
	                return rs.getInt("countTodayDate");
	            } else {
	                return 0; 
	            }
	        }
	    }
	}
}
