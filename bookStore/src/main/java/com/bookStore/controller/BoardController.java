package com.bookStore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookStore.model.BoardVO;
import com.bookStore.service.BoardService;

import lombok.extern.log4j.Log4j;

/** @author Han mirae
 * 
 * 1) 게시판 목록, 등록 페이지 생성
 * 2) url생성을 통해 해당 페이지를 이동할 수 있도록 url맵핑 메서드를 작성
 * 
 * @GetMapping("") <=동일한 역할의 어노테이션=> @RequestMapping(value="", method=RequestMethod.GET)  
 */

@Controller 				//Bean등록
@RequestMapping("/board/*") //'/board'로 시작하는 모든 처리를 BoardController가 처리 하도록 지정
@Log4j 						//lombok 어노테이션 사용 (대문자Log) -> 사용할 때는 (소문자log)

public class BoardController {

	@Autowired
	private BoardService bservice;
	
	
	/* 게시판 목록 페이지 진입 */
	@GetMapping("/list")
	public void boardListGET() {	
		log.info("게시판 목록 페이지 진입");		
	}
	
	/* 게시판 등록 페이지 진입 */
	@GetMapping("/enroll")
	public void boardEnrollGET() {		
		log.info("게시판 등록 페이지 진입");		
	}
	
	/* 게시판 등록 POST (enroll.jsp 뷰에서 받은 값) */
	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardVO : " + board);
		
		bservice.enroll(board); //enroll에서 받은 파라미터값을 service로 넘겨줌
		
		return "redirect:/board/list";//넘겨 주었기 때문에 더 이상 머물러 있을 필요 X -> list로 이동
	}
}
