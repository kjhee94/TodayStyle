package kr.or.iei.postItItem.model.vo;

import java.sql.Date;

public class PostItItem {
	
	private int itItemNo;
	private String itItemTitle;
	private String userId;
	private String nickName;
	private String profileFilePath;
	private String follow;
	private int itLike;
	private int itScrap;
	private String gender;
	private String itContent;
	private String categoryName;
	private String categoryCode;
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
	private Date cmtTime;
	private Date postTime;
	
	public PostItItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostItItem(int itItemNo, String itItemTitle, String userId, String nickName, String profileFilePath,
			String follow, int itLike, int itScrap, String gender, String itContent, String categoryName,
			String categoryCode, String brand, String itName, String itColor, String itSize, int userHeight,
			String userSize, String filePath, String hashtag, char delYN, int cmtNo, String cmtWriter,
			String cmtContent, String cmtParent, String cmtDepth, String cmtSEQ, String cmtDelYN, Date cmtTime,
			Date postTime) {
		super();
		this.itItemNo = itItemNo;
		this.itItemTitle = itItemTitle;
		this.userId = userId;
		this.nickName = nickName;
		this.profileFilePath = profileFilePath;
		this.follow = follow;
		this.itLike = itLike;
		this.itScrap = itScrap;
		this.gender = gender;
		this.itContent = itContent;
		this.categoryName = categoryName;
		this.categoryCode = categoryCode;
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
		this.cmtTime = cmtTime;
		this.postTime = postTime;
	}

	public int getItItemNo() {
		return itItemNo;
	}

	public String getItItemTitle() {
		return itItemTitle;
	}

	public String getUserId() {
		return userId;
	}

	public String getNickName() {
		return nickName;
	}

	public String getProfileFilePath() {
		return profileFilePath;
	}

	public String getFollow() {
		return follow;
	}

	public int getItLike() {
		return itLike;
	}

	public int getItScrap() {
		return itScrap;
	}

	public String getGender() {
		return gender;
	}

	public String getItContent() {
		return itContent;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public String getBrand() {
		return brand;
	}

	public String getItName() {
		return itName;
	}

	public String getItColor() {
		return itColor;
	}

	public String getItSize() {
		return itSize;
	}

	public int getUserHeight() {
		return userHeight;
	}

	public String getUserSize() {
		return userSize;
	}

	public String getFilePath() {
		return filePath;
	}

	public String getHashtag() {
		return hashtag;
	}

	public char getDelYN() {
		return delYN;
	}

	public int getCmtNo() {
		return cmtNo;
	}

	public String getCmtWriter() {
		return cmtWriter;
	}

	public String getCmtContent() {
		return cmtContent;
	}

	public String getCmtParent() {
		return cmtParent;
	}

	public String getCmtDepth() {
		return cmtDepth;
	}

	public String getCmtSEQ() {
		return cmtSEQ;
	}

	public String getCmtDelYN() {
		return cmtDelYN;
	}

	public Date getCmtTime() {
		return cmtTime;
	}

	public Date getPostTime() {
		return postTime;
	}

	public void setItItemNo(int itItemNo) {
		this.itItemNo = itItemNo;
	}

	public void setItItemTitle(String itItemTitle) {
		this.itItemTitle = itItemTitle;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public void setProfileFilePath(String profileFilePath) {
		this.profileFilePath = profileFilePath;
	}

	public void setFollow(String follow) {
		this.follow = follow;
	}

	public void setItLike(int itLike) {
		this.itLike = itLike;
	}

	public void setItScrap(int itScrap) {
		this.itScrap = itScrap;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setItContent(String itContent) {
		this.itContent = itContent;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public void setItName(String itName) {
		this.itName = itName;
	}

	public void setItColor(String itColor) {
		this.itColor = itColor;
	}

	public void setItSize(String itSize) {
		this.itSize = itSize;
	}

	public void setUserHeight(int userHeight) {
		this.userHeight = userHeight;
	}

	public void setUserSize(String userSize) {
		this.userSize = userSize;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}

	public void setCmtNo(int cmtNo) {
		this.cmtNo = cmtNo;
	}

	public void setCmtWriter(String cmtWriter) {
		this.cmtWriter = cmtWriter;
	}

	public void setCmtContent(String cmtContent) {
		this.cmtContent = cmtContent;
	}

	public void setCmtParent(String cmtParent) {
		this.cmtParent = cmtParent;
	}

	public void setCmtDepth(String cmtDepth) {
		this.cmtDepth = cmtDepth;
	}

	public void setCmtSEQ(String cmtSEQ) {
		this.cmtSEQ = cmtSEQ;
	}

	public void setCmtDelYN(String cmtDelYN) {
		this.cmtDelYN = cmtDelYN;
	}

	public void setCmtTime(Date cmtTime) {
		this.cmtTime = cmtTime;
	}

	public void setPostTime(Date postTime) {
		this.postTime = postTime;
	}

}