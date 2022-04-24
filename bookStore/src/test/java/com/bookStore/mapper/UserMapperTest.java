package com.bookStore.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookStore.model.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")


public class UserMapperTest {

	@Autowired
	private UserMapper userMapper;
	
	@Test
	public void UserJoin() throws Exception {
		UserVO user = new UserVO();
		
		user.setUserId("test");
		user.setUserPw("test");
		user.setUserName("test");
		user.setUserEmail("test@test.com");
		user.setUserAddr1("test");
		user.setUserAddr2("test");
		user.setUserAddr3("test");
		
		userMapper.userJoin(user);
	}
}
