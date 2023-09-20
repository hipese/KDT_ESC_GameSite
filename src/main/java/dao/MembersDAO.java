package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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
        String sql = "insert into gamemembers values(?,?,?,?,?,?,?,?,?)";
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
		String sql = "select * from gamemembers where id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			
			pstat.setString(1, dto.getId());
			
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	public boolean login(String id,String pw)throws Exception{
	      String sql = "select * from gamemembers where id=? and pw=?";
	      try(Connection con = this.getConnection();
	            PreparedStatement pstat = con.prepareStatement(sql);){
	         pstat.setString(1, id);
	         pstat.setString(2, pw);
	         try(ResultSet rs = pstat.executeQuery();){
	            return  rs.next();
	         }   
	      }
	   }

}
