package com.bookStore.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookStore.model.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class UserServiceTest {

	@Autowired
	private UserService uService;
	
	@Test
	public void testUserJoin() throws Exception {
		UserVO user = new UserVO();
		
		user.setUserId("test456");
		user.setUserPw("1234");
		user.setUserName("아무개");
		
		uService.userJoin(user);
	}
}
