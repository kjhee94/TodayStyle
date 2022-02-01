package kr.or.iei.board.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String title;
	private String content;
	private String userId;
	private Date regdate;
	private char endYN;
	private String userName;
	
	
	
	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", userId=" + userId
				+ ", regdate=" + regdate + ", endYN=" + endYN + ", userName=" + userName + "]";
	}
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int noticeNo, String title, String content, String userId, Date regdate, char endYN,
			String userName) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.regdate = regdate;
		this.endYN = endYN;
		this.userName = userName;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public char getEndYN() {
		return endYN;
	}
	public void setEndYN(char endYN) {
		this.endYN = endYN;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	

	
}
