package com.bookStore.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class Criteria {

	/* 현재 페이지 */
	private int pageNum;
	
	/* 한 페이지 당 보여질 게시물 갯수 */
	private int amount;
	
	/* (Mysql) 스킵 할 게시물 수 -> (pageNum-1)*amount */
	private int skip;
	
	/* 기본 생성자 -> 기본 셋팅 : pageNum=1, amount=10 */ //파라미터 없이 Criteria클래스를 호출하였을 때
	public Criteria() {
        this(1,10);
        this.skip = 0; //(Mysql)
    }
	
	/* 생성자 -> 원하는 pageNum, 원하는 amount */ //파라미터와 함께 Criteria를 호출하게 되면 파라미터의 값이 각각 저장되도록 생성자 작성
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.skip = (pageNum-1) * amount;
	}
	
}
