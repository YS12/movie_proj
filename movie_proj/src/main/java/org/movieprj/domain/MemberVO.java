package org.movieprj.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String memNick;
	private String memID;
	private String memName;
	private int memAge;
	private String memPW;

}
