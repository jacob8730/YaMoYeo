package dto;

import java.sql.Date;

public class BoardDTO {
		
	private int 	zNum;
	private String 	zId;
	private String 	zEmail;
	private String 	zLink;
	private String 	zTitle;
	private String 	zCategories;
	private String 	zPlace;
	private String 	zPublic;
	private int		zPersonnel;
	private String 	zContents;
	private Date 	zDate;
	private int 	zHits;
	private String 	zFile;
	
	public int getzNum() {
		return zNum;
	}
	public void setzNum(int zNum) {
		this.zNum = zNum;
	}
	public String getzId() {
		return zId;
	}
	public void setzId(String zId) {
		this.zId = zId;
	}
	public String getzEmail() {
		return zEmail;
	}
	public void setzEmail(String zEmail) {
		this.zEmail = zEmail;
	}
	public String getzLink() {
		return zLink;
	}
	public void setzLink(String zLink) {
		this.zLink = zLink;
	}
	public String getzTitle() {
		return zTitle;
	}
	public void setzTitle(String zTitle) {
		this.zTitle = zTitle;
	}
	public String getzCategories() {
		return zCategories;
	}
	public void setzCategories(String zCategories) {
		this.zCategories = zCategories;
	}
	public String getzPlace() {
		return zPlace;
	}
	public void setzPlace(String zPlace) {
		this.zPlace = zPlace;
	}
	public String getzPublic() {
		return zPublic;
	}
	public void setzPublic(String zPublic) {
		this.zPublic = zPublic;
	}
	public int getzPersonnel() {
		return zPersonnel;
	}
	public void setzPersonnel(int zPersonnel) {
		this.zPersonnel = zPersonnel;
	}
	public String getzContents() {
		return zContents;
	}
	public void setzContents(String zContents) {
		this.zContents = zContents;
	}
	public Date getzDate() {
		return zDate;
	}
	public void setzDate(Date zDate) {
		this.zDate = zDate;
	}
	public int getzHits() {
		return zHits;
	}
	public void setzHits(int zHits) {
		this.zHits = zHits;
	}
	public String getzFile() {
		return zFile;
	}
	public void setzFile(String zFile) {
		this.zFile = zFile;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [zNum=" + zNum + ", zId=" + zId + ", zEmail=" + zEmail + ", zLink=" + zLink + ", zTitle="
				+ zTitle + ", zCategories=" + zCategories + ", zPlace=" + zPlace + ", zPublic=" + zPublic
				+ ", zPersonnel=" + zPersonnel + ", zContents=" + zContents + ", zDate=" + zDate + ", zHits=" + zHits
				+ ", zFile=" + zFile + "]";
	}
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardDTO(int zNum, String zId, String zEmail, String zLink, String zTitle, String zCategories, String zPlace,
			String zPublic, int zPersonnel, String zContents, Date zDate, int zHits, String zFile) {
		super();
		this.zNum = zNum;
		this.zId = zId;
		this.zEmail = zEmail;
		this.zLink = zLink;
		this.zTitle = zTitle;
		this.zCategories = zCategories;
		this.zPlace = zPlace;
		this.zPublic = zPublic;
		this.zPersonnel = zPersonnel;
		this.zContents = zContents;
		this.zDate = zDate;
		this.zHits = zHits;
		this.zFile = zFile;
	}
	
	
	
}
