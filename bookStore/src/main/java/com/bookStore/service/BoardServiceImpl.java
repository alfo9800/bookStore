package com.bookStore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookStore.mapper.BoardMapper;
import com.bookStore.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired //BoardMapper interface를 주입해주는 코드 작성
	private BoardMapper mapper;
	
	
	@Override //BoardService interface에서 선언한 메서드를 오버라이딩하여 메서드의 구현부를 작성
	public void enroll(BoardVO board) {
		mapper.enroll(board);
		
	}


	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}


	@Override
	public BoardVO getPage(int bno) {
		return mapper.getPage(bno);
	}
	
}
