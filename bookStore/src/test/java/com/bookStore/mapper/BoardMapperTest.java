package com.bookStore.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bookStore.model.BoardVO;

import lombok.extern.log4j.Log4j; 

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardMapperTest {
	
	//private static final Logger log = LoggerFactory.getLogger(BoardMapperTest.class); ==> lombok 어노테이션 사용 대체 가능 @Log4j
	
	@Autowired
	private BoardMapper mapper;
	
	/*
	@Test //게시판 등록 테스트 : DB에 title, Content, Writer를 test로 넣어준다
	public void testEnroll() {
		BoardVO vo = new BoardVO();
		
		vo.setTitle("mapper test");
		vo.setContent("mapper test");
		vo.setWriter("mapper test");
		
		mapper.enroll(vo);
	}
	*/
	
	@Test //게시판 목록 테스트
	public void testGetList() {
		//게시판 목록 메소드를 수행 후 반환 받은 list객체
		List list = mapper.getList();
		
		//일반 for문을 통해 모든 요소를 출력
		/*
		for(int i=0; i<list.size(); i++) {
			log.info("" + list.get(i));
		}
		*/
		
		//foreach문 (향상된 for문)
		/*
		for(Object a : list) {
			log.info("" + a);
		}
		*/
		
		//foreach문 & 람다식
		list.forEach(board -> log.info(board));
	}
}
