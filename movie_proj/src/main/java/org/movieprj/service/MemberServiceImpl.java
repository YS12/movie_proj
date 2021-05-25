package org.movieprj.service;

import org.movieprj.domain.MemberVO;
import org.movieprj.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Service
@Log4j
public class MemberServiceImpl implements MemberService{
	
	private MemberMapper mapper;
	
	@Override
	public void insert(MemberVO member) {
		log.info("service>>insert member: " + member);
		mapper.insert(member);
	}

	@Override
	public int delete(String id, String pw) {
		log.info("service>>delete member: " + id);
		return mapper.delete(id, pw);
	}

	@Override
	public boolean check(String id, String pw) {
		log.info("service>>check member : " + id);
		return mapper.check(id, pw);
	}
	

}
