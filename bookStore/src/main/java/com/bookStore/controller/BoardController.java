package com.bookStore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookStore.model.BoardVO;
import com.bookStore.model.Criteria;
import com.bookStore.model.PageMakerDTO;
import com.bookStore.service.BoardService;

import lombok.extern.log4j.Log4j;

/** @author Han mirae
 * 
 * 1) 게시판 목록, 등록, 수정, 삭제 페이지 생성
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
	
	
	/* 게시판 목록 페이지 진입 (view에 데이터 전송 위해 Model 파라미터 추가)*/
	/*
	@GetMapping("/list")
	public void boardListGET(Model model) {	
		log.info("게시판 목록 페이지 진입");	
		
		model.addAttribute("list", bservice.getList()); //"list"라는 속성명에 BoardService클래스의 getList메소드 반환값(=게시판 목록 데이터)을 속성값으로 저장
	}
	*/
	
	/* 게시판 목록 페이지 접속 (페이징 적용) */
	@GetMapping("/list")
	public void boardListGET(Model model, Criteria cri) {
		log.info("boardListGET");
		
		model.addAttribute("list", bservice.getListPaging(cri)); //보고자 하는 페이지의 정보를 얻기 위헤서
		
		
		int total = bservice.getTotal(); //게시판 총 갯수
		
		PageMakerDTO paging = new PageMakerDTO(cri, total); //변수를 일일 선언 (total, paging)한 것은 이해를 위해서 -> 파라미터에 바로 메소드와 인스턴스 선언을 작성해도 됨
		
		model.addAttribute("pageMaker", paging);
	}
	
	/* 게시판 등록 페이지 진입 */
	@GetMapping("/insert")
	public void boardInsertGET() {		
		log.info("게시판 등록 페이지 진입");		
	}
	
	/* 게시판 등록 POST (insert.jsp view에서 받은 값) */
	@PostMapping("/insert")
	public String boardInsertPOST(BoardVO board, RedirectAttributes rttr) {
		log.info("BoardVO : " + board);
		
		bservice.insert(board); //insert에서 받은 파라미터값을 service로 넘겨줌
		
		rttr.addFlashAttribute("result", "insert success"); //'게시판 목록'화면으로 이동시 등록 성공 여부를 알리는 문자를 전송 //일회성으로만 데이터를 전송하기 위함. 혹, 전달받은 데이터가 계속 잔존할 경우 경고창이 계속 뜰 수 있기 때문
		
		return "redirect:/board/list";//넘겨 주었기 때문에 더 이상 머물러 있을 필요 X -> list로 이동
	}
	
	/* 게시판 상세조회 */
	@GetMapping("/get")
	public void boardGetPageGET(int bno, Model model, Criteria cri) {
		model.addAttribute("pageInfo", bservice.getPage(bno)); //"pageInfo"라는 속성명에 BoardService클래스의 getPage메소드 반환값(=게시판 상세 조회 데이터)을 속성값으로 저장
		
		model.addAttribute("cri", cri); //뷰에서 전송하는 pageNum, amount 데이터를 사용할 수 있도록 파라미터를 추가해야 함. //"cri"속성명에 속성값으로 뷰로부터 전달 받은 Criteria 인스턴스를 저장
	}
	
	/* 수정페이지 이동 (위 상세조회페이지 이동과 메소드 동일) */
	@GetMapping("/modify")
	public void boardModifyGET(int bno, Model model, Criteria cri) {
		model.addAttribute("pageInfo", bservice.getPage(bno));
		
		model.addAttribute("cri", cri);
	}
	
	/* 게시판 수정 (@GetMapping 아니고, @PostMapping이다) */
	@PostMapping("/modify")
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) { //수정될 내용의 데이터를 가져오기 위해 BoardVO 클래스를 파라미터로 부여, 수정기능 실행 후 리다이렉트 방식으로 리스트 페이지 이동 시 데이터를 같이 전송
		bservice.modify(board);

		log.info("수정된 값들 확인 : " + board); //수정된 값들은 다 들어왔음
		log.info("서비스에서 테스트 했을 때는 되는 데.. ========== 수정 성공 여부 (1: 성공 / 0: 실패) ========== " + bservice.modify(board));
		
		rttr.addFlashAttribute("result", "modify success"); //list페이지 이동 시 수정이 완료되었음을 알리는 창 띄우기 위해 "modify success"스트링 데이터를 "result"속성값에 저장하는 addFlashAttribute() 메소드 호출
		
		return "redirect:/board/list"; 
	}
	
	
	/* 게시판 삭제 */
	@PostMapping("/delete")
	public String boardDeletePOST(int bno, RedirectAttributes rttr) { //삭제 실행 위해서 게시판 번호 bno 필요하기 때문에 파라미터로 부여, 삭제 기능 실행 후 리다이렉트 방식으로 리스트 페이지 이동 시 데이터를 같이 전송
		bservice.delete(bno);
		
		rttr.addFlashAttribute("result", "delete success");
		
		return "redirect:/board/list";
	}
}
