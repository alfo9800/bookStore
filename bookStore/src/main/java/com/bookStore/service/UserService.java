package com.bookStore.service;

import com.bookStore.model.UserVO;

public interface UserService {

	//회원가입
	public void userJoin(UserVO user) throws Exception;
	
	//아이디 중복 검사
	public int idCk(String userId) throws Exception;
}
