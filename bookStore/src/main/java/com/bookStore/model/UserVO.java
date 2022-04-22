package com.bookStore.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 회원 데이터를 다룰 수 있는 데이터베이스 및 자바빈즈 완성
 */

@Getter
@Setter
@ToString

public class UserVO {

	private String userId;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	private String userPhone;
	private String role;

}
