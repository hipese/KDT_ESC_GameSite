package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.AdminBoardDTO;

public class AdminBoardDAO {
	private static AdminBoardDAO instance;

	public static AdminBoardDAO getInstance() {
		if (instance == null) {
			instance = new AdminBoardDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	public int getRecordCount() throws Exception {
		String sql = "select count(*) from adminboard";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}

	public int getSearchRecordCount(String searchText) throws Exception {
		String sql = "SELECT count(*)\r\n" + "FROM adminboard\r\n"
				+ "WHERE title LIKE ? OR writer LIKE ? OR contents Like ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchText + "%");
			pstat.setString(2, "%" + searchText + "%");
			pstat.setString(3, "%" + searchText + "%");
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}

	public List<AdminBoardDTO> selectBy(int start, int end) throws Exception {
		String sql = "select * from " + "(select " + "row_number() over(order by seq desc) as rs , adminboard.* from "
				+ "adminboard) temp " + "where rs between ? and ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			List<AdminBoardDTO> list = new ArrayList<>();
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try (ResultSet rs = pstat.executeQuery();) {
				while (rs.next()) {
					AdminBoardDTO dto = new AdminBoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setWriter(rs.getString("writer"));
					dto.setTitle(rs.getString("title"));
					dto.setContents(rs.getString("contents"));
					dto.setWrite_date(rs.getTimestamp("write_date"));
					dto.setView_count(rs.getInt("view_count"));
					list.add(dto);
				}
				return list;
			}
		}
	}

	public int writeWord(AdminBoardDTO dto) throws Exception {
		String sql = "insert into adminboard values(null,?,?,?,?,?)";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);) {
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContents());
			pstat.setTimestamp(4, dto.getWrite_date());
			pstat.setInt(5, dto.getView_count());
			pstat.executeUpdate();
			try(ResultSet rs=pstat.getGeneratedKeys()){
				rs.next();
				return rs.getInt(1);
			}
		}

	}

	public List<AdminBoardDTO> getBoardList() throws Exception {
		String sql = "select * from adminboard order by seq desc";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()) {
			List<AdminBoardDTO> list = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String writer = rs.getString(2);
				String title = rs.getString(3);
				String contents = rs.getString(4);
				Timestamp write_date = rs.getTimestamp(5);
				int view_count = rs.getInt(6);

				list.add(new AdminBoardDTO(seq, writer, title, contents, write_date, view_count));
			}
			return list;
		}
	}

	public AdminBoardDTO showContents(int seq) throws Exception {
		String sql = "select * from adminboard where seq like ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			ResultSet rs = pstat.executeQuery();
			while (rs.next()) {
				int seq2 = rs.getInt(1);
				String writer = rs.getString(2);
				String title = rs.getString(3);
				String contents = rs.getString(4);
				Timestamp write_date = rs.getTimestamp(5);
				int view_count = rs.getInt(6);

				return new AdminBoardDTO(seq2, writer, title, contents, write_date, view_count);
			}

		}
		return null;
	}

	public int updateContents(String seq, String title, String contents) throws Exception {
	    String sql = "UPDATE adminboard SET title=?, contents=? WHERE seq=?";
	    try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
	        pstat.setString(1, title);
	        pstat.setString(2, contents);
	        pstat.setString(3, seq);
	        return pstat.executeUpdate();
	    }
	}


	public int upView_Count(int seq) throws Exception {
		String sql = "update adminboard set view_count=view_count+1 where seq=?";
		System.out.println("업");
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			return pstat.executeUpdate();
		}
	}

	public int deleteContents(int seq) throws Exception {
		String sql = "delete from adminboard where seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			return pstat.executeUpdate();
		}

	}

	public List<AdminBoardDTO> searchContents(String searchText, int start, int end) throws Exception {
		String sql = "SELECT * \r\n" + "FROM (\r\n" + "  SELECT \r\n"
				+ "    row_number() OVER (ORDER BY seq DESC) AS rs, \r\n" + "    adminboard.* \r\n" + "  FROM adminboard\r\n"
				+ "  WHERE title LIKE ? OR writer LIKE ? OR contents LIKE ?\r\n" + ") AS temp\r\n"
				+ "WHERE temp.rs BETWEEN ? AND ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchText + "%");
			pstat.setString(2, "%" + searchText + "%");
			pstat.setString(3, "%" + searchText + "%");
			pstat.setInt(4, start);
			pstat.setInt(5, end);

			List<AdminBoardDTO> searchList = new ArrayList<>();
			try (ResultSet rs = pstat.executeQuery();) {
				while (rs.next()) {
					AdminBoardDTO dto = new AdminBoardDTO();
					dto.setSeq(rs.getInt("seq"));
					dto.setWriter(rs.getString("writer"));
					dto.setTitle(rs.getString("title"));
					dto.setContents(rs.getString("contents"));
					dto.setWrite_date(rs.getTimestamp("write_date"));
					dto.setView_count(rs.getInt("view_count"));
					searchList.add(dto);
				}
				return searchList;
			}

		}
	}

	public boolean isExistTest(String searchText) throws Exception {
		String sql = "SELECT *\r\n" + "FROM adminboard\r\n" + "WHERE title LIKE ? OR writer LIKE ? OR contents Like ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, "%" + searchText + "%");
			pstat.setString(2, "%" + searchText + "%");
			pstat.setString(3, "%" + searchText + "%");
			ResultSet rs = pstat.executeQuery();
			return rs.next();

		}
	}
}
