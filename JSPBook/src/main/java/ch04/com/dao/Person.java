package ch04.com.dao;

// 데이터 전달용 자바빈(스프링에서는 DTO)
// JSP에서 자바빈의 주용도
public class Person {
	private int id = 20230821;
	private String name = "홍길동";
	
	public Person() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
