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
import com.bookStore.model.Criteria;

import lombok.extern.log4j.Log4j; 

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardMapperTest {
	
	//private static final Logger log = LoggerFactory.getLogger(BoardMapperTest.class); ==> lombok 어노테이션 사용 대체 가능 @Log4j
	
	@Autowired
	private BoardMapper mapper;
	
	//게시판 등록 테스트 : DB에 title, Content, Writer를 test로 넣어준다
	@Test 
	public void testEnroll() {
		BoardVO vo = new BoardVO();
		
		vo.setTitle("mapper test");
		vo.setContent("mapper test");
		vo.setWriter("mapper test");
		
		mapper.enroll(vo);
	}
	
	//게시판 목록 테스트
	@Test 
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
		
		//foreach문 & 람다식 (**참고** list배열에서 forEach함수를 사용하기 위해서는 Stream API를 이용!)
		list.forEach(board -> log.info(board));
	}
	
	//게시판 목록(페이징 적용) 테스트
	@Test
	public void testGetListPaging() {
		Criteria cri = new Criteria();
		
		cri.setPageNum(5);
		
		List list = mapper.getListPaging(cri);
		
		list.forEach(board -> log.info("" + board));
	}
	
	//게시판 상세조회
	@Test 
	public void testGetPage() {
		/* 실제 존재하는 페이지 */
		int bno = 4;
		
		log.info("" + mapper.getPage(bno));
	}
	
	//게시판 수정
	@Test
	public void testModify() {
		BoardVO board = new BoardVO();
		board.setBno(8);
		board.setTitle("수정 제목");
		board.setContent("수정 내용");
	
		int result = mapper.modify(board); //게시판 번호(bno)가 존재하는 것 result = 1 / 존재하지 않는 것 result = 0
		log.info("result : " + result);
	}
	
	//게시판 삭제
	@Test
	public void testDelete() {
		int result = mapper.delete(8);
		
		log.info("result : " + result);
	}
	
	
	//게시판 총 갯수
	@Test 
	public void testgetTotal() {
		int result = mapper.getTotal();
		
		log.info("result : " + result);
	}
	
}
