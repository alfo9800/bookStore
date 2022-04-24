package com.bookStore.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * DB의 USER테이블에 데이터를 저장하거나, 반환된 데이터를 담을 객체 (VO) 생성ㅇ
 */

@Getter
@Setter
@ToString

public class UserVO {

	/* 회원 아이디 */
	private String userId;
	
	/* 회원 비밀번호 */
	private String userPw;
	
	/* 회원 이름 */
	private String userName;
	
	/* 회원 이메일 */
	private String userEmail;
	
	/* 회원 우편번호 */
	private String userAddr1;
	
	/* 회원 주소 */
	private String userAddr2;
	
	/* 회원 상세 주소 */
	private String userAddr3;
	
	/* 관리자 구분 (0:일반사용자 / 1:관리자) */
	private int adminCK;
	
	/* 등록일자 */
	private int regDate;
	
	/* 회원 돈 */
	private int money;
	
	/* 회원 포인트 */
	private int point;
	
}
