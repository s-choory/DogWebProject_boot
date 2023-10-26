package com.example.service;

import java.util.Optional;

import com.example.dto.UsersDTO;

public interface UserSecuService {
	Optional<UsersDTO> login(UsersDTO userVo);
}
