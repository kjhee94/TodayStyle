package kr.or.iei.myPage.model.vo;

public class ScrapItTemList {
	
	private int itTemScrapNo;
	private int itTemNo;
	private String itTemUserId;
	private String itTemFilepath;
	private String profileFilepath;
	private String itTemNickname;
	
	
	public ScrapItTemList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScrapItTemList(int itTemScrapNo, int itTemNo, String itTemUserId, String itTemFilepath,
			String profileFilepath, String itTemNickname) {
		super();
		this.itTemScrapNo = itTemScrapNo;
		this.itTemNo = itTemNo;
		this.itTemUserId = itTemUserId;
		this.itTemFilepath = itTemFilepath;
		this.profileFilepath = profileFilepath;
		this.itTemNickname = itTemNickname;
	}
	public int getItTemScrapNo() {
		return itTemScrapNo;
	}
	public void setItTemScrapNo(int itTemScrapNo) {
		this.itTemScrapNo = itTemScrapNo;
	}
	public int getItTemNo() {
		return itTemNo;
	}
	public void setItTemNo(int itTemNo) {
		this.itTemNo = itTemNo;
	}
	public String getItTemUserId() {
		return itTemUserId;
	}
	public void setItTemUserId(String itTemUserId) {
		this.itTemUserId = itTemUserId;
	}
	public String getItTemFilepath() {
		return itTemFilepath;
	}
	public void setItTemFilepath(String itTemFilepath) {
		this.itTemFilepath = itTemFilepath;
	}
	public String getProfileFilepath() {
		return profileFilepath;
	}
	public void setProfileFilepath(String profileFilepath) {
		this.profileFilepath = profileFilepath;
	}
	public String getItTemNickname() {
		return itTemNickname;
	}
	public void setItTemNickname(String itTemNickname) {
		this.itTemNickname = itTemNickname;
	}
	@Override
	public String toString() {
		return "ScrapItTemList [itTemScrapNo=" + itTemScrapNo + ", itTemNo=" + itTemNo + ", itTemUserId=" + itTemUserId
				+ ", itTemFilepath=" + itTemFilepath + ", profileFilepath=" + profileFilepath + ", itTemNickname="
				+ itTemNickname + "]";
	}
	
	
}
