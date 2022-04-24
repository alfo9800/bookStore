package com.bookStore.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookStore.mapper.UserMapper;
import com.bookStore.model.UserVO;

@Service

public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public void userJoin(UserVO user) throws Exception {
		userMapper.userJoin(user);
	}
	
	
}
