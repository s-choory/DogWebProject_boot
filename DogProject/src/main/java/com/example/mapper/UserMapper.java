package com.example.mapper;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.example.dto.UsersDTO;

@Repository
public interface UserMapper {
	Optional<UsersDTO> login(UsersDTO userDTO);
}
