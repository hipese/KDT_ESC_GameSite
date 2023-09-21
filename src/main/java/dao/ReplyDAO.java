package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ReplyDTO;


public class ReplyDAO {
	private static ReplyDAO instantce;
	
	public static ReplyDAO getInstance() {
		if(instantce==null) {
			instantce=new ReplyDAO();
		}
		return instantce;
	}
	
	public Connection getConnection() throws Exception{
		Context ctx=new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public int writeReply(ReplyDTO dto) throws  Exception {
		String sql="insert into reply values(null,?,?,?,?)";
		try(Connection con=this.getConnection();
			PreparedStatement pstat=con.prepareStatement(sql);){
			pstat.setString(1,dto.getWriter());
			pstat.setString(2,dto.getContents());
			pstat.setTimestamp(3, dto.getWrite_date());
			pstat.setInt(4,dto.getParent_seq());
			
			return pstat.executeUpdate();
		}
	}
	
	public boolean isReplyExist(int parentSeq) throws Exception {
		String sql="select seq from reply where parent_seq =?";
		try(Connection con=this.getConnection();
			PreparedStatement pstat=con.prepareStatement(sql);){
			pstat.setInt(1, parentSeq);
			ResultSet rs = pstat.executeQuery();
			return rs.next();
		}
	}
	
	public List<ReplyDTO> selectAll() throws Exception{
		String sql="select * from reply";
		try (Connection con = this.getConnection();
				PreparedStatement stat = con.prepareStatement(sql);
				ResultSet rs=stat.executeQuery();){
			List<ReplyDTO>list =new ArrayList<>();
			while(rs.next()) {
				int seq=rs.getInt(1);
				String writer=rs.getString(2);
				String contents=rs.getString(3);
				Timestamp date=rs.getTimestamp(4);
				int parentseq=rs.getInt(5);
				list.add(new ReplyDTO(seq, writer, contents,date,parentseq));
			}
			return list;
		}
	}
	
	public int deleteReply(int seq) throws Exception {
		String sql="delete from reply where seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);
			return pstat.executeUpdate();
		}
	}
	
	public int upDateContents(int seq, String contents) throws Exception {
		String sql = "update reply set contents=? where seq=? ";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, contents);
			pstat.setInt(2, seq);
			return pstat.executeUpdate();
		}
	}
	
	public List<ReplyDTO> selectReply(int seq) throws Exception{
		String sql="select * from reply  where parent_seq=?";
		try (Connection con = this.getConnection();
			PreparedStatement stat = con.prepareStatement(sql);){
			stat.setInt(1, seq);
			List<ReplyDTO>list =new ArrayList<>();
			ResultSet rs=stat.executeQuery();
			while(rs.next()) {
				int pseq=rs.getInt(1);
				String writer=rs.getString(2);
				String contents=rs.getString(3);
				Timestamp date=rs.getTimestamp(4);
				int parentseq=rs.getInt(5);
				list.add(new ReplyDTO(pseq, writer, contents,date,parentseq));
			}
			return list;
		}
	}
	
	public int countReply(int parent_seq) throws Exception {
		String sql = "SELECT count(*)FROM reply where parent_seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1,parent_seq);
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getInt(1);
		}
	}
}
