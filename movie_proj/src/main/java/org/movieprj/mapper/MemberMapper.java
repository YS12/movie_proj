package org.movieprj.mapper;

import org.apache.ibatis.annotations.Param;
import org.movieprj.domain.MemberVO;

public interface MemberMapper {
	
	public void insert(MemberVO member);
	public int delete(@Param("id") String id, @Param("pw") String pw);
	public boolean check(@Param("id") String id, @Param("pw") String pw);

}
