package com.bookStore.mapper;

import java.util.List;

import com.bookStore.model.BoardVO;

/* DAO의 역할이었다.. */
public interface BoardMapper {

	//게시판 등록 쿼리를 요청하는 enroll()메서드 코드
	/* 작가 등록 */
	public void enroll(BoardVO board);
	
	//DB에 저장된 board테이블의 모든 행의 정보를 출력 시키기 위해 getList()메서드 코드
	/* 게시판 목록 */
	public List<BoardVO> getList();
	
	//하나의 게시판 정보를 얻기 위해서 -> 그 게시판의 게시판 번호를 알아야하기 때문 -> 게시판 정보 데이터를 전달 받을 수 있도록, int형 변수를 파라미터로 추가
	/* 게시판 상세조회 */
	public BoardVO getPage(int bno);
}
