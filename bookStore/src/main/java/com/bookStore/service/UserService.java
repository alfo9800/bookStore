package com.bookStore.service;

import com.bookStore.model.UserVO;

public interface UserService {

	//회원가입
	public void userJoin(UserVO user) throws Exception;
	
}
