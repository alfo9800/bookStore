package com.bookStore.mapper;

import com.bookStore.model.UserVO;

public interface AccountMapper {

	/* 로그인 */
	public UserVO getAccountById();
	
	/* 회원가입 */
	public void insertAccount(UserVO userVO);
	
	
}
