package kr.or.iei.myPage.model.vo;

public class MyItTemList {
	
	private int itTemNo;
	private String filepath;
	
	
	public MyItTemList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyItTemList(int itTemNo, String filepath) {
		super();
		this.itTemNo = itTemNo;
		this.filepath = filepath;
	}
	public int getItTemNo() {
		return itTemNo;
	}
	public void setItTemNo(int itTemNo) {
		this.itTemNo = itTemNo;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	@Override
	public String toString() {
		return "MyItTemList [itTemNo=" + itTemNo + ", filepath=" + filepath + "]";
	}
	
	

}
