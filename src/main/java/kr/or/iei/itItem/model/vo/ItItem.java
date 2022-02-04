package kr.or.iei.itItem.model.vo;

import java.sql.Date;

public class ItItem {
	
	private int itItemNo;
	private String userId;
	private String itItemTitle;
	private String itItemContent;
	private String itItemName;
	private String itItemColor;
	private String itItemSize;
	private String itItembrand;
	private String hashTag;
	private String itemCode;
	private String userSize;
	private int userHeight;
	private Date regDate;
	private char delYN;
	private String itItemImgOriginalName;
	private String itItemImgChangedName;
	private String filePath;
	private String nickName;
	private String itemName;
	private String profileFilePath;
	
	public ItItem() {
		super();
	}
	
	

	public ItItem(int itItemNo, String userId, String itItemTitle, String itItemContent, String itItemName,
			String itItemColor, String itItemSize, String itItembrand, String hashTag, String itemCode, String userSize,
			int userHeight, Date regDate, char delYN, String itItemImgOriginalName, String itItemImgChangedName,
			String filePath, String nickName, String itemName, String profileFilePath) {
		super();
		this.itItemNo = itItemNo;
		this.userId = userId;
		this.itItemTitle = itItemTitle;
		this.itItemContent = itItemContent;
		this.itItemName = itItemName;
		this.itItemColor = itItemColor;
		this.itItemSize = itItemSize;
		this.itItembrand = itItembrand;
		this.hashTag = hashTag;
		this.itemCode = itemCode;
		this.userSize = userSize;
		this.userHeight = userHeight;
		this.regDate = regDate;
		this.delYN = delYN;
		this.itItemImgOriginalName = itItemImgOriginalName;
		this.itItemImgChangedName = itItemImgChangedName;
		this.filePath = filePath;
		this.nickName = nickName;
		this.itemName = itemName;
		this.profileFilePath = profileFilePath;
	}



	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	
	
	
	public String getItemName() {
		return itemName;
	}


	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getProfileFilePath() {
		return profileFilePath;
	}


	public void setProfileFilePath(String profileFilePath) {
		this.profileFilePath = profileFilePath;
	}


	public int getItItemNo() {
		return itItemNo;
	}
	public void setItItemNo(int itItemNo) {
		this.itItemNo = itItemNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getItItemTitle() {
		return itItemTitle;
	}
	public void setItItemTitle(String itItemTitle) {
		this.itItemTitle = itItemTitle;
	}
	public String getItItemContent() {
		return itItemContent;
	}
	public void setItItemContent(String itItemContent) {
		this.itItemContent = itItemContent;
	}
	public String getItItemName() {
		return itItemName;
	}
	public void setItItemName(String itItemName) {
		this.itItemName = itItemName;
	}
	public String getItItemColor() {
		return itItemColor;
	}
	public void setItItemColor(String itItemColor) {
		this.itItemColor = itItemColor;
	}
	public String getItItemSize() {
		return itItemSize;
	}
	public void setItItemSize(String itItemSize) {
		this.itItemSize = itItemSize;
	}
	public String getItItembrand() {
		return itItembrand;
	}
	public void setItItembrand(String itItembrand) {
		this.itItembrand = itItembrand;
	}
	public String getHashTag() {
		return hashTag;
	}
	public void setHashTag(String hashTag) {
		this.hashTag = hashTag;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getUserSize() {
		return userSize;
	}
	public void setUserSize(String userSize) {
		this.userSize = userSize;
	}
	public int getUserHeight() {
		return userHeight;
	}
	public void setUserHeight(int userHeight) {
		this.userHeight = userHeight;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public char getDelYN() {
		return delYN;
	}
	public void setDelYN(char delYN) {
		this.delYN = delYN;
	}
	public String getItItemImgOriginalName() {
		return itItemImgOriginalName;
	}
	public void setItItemImgOriginalName(String itItemImgOriginalName) {
		this.itItemImgOriginalName = itItemImgOriginalName;
	}
	public String getItItemImgChangedName() {
		return itItemImgChangedName;
	}
	public void setItItemImgChangedName(String itItemImgChangedName) {
		this.itItemImgChangedName = itItemImgChangedName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	
	
}
