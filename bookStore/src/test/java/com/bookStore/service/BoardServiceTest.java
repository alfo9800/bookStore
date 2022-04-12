package com.bookStore.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookStore.model.BoardVO;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardServiceTest {
	
	@Autowired
	private BoardService service;
	
	/* //게시판 등록
	@Test
	public void testEnroll() {
		BoardVO vo = new BoardVO();
		
		vo.setTitle("service test");
		vo.setContent("service test");
		vo.setWriter("service test");
		
		service.enroll(vo);
	}
	*/
	
	/* //게시판 목록
	@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info("" + board));
	}
	*/
	
	/* //게시판 상세조회
	@Test
	public void testGetPage() {
		int bno = 4;
		
		log.info("" + service.getPage(bno));
	}
	*/
	
	//게시판 수정
	@Test
	public void testModify() {
		BoardVO board = new BoardVO();
		
		board.setBno(3);
		board.setTitle("제목입니다");
		board.setContent("내용입니다");
		
		int result = service.modify(board);
		log.info("result : " + result);
	}
}
