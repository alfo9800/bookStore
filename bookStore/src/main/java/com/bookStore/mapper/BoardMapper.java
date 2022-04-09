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
}
