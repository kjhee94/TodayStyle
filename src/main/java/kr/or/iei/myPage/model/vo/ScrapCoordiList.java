package kr.or.iei.myPage.model.vo;

public class ScrapCoordiList {
	
	private int coordiScrapNo;
	private int coordiNo;
	private String coordiUserId;
	private String coordiFilepath;
	private String profileFilepath;
	private String coordiNickname;
	
	
	
	public ScrapCoordiList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ScrapCoordiList(int coordiScrapNo, int coordiNo, String coordiUserId, String coordiFilepath,
			String profileFilepath, String coordiNickname) {
		super();
		this.coordiScrapNo = coordiScrapNo;
		this.coordiNo = coordiNo;
		this.coordiUserId = coordiUserId;
		this.coordiFilepath = coordiFilepath;
		this.profileFilepath = profileFilepath;
		this.coordiNickname = coordiNickname;
	}
	public int getCoordiScrapNo() {
		return coordiScrapNo;
	}
	public void setCoordiScrapNo(int coordiScrapNo) {
		this.coordiScrapNo = coordiScrapNo;
	}
	public int getCoordiNo() {
		return coordiNo;
	}
	public void setCoordiNo(int coordiNo) {
		this.coordiNo = coordiNo;
	}
	public String getCoordiUserId() {
		return coordiUserId;
	}
	public void setCoordiUserId(String coordiUserId) {
		this.coordiUserId = coordiUserId;
	}
	public String getCoordiFilepath() {
		return coordiFilepath;
	}
	public void setCoordiFilepath(String coordiFilepath) {
		this.coordiFilepath = coordiFilepath;
	}
	public String getProfileFilepath() {
		return profileFilepath;
	}
	public void setProfileFilepath(String profileFilepath) {
		this.profileFilepath = profileFilepath;
	}
	public String getCoordiNickname() {
		return coordiNickname;
	}
	public void setCoordiNickname(String coordiNickname) {
		this.coordiNickname = coordiNickname;
	}
	@Override
	public String toString() {
		return "ScrapCoordiList [coordiScrapNo=" + coordiScrapNo + ", coordiNo=" + coordiNo + ", coordiUserId="
				+ coordiUserId + ", coordiFilepath=" + coordiFilepath + ", profileFilepath=" + profileFilepath
				+ ", coordiNickname=" + coordiNickname + "]";
	}
	
	

}
