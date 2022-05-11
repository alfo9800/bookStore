package com.bookStore.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookStore.DAO.UserMapper;
import com.bookStore.model.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class UserMapperTest {

	@Autowired
	private UserMapper userMapper;
	
	/*
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
	*/
	
	/*
	  @Test 
	  public void userIdCk() throws Exception { 
		  String id = "hihi"; //존재하는 아이디 
		  String id2 = "alfo"; //존재하지 않는 아이디
	  
		  userMapper.idCk(id); userMapper.idCk(id2); 
	  }
	 */
	
	@Test
	public void userLogin() throws Exception {
		UserVO user = new UserVO();
		
		//올바른 아이디 비번 입력 경우
		//user.setUserId("hihi");
		//user.setUserPw("123");
		
		//올바르지 않은 아이디 비번 입력 경우
		user.setUserId("hihiii");
		user.setUserPw("123ii");
		
		userMapper.userLogin(user);
		
		log.info("결과 값 : " + userMapper.userLogin(user));
		//System.out.println("결과 값 : " + userMapper.userLogin(user));
	}
	
}
