package kr.or.iei.postItItem.model.vo;

import java.util.Date;

public class PostItItem {
	
	private String nickName;
	private String profileFilePath;
	private String follow;
	private int itLike;
	private int itScrap;
	private String gender;
	private String category;
	private String brand;
	private String itName;
	private String itColor;
	private String itSize;
	private int userHeight;
	private String userSize;
	private String filePath;
	private String hashtag;
	private char delYN;
	private int cmtNo;
	private String cmtWriter;
	private String cmtContent;
	private String cmtParent;
	private String cmtDepth;
	private String cmtSEQ;
	private String cmtDelYN;
	private Date CmtTime;
	private Date PostTime;
	
	
	
	public PostItItem() {
		super();
		// TODO Auto-generated constructor stub
	}



	public PostItItem(String nickName, String profileFilePath, String follow, int itLike, int itScrap, String gender,
			String category, String brand, String itName, String itColor, String itSize, int userHeight,
			String userSize, String filePath, String hashtag, char delYN, int cmtNo, String cmtWriter,
			String cmtContent, String cmtParent, String cmtDepth, String cmtSEQ, String cmtDelYN, Date cmtTime,
			Date postTime) {
		super();
		this.nickName = nickName;
		this.profileFilePath = profileFilePath;
		this.follow = follow;
		this.itLike = itLike;
		this.itScrap = itScrap;
		this.gender = gender;
		this.category = category;
		this.brand = brand;
		this.itName = itName;
		this.itColor = itColor;
		this.itSize = itSize;
		this.userHeight = userHeight;
		this.userSize = userSize;
		this.filePath = filePath;
		this.hashtag = hashtag;
		this.delYN = delYN;
		this.cmtNo = cmtNo;
		this.cmtWriter = cmtWriter;
		this.cmtContent = cmtContent;
		this.cmtParent = cmtParent;
		this.cmtDepth = cmtDepth;
		this.cmtSEQ = cmtSEQ;
		this.cmtDelYN = cmtDelYN;
		CmtTime = cmtTime;
		PostTime = postTime;
	}



	public String getNickName() {
		return nickName;
	}



	public void setNickName(String nickName) {
		this.nickName = nickName;
	}



	public String getProfileFilePath() {
		return profileFilePath;
	}



	public void setProfileFilePath(String profileFilePath) {
		this.profileFilePath = profileFilePath;
	}



	public String getFollow() {
		return follow;
	}



	public void setFollow(String follow) {
		this.follow = follow;
	}



	public int getItLike() {
		return itLike;
	}



	public void setItLike(int itLike) {
		this.itLike = itLike;
	}



	public int getItScrap() {
		return itScrap;
	}



	public void setItScrap(int itScrap) {
		this.itScrap = itScrap;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public String getBrand() {
		return brand;
	}



	public void setBrand(String brand) {
		this.brand = brand;
	}



	public String getItName() {
		return itName;
	}



	public void setItName(String itName) {
		this.itName = itName;
	}



	public String getItColor() {
		return itColor;
	}



	public void setItColor(String itColor) {
		this.itColor = itColor;
	}



	public String getItSize() {
		return itSize;
	}



	public void setItSize(String itSize) {
		this.itSize = itSize;
	}



	public int getUserHeight() {
		return userHeight;
	}



	public void setUserHeight(int userHeight) {
		this.userHeight = userHeight;
	}



	public String getUserSize() {
		return userSize;
	}



	public void setUserSize(String userSize) {
		this.userSize = userSize;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public String getHashtag() {
		return hashtag;
	}



	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}



	public char getDelYN() {
		return delYN;
	}



	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}



	public int getCmtNo() {
		return cmtNo;
	}



	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}



	public String getCmtWriter() {
		return cmtWriter;
	}



	public void setCmtWriter(String cmtWriter) {
		this.cmtWriter = cmtWriter;
	}



	public String getCmtContent() {
		return cmtContent;
	}



	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}



	public String getCmtParent() {
		return cmtParent;
	}



	public void setCmtParent(String cmtParent) {
		this.cmtParent = cmtParent;
	}



	public String getCmtDepth() {
		return cmtDepth;
	}



	public void setCmtDepth(String cmtDepth) {
		this.cmtDepth = cmtDepth;
	}



	public String getCmtSEQ() {
		return cmtSEQ;
	}



	public void setCmtSEQ(String cmtSEQ) {
		this.cmtSEQ = cmtSEQ;
	}



	public String getCmtDelYN() {
		return cmtDelYN;
	}



	public void setCmtDelYN(String cmtDelYN) {
		this.cmtDelYN = cmtDelYN;
	}



	public Date getCmtTime() {
		return CmtTime;
	}



	public void setCmtTime(Date cmtTime) {
		CmtTime = cmtTime;
	}



	public Date getPostTime() {
		return PostTime;
	}



	public void setPostTime(Date postTime) {
		PostTime = postTime;
	}
	
	
	
	
	
	
}
