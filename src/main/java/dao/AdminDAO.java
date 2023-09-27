package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MembersDTO;
import dto.UserManageDTO;

public class AdminDAO {
	public static AdminDAO instance;

	public synchronized static AdminDAO getInstance() {
		if (instance == null) {
			instance = new AdminDAO();
		}
		return instance;
	}

	private AdminDAO() {
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	public MembersDTO mypage(String id) throws Exception {
		String sql = "select * from members where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery()) {
				while (rs.next()) {
					String ids = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String zipcode = rs.getString("zipcode");
					String address1 = rs.getString("address1");
					String address2 = rs.getString("address2");
					Timestamp signup_date = rs.getTimestamp("signup_date");
					String profile = rs.getString("profile");
					boolean isadmin = rs.getBoolean("isAdmin");
					return new MembersDTO(ids, pw, name, phone, email, zipcode, address1, address2, signup_date,
							profile, isadmin);
				}

			}
			return new MembersDTO("0", "0", "0", "0", "0", "0", "0", "0", null, "0");
		}
	}

	public int userBan(String id) throws Exception {
		String sql = "update user_management set isbanned=true where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);

			return pstat.executeUpdate();
		}
	}
	
	public int userBancancel(String id) throws Exception {
		String sql = "update user_management set isbanned=false where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);

			return pstat.executeUpdate();
		}
	}
	
	public boolean isBan(String id) throws Exception {
		String sql = "select isbanned from user_management where id=?";
		try (Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery()) {
				while(rs.next()) {
					boolean isbanned = rs.getBoolean("isbanned");
					return isbanned;
				}
				return false;
			}
		}
	}
}
