package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FilesDTO;

public class FilesDAO {
	private static FilesDAO instance;

	public static FilesDAO getInstance() {
		if (instance == null) {
			instance = new FilesDAO();
		}
		return instance;
	}

	private FilesDAO() {

	}

	private Connection getConnection() throws Exception {

		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();

	}

	public int insert(FilesDTO dto) throws Exception {

		String sql = "insert into files values(?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, dto.getSeq());
			pstat.setString(2, dto.getOri_name());
			pstat.setString(3, dto.getSys_name());
			pstat.setInt(4, dto.getParent_seq());
			return pstat.executeUpdate();
		}
	}

	public int adminInsert(FilesDTO dto) throws Exception {

		String sql = "insert into adminfiles values(?,?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, dto.getSeq());
			pstat.setString(2, dto.getOri_name());
			pstat.setString(3, dto.getSys_name());
			pstat.setInt(4, dto.getParent_seq());
			return pstat.executeUpdate();
		}
	}

	public List<FilesDTO> selectAll(int parent_seq) throws Exception {
		String sql = "select * from files where parent_seq like ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parent_seq);
			ResultSet rs = pstat.executeQuery();
			List<FilesDTO> result = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String ori_name = rs.getString(2);
				String sys_name = rs.getString(3);
				int parent_seq2 = rs.getInt(4);
				FilesDTO dto = new FilesDTO(seq, ori_name, sys_name, parent_seq2);
				result.add(dto);
			}
			return result;
		}
	}

	public List<FilesDTO> adminSelectAll(int parent_seq) throws Exception {
		String sql = "select * from adminfiles where parent_seq like ?";

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parent_seq);
			ResultSet rs = pstat.executeQuery();
			List<FilesDTO> result = new ArrayList<>();
			while (rs.next()) {
				int seq = rs.getInt(1);
				String ori_name = rs.getString(2);
				String sys_name = rs.getString(3);
				int parent_seq2 = rs.getInt(4);
				FilesDTO dto = new FilesDTO(seq, ori_name, sys_name, parent_seq2);
				result.add(dto);
			}
			return result;
		}
	}
}
