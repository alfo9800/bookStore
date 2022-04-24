package com.bookStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookStore.model.UserVO;
import com.bookStore.service.UserService;
import com.sun.tools.javac.util.Log;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j

public class UserController {

	@Autowired
	private UserService uService;
	
	
	//회원가입 : 반환형식을 string으로 하여 return에 home페이지로 이동하도록 함
	@PostMapping("/join")
	public String joinPOST(UserVO user) throws Exception {
		
		log.info("join 진입");
		
		//회원가입 서비스 실행
		uService.userJoin(user);
		
		log.info("join service 성공");
		
		return "redirect:/home";
	}
	
	
	
	
	
	/* 회원가입 페이지 이동 */
	@GetMapping("/join")
	public void joinGET() {
		
		log.info("회원가입 페이지 진입");
	
	}
	
	/* 로그인 페이지 이동 */
	@GetMapping("/login")
	public void loginGET() {
		
		log.info("로그인 페이지 진입");
		
	}
}
