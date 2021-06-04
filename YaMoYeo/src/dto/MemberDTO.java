package dto;

public class MemberDTO {
	
	private String yId;
	private String yPw;
	private String yName;
	private String yBirth;
	private String yGender;
	private String yEmail;
	private String yFile;
	
	public String getyId() {
		return yId;
	}
	public void setyId(String yId) {
		this.yId = yId;
	}
	public String getyPw() {
		return yPw;
	}
	public void setyPw(String yPw) {
		this.yPw = yPw;
	}
	public String getyName() {
		return yName;
	}
	public void setyName(String yName) {
		this.yName = yName;
	}
	public String getyBirth() {
		return yBirth;
	}
	public void setyBirth(String yBirth) {
		this.yBirth = yBirth;
	}
	public String getyGender() {
		return yGender;
	}
	public void setyGender(String yGender) {
		this.yGender = yGender;
	}
	public String getyEmail() {
		return yEmail;
	}
	public void setyEmail(String yEmail) {
		this.yEmail = yEmail;
	}
	public String getyFile() {
		return yFile;
	}
	public void setyFile(String yFile) {
		this.yFile = yFile;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [yId=" + yId + ", yPw=" + yPw + ", yName=" + yName + ", yBirth=" + yBirth + ", yGender="
				+ yGender + ", yEmail=" + yEmail + ", yFile=" + yFile + "]";
	}
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String yId, String yPw, String yName, String yBirth, String yGender, String yEmail, String yFile) {
		super();
		this.yId = yId;
		this.yPw = yPw;
		this.yName = yName;
		this.yBirth = yBirth;
		this.yGender = yGender;
		this.yEmail = yEmail;
		this.yFile = yFile;
	}
	
					
}