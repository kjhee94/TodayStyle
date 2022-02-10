package kr.or.iei.board.model.vo;

import java.sql.Date;

public class FAQ {
	private int faqNo;
	private String category;
	private String title;
	private String content;
	private String userId;
	private Date regdate;
	private char endYN;
	private String userName;
	
	
	
	@Override
	public String toString() {
		return "FAQ [faqNo=" + faqNo + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", userId=" + userId + ", regdate=" + regdate + ", endYN=" + endYN + "]";
	}
	public FAQ(int faqNo, String category, String title, String content, String userId, Date regdate, char endYN) {
		super();
		this.faqNo = faqNo;
		this.category = category;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.regdate = regdate;
		this.endYN = endYN;
	}
	public FAQ() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
