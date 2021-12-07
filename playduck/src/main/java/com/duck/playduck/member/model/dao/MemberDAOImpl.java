package com.duck.playduck.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.duck.playduck.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember",m);
	}

	@Override
	public int signUpConfirm(Map<String, String> map) {
		return sqlSession.update("member.signUpConfirm", map);
	}

	@Override
	public Member selectOneMember(String m_id) {
		return sqlSession.selectOne("member.selectOneMember", m_id);
	}

	@Override
	public Member selectId(String m_email) {
		return sqlSession.selectOne("member.selectId",m_email);
	}
	public Member selectMember(String m_email) {
		
		return sqlSession.selectOne("member.selectMember", m_email);
	}

	@Override
	public int pwdUpdate(Member member) {
		
		return sqlSession.update("member.pwdUpdate", member);
	}

	@Override
	public int updateMember(Member m) {
		return sqlSession.update("member.updateMember", m);
	}

	@Override
	public int checkIdDuplicate(String m_id) {
		return sqlSession.selectOne("member.checkIdDuplicate",m_id);
	}

}
