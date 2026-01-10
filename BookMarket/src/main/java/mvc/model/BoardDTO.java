package mvc.model;

//게시판 데이터 클래스
public class BoardDTO {
	private int num;           // 게시글 순번
	private String id;         // 작성자 아이디
	private String name;       // 작성자 이름
	private String subject;    // 제목
	private String content;    // 내용
	private String registDay;  // 등록 일자
	private int hit;           // 조회 수
	private String ip;         // IP 주소
	
	// 기본 생성자
	public BoardDTO() {
	}

	// Getter/Setter
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegistDay() {
		return registDay;
	}

	public void setRegistDay(String registDay) {
		this.registDay = registDay;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", id=" + id + ", name=" + name + ", subject=" + subject + ", content="
				+ content + ", registDay=" + registDay + ", hit=" + hit + ", ip=" + ip + "]";
	}
}
