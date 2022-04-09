package com.bookStore.mapper;

import com.bookStore.model.BoardVO;

public interface BoardMapper {

	//게시판 등록 쿼리를 요청하는 enroll()메서드 코드
	/* 작가 등록 */
	public void enroll(BoardVO board);
}
