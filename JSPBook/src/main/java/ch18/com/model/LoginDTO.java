package ch18.com.model;

public class LoginDTO {
	
	private String id;
	private String password;
	
	public LoginDTO() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	// 기능 로직은 서비스 계층에 작성하여 역할 분리하는 것이 좋음
	public boolean validate() {
		if ("admin".equals(id) && "1234".equals(password)) return true;
		else return false;
	}
}
