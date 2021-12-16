package co.won.potal.board.service;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
public class BoardVO {
	private int no;
	private String writer; // member id
	private Date wdate;
	private String title;
	private String subject;
	private int hit;
	
	private String name; // member name
}
