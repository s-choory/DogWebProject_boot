package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UsersDAO;
import com.example.dto.UsersDTO;

@Service
public class UsersService {
	
	@Autowired
	UsersDAO dao;

	public UsersDTO loginChk(UsersDTO dto) {
		return dao.loginChk(dto);
	}

	public int idChk(String UserID) {
		return dao.idChk(UserID);
	}

	public int memberAdd(UsersDTO user) {
		return dao.memberAdd(user);
	}

	public int aliasChk(String UserAlias) {
		return dao.aliasChk(UserAlias);
	}

	public UsersDTO findID(UsersDTO uDTO) {
		return dao.findID(uDTO);
	}

	public UsersDTO findPW(UsersDTO uDTO) {
		return dao.findPW(uDTO);
	}

	public int updatePW(UsersDTO uDTO) {
		return dao.updatePW(uDTO);
	}
	
	public int ProfilImg(UsersDTO dTO) {
		return dao.ProfilImg(dTO);
	}

	public int profilImgDelete(String userID) {
		return dao.profilImgDelete(userID);
	}

	public UsersDTO userinfo(String userID) {
		return dao.userinfo(userID);
	}

	public UsersDTO profilUpdate(UsersDTO dto) {
		return dao.profilUpdate(dto);
	}
	
}
