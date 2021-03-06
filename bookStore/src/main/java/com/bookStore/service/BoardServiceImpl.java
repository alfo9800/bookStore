package com.bookStore.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookStore.mapper.BoardMapper;
import com.bookStore.model.BoardVO;
import com.bookStore.model.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired //BoardMapper interface를 주입해주는 코드 작성
	private BoardMapper mapper;
	
	
	@Override //BoardService interface에서 선언한 메서드를 오버라이딩하여 메서드의 구현부를 작성
	public void insert(BoardVO board) {
		mapper.insert(board);
		
	}


	@Override
	public List<BoardVO> list() {
		return mapper.list();
	}


	@Override
	public BoardVO getPage(int bno) {
		mapper.boardcnt(bno);
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


	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
		return mapper.getListPaging(cri);
	}


	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

}
