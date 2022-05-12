package com.bookStore.model;

import java.sql.Date; //util -> sql //자료형이 맞지 않아 '수정'을 구현할 때, java에서 DB로 넘어갈 때 오류 발생

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//lombok 사용
@Getter
@Setter
@ToString

public class BoardVO {
	
	/* 화면단에 보여지는 게시판 번호 */
	//private int idx;
	
	/* 게시판 번호 */
    private int bno;
    
    /* 게시판 제목 */
    private String title;
    
    /* 게시판 내용 */
    private String content;
    
    /* 게시판 작가 */
    private String writer;
    
    /* 등록 날짜 */
    private Date regdate;
    
    /* 수정 날짜 */
    private Date updateDate;
    
    /* 조회 수 */
    private int boardcnt;
    
}
