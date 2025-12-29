package ch04.com.dao;

// Quiz: 자바빈 클래스 작성
// 회원가입 시 입력했던 내용을 멤버 변수(속성, 프로퍼티, 필드)에 저장하는 역할
// id(String)
// pass(String)
// name(String)
// gender(String)
// age(int)
// email(String)
public class JoinBean {
	private String id;
	private String pass;
	private String name;
	private String gender;
	private int age;
	private String email;
	
	public JoinBean() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
