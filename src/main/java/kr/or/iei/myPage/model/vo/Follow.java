package kr.or.iei.myPage.model.vo;

public class Follow {
	
	private String userId;
	private String nickname;
	private String filepath;
	
	
	
	
	public Follow() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Follow(String userId, String nickname, String filepath) {
		super();
		this.userId = userId;
		this.nickname = nickname;
		this.filepath = filepath;
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
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	@Override
	public String toString() {
		return "Follow [userId=" + userId + ", nickname=" + nickname + ", filepath=" + filepath + "]";
	}
	
	
	

}
