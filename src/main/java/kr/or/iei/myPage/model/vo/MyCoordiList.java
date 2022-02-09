package kr.or.iei.myPage.model.vo;

public class MyCoordiList {
	
	private int coordiNo;
	private String filepath;
	
	
	
	public MyCoordiList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyCoordiList(int coordiNo, String filepath) {
		super();
		this.coordiNo = coordiNo;
		this.filepath = filepath;
	}
	public int getCoordiNo() {
		return coordiNo;
	}
	public void setCoordiNo(int coordiNo) {
		this.coordiNo = coordiNo;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	@Override
	public String toString() {
		return "MyCoordiList [coordiNo=" + coordiNo + ", filepath=" + filepath + "]";
	}
	
	
}
