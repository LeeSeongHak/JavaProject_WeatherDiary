package global.sesoc.project1.vo;

public class DiaryVO {
	
	private int num;
	private String id;
	private String emotion;
	private String weather;
	private String title;
	private String content;
	private int inputdate;
	
	public DiaryVO(){
		
	}
	
	public DiaryVO(String id, String emotion, String weather, String title, String content){
		this.id = id;
		this.emotion = emotion;
		this.weather = weather;
		this.title = title;
		this.content = content;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmotion() {
		return emotion;
	}

	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getInputdate() {
		return inputdate;
	}

	public void setInputdate(int inputdate) {
		this.inputdate = inputdate;
	}

	@Override
	public String toString() {
		return "DiaryVO [num=" + num + ", id=" + id + ", emotion=" + emotion + ", weather=" + weather + ", title="
				+ title + ", content=" + content + ", inputdate=" + inputdate + "]";
	}
}
