package global.sesoc.project1.vo;

public class UserVO {
	private String id;
	private String password;
	private String name;
	private String country;
	private String region;
	private String question;
	private String answer;

	public UserVO(){
		
	}
	
	public UserVO(String id, String password, String name, String country, String region, String question, String answer){
		this.id = id;
		this.password = password;
		this.name = name;
		this.country = country;
		this.region = region;
		this.question = question;
		this.answer = answer;
	}

	public String getUserid() {
		return id;
	}

	public void setUserid(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", country=" + country
				+ ", region=" + region + ", question=" + question + ", answer=" + answer + "]";
	}
	
}
