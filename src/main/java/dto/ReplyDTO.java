package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ReplyDTO {
	private int seq;
	private String writer;
	private String contents;
	private Timestamp write_date;
	private int parent_seq;
	
	
	public ReplyDTO() {}
	
	
	public ReplyDTO(int seq, String writer, String contents, Timestamp write_date, int parent_seq) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.parent_seq = parent_seq;
	}
	
	
	public String getFormedSignupData() {
		long currentTime = System.currentTimeMillis();
		long signup = this.write_date.getTime();

		long gapTime = currentTime - signup;

		if (gapTime < 60000) {
			return gapTime / 1000 + "초 전";
		} else if (gapTime < 60000 * 60) {
			return gapTime / 60000 + "분 전";
		} else if (gapTime < 60000 * 60 * 24) {
			return gapTime / (60000 * 60) + "시간 전";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
			return sdf.format(getWrite_date());
		}
	}
	
	
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	
}
