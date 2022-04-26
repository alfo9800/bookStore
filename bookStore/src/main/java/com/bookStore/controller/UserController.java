package com.bookStore.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	

	/* 회원가입 페이지 이동 */
	  @GetMapping("/join") public void joinGET() {
	  
	  log.info("회원가입 페이지 진입");
	  
	  }
	
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
	
	
	
	 
	/* 로그인 페이지 이동 */
	@GetMapping("/login")
	public void loginGET() {
		
		log.info("로그인 페이지 진입");
		
	}
	
	
	/* 로그인 */
	@PostMapping("/login")
	public String loginPOST(UserVO user, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		//log.info("login메서드 진입");
		log.info("전달된 데이터 : " + user);
		
		HttpSession session = request.getSession(); //session 변수를 선언 및 초기화 //다음 코드는 session을 사용하기 위한 전형적인 방법
		UserVO lvo = uService.userLogin(user); //lvo 변수를 선업 및 초기화 //userLogin 메소드를 요청하게 되면 ~거쳐서~ 로그인 쿼리가 실행되게 되고 그 결과 값이 담긴 userVO 객체를 반환 받아 변수 lvo에 저장 
		
		if(lvo == null) { //만약, lvo에 userVO에 대한 객체가 null값이라면
			int result = 0;
			rttr.addFlashAttribute("result", result); //0을 result에 담아서 String형태의 문자열을 넣어 전달한다
			
			return "redirect:/user/login"; //다시 로그인 페이지로 가서 
		}
		
		session.setAttribute("user", lvo);
		
		return "redirect:/";
	}
	
	
	/* 로그아웃 */
	@GetMapping("/logout") //메서드 방식은 GET방식 //a태그의 요청은 GET방식이기 때문
	public String logoutGET(HttpServletRequest request) throws Exception { //session에 대한 작업을 위해서 HttpServletRequest타입의 매개변수 작성
		
		log.info("logoutGET메서드 진입");
		
		HttpSession session = request.getSession(); //session 변수를 선언 및 초기화
		
		session.invalidate(); //session 전체를 무효화
		
		return "redirect:/";
	}
	
	
	
}
