package com.bookStore.model;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString

public class Criteria {

	
	// 현재 페이지  
	private int pageNum;
	
	// 한 페이지 당 보여질 게시물 갯수
	private int amount;
	
	
	/* 아래는 setter할 때, 영향을 주는 것으로 보아서 직접 아래 setter,getter */	
	//참고 : setter의 경우 실무에서 무분별하게 사용할 경우 후에 의도치 않은 값의 변경으로 인한 어려움을 겪을 수 있기에 상황에 맞춰서 필요할 때만 사용할 것
	
	/*
	//현재 페이지 //set할 때 특별히 커스텀을 해야하는 상황
	@Setter(AccessLevel.PUBLIC)
	private int pageNum;
	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1)*this.amount;
		this.skip = pageNum; 
	}
	
	//한 페이지 당 보여질 게시물 갯수 //set할 때 특별히 커스텀을 해야하는 상황
	@Setter(AccessLevel.PUBLIC)
	private int amount;
	public void setAmount(int amount) {
		this.skip = (this.pageNum-1)*amount;
		this.amount = amount; 
	}
	*/
		
	
	
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

	
	
	
	//setter
	public void setPageNum(int pageNum) {
		this.skip = (pageNum-1) * this.amount;
		this.pageNum = pageNum;
	}

	public void setAmount(int amount) {
		this.skip = (this.pageNum-1) * amount;
		this.amount = amount;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	
	
	
}
