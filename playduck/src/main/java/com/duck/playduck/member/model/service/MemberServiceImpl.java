package com.duck.playduck.member.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.duck.playduck.member.model.dao.MemberDAO;
import com.duck.playduck.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member m) {
		return memberDAO.insertMember(m);
	}

	@Override
	public int signUpConfirm(Map<String, String> map) {
		return memberDAO.signUpConfirm(map);
	}

	@Override
	public Member selectOneMember(String m_id) {
		return memberDAO.selectOneMember(m_id);
	}

	@Override

	public Member selectId(String m_email) {
		return memberDAO.selectId(m_email);
	}

	public Member selectMember(String m_email) {
		
		return memberDAO.selectMember(m_email);
	}

	@Override
	public int pwdUpdate(Member member) {
		// TODO Auto-generated method stub
		return memberDAO.pwdUpdate(member);
	}

	@Override
	public int updateMember(Member m) {
		return memberDAO.updateMember(m);
	}

	@Override
	public int checkIdDuplicate(String m_id) {
		return memberDAO.checkIdDuplicate(m_id);
	}



	


}
