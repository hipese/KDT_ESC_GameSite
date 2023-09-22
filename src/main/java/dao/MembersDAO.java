package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.EncryptionUtils;
import dto.MembersDTO;

public class MembersDAO {
    public static MembersDAO instance;
	public synchronized static MembersDAO getInstance() {
		if(instance == null) {
			instance = new MembersDAO();
		}
		return instance;
	}
	private MembersDAO() {}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	public int insert(MembersDTO dto) throws Exception{
        String sql = "insert into members values(?,?,?,?,?,?,?,?,?)";
        try(Connection con = this.getConnection();
                PreparedStatement pstat = con.prepareStatement(sql);){
            pstat.setString(1, dto.getId());
            pstat.setString(2, dto.getPw());
            pstat.setString(3, dto.getName());
            pstat.setString(4, dto.getPhone());
            pstat.setString(5, dto.getEmail());
            pstat.setString(6, dto.getZipcode());
            pstat.setString(7, dto.getAddress1());
            pstat.setString(8, dto.getAddress2());
            pstat.setTimestamp(9, dto.getSignup_date());
            int result = pstat.executeUpdate();
            return result;
        }
    }
	public Boolean isIdExist (MembersDTO dto) throws Exception {
		String sql = "select * from members where id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			
			pstat.setString(1, dto.getId());
			
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	public boolean login(String id,String pw)throws Exception{
	      String sql = "select * from members where id=? and pw=?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setString(1, id);
	         pstat.setString(2, pw);
	         try(ResultSet rs = pstat.executeQuery();){
	            return  rs.next();
	         }   
	      }
	   }
	public MembersDTO mypage(String id) throws Exception {
		String sql = "select * from members where id=?";

		try (Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			try (ResultSet rs = pstat.executeQuery()) {
				while(rs.next()) {
					String ids = rs.getString("id");
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String zipcode = rs.getString("zipcode");
					String address1 = rs.getString("address1");
					String address2 = rs.getString("address2");
					Timestamp signup_date = rs.getTimestamp("signup_date");
					return new MembersDTO(ids,pw,name,phone,email,zipcode,address1,address2,signup_date);
				}
				
			}return new MembersDTO("0","0","0","0","0","0","0","0",null);
		}
	}

	public int update(String id, String name, String phone, String email, String zipcode, String address1, String address2) throws Exception{
		String sql = "update members set name=? , phone=? , email=? , zipcode=? ,address1=?, address2=? where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, name);
			pstat.setString(2, phone);
			pstat.setString(3, email);
			pstat.setString(4, zipcode);
			pstat.setString(5, address1);
			pstat.setString(6, address2);
			pstat.setString(7, id);
			
			return pstat.executeUpdate();
		}
	}
	
	public String findId(String email,String name) throws Exception {
		String sql = "select id from members where email=? and name=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1,email);
			pstat.setString(2,name);
			try (ResultSet rs = pstat.executeQuery()){
				while(rs.next()) {
					String memberId = rs.getString(1);
					return memberId.substring(0,memberId.length()-2)+"**";
				}
				
			}
		}
		return null;
	}
	
	public boolean tempPwCondition(String id, String email, String name) throws Exception {
		String sql = "select * from members where id = ? and email = ? and name=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1,id);
			pstat.setString(2, email);
			pstat.setString(3, name);
			try (ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}	
		}
	} 
	
	public int updateTempPw(String pw, String id, String email, String name) throws SQLException, Exception {
		String sql = "update members set pw = ? where id = ? and email = ? and name=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, EncryptionUtils.getSHA512(pw));
			pstat.setString(2, id);
			pstat.setString(3, email);
			pstat.setString(4, name);
			return pstat.executeUpdate();
		}
	}
	
	public int delete(String id) throws SQLException, Exception {
		String sql = "delete from members where id=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, id);
			return pstat.executeUpdate();
		}
	}
	
	public int changePW(String pw1, String pw2) throws SQLException, Exception {
		String sql = "update members set pw = ? where pw = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, pw2);
			pstat.setString(2, pw1);
			return pstat.executeUpdate();
		}
	}

}
