package kr.or.iei.beststyle.model.vo;

import java.sql.Date;

public class Beststyle {
	private int coordiNo;
	private String userId;
	private String nickname;
	private String coordiContent;
	private String gender;
	private String season;
	private String temperature;
	private Date regdate;
	private String hashtag;
	private char delYN;
	private String likeNum;
	private String coordifilepath;
	private String profilefilepath;
	private char topYN;
	
	
	
	
	@Override
	public String toString() {
		return "Beststyle [coordiNo=" + coordiNo + ", userId=" + userId + ", nickname=" + nickname + ", coordiContent="
				+ coordiContent + ", gender=" + gender + ", season=" + season + ", temperature=" + temperature
				+ ", regdate=" + regdate + ", hashtag=" + hashtag + ", delYN=" + delYN + ", likeNum=" + likeNum
				+ ", coordifilepath=" + coordifilepath + ", profilefilepath=" + profilefilepath + ", topYN=" + topYN
				+ "]";
	}
	public Beststyle() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Beststyle(int coordiNo, String userId, String nickname, String coordiContent, String gender, String season,
			String temperature, Date regdate, String hashtag, char delYN, String likeNum, String coordifilepath,
			String profilefilepath, char topYN) {
		super();
		this.coordiNo = coordiNo;
		this.userId = userId;
		this.nickname = nickname;
		this.coordiContent = coordiContent;
		this.gender = gender;
		this.season = season;
		this.temperature = temperature;
		this.regdate = regdate;
		this.hashtag = hashtag;
		this.delYN = delYN;
		this.likeNum = likeNum;
		this.coordifilepath = coordifilepath;
		this.profilefilepath = profilefilepath;
		this.topYN = topYN;
	}
	public int getCoordiNo() {
		return coordiNo;
	}
	public void setCoordiNo(int coordiNo) {
		this.coordiNo = coordiNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCoordiContent() {
		return coordiContent;
	}
	public void setCoordiContent(String coordiContent) {
		this.coordiContent = coordiContent;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public String getTemperature() {
		return temperature;
	}
	public void setTemperature(String temperature) {
		this.temperature = temperature;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
	public String getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(String likeNum) {
		this.likeNum = likeNum;
	}
	public String getCoordifilepath() {
		return coordifilepath;
	}
	public void setCoordifilepath(String coordifilepath) {
		this.coordifilepath = coordifilepath;
	}
	public String getProfilefilepath() {
		return profilefilepath;
	}
	public void setProfilefilepath(String profilefilepath) {
		this.profilefilepath = profilefilepath;
	}
	public char getTopYN() {
		return topYN;
	}
	public void setTopYN(char topYN) {
		this.topYN = topYN;
	}
	
	
	
	
	
	
	
}
