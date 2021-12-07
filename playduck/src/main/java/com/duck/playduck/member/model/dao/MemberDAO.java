package com.duck.playduck.member.model.dao;

import java.util.Map;

import com.duck.playduck.member.model.vo.Member;

public interface MemberDAO {

	int insertMember(Member m);

	int signUpConfirm(Map<String, String> map);

	Member selectOneMember(String m_id);

	Member selectId(String m_email);
	
	Member selectMember(String m_email);

	int pwdUpdate(Member member);

	int updateMember(Member m);

	int checkIdDuplicate(String m_id);

}
