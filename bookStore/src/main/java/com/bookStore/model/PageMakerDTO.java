package com.bookStore.model;

import com.bookStore.model.Criteria;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageMakerDTO {
	
	/* 시작 페이지 */
	private int startPage;
	
	/* 끝 페이지 */
	private int endPage;
	
	/* 이전 페이지, 다음 페이지 존재 유무 */
	private boolean prev, next;
	
	/* 전체 게시물 수 */ //해당 정보가 있어야 startPage endPage prev next의 값을 구할 수 있어서 선언
	private int total;
	
	/* 현재 페이지, 페이지당 게시물 표시 수 정보 */ //Criteria클래스의 pageNum(현재 페이지) 변수 값을 얻기 위해 선언
	private Criteria cri;
	
	
	
	
	/* 생성자 */
	public PageMakerDTO(Criteria cri, int total) {
		
		this.cri = cri;
		this.total = total;
		
		/* 마지막 페이지 */ 
		this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))*10; //만약, pageNum이 7이라면 (cri.getPageNum()/10.0)는 0.7 그런데 //Math.ceil함수는 소수점 자리가 나오면 무조건 올림. 즉, 1이됨. //결론 : 마지막 페이지는 10이 계산되어서 나옴 
		/* 시작 페이지 */
		this.startPage = this.endPage -9; 
		
		/* 전체 마지막 페이지 */
		int realEnd = (int) (Math.ceil(total * 1.0/cri.getAmount())); //만약, total이 23이라면 23.0 //보여질 갯수인 amount가 10이라면 //2.3의 결과가 나옴 //Math.ceil함수는 무조건 올림이므로, 전체 마지막 페이지는 3이 된다.
		
		/* 전체 마지막 페이지(realend)가 화면에 보이는 마지막 페이지(endPage)보다 작은 경우, 보이는 페이지(endPage) 값 조정 */
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		/* 시작 페이지(startPage) 값이 1보다 큰 경우 true */
		this.prev = this.startPage > 1;
		
		/* 마지막 페이지(endPage) 값이 1보다 큰 경우 true */
		this.next = this.endPage < realEnd;	
	}
	
	
}
