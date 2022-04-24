package com.bookStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	//회원가입
	@PostMapping("/join")
	public String joinPOST(UserVO user, RedirectAttributes rttr) throws Exception {
		
		log.info("join 진입");
		
		//회원가입 서비스 실행
		uService.userJoin(user);
		
		log.info("join service 성공");
		
		//rttr.addFlashAttribute("result", "join success"); 
		
		return "redirect:/";
	}
	
			//회원가입 : join.jsp로 메서드의 결과 반환되기 위해서 어노테이션 ResponseBody 사용
			//아이디 중복검사
			@PostMapping("/userIdCk")
			@ResponseBody
			public String userIdCkPOST(String userId) throws Exception {
				//log.info("userIdCk 진입");
				int result = uService.idCk(userId);
				
				//log.info("결과 값 : " + result);

				if(result != 0) {
					return "fail"; //중복아이디가 존재
				}else {
					return "success"; //중복아이디 없음
				}				
			}
	
	
	
	/* 회원가입 페이지 이동 */
	  @GetMapping("/join") public void joinGET() {
	  
	  log.info("회원가입 페이지 진입");
	  
	  }
	 
	/* 로그인 페이지 이동 */
	@GetMapping("/login")
	public void loginGET() {
		
		log.info("로그인 페이지 진입");
		
	}
}
