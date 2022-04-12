package com.bookStore.mapper;

import java.util.List;

import com.bookStore.model.BoardVO;
import com.bookStore.model.Criteria;

/* DAO의 역할이었다.. */
public interface BoardMapper {

	//게시판 등록 쿼리를 요청하는 enroll()메서드 코드
	/* 작가 등록 */
	public void enroll(BoardVO board);
	
	//DB에 저장된 board테이블의 모든 행의 정보를 출력 시키기 위해 getList()메서드 코드
	/* 게시판 목록 */
	public List<BoardVO> getList();
	
	//getList의 역할도 하면서 단지 쿼리만 조금 수정되는 것이기 때문에 반환타입은 동일 & pageNum, amount의 정보를 DB에 전달하기 위해서 Criteria클래스 파라미터로 부여
	/* 게시판 목록(페이징 적용) */
	public List<BoardVO> getListPaging(Criteria cri);
	
	//하나의 게시판 정보를 얻기 위해서 -> 그 게시판의 게시판 번호를 알아야하기 때문 -> 게시판 정보 데이터를 전달 받을 수 있도록, int형 변수를 파라미터로 추가
	/* 게시판 상세조회 */
	public BoardVO getPage(int bno);
	
	//bno, title, content, writer에 대한 데이터가 필요 / 수정을 수행하는 메소드의 경우 반환 타입이 필요 없음 / int형으로 설정할 경우 수정 성공 시 1, 수정 실패 0 반환
	/* 게시판 수정 */
	public int modify(BoardVO board);
	
	//bno='게시판 번호' 지정을 통하여, 특정페이지만 삭제 되도록 함 / 반환 타입은 수정과 동일 하게 int형 / 수정 성공 시 1, 수정 실패 0 반환
	public int delete(int bno);
		
}
