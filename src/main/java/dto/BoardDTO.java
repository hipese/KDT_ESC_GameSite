package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardDTO {
	private int seq;
	private String writer;
	private String title;
	private String contents;
	private Timestamp write_date;
	private int view_count;
	private int like;
	private int dislike;
	
	
	
	public BoardDTO() {}
	
	public BoardDTO(int seq, String writer, String title, String contents, Timestamp write_date, int view_count) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
	}
	
	public BoardDTO(int seq, String writer, String title, String contents, Timestamp write_date, int view_count, int like, int dislike) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.contents = contents;
		this.write_date = write_date;
		this.view_count = view_count;
		this.like = like;
		this.dislike = dislike;
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public int getLike() {
		return like;
	}
	public void setDislike(int like) {
		this.like = like;
	}
	public int getDislike() {
		return dislike;
	}
	public void setLike(int dislike) {
		this.dislike = dislike;
	}
}
