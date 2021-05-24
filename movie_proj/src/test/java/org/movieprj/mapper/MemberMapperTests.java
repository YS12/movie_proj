package org.movieprj.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.movieprj.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Test
	public void testInsert() {
		MemberVO member = new MemberVO();
		member.setMemNick("bbb");
		member.setMemID("bbb");
		member.setMemPW("bbb");
		member.setMemName("b군");
		member.setMemAge(24);
		
		mapper.insert(member);
	}
	
	@Test
	public void testDelete() {
		String removeID = "bbb";
		String removePW = "bbb";
		
		int res = mapper.delete(removeID, removePW);
		log.info("delete member " + removeID + " with result : " + res);
	}
	
	@Test
	public void testMember() {
		String checkID = "manager1";
		String checkPW = "1234";
		
		boolean res = mapper.check(checkID, checkPW);
		log.info("check member " + checkID + " with result : " + res);
	}

}
