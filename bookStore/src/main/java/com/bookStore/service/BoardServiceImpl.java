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


	@Override
	public int modify(BoardVO board) {
		return mapper.modify(board);
	}


	@Override
	public int delete(int bno) {
		return mapper.delete(bno); //int를 반환해야기 때문에 return값에서 mapper메소드 호출
	}
	
}
