package kr.or.iei.myPage.model.vo;

import java.sql.Date;

public class Comments {
	
	private int postNo;
	private int cmtNo;
	private String cmtContent;
	private Date cmtTime;
	private String postContent;
	private String postFilepath;
	private int cmtNum;
	
	
	
	
	public Comments() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Comments(int postNo, int cmtNo, String cmtContent, Date cmtTime, String postContent, String postFilepath,
			int cmtNum) {
		super();
		this.postNo = postNo;
		this.cmtNo = cmtNo;
		this.cmtContent = cmtContent;
		this.cmtTime = cmtTime;
		this.postContent = postContent;
		this.postFilepath = postFilepath;
		this.cmtNum = cmtNum;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getCmtNo() {
		return cmtNo;
	}
	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}
	public String getCmtContent() {
		return cmtContent;
	}
	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}
	public Date getCmtTime() {
		return cmtTime;
	}
	public void setCmtTime(Date cmtTime) {
		this.cmtTime = cmtTime;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostFilepath() {
		return postFilepath;
	}
	public void setPostFilepath(String postFilepath) {
		this.postFilepath = postFilepath;
	}
	public int getCmtNum() {
		return cmtNum;
	}
	public void setCmtNum(int cmtNum) {
		this.cmtNum = cmtNum;
	}
	@Override
	public String toString() {
		return "Comments [postNo=" + postNo + ", cmtNo=" + cmtNo + ", cmtContent=" + cmtContent + ", cmtTime=" + cmtTime
				+ ", postContent=" + postContent + ", postFilepath=" + postFilepath + ", cmtNum=" + cmtNum + "]";
	}

	
}
