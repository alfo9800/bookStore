package com.bookStroe.spring.H2db;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * 엔티티 클래스에서는 테이블에 포함되는 항목을 그대로 필드로 제공함.
 * 즉, 테이블=클래스 , 컬럼=필드 라는 느낌으로 정의
 * 주의 할 점은 오직 정의 할 뿐만 아니라 각각에 어노테이션을 붙여 있다는 것
 */

@Entity //이 클래스가 엔티티 클래스임을 나타냄
public class SampleEntity {

	@Id //최초의 id필드에만 붙일 수 있음. 기본 키를 나타 내기 위한 것이며, 이것을 붙인 필드는 그 테이블의 기본 키 컬럼임을 나타냄
	@Column //테이블의 칼럼을 나타내기 위한 것. 필드에 붙임. 이것을 붙인 필드는 그 이름과 같은 컬럼의 값을 저장하는 것으로 간주됨. 따라서, 칼럼의 형태와 같은 형태의 값이 아니면 안됨.
			//(length=50, nullable=false) -> () 안에 칼럼 특성을 기술하고 있는 것. 이런 방식으로 그 칼럼에 설정해야 속성도 함께 어노테이션을 작성할 수 있음
	@GeneratedValue(strategy=GenerationType.AUTO) //이것도 id필드에 붙여있음 -> 값의 자동 생성에 관한 것  
												  //()안에 지정하면 값을 자동으로 설정하도록 함
												  //추가되어 있는 필드는 모두 private으로 되어 있으며, setter/getter메소드에 액세스 할 수 있게 됨. 그 외에 두 종류의 생성자와 toString메소드가 있지만, 이들은 엔티티에 필수는 아님.
	private long id;
	
	
	@Column(length=50, nullable=false)
	private String name;
	
	@Column(length=100, nullable=false)
	private String mail;

	
	
	
	
	
	//getter, setter 
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	public SampleEntity() {
		super();
	}
	
	public SampleEntity(String name, String mail) {
		this();
		this.name = name;
		this.mail = mail;
	}

	public String toString() {
		return "SampleEntity [id=" + id + ", name=" + name + ", mail=" + mail + "]";
	}
	
	
}
