package com.bookStore.service;

import java.util.List;

import com.bookStore.model.BoardVO;

public interface BoardService {

	/* 게시판 등록 */
	public void enroll(BoardVO board);
	
	/* 게시판 목록 */
	public List<BoardVO> getList();
	
	/* 게시판 조회 */ //목록과 달리, 하나의 게시판 정보를 반환받는 것이 목표 -> 반환타입을 BoardVO
	public BoardVO getPage(int bno);
	
	/* 게시판 수정 */ //반환 타입은 int로. Controller에서 활용을 하지 않더라도 선택지를 넓혀주는 의미에서.
	public int modify(BoardVO board);
}
