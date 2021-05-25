package org.movieprj.service;

import org.movieprj.domain.MemberVO;

public interface MemberService {
	public void insert(MemberVO member);
	public int delete(String id, String pw);
	public boolean check(String id, String pw);

}
