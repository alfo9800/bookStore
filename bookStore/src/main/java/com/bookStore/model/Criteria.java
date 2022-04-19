package com.bookStore.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Criteria {

	/* 기존 vo생성
	// 현재 페이지  
	private int pageNum;
	
	// 한 페이지 당 보여질 게시물 갯수
	private int amount;
	*/
	
	
	/* 현재 페이지 */ //set할 때 특별히 커스텀을 해야하는 상황
	@Setter(AccessLevel.PROTECTED)
	private int pageNum;
	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		//this.skip = pageNum; //-> set custom을 해놓고 다시 초기화를 했음.. (사용 안함)
	}
	
	/* 한 페이지 당 보여질 게시물 갯수 */ //set할 때 특별히 커스텀을 해야하는 상황
	@Setter(AccessLevel.PROTECTED)
	private int amount;
	public void setAmount(int amount) {
		this.skip = (this.pageNum-1)*amount;
		this.amount = amount; //이거는 사용해줘야 함 ...??!?
	}
	
	
	/* (Mysql) 스킵 할 게시물 수 -> (pageNum-1)*amount */
	private int skip;
	
	/* 기본 생성자 -> 기본 셋팅 : pageNum=1, amount=10 */ //파라미터 없이 Criteria클래스를 호출하였을 때
	public Criteria() {
        this(1,10);
        this.skip = 0; //(Mysql) 쿼리문의 limit에서 사용할 스킵 개수를 미리 java단계에서 처리 후 넘겨주기 위함
    }
	
	/* 생성자 -> 원하는 pageNum, 원하는 amount */ //파라미터와 함께 Criteria를 호출하게 되면 파라미터의 값이 각각 저장되도록 생성자 작성
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1) * amount;
	}
	
}
