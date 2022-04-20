package com.bookStore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j

public class UserController {
	
	@GetMapping("/login")
	public void loginGET() {	
		log.info("로그인 페이지 페이지 진입");	
		
	}
}
