package com.bookStore.mysql.jpa;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/*import javax.persistence.*;*/

/**
 * Entity implementation class for Entity: BoardJPA2
 *
 */
@Entity

public class BoardJPA2 implements Serializable {

	
	private static final long serialVersionUID = 1L;

	public BoardJPA2() {
		@Id 	@GeneratedValue(strategy=GenerationType.AUTO)
		private Long bno;
			
		private String title;
		
		private String content;
		
		private String writer;
		
		private Date regdate;
		
		private Date updatedate;
		
		private int boardcnt;
		
		
		super();
	}
   
}
