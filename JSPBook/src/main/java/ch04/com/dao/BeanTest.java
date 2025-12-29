package ch04.com.dao;

// 자바빈 설계 규약
// 1. 기본 생성자
// 2. private 필드
// 3. getter/setter
// 4. Serializable(선택)
public class BeanTest {
	private String name = "gonikim";
	
	public BeanTest() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
