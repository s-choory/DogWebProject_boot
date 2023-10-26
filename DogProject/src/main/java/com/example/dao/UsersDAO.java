package com.example.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.UsersDTO;

@Repository
public class UsersDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public UsersDTO loginChk(UsersDTO dto) {
		UsersDTO dto2 = session.selectOne("UsersMapper.loginChk", dto);
		return dto2;
	}

	public int idChk(String UserID) {
		return session.selectOne("UsersMapper.idChk", UserID);
	}

	public int memberAdd(UsersDTO user) {
		return session.insert("UsersMapper.memberAdd", user);
	}

	public int aliasChk(String UserAlias) {
		return session.selectOne("UsersMapper.aliasChk", UserAlias);
	}

	public UsersDTO findID(UsersDTO uDTO) {
		return session.selectOne("UsersMapper.findID", uDTO);
	}

	public UsersDTO findPW(UsersDTO uDTO) {
		return session.selectOne("UsersMapper.findPW", uDTO);
	}

	public int updatePW(UsersDTO uDTO) {
		return session.update("UsersMapper.updatePW", uDTO);
	}

	public int ProfilImg(UsersDTO dTO) {
		return session.update("UsersMapper.profilChange", dTO);
	}

	public int profilImgDelete(String userID) {
		return session.update("UsersMapper.profilDelete", userID);
	}

	public UsersDTO userinfo(String userID) {
		return session.selectOne("UsersMapper.userinfo", userID);
	}

	public UsersDTO profilUpdate(UsersDTO dto) {
		return session.selectOne("UsersMapper.profilUpdate", dto);
	}
	
	
}
