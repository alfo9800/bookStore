package com.bookStore.mysql.jpa;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity(name="bookstore_board")
@Data
public class BoardJPA {

	@Id 	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long bno;
		
	private String title;
	
	private String content;
	
	private String writer;
	
	private Date regdate;
	
	private Date updatedate;
	
	private int boardcnt;
	
}
