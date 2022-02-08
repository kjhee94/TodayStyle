package kr.or.iei.myPage.model.vo;

public class ProfileImg {
	
	private String userId;
	private String imgName;
	private String filePath;
	
	
	
	
	public ProfileImg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProfileImg(String userId, String imgName, String filePath) {
		super();
		this.userId = userId;
		this.imgName = imgName;
		this.filePath = filePath;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "profileImg [userId=" + userId + ", imgName=" + imgName + ", filePath=" + filePath + "]";
	}
	
	
	

}
