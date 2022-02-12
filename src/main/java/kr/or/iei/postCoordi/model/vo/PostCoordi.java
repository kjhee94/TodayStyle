package kr.or.iei.postCoordi.model.vo;

import java.sql.Date;

public class PostCoordi {
	
	private int coordiNo;
	private String nickName;
	private String profileFilePath;
	private String follow;
	private int coordiLike;
	private int coordiScrap;
	private String temperature;
	private String season;
	private String gender;
	private String coordiContent;
	private String categoryName;
	private String categoryCode;
	private String brand;
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
	
	public PostCoordi() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostCoordi(int coordiNo, String nickName, String profileFilePath, String follow, int coordiLike,
			int coordiScrap, String temperature, String season, String gender, String coordiContent,
			String categoryName, String categoryCode, String brand, String filePath, String hashtag, char delYN,
			int cmtNo, String cmtWriter, String cmtContent, String cmtParent, String cmtDepth, String cmtSEQ,
			String cmtDelYN, Date cmtTime, Date postTime) {
		super();
		this.coordiNo = coordiNo;
		this.nickName = nickName;
		this.profileFilePath = profileFilePath;
		this.follow = follow;
		this.coordiLike = coordiLike;
		this.coordiScrap = coordiScrap;
		this.temperature = temperature;
		this.season = season;
		this.gender = gender;
		this.coordiContent = coordiContent;
		this.categoryName = categoryName;
		this.categoryCode = categoryCode;
		this.brand = brand;
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

	public int getCoordiNo() {
		return coordiNo;
	}

	public void setCoordiNo(int coordiNo) {
		this.coordiNo = coordiNo;
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

	public int getCoordiLike() {
		return coordiLike;
	}

	public void setCoordiLike(int coordiLike) {
		this.coordiLike = coordiLike;
	}

	public int getCoordiScrap() {
		return coordiScrap;
	}

	public void setCoordiScrap(int coordiScrap) {
		this.coordiScrap = coordiScrap;
	}

	public String getTemperature() {
		return temperature;
	}

	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}

	public String getSeason() {
		return season;
	}

	public void setSeason(String season) {
		this.season = season;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCoordiContent() {
		return coordiContent;
	}

	public void setCoordiContent(String coordiContent) {
		this.coordiContent = coordiContent;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
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