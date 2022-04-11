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
	
	/*
	@Test
	public void testEnroll() {
		BoardVO vo = new BoardVO();
		
		vo.setTitle("service test");
		vo.setContent("service test");
		vo.setWriter("service test");
		
		service.enroll(vo);
	}
	*/
	
	/*
	@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info("" + board));
	}
	*/
	
	@Test
	public void testGetPage() {
		int bno = 4;
		
		log.info("" + service.getPage(bno));
	}
}
