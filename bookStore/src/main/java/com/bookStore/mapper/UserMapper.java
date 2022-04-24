package com.bookStore.mapper;

import com.bookStore.model.UserVO;

public interface UserMapper {

	/* 회원가입 */
	public void userJoin(UserVO user);
}
