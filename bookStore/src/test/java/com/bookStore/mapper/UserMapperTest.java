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
		
		user.setUserId("test123");
		user.setUserPw("test");
		user.setUserName("test");
		user.setUserEmail("test@test.com");
		user.setUserAddr1("test");
		user.setUserAddr2("test");
		
		userMapper.userJoin(user);
	}
	
	
	@Test
	public void userIdCk() throws Exception {
		String id = "hihi"; //존재하는 아이디
		String id2 = "alfo"; //존재하지 않는 아이디
		
		userMapper.idCk(id);
		userMapper.idCk(id2);
	}
	
	
}
